using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using com.Informat.WebAPI.Models;
using Microsoft.Extensions.Options;
using MimeKit;
using com.Informat.WebAPI.Repository;

namespace com.Informat.WebAPI.Helper
{
    public interface IEmailHelper
    {
        Task<bool> EmployeeWelcome(string userEmail, string link);
    }

    public class EmailHelper : IEmailHelper
    {
        private readonly EmailSettings _configuration;
        private readonly IHostingEnvironment Environment;
        private readonly IEmailRepo _emailRepo;
        public EmailHelper(IOptions<EmailSettings> configuration, IHostingEnvironment _environment, IEmailRepo emailRepo)
        {
            Environment = _environment;
            _configuration = configuration.Value;
            _emailRepo = emailRepo;
        }

        public async Task<bool> EmployeeWelcome(string userEmail, string link)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Path.Combine("Template", "EmployeeWelcome.html")))
            {
                body = reader.ReadToEnd();
            }

            string FromAdressTitle = _configuration.AdressTitle;
            string SmtpServer = _configuration.SmptServer;
            int SmtpPortNumber = _configuration.PortNumber;

            body = body.Replace("{link}", link);

            var mimeMessage = new MimeMessage();
            mimeMessage.From.Add(new MailboxAddress(FromAdressTitle, _configuration.EmailID));
            mimeMessage.To.Add(new MailboxAddress("", userEmail));
            mimeMessage.Subject = "Account Activation";
            mimeMessage.Body = new TextPart("html")
            {
                Text = body
            };

            try
            {
                using (var client = new MailKit.Net.Smtp.SmtpClient())
                {
                    client.Connect(SmtpServer, SmtpPortNumber, false);
                    client.Authenticate(
                        _configuration.EmailID,
                        _configuration.EmailPassword
                        );
                    await client.SendAsync(mimeMessage);
                    await client.DisconnectAsync(true);

                    await _emailRepo.InsertEmail(null, null, body, mimeMessage.To.ToString(), null, mimeMessage.Subject, true);
                }
                return true;
            }
            catch (Exception ex)
            {
                await _emailRepo.InsertEmail(null, null, body, mimeMessage.To.ToString(), ex.ToString(), mimeMessage.Subject, false);
                return false;
            }
        }
    }
}
