using System;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.Mvc.Routing;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Microsoft.AspNetCore.Hosting;
using System.Configuration;
using com.Informat.WebAPI.Models;
using Microsoft.Extensions.Options;

namespace com.Informat.WebAPI.Helper
{
    public interface IImageUpload
    {
        void SaveImage(string path, string base64, string name);
        string ImageURL(string Source);
        string CompanyLogoURL(string Source);
    }

    public class ImageUpload : IImageUpload
    {
        private readonly AppSettings _configuration;
        private readonly IHostingEnvironment Environment;
        private readonly string uploadsUrl = "";
        public ImageUpload(IOptions<AppSettings> configuration, IHostingEnvironment _environment)
        {
            Environment = _environment;
            _configuration = configuration.Value;
            uploadsUrl = _configuration.BaseUrl + _configuration.UploadsFolder;
        }

        public void SaveImage(string path, string base64, string name)
        {

            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            byte[] imageBytes = Convert.FromBase64String(Regex.Replace(base64, @"^data:image\/[a-zA-Z]+;base64,", string.Empty));
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            ms.Write(imageBytes, 0, imageBytes.Length);

            Image image = Image.FromStream(ms, true);
            image.Save(Path.Combine(path, name), ImageFormat.Jpeg);
        }

        public string ImageURL(string Source)
        {
            string directory = uploadsUrl;
            if (string.IsNullOrEmpty(Source))
            {
                return String.Format("{0}{1}", directory, _configuration.DefaultUserImage);
            }
            else
            {
                return String.Format("{0}{1}", directory, Source);
            }
        }

        public string CompanyLogoURL(string Source)
        {
            string directory = uploadsUrl;
            if (string.IsNullOrEmpty(Source))
            {
                return String.Format("{0}{1}", directory, _configuration.DefaultCompanyLogo );
            }
            else
            {
                return String.Format("{0}{1}", directory, Source);
            }
        }


    }
}
