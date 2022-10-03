using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace com.Informat.WebAPI.Models
{
    public class Invitation
    {
        public string InvitationId { get; set; }
        public string CoupleName { get; set; }
        public string SecondCoupleName { get; set; }
        public string EventTitle { get; set; }
        public string EventTime { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime EventDate { get; set; }
        public string Location { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string UserId { get; set; }
        public int UserSubscriptionId { get; set; }
        public int SongId { get; set; }
        public IEnumerable<InvitationAttachment> Attachments { get; set; }
    }

    public class InvitationAttachment
    {
        public string InvitationId { get; set; }
        public string Attachment { get; set; }
    }
}
