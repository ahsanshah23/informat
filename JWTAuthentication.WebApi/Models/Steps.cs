using System.Collections;
using System.Collections.Generic;

namespace com.Informat.WebAPI.Models
{
    public class Steps
    {
        public string Id { get; set; }
        public IEnumerable<string> ApproverRoleIds { get; set; }
    }
}
