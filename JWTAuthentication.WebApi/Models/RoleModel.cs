﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace JWTAuthentication.WebApi.Models
{
    public class RoleModel
    {
        public string Id { get; set; }
        //[Required]
        //public string Email { get; set; }
        //[Required]
        //public string Password { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string CompanyId { get; set; }
    }
}
