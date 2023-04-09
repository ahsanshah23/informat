using com.Informat.Services.Repository.SQL_Server;
using com.Informat.WebAPI.Models;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Net.Mail;
using System.Threading.Tasks;

namespace com.Informat.WebAPI.Repository
{
    public interface IInvitationRepo
    {
        Task<InvitationResponse> GetInvitationById(string invitationId);
        Task<IEnumerable<InvitationResponse>> GetInvitationAttachments(string invitationId);
        Task<bool> AddRSVP(RSVP data);
        Task<IEnumerable<RSVPResponse>> GetRSVP(string eventId);
        Task<IEnumerable<InvitationResponse>> GetEvent(string userId);
        Task<InvitationResponse> CreateInvitation(Invitation data);
        Task<IEnumerable<InvitationAttachment>> CreateInvitationAttachments(string invitationId, IEnumerable<InvitationAttachment> attachments);
    }

    public class InvitationRepo : IInvitationRepo
    {
        protected IDbContext _dbContext = null;
        public InvitationRepo(IDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IEnumerable<InvitationResponse>> GetEvent(string userId)
        {
            var p = new DynamicParameters();
            p.Add("@UserId", userId);
            var entity = await _dbContext.Connection.QueryAsync<InvitationResponse>
            ("EventByUser", p, commandType: CommandType.StoredProcedure);

            return entity;
        }

        public async Task<IEnumerable<RSVPResponse>> GetRSVP(string eventId)
        {
            var p = new DynamicParameters();
            p.Add("@EventId", eventId);
            var entity = await _dbContext.Connection.QueryAsync<RSVPResponse>
            ("RSVPbyEvent", p, commandType: CommandType.StoredProcedure);

            return entity;
        }

        public async Task<bool> AddRSVP(RSVP data)
        {
            var p = new DynamicParameters();
            p.Add("@Id", data.RSVPId);
            p.Add("@Names", data.Names);
            p.Add("@IsAttending", data.IsAttending);
            p.Add("@NoOfAttendies", data.NoOfAttendies);
            p.Add("@EventId", data.EventId);

            try
            {
                var entity = await _dbContext.Connection.QuerySingleOrDefaultAsync<InvitationResponse>
                ("AddRSVP", p, commandType: CommandType.StoredProcedure, transaction: _dbContext.Transaction);

                return true;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public async Task<InvitationResponse> CreateInvitation(Invitation data)
        {
            var p = new DynamicParameters();
            p.Add("@InvitationId", data.InvitationId);
            p.Add("@CoupleName", data.CoupleName);
            p.Add("@SecondCoupleName", data.SecondCoupleName);
            p.Add("@EventTitle", data.EventTitle);
            p.Add("@EventTime", data.EventTime);
            p.Add("@Email", data.Email);
            p.Add("@PhoneNumber", data.PhoneNumber);
            p.Add("@EventDate", data.EventDate);
            p.Add("@Location", data.Location);
            p.Add("@ExpiryDate", data.ExpiryDate);
            p.Add("@UserId", data.UserId);
            p.Add("@UserSubscriptionId", data.UserSubscriptionId);
            p.Add("@SongId", data.SongId);

            try
            {
                var entity = await _dbContext.Connection.QuerySingleOrDefaultAsync<InvitationResponse>
                ("Create_Invitation", p, commandType: CommandType.StoredProcedure, transaction: _dbContext.Transaction);

                return entity;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public async Task<IEnumerable<InvitationAttachment>> CreateInvitationAttachments(string invitationId, IEnumerable<InvitationAttachment> attachments)
        {
            IEnumerable<InvitationAttachment> entity = null;
            DynamicParameters p = new DynamicParameters();
            try
            {
                p.Add("@InvitationId", invitationId);
                foreach (var item in attachments)
                {
                    p.Add("@Attachment", item.Attachment);

                    entity = await _dbContext.Connection.QueryAsync<InvitationAttachment>
                            ("Create_Invitation_Attachment", p, commandType: CommandType.StoredProcedure, transaction: _dbContext.Transaction);
                }
                return entity;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<InvitationResponse> GetInvitationById(string invitationId)
        {
            var p = new DynamicParameters();
            p.Add("@InvitationId", invitationId);
            var entity = await _dbContext.Connection.QuerySingleOrDefaultAsync<InvitationResponse>
            ("Get_Invitation_By_Id", p, commandType: CommandType.StoredProcedure);

            return entity;
        }
        public async Task<IEnumerable<InvitationResponse>> GetInvitationAttachments(string invitationId)
        {
            DynamicParameters p = new DynamicParameters();
            p.Add("@InvitationId", invitationId);
            try
            {
                var entities = await _dbContext.Connection.QueryAsync<InvitationResponse>
                        ("Get_Invitation_Attachments", p, commandType: CommandType.StoredProcedure, transaction: _dbContext.Transaction);

                return entities;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
