using com.Informat.Services.Repository.SQL_Server;
using com.Informat.WebAPI.Models;
using com.Informat.WebAPI.Responses;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace com.Informat.WebAPI.Repository
{

    public interface ISubscriptionRepo
    {
        
        Task<UserSubscriptionResponse> CreateUserSubscription(UserSubscription data);
    }

    public class SubscriptionRepo : ISubscriptionRepo
    {
        protected IDbContext _dbContext = null;
        public SubscriptionRepo(IDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<UserSubscriptionResponse> CreateUserSubscription(UserSubscription data)
        {
            var p = new DynamicParameters();
            p.Add("@SubscriptionId", data.SubscriptionId);
            p.Add("@UserId", data.UserId);
            p.Add("@BuyingDate", DateTime.Now);
            p.Add("@ExpiresOn", DateTime.Now.AddDays(30));
            try
            {
                var entity = await _dbContext.Connection.QuerySingleOrDefaultAsync<UserSubscriptionResponse>
                ("Create_User_Subscription", p, commandType: CommandType.StoredProcedure, transaction: _dbContext.Transaction);

                return entity;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
