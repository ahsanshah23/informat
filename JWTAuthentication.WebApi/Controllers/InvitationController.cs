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
    public class InvitationController : ControllerBase
    {
        private readonly IInvitationService _invitationService;
        public InvitationController(IInvitationService invitationService)
        {
            _invitationService = invitationService;
        }

        [HttpPost("create-invitation")]
        public async Task<IActionResult> CreateInvitation(Invitation data)
        {
            try
            {
                var result = await _invitationService.CreateInvitation(data);
                return Ok(new ApiResponse
                {
                    status_code = ((result != null) ? (int)HttpStatusCode.OK : (int)HttpStatusCode.BadRequest),
                    Message = result != null ? "Invitation created" : "failed",
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
