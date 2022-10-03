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
    public class SongsController : ControllerBase
    {
        private readonly ISongsService _songsService;
        public SongsController(ISongsService songsService)
        {
            _songsService = songsService;
        }

        [HttpGet("get-all")]
        public async Task<IActionResult> GetAll()
        {
            try
            {
                var result = await _songsService.GetAll();
                return Ok(new ApiResponse
                {
                    status_code = ((result != null) ? (int)HttpStatusCode.OK : (int)HttpStatusCode.BadRequest),
                    Message = result != null ? "Songs loaded" : "failed",
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
