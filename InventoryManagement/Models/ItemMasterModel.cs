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
    public class ItemMasterModel : ItemMaster
    {

        public List<ItemMaster> GetItemMasters(int? id)
        {
            IMSDbContext db = new IMSDbContext();
            List<ItemMaster> p = db.Set<ItemMaster>().FromSqlRaw($"Exec usp_GetItemMaster {id}").ToList();
            return p;
        }

        public bool AdditemMaster(ItemMaster obj)
        {
            try
            {
                IMSDbContext db = new IMSDbContext();
                var result = db.Set<ItemMaster>().FromSqlRaw($"Exec usp_AddItemMaster '{obj.Code}','{obj.Name}',{obj.CreatedBy}").ToList();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool UpdateitemMaster(ItemMaster obj)
        {
            try
            {
                IMSDbContext db = new IMSDbContext();
                var result = db.Set<ItemMaster>().FromSqlRaw($"Exec usp_UpdateItemMaster '{obj.Id}','{obj.Code}', '{obj.Name}', {obj.ModifiedBy}").ToList();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool DeleteitemMaster(int id)
        {
            try
            {
                IMSDbContext db = new IMSDbContext();
                var result = db.Set<ItemMaster>().FromSqlRaw($"Exec usp_DeleteItemMaster {id},1").ToList();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
