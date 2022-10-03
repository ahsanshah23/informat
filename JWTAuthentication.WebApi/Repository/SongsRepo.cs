using com.Informat.Services.Repository.SQL_Server;
using com.Informat.WebAPI.Models;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace com.Informat.WebAPI.Repository
{
    public interface ISongsRepo
    {
        Task<IEnumerable<Songs>> GetAll();
    }

    public class SongsRepo : ISongsRepo
    {
        protected IDbContext _dbContext = null;
        public SongsRepo(IDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IEnumerable<Songs>> GetAll()
        {
            try
            {
                var entities = await _dbContext.Connection.QueryAsync<Songs>
                        ("Get_All_Songs", commandType: CommandType.StoredProcedure, transaction: _dbContext.Transaction);

                return entities;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
