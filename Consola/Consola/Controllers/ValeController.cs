using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Consola.Controllers
{
    public class ValeController : Controller
    {
        // GET: Vale
        public ActionResult Index()
        {
            return View();
        }

        // GET: Vale/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Vale/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Vale/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Vale/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Vale/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Vale/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Vale/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
