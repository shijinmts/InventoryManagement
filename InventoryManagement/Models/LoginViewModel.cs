using InventoryManagement.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InventoryManagement.Models
{
    public class LoginViewModel
    {
        public string Username { get; set; }

        public string Password { get; set; }

        public bool Login(UserInfo obj)
        {
            try
            {
                IMSDbContext db = new IMSDbContext();
                var result = db.Set<UserInfo>().FromSqlRaw($"Exec usp_GetUserLogin '{obj.UserName}','{obj.Password}'").ToList();
               if(result.Count!=0)                
                return true;
               else
                    return false;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}
