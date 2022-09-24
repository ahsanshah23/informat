using com.Informat.WebAPI.Models;
using JWTAuthentication.WebApi.Models;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JWTAuthentication.WebApi.Services
{
    public interface IRoleService
    {
        Task<ApplicationRole> CreateAsync(RoleModel model);

        Task<List<ApplicationRole>> GetRolesAsync();
        Task<List<ApplicationRole>> GetRolesByCompany(string companyId);

        IdentityRole GetById(string id);

        Task<ApplicationRole> UpdateAsync(RoleModel model);

        Task<bool> UpdateRolesAsync(RoleModification model);
        Task<bool> DeleteRoleAsync(string rid);
    }
}
