using System.Collections.Generic;
using System;

namespace com.Informat.WebAPI.Repository
{
    public class InvitationResponse
    {
        public int Id { get; set; }
        public string InvitationId { get; set; }
        public string CoupleName { get; set; }
        public string SecondCoupleName { get; set; }
        public string EventTitle { get; set; }
        public string EventTime { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime EventDate { get; set; }
        public string Location { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string CreatedBy { get; set; }
        public IEnumerable<string> Attachment { get; set; }
    }
}
