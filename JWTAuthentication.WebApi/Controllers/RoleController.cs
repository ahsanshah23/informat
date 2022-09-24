using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using JWTAuthentication.WebApi.Models;
using JWTAuthentication.WebApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
 
namespace com.Informat.WebAPI.Controllers

{
    [Route("api/[controller]")]
    [ApiController]
    public class RoleController : ControllerBase
    {
        private readonly IRoleService _roleService;
        public RoleController(IRoleService roleService)
        {
            _roleService = roleService;
        }

        [HttpPost("create-role")]
        public async Task<IActionResult> CreateRoleAsync(RoleModel model)
        {
            var result = await _roleService.CreateAsync(model);
            return Ok(result);

        }

        [HttpGet("get-roles")]
        public async Task<IActionResult> GetRolesAsync() //Get Roles
        {
            var result = await _roleService.GetRolesAsync();

            return Ok(result);
        }

        [HttpGet("get-roles-by-company")]
        public async Task<IActionResult> GetRolesByCompany(string companyId) //Get Roles
        {
            var result = await _roleService.GetRolesByCompany(companyId);

            return Ok(result);
        }

        [HttpPost("get-role-by-id")]
        public IActionResult GetRoleByID(string rid) //Get Role by id
        {
            var result = _roleService.GetById(rid);

            return Ok(result);
        }

        [HttpPut("update-role")]
        public async Task<ActionResult> UpdateAsync(RoleModel model)  //Update role
        {

            var result = await _roleService.UpdateAsync(model);
            return Ok(result);
        }

        [HttpDelete("delete-role")]
        public async Task<IActionResult> DeleteRoleAsync(string rid) //delete role
        {
            var result = await _roleService.DeleteRoleAsync(rid);

            return Ok(result);
        }

        [HttpPut("update-roles")]
        public async Task<ActionResult> UpdateRolesAsync(RoleModification model)  //Update role
        {

            var result = await _roleService.UpdateRolesAsync(model);
            return Ok(result);
        }
    }
}
