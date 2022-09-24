using com.Informat.WebAPI.Models;
using JWTAuthentication.WebApi.Constants;
using JWTAuthentication.WebApi.Contexts;
using JWTAuthentication.WebApi.Entities;
using JWTAuthentication.WebApi.Models;
using JWTAuthentication.WebApi.Settings;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace JWTAuthentication.WebApi.Services
{
    public class RoleService : IRoleService
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<ApplicationRole> _roleManager;
        private readonly JWT _jwt;

        public RoleService(UserManager<ApplicationUser> userManager, RoleManager<ApplicationRole> roleManager, IOptions<JWT> jwt, ApplicationDbContext context)
        {
            _context = context;
            _userManager = userManager;
            _roleManager = roleManager;
            _jwt = jwt.Value;
        }

        public async Task<ApplicationRole> CreateAsync(RoleModel model)
        {
            var role = new ApplicationRole
            {
                Name = model.CompanyId + "_" + model.Name,
                CompanyId = model.CompanyId
            };
            IdentityResult result = await _roleManager.CreateAsync(role);
            //if (result.Succeeded)
            //    return role;
            //else
            //    return role;

            return role;
        }

        public async Task<List<ApplicationRole>> GetRolesAsync()
        {
            var roles = _roleManager.Roles.ToList();

            return roles;
        }

        public async Task<List<ApplicationRole>> GetRolesByCompany(string companyId)
        {
            var roles = _roleManager.Roles.Where(x => x.CompanyId == companyId).ToList();
            foreach (var role in roles)
            {
                role.Name = role.Name.Split('_')[1];
            }

            return roles;
        }

        public IdentityRole GetById(string id)
        {
            return _context.Roles.Find(id);
        }

        public async Task<ApplicationRole> UpdateAsync(RoleModel model)
        {
            ApplicationRole role = await _roleManager.FindByIdAsync(model.Id);
            if (role != null)
            {
                role.Name = model.Name;
                await _roleManager.UpdateAsync(role);
            }
            return role;
        }

        public async Task<bool> UpdateRolesAsync(RoleModification model)
        {
            IdentityResult result;
            foreach (string userId in model.AddIds ?? new string[] { })
            {
                ApplicationUser user = await _userManager.FindByIdAsync(userId);
                if (user != null)
                {
                    model.RoleName = _roleManager.FindByIdAsync(model.RoleId).Result.Name;
                    result = await _userManager.AddToRoleAsync(user, model.RoleName);
                }
            }
            foreach (string userId in model.DeleteIds ?? new string[] { })
            {
                ApplicationUser user = await _userManager.FindByIdAsync(userId);
                if (user != null)
                {
                    model.RoleName = _roleManager.FindByIdAsync(model.RoleId).Result.Name;
                    result = await _userManager.RemoveFromRoleAsync(user, model.RoleName);
                    //if (!result.Succeeded)
                    //    Errors(result);
                }
            }
            return true;
        }

        public async Task<bool> DeleteRoleAsync(string rid)
        {
            ApplicationRole role = await _roleManager.FindByIdAsync(rid);
            if (role != null)
            {
                IdentityResult result = await _roleManager.DeleteAsync(role);
                if (result.Succeeded)
                    return true;
                else
                    return false;

            }
            return true;
        }
    }
}
