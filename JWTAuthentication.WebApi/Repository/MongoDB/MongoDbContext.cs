using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using com.Informat.WebAPI.Models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace com.Informat.Services.Repository.MongoDB
{
    public interface IMongoContext : IDisposable
    {
        void AddCommand(Func<Task> func);
        Task<int> SaveChanges();
        IMongoCollection<T> GetCollection<T>(string name);
    }

    public class MongoDbContext : IMongoContext
    {
        private IMongoDatabase Database { get; set; }
        public IClientSessionHandle Session { get; set; }
        public MongoClient MongoClient { get; set; }
        private readonly List<Func<Task>> _commands;
        private readonly AppSettings _DBconfiguration;

        public MongoDbContext(IOptions<AppSettings> appIdentitySettingsAccessor)
        {

            _DBconfiguration = appIdentitySettingsAccessor.Value;
            // Every command will be stored and it'll be processed at SaveChanges
            _commands = new List<Func<Task>>();
        }

        public async Task<int> SaveChanges()
        {
            ConfigureMongo();

            using (Session = await MongoClient.StartSessionAsync())
            {
                Session.StartTransaction();

                var commandTasks = _commands.Select(c => c());

                await Task.WhenAll(commandTasks);

                await Session.CommitTransactionAsync();
            }

            return _commands.Count;
        }

        private void ConfigureMongo()
        {
            if (MongoClient != null)
                return;

            // Configure mongo (You can inject the config, just to simplify)
            MongoClient = new MongoClient(_DBconfiguration.MongoDbConnectionString);

            Database = MongoClient.GetDatabase("TaskVare");

        }

        public IMongoCollection<T> GetCollection<T>(string name)
        {
            ConfigureMongo();
            return Database.GetCollection<T>(typeof(T).Name);
        }

        public void Dispose()
        {
            Session?.Dispose();
            GC.SuppressFinalize(this);
        }

        public void AddCommand(Func<Task> func)
        {
            _commands.Add(func);
        }
    }

  
        
    
}
