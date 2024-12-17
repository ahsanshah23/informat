using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace com.Informat.WebAPI.Models
{
    public class AppSettings
    {
        public string Secret { get; set; }
        public string MongoDbConnectionString { get; set; }
        public string SQLServerConnectionString { get; set; }
        public string TwilioaccountSid { get; set; }
        public string TwilioauthToken { get; set; }
        public string TwilioNumber { get; set; }
        public string GmailID { get; set; }
        public string GmailPassword { get; set; }
        public string ElasticSearch { get; set; }
        public string ImageSavePath { get; set; }
        public string IconSavePath { get; set; }
        public string BaseUrl { get; set; }
        public string WebUrl { get; set; }
        public string UploadsFolder { get; set; }
        public string UploadsFolderUpload { get; set; }
        public string DefaultUserImage { get; set; }
        public string DefaultCompanyLogo { get; set; }
        

    }

    public class EmailSettings
    {
        public string EmailID { get; set; }
        public string EmailPassword { get; set; }
        public string AdressTitle { get; set; }
        public string SmptServer { get; set; }
        public int PortNumber { get; set; }
    }
}
