using JWTAuthentication.WebApi.Entities;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace JWTAuthentication.WebApi.Models
{
    public class ApplicationUser : IdentityUser
    {
        public bool? IsActive { get; set; }
        public string FullName { get; set; }
        public bool? IsDummyData { get; set; }
        public bool? IsPasswordSet { get; set; }
        public List<RefreshToken> RefreshTokens { get; set; }
    }

    public class ApplicationUserDTO
    {
        public string Role { get; set; }
        public ApplicationUser ApplicationUsers { get; set; }
    }


}
