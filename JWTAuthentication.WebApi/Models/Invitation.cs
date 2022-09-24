using System;
using System.Collections;
using System.Collections.Generic;

namespace com.Informat.WebAPI.Models
{
    public class Invitation
    {
        public string InvitationId { get; set; }
        public string CoupleName { get; set; }
        public string SecondCoupleName { get; set; }
        public string EventTitle { get; set; }
        public TimeSpan EventTime { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime EventDate { get; set; }
        public string Location { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string CreatedBy { get; set; }
        public IEnumerable<string> Attachments { get; set; }
    }

    public class InvitationAttachment
    {

    }
}
