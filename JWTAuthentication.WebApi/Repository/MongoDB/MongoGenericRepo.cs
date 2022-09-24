using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MongoDB.Driver;
using ServiceStack;

namespace com.Informat.Services.Repository.MongoDB
{
    public interface IRepository<TEntity> : IDisposable where TEntity : class
    {
        void Add(TEntity obj);
        Task<TEntity> GetById(Guid id);
        Task<TEntity> GetById(string id);
        Task<IEnumerable<TEntity>> GetAll();
        void Update(TEntity obj);
        void Remove(Guid id);
        void Remove(string id);
        Task<bool> Commit();
        Task<IEnumerable<TEntity>> GetByColumnName(string name, string value);
        Task<IEnumerable<TEntity>> GetByColumnName(string name, bool value);
    }
    public abstract class MongoGenericRepo<TEntity> : IRepository<TEntity> where TEntity : class
    {
        protected readonly IMongoContext Context;
        protected IMongoCollection<TEntity> DbSet;

        protected MongoGenericRepo(IMongoContext context)
        {
            Context = context;
            ConfigDbSet();
        }

        public async virtual void Add(TEntity obj)
        {
            ConfigDbSet();
            Context.AddCommand(() => DbSet.InsertOneAsync(obj));

        }

        private void ConfigDbSet()
        {
            DbSet = Context.GetCollection<TEntity>(typeof(TEntity).Name);
        }

        public async Task<TEntity> GetById(Guid id)
        {
            ConfigDbSet();
            var data = await DbSet.FindAsync(Builders<TEntity>.Filter.Eq("_id", id));
            return data.SingleOrDefault();
        }
        public async Task<IEnumerable<TEntity>> GetByColumnName(string name, string value)
        {
            ConfigDbSet();
            var data = await DbSet.FindAsync(Builders<TEntity>.Filter.Eq(name, value));
            return data.ToList();
        }

        public async Task<IEnumerable<TEntity>> GetByColumnName(string name, bool value)
        {
            ConfigDbSet();
            var data = await DbSet.FindAsync(Builders<TEntity>.Filter.Eq(name, value));
            return data.ToList();
        }

        public virtual async Task<IEnumerable<TEntity>> GetAll()
        {
            ConfigDbSet();
            var all = await DbSet.FindAsync(Builders<TEntity>.Filter.Empty);
            return all.ToList();
        }

        public virtual void Update(TEntity obj)
        {
            ConfigDbSet();
            Context.AddCommand(() => DbSet.ReplaceOneAsync(Builders<TEntity>.Filter.Eq("_id", obj.GetId()), obj));
        }

        public virtual void Remove(Guid id)
        {
            ConfigDbSet();
            Context.AddCommand(() => DbSet.DeleteOneAsync(Builders<TEntity>.Filter.Eq("_id", id)));
        }

        public async Task<bool> Commit()
        {
            var changeAmount = await Context.SaveChanges();
            return changeAmount > 0;
        }

        public void Dispose()
        {
            Context?.Dispose();
        }

        public async Task<TEntity> GetById(string id)
        {
            ConfigDbSet();
            var data = await DbSet.FindAsync(Builders<TEntity>.Filter.Eq("_id", id));
            return data.SingleOrDefault();
        }

        public void Remove(string id)
        {
            ConfigDbSet();
            Context.AddCommand(() => DbSet.DeleteOneAsync(Builders<TEntity>.Filter.Eq("_id", id)));
        }

        //public void RemoveWatchlist(Models.Models.Watchlist watchlist)
        //{
        //    var update = DbSet.FindOneAndUpdateAsync(Builders<Models.Models.Watchlist>.Filter.Eq("_id", watchlist._id), Builders<Models.Models.Watchlist>.Update.Set("isActive", watchlist.isActive = false));
        //}

    }
}
