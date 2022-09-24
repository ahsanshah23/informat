using System;

namespace com.Informat.WebAPI.Models
{
    public class InitialResponse
    {
        public string Id { get; set; }
        public string Message { get; set; }
        public string Token { get; set; }
        public DateTime? CreatedOn { get; set; }
    }
}
