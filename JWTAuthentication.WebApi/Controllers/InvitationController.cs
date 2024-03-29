﻿using com.Informat.WebAPI.Models;
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

        [HttpGet("get-invitation-by-id")]
        public async Task<IActionResult> GetInvitationById(string invitationId)
        {
            try
            {
                var result = await _invitationService.GetInvitationById(invitationId);
                return Ok(new ApiResponse
                {
                    status_code = ((result != null) ? (int)HttpStatusCode.OK : (int)HttpStatusCode.BadRequest),
                    Message = result != null ? " Leave Request loaded" : "failed",
                    data = result
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex);
            }
        }


        [HttpGet("get-events-by-user")]
        public async Task<IActionResult> GetEvents(string userId)
        {
            try
            {
                var result = await _invitationService.GetEvent(userId);
                return Ok(new ApiResponse
                {
                    status_code = ((result != null) ? (int)HttpStatusCode.OK : (int)HttpStatusCode.BadRequest),
                    Message = result != null ? "Event Details" : "failed",
                    data = result
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex);
            }
        }

        [HttpGet("get-rsvp-by-event")]
        public async Task<IActionResult> GetRSVP(string eventId)
        {
            try
            {
                var result = await _invitationService.GetRSVP(eventId);
                return Ok(new ApiResponse
                {
                    status_code = ((result != null) ? (int)HttpStatusCode.OK : (int)HttpStatusCode.BadRequest),
                    Message = result != null ? "RSVP Details" : "failed",
                    data = result
                });
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex);
            }
        }

        [HttpPost("create-rsvp")]
        public async Task<IActionResult> AddRSVP(RSVP data)
        {
            try
            {
                var result = await _invitationService.AddRSVP(data);
                return Ok(new ApiResponse
                {
                    status_code = ((result != null) ? (int)HttpStatusCode.OK : (int)HttpStatusCode.BadRequest),
                    Message = result != null ? "RSVP added" : "failed",
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
