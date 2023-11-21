using System;
using System.Collections.Generic;

#nullable disable

namespace InventoryManagement.Entities
{
    public partial class ItemQuantity
    {
        public int Id { get; set; }
        public string ItemCode { get; set; }
        public double Quantity { get; set; }
        public double Price { get; set; }
        public bool? Status { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public int? ModifiedBy { get; set; }
        public DateTime? ModifiedOn { get; set; }
    }
}
