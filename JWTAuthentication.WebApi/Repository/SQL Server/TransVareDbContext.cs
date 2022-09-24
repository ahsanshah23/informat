using com.Informat.WebAPI.Models;
using Dapper;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace com.Informat.WebAPI.Repository.SQL_Server
{
 
    public interface ITransVareDbContext : IDisposable
    {
        IDbConnection Connection { get; }
        IDbTransaction Transaction { get; }
        Task<IDbTransaction> OpenTransaction();
        Task<IDbTransaction> OpenTransaction(IsolationLevel level);
        void CommitTransaction(bool disposeTrans = true);
        void RollbackTransaction(bool disposeTrans = true);
        //IAccountsRepo AccountsRepo { get; }
    }

    public class TransVareDbContext : ITransVareDbContext
    {
        protected readonly IConfiguration _config;
        protected IDbConnection _cn = null;
        private readonly AppSettings _dbconfiguration;

        public TransVareDbContext(IOptions<AppSettings> appIdentitySettingsAccessor)
        {
            _dbconfiguration = appIdentitySettingsAccessor.Value;
            DefaultTypeMap.MatchNamesWithUnderscores = true;
            _cn = new SqlConnection(_dbconfiguration.SQLServerConnectionString);
        }

        public IDbConnection Connection
        {
            get => _cn;
        }

        protected IDbTransaction _trans = null;
        public IDbTransaction Transaction
        {
            get => _trans;
        }

        //protected IAccountsRepo _accountsRepo;
        //public IAccountsRepo AccountsRepo
        //{
        //    get
        //    {
        //        if (_accountsRepo == null)
        //            _accountsRepo = new AccountsRepo(this);
        //        return _accountsRepo;
        //    }
        //}

        public async Task<IDbTransaction> OpenTransaction()
        {
            if (_trans != null)
                throw new Exception("A transaction is already open, you need to use a new DbContext for parallel job.");

            if (_cn.State == ConnectionState.Closed)
            {
                if (!(_cn is DbConnection))
                    throw new Exception("Connection object does not support OpenAsync.");

                await (_cn as DbConnection).OpenAsync();
            }

            _trans = _cn.BeginTransaction();

            return _trans;
        }

        public async Task<IDbTransaction> OpenTransaction(IsolationLevel level)
        {
            if (_trans != null)
                throw new Exception("A transaction is already open, you need to use a new DbContext for parallel job.");

            if (_cn.State == ConnectionState.Closed)
            {
                if (!(_cn is DbConnection))
                    throw new Exception("Connection object does not support OpenAsync.");

                await (_cn as DbConnection).OpenAsync();
            }

            _trans = _cn.BeginTransaction(level);

            return _trans;
        }

        public void CommitTransaction(bool disposeTrans = true)
        {
            if (_trans == null)
                throw new Exception("DB Transaction is not present.");

            _trans.Commit();
            if (disposeTrans) _trans.Dispose();
            if (disposeTrans) _trans = null;
        }

        public void RollbackTransaction(bool disposeTrans = true)
        {
            if (_trans == null)
                throw new Exception("DB Transaction is not present.");

            _trans.Rollback();
            if (disposeTrans) _trans.Dispose();
            if (disposeTrans) _trans = null;
        }

        public void Dispose()
        {
            _trans?.Dispose();
            _cn?.Close();
            _cn?.Dispose();
        }
    }
}
