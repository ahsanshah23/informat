using JWTAuthentication.WebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JWTAuthentication.WebApi.Services
{
    public interface IUserService
    {
        Task<ApplicationUser> RegisterAsync(RegisterModel model);

        Task<bool> DeleteUserAsync(string uid);
        Task<ApplicationUser> UpdateAsync(UpdateModel model);
        Task<AuthenticationModel> GetTokenAsync(TokenRequestModel model);
        Task<List<ApplicationUserDTO>> GetUsersAsync(int type);
        Task<string> AddRoleAsync(AddRoleModel model); 
        Task<AuthenticationModel> RefreshTokenAsync(string jwtToken); 
        bool RevokeToken(string token);
        ApplicationUser GetById(string id); 
        Task<bool> BlockUnblockUserAsync(string uid); 
        Task<IEnumerable<ApplicationUser>> GetUsersByRole(string rname);
    }
}
