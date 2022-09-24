﻿using com.Informat.WebAPI.Helper;
using com.Informat.WebAPI.Models;
using com.Informat.WebAPI.Repository;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using System.Configuration;

namespace com.Informat.WebAPI.Services
{
    public interface IInvitationService
    {
        Task<InvitationResponse> CreateInvitation(Invitation data);
    }

    public class InvitationService : IInvitationService
    {
        private readonly AppSettings _configuration;
        private readonly IInvitationRepo _invitationRepo;
        private readonly IHostingEnvironment Environment;
        private readonly IHelperMethods _helperMethods;
        private readonly IImageUpload _imageUpload;
        public InvitationService(IImageUpload imageUpload, Microsoft.Extensions.Options.IOptions<AppSettings> configuration, IInvitationRepo invitationRepo, IHelperMethods helperMethods, IHostingEnvironment _environment)
        {
            _invitationRepo = invitationRepo;
            Environment = _environment;
            _helperMethods = helperMethods;
            _configuration = configuration.Value;
            _imageUpload = imageUpload;
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
            foreach (var attach in data.Attachments)
            {
                string attachment = "";
                string path = Path.Combine(this.Environment.WebRootPath, _configuration.UploadsFolder);
                if (!string.IsNullOrEmpty(attach.Attachment))
                {
                    attachment = Guid.NewGuid().ToString() + ".png";
                    _imageUpload.SaveImage(path, attach.Attachment, attachment);
                    attach.Attachment = attachment;
                }
            }
            await _invitationRepo.CreateInvitationAttachments(invitationId, data.Attachments);

            return result;
        }
    }
}
