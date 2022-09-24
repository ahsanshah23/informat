using System.ComponentModel.DataAnnotations;

namespace JWTAuthentication.WebApi.Models
{
    public class RoleModification
    {
        
        public string RoleName { get; set; }

        public string RoleId { get; set; }
        
        public string[] AddIds { get; set; }
        
        public string[] DeleteIds { get; set; }
    }
}
