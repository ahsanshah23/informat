using com.Informat.Services.Repository.SQL_Server;
using Dapper;
using System.Data;
using System.Threading.Tasks;
using System;

namespace com.Informat.WebAPI.Repository
{
    public interface IEmailRepo
    {
        Task<int> InsertEmail(string Emailcc, string EmailBcc, string EmailBody, string Emailto, string EmailError, string EmailSubject, bool status);
    }
    public class EmailRepo : IEmailRepo
    {
        protected IDbContext _dbContext = null;

        public EmailRepo(IDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<int> InsertEmail(string Emailcc, string EmailBcc, string EmailBody, string Emailto, string EmailError, string EmailSubject, bool status)
        {
            try
            {
                var p = new DynamicParameters();
                p.Add("@Emailcc", Emailcc);
                p.Add("@EmailBcc", EmailBcc);
                p.Add("@EmailBody", EmailBody);
                p.Add("@EmailTo", Emailto);
                p.Add("@EmailError", EmailError);
                p.Add("@EmailStatus", status);
                p.Add("@CreatedDate", DateTime.Now);
                p.Add("@Subject", EmailSubject);

                var entity = await _dbContext.Connection.QueryAsync<int>
                      ("Email-log-Insert", p, commandType: CommandType.StoredProcedure, transaction: _dbContext.Transaction);

                return 0;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
