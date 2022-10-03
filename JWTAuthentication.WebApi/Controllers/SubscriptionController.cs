using com.Informat.WebAPI.Models;
using com.Informat.WebAPI.Services;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System.Threading.Tasks;
using System;

namespace com.Informat.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubscriptionController : ControllerBase
    {
        private readonly ISubscriptionService _subscriptionService;
        public SubscriptionController(ISubscriptionService subscriptionService)
        {
            _subscriptionService = subscriptionService;
        }

        [HttpPost("create-user-subscription")]
        public async Task<IActionResult> CreateUserSubscription(UserSubscription data)
        {
            try
            {
                var result = await _subscriptionService.CreateUserSubscription(data);
                return Ok(new ApiResponse
                {
                    status_code = ((result != null) ? (int)HttpStatusCode.OK : (int)HttpStatusCode.BadRequest),
                    Message = result != null ? "User subscription created" : "failed",
                    data = result
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex);
            }
        }

        [HttpGet("check-subscription")]
        public async Task<IActionResult> CheckSubscription(string userId)
        {
            try
            {
                var result = await _subscriptionService.CheckUserSubsciption(userId);
                return Ok(new ApiResponse
                {
                    status_code = (int)HttpStatusCode.OK,
                    Message = result != null ? "User subscription exists" : "No user subscription exists",
                    data = result
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex);
            }
        }
    }
}
