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
    public class ItemMasterController : Controller
    {
        // GET: ItemMasterController1
        public ActionResult Index()
        {
            var p = new ItemMasterModel().GetItemMasters(null);
            return View(p);
        }

        // GET: ItemMasterController1/Details/5
        public ActionResult Details(int id)
        {
            var p = new ItemMasterModel().GetItemMasters(id)?.FirstOrDefault();
            return View(p);
        }

        // GET: ItemMasterController1/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ItemMasterController1/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                ItemMaster obj = new ItemMaster
                {
                    Code = collection["Code"].ToString(),
                    Name = collection["Name"].ToString(),
                    CreatedBy = 1,
                };
                new ItemMasterModel().AdditemMaster(obj);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ItemMasterController1/Edit/5
        public ActionResult Edit(int id)
        {
            var p = new ItemMasterModel().GetItemMasters(id)?.FirstOrDefault();
            return View(p);
        }

        // POST: ItemMasterController1/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                ItemMaster obj = new ItemMaster
                {
                    Id = id,
                    Code = collection["Code"].ToString(),
                    Name = collection["Name"].ToString(),
                    ModifiedBy = 1,
                };
                new ItemMasterModel().UpdateitemMaster(obj);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ItemMasterController1/Delete/5
        public ActionResult Delete(int id)
        {
            var p = new ItemMasterModel().GetItemMasters(id)?.FirstOrDefault();
            return View(p);
        }

        // POST: ItemMasterController1/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                new ItemMasterModel().DeleteitemMaster(id);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
