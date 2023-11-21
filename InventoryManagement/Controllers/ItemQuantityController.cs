using InventoryManagement.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InventoryManagement.Controllers
{
    public class ItemQuantityController : Controller
    {
        // GET: ItemQuantityController
        public ActionResult Index()
        {
            var p = new ItemQuantityModel().GetItemQuantity(null);
            return View(p);
           
        }

        // GET: ItemQuantityController/Details/5
        public ActionResult Details(int id)
        {
            var p = new ItemQuantityModel().GetItemQuantity(id)?.FirstOrDefault();
            return View(p);
        }

        // GET: ItemQuantityController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ItemQuantityController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                Entities.ItemQuantity obj = new Entities.ItemQuantity
                {
                    ItemCode = collection["ItemCode"].ToString(),
                    Price = Convert.ToDouble(collection["Price"]),
                    Quantity = Convert.ToDouble(collection["Quantity"]),
                    CreatedBy = 1,
                };
                new ItemQuantityModel().AdditemQuantity(obj);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ItemQuantityController/Edit/5
        public ActionResult Edit(int id)
        {
            var p = new ItemQuantityModel().GetItemQuantity(id)?.FirstOrDefault();
            return View(p);
        }

        // POST: ItemQuantityController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
        {
            try
            {
                Entities.ItemQuantity obj = new Entities.ItemQuantity
                {
                    Id = id,                 
                    Price = Convert.ToDouble(collection["Price"]),
                    Quantity = Convert.ToDouble(collection["Quantity"]),
                    ModifiedBy = 1,
                };
                new ItemQuantityModel().UpdateitemQuantity(obj);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ItemQuantityController/Delete/5
        public ActionResult Delete(int id)
        {
            var p = new ItemQuantityModel().GetItemQuantity(id)?.FirstOrDefault();
            return View(p);
        }

        // POST: ItemQuantityController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                new ItemQuantityModel().DeleteitemQuantity(id);
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
    }
}
