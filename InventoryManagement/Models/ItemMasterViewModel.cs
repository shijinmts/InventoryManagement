using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InventoryManagement.Models
{
    public class ItemMasterViewModel
    {
        public ItemMasterModel itemMasterModel { get; set; }
        public List<ItemQuantityModel> itemquantitymodels { get; set; }
    }
}
