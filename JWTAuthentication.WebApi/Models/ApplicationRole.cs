using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace com.Informat.WebAPI.Models
{
    public class ApplicationRole : IdentityRole
    {
        public ApplicationRole() : base() { }
        public ApplicationRole(string name) : base(name)
        {
            
        }
        public string CompanyId { get; set; }
        public bool? IsDummyData { get; set; }
     
    }
}
