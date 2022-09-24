using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using JWTAuthentication.WebApi.Models;
using JWTAuthentication.WebApi.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JWTAuthentication.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        public UserController(IUserService userService)
        {
            _userService = userService;
        }
        [HttpPost("register")]
        public async Task<ActionResult> RegisterAsync(RegisterModel model)  //Signup
        {

            var result = await _userService.RegisterAsync(model);
            return Ok(result);
        }

        [HttpPut("update-user")]
        public async Task<ActionResult> UpdateAsync(UpdateModel model)  //Update user
        {

            var result = await _userService.UpdateAsync(model);
            return Ok(result);
        }
        [HttpPost("token")]
        public async Task<IActionResult> GetTokenAsync(TokenRequestModel model) //Login
        {
            var result = await _userService.GetTokenAsync(model);
            if(result.IsAuthenticated==true)
                SetRefreshTokenInCookie(result.RefreshToken);
            return Ok(result);
        }

        [HttpGet("get-users")]
        public async Task<IActionResult> GetUsersAsync(int type) //Get Users

        {
            
            var result = await _userService.GetUsersAsync(type);

            
            
            return Ok(result);
        }

        [HttpDelete("delete-user")]
        public async Task<IActionResult> DeleteUserAsync(string uid) //delete user
        {
            var result = await _userService.DeleteUserAsync(uid);

            return Ok(result);
        }

        [HttpPost("get-user-by-id")]
        public IActionResult GetUserByID(string uid) //Get User by id
        {
            var result =  _userService.GetById(uid);

            return Ok(result);
        }

        [HttpPost("addrole")]
        public async Task<IActionResult> AddRoleAsync(AddRoleModel model) 
        {
            var result = await _userService.AddRoleAsync(model);
            return Ok(result);
        }

        
        [HttpGet("refresh-token")]
        public async Task<IActionResult> RefreshToken()  //?
        {
            var refreshToken = Request.Cookies["refreshToken"];
            var response = await _userService.RefreshTokenAsync(refreshToken);
            if (!string.IsNullOrEmpty(response.RefreshToken))
                SetRefreshTokenInCookie(response.RefreshToken);
            return Ok(response);
        }
        

        [HttpPost("revoke-token")]
        public async Task<IActionResult> RevokeToken([FromBody] RevokeTokenRequest model) //logout
        {
            // accept token from request body or cookie
            var token = model.Token ?? Request.Cookies["refreshToken"];

            if (string.IsNullOrEmpty(token))
                return BadRequest(new { message = "Token is required" });

            var response = _userService.RevokeToken(token);

            if (!response)
                return NotFound(new { message = "Token not found" });

            return Ok(new { message = "Token revoked" });
        }
        
        private void SetRefreshTokenInCookie(string refreshToken)
        {
            var cookieOptions = new CookieOptions
            {
                Secure = true,
                SameSite = SameSiteMode.None,
                HttpOnly = true,
                Expires = DateTime.UtcNow.AddDays(10),
            };
            Response.Cookies.Append("refreshToken", refreshToken, cookieOptions);
        }

        [Authorize]
        [HttpPost("tokens/{id}")]  
        public IActionResult GetRefreshTokens(string id) //?
        {
            var user = _userService.GetById(id);
            return Ok(user.RefreshTokens);
        }

        [HttpGet("get-users-by-role")]
        public IActionResult GetUsersByRole(string rname) //Get users by role name 
        {

            var result = _userService.GetUsersByRole(rname);

            return Ok(result.Result);
        }

        [HttpPost("blockUnblock-user")]
        public IActionResult BlockUnblock(string uid) //Get users by role name 
        {
            var result = _userService.BlockUnblockUserAsync(uid);

            return Ok(result.Result);
        }
    }
}