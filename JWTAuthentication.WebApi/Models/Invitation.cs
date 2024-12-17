using Microsoft.AspNetCore.Mvc;
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
        public string LocationURL { get; set; }
        public string EventDesc { get; set; }
        public IEnumerable<InvitationAttachment> Attachments { get; set; }
    }

    public class InvitationAttachment
    {
        public string InvitationId { get; set; }
        public string Attachment { get; set; }
    }

    public class RSVP
    {
        public string RSVPId { get; set;}
        public string EventId { get; set; }
        public string Names { get; set; }
        public string IsAttending { get; set; }
        public int NoOfAttendies { get; set; }
    }
}
