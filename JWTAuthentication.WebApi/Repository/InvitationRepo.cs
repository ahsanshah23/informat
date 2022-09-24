using com.Informat.Services.Repository.SQL_Server;
using com.Informat.WebAPI.Models;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace com.Informat.WebAPI.Repository
{
    public interface IInvitationRepo
    {
        Task<InvitationResponse> CreateInvitation(Invitation data);
        Task<IEnumerable<string>> CreateInvitationAttachments(string invitationId, IEnumerable<string> attachments);
    }

    public class InvitationRepo : IInvitationRepo
    {
        protected IDbContext _dbContext = null;
        public InvitationRepo(IDbContext dbContext)
        {
            _dbContext = dbContext;
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
            p.Add("@CreatedBy", data.CreatedBy);

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

        public async Task<IEnumerable<string>> CreateInvitationAttachments(string invitationId, IEnumerable<string> attachments)
        {
            IEnumerable<string> entity = null;
            DynamicParameters p = new DynamicParameters();
            try
            {
                p.Add("@InvitationId", invitationId);
                foreach (var item in attachments)
                {
                    p.Add("@Attachment", item);

                    entity = await _dbContext.Connection.QueryAsync<string>
                            ("Create_Invitation_Attachment", p, commandType: CommandType.StoredProcedure, transaction: _dbContext.Transaction);
                }
                return entity;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
