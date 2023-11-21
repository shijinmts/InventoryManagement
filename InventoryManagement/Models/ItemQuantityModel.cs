using InventoryManagement.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Query;
using Microsoft.EntityFrameworkCore.SqlServer;
using Microsoft.Data.SqlClient;

namespace InventoryManagement.Models
{
    public class ItemQuantityModel:ItemQuantity
    {
        public List<ItemMaster> ItemMMasters = new ItemMasterModel().GetItemMasters(null);
            
        public List<ItemQuantity> GetItemQuantity(int? id)
        {
            IMSDbContext db = new IMSDbContext();
            List<ItemQuantity> p = db.Set<ItemQuantity>().FromSqlRaw($"Exec usp_GetItemQuantity {id}").ToList();
            return p;
        }

        public bool AdditemQuantity(ItemQuantity obj)
        {
            try
            {
                IMSDbContext db = new IMSDbContext();
                var result = db.Set<ItemQuantity>().FromSqlRaw($"Exec usp_AddItemQuantity '{obj.ItemCode}','{obj.Price}','{obj.Quantity}',{obj.CreatedBy}").ToList();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool UpdateitemQuantity(ItemQuantity obj)
        {
            try
            {
                IMSDbContext db = new IMSDbContext();
                var result = db.Set<ItemQuantity>().FromSqlRaw($"Exec usp_UpdateItemQuantity '{obj.Id}','{obj.Price}','{obj.Quantity}', {obj.ModifiedBy}").ToList();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteitemQuantity(int id)
        {
            try
            {
                IMSDbContext db = new IMSDbContext();
                var result = db.Set<ItemQuantity>().FromSqlRaw($"Exec usp_DeleteItemQuantity {id},1").ToList();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
