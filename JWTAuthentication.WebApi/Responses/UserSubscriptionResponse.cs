using System;
using System.ComponentModel.DataAnnotations;

namespace com.Informat.WebAPI.Responses
{
    public class UserSubscriptionResponse
    {
        public string UserId { get; set; }
        public string SubscriptionId { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime? BuyingDate { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime? ExpiresOn { get; set; }
    }
}
