using com.Informat.WebAPI.Models;
using com.Informat.WebAPI.Repository;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace com.Informat.WebAPI.Services
{
    public interface IInvitationService
    {
        Task<InvitationResponse> CreateInvitation(Invitation data);
    }

    public class InvitationService : IInvitationService
    {
        private readonly IInvitationRepo _invitationRepo;
        public InvitationService(IInvitationRepo invitationRepo)
        {
            _invitationRepo = invitationRepo;
        }


        public async Task<InvitationResponse> CreateInvitation(Invitation data)
        {
            var invitationId = Guid.NewGuid().ToString();

            Invitation invitation_req = new Invitation
            {
                InvitationId = invitationId,
                CoupleName = data.CoupleName,
                SecondCoupleName = data.SecondCoupleName,
                EventTitle = data.EventTitle,
                EventTime = data.EventTime,
                Email = data.Email,
                PhoneNumber = data.PhoneNumber,
                EventDate = data.EventDate,
                Location = data.Location,
                ExpiryDate = data.ExpiryDate,
                CreatedBy = data.CreatedBy,
            };

            var result = await _invitationRepo.CreateInvitation(invitation_req);
            await _invitationRepo.CreateInvitationAttachments(invitationId, data.Attachments);

            return result;
        }
    }
}
