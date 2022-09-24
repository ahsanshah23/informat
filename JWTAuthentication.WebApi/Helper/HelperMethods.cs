using System.Collections.Generic;
using System.Threading.Tasks;
using System;
using JWTAuthentication.WebApi.Models;
using Microsoft.AspNetCore.Identity;
using System.Text;
using com.Informat.WebAPI.Models;
using System.Linq;
using com.Informat.WebAPI.Repository;

namespace com.Informat.WebAPI.Helper
{
    public interface IHelperMethods
    {

        Task<string> RandomString(int size, bool lowerCase);

        string PasswordGenerator();
        string DateFormatter(DateTime date);

    }

    public class HelperMethods : IHelperMethods
    {
        public HelperMethods()
        {
        }
        public async Task<string> RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }

        
        public string PasswordGenerator()
        {
            PasswordOptions opts = new PasswordOptions()
            {
                RequiredLength = 8,
                RequiredUniqueChars = 4,
                RequireDigit = true,
                RequireLowercase = true,
                RequireNonAlphanumeric = true,
                RequireUppercase = true
            };

            string[] randomChars = new[] {
            "ABCDEFGHJKLMNOPQRSTUVWXYZ",    // uppercase 
            "abcdefghijkmnopqrstuvwxyz",    // lowercase
            "0123456789",                   // digits
            "!@$?_-"                        // non-alphanumeric
        };

            Random rand = new Random(Environment.TickCount);
            List<char> chars = new List<char>();

            if (opts.RequireUppercase)
                chars.Insert(rand.Next(0, chars.Count),
                    randomChars[0][rand.Next(0, randomChars[0].Length)]);

            if (opts.RequireLowercase)
                chars.Insert(rand.Next(0, chars.Count),
                    randomChars[1][rand.Next(0, randomChars[1].Length)]);

            if (opts.RequireDigit)
                chars.Insert(rand.Next(0, chars.Count),
                    randomChars[2][rand.Next(0, randomChars[2].Length)]);

            if (opts.RequireNonAlphanumeric)
                chars.Insert(rand.Next(0, chars.Count),
                    randomChars[3][rand.Next(0, randomChars[3].Length)]);

            for (int i = chars.Count; i < opts.RequiredLength
                || chars.Distinct().Count() < opts.RequiredUniqueChars; i++)
            {
                string rcs = randomChars[rand.Next(0, randomChars.Length)];
                chars.Insert(rand.Next(0, chars.Count),
                    rcs[rand.Next(0, rcs.Length)]);
            }

            return new string(chars.ToArray());
        }

        public string DateFormatter(DateTime date)
        {
            if (date != null)
            {
                var formatted_date = date.Day + " " + date.ToString("MMM") + ", " + date.Year;
                return formatted_date;
            }
            else
                return "";
            
        }
    }
}
