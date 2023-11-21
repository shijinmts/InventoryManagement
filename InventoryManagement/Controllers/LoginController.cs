using InventoryManagement.Entities;
using InventoryManagement.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InventoryManagement.Controllers
{
    public class LoginController : Controller
    {

        // GET: /Login/Login

        public ActionResult Login()
        {
            return
            View();
        }
        // POST: /Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel model)
        {
            UserInfo objUser = new UserInfo
            {
                UserName = model.Username,
                Password = model.Password
            };

            var loginresponse = new LoginViewModel().Login(objUser);
            // return View(loginresponse);
            if (loginresponse)
            {
                return  RedirectToAction("Index", "Home");
            }
            else
            {
               
                return View(model);
            }
           
        }
    }
}
