using com.Informat.WebAPI.Models;
using com.Informat.WebAPI.Repository;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace com.Informat.WebAPI.Services
{
    public interface ISongsService
    {
        Task<IEnumerable<Songs>> GetAll();
    }

    public class SongsService : ISongsService
    {
        private readonly ISongsRepo _songsRepo;
        public SongsService(ISongsRepo songsRepo)
        {
            _songsRepo = songsRepo;
        }

        public async Task<IEnumerable<Songs>> GetAll()
        {
            var result = await _songsRepo.GetAll();
            
            return result;

        }
    }
}
