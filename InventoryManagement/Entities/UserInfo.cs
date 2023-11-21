using System;
using System.Collections.Generic;

#nullable disable

namespace InventoryManagement.Entities
{
    public partial class UserInfo
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public bool? Status { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
