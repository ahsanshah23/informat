using System;

namespace com.Informat.WebAPI.Models
{
    public class SubscriptionCheck
    {
        public bool IsValid { get; set; }
        public int UserSubscriptionId { get; set; }
        public int ConsumedCount { get; set; }
        public int OriginalCount { get; set; }
        public string Name { get; set; }
        public DateTime ExpiresOn { get; set; }
    }

    public class UserSubscription
    {
        public string UserId { get; set; }
        public string SubscriptionId { get; set; }
    }
}
