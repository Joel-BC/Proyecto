﻿using BLL;
using Consola.Helpers;
using Consola.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Consola.Controllers
{
    [SessionManage]
    public class CotizacionController : Controller
    {
        public ActionResult Index()
        {
            try
            {
                List<Cotizacion> listaCotizacion = new List<Cotizacion>();
                clsCotizacion cliente = new clsCotizacion();
                var data = cliente.ConsultarCotizacion().ToList();

                foreach (var item in data)
                {
                    Cotizacion modelo = new Cotizacion();
                    modelo.idCotizacion = item.idCotizacion;
                    modelo.idColaborador = item.idColaborador;
                    modelo.nombreProductoCotizacion = item.nombreProductoCotizacion;
                    modelo.cantidadProductoCotizacion = item.cantidadProductoCotizacion;
                    modelo.detalleCotizacion = item.detalleCotizacion;
                    modelo.estadoCotizacion = item.estadoCotizacion;

                    listaCotizacion.Add(modelo);

                }
                return View(listaCotizacion);
            }
            catch
            {
                string descMsg = "Error consultando la informacion del CLiente.";
                //Bitacora
                return RedirectToAction("Error", "Error");
            }
        }

        [HttpGet]
        public ActionResult EnviarCorreo()
        {
            clsCotizacion ObjCotizacion = new clsCotizacion();
            ViewBag.Lista = ObjCotizacion.ConsultaCorreoProveedor().ToList();
            return View();
        }

        [HttpPost]
        public ActionResult EnviarCorreo(string txtCorreoElectronico, string asunto, string mensaje
            , string txtIdColaboradorCotizacion, string txtNombreProductoCotizacion, string txtCantidadProductoCotizacion, string txtDetalleCotizacion)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    clsCotizacion ObjCotizacion = new clsCotizacion();
                    bool Resultado = ObjCotizacion.AgregarCotizacion(Int32.Parse(txtIdColaboradorCotizacion), txtNombreProductoCotizacion,
                        Int32.Parse(txtCantidadProductoCotizacion), txtDetalleCotizacion, true);

                    if (Resultado)
                    {
                        System.Net.Mail.MailMessage mmsg = new System.Net.Mail.MailMessage();

                        mmsg.To.Add(txtCorreoElectronico);
                        asunto = "Cotización Tarimas LS";
                        mensaje =

                              "<h1 text-align: center;><b> Solicitud de cotización Tarimas LS </b></h1>" +
                            "<br />" +
                            "<br /> Este es un correo automatizado del sistema de Tarimas LS, se le solicita la cotización de lo siguiente: " +
                            "<br />" +
                            "<br /> ********************************************************************************************** " +
                            "<h3 text-align: center;><b> Cotización: </b></h3>" +
                            "<br /> Nombre de producto: " + txtNombreProductoCotizacion +
                            "<br /> Cantidad: " + txtCantidadProductoCotizacion +
                            "<br /> Detalles: " + txtDetalleCotizacion +
                            "<br /> ********************************************************************************************** " +
                            "<br />" +
                            "<br /> Tarimas LS S.A. <a href='https://www.tarimasls.com/'> Tarimas LS S.A </a>";

                        mmsg.Subject = asunto;
                        mmsg.SubjectEncoding = System.Text.Encoding.UTF8;

                        mmsg.Body = mensaje;
                        mmsg.BodyEncoding = System.Text.Encoding.UTF8;
                        mmsg.IsBodyHtml = true;
                        mmsg.From = new System.Net.Mail.MailAddress("sistemaASEcorreo@gmail.com"); //En "correo" se tiene que escribir el correo que va a usar el sistema para enviar correos

                        System.Net.Mail.SmtpClient cliente = new System.Net.Mail.SmtpClient();

                        cliente.Credentials = new System.Net.NetworkCredential("sistemaASEcorreo@gmail.com", "sisASE-123"); //En "correo" se escribe de nuevo el correo que va a usar el sistema y en contraseña va la contraseña del correo
                                                                                                                            //OJO: cuidado ponen su correo y contraseña aqui y mandan una version del proyecto por accidente con eso
                        cliente.Port = 587;
                        cliente.EnableSsl = true;
                        cliente.Host = "smtp.gmail.com"; //esta dirección de hosteo va a cambiar dependiendo del proveedor de correo electronico que se use en el correo del sistema, en esta caso, esa es la dirección de hosteo de gmail

                        try
                        {
                            cliente.Send(mmsg);
                        }
                        catch (Exception ex)
                        {
                            ViewBag.Error = ex.Message;
                        }
                        TempData["alertaMensaje"] = "La cotización ha sido enviada por correo exitosamente.";
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        return View("Crear");
                    }
                }
                else
                {
                    return View("Crear");
                }
            }
            catch
            {
                clsCotizacion ObjCotizacion = new clsCotizacion();
                ViewBag.Lista = ObjCotizacion.ConsultaCorreoProveedor().ToList();
                TempData["errorMensaje"] = "Inserte correctamente el formato de los datos.";
                return View();
            }
        }

        // GET: Cotizacion/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Cotizacion/Edit/5
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

        // GET: Cotizacion/Delete/5
        public ActionResult Deshabilitar(int id)
        {
            if (Session["ROLES"].Equals("Admin"))
            {
                clsCotizacion ObjCotizacion = new clsCotizacion();
                ObjCotizacion.DeshabilitarCotizacion(id);
                return RedirectToAction("Index");
            }
            TempData["alertaMensaje"] = "El usuario con el que ha ingresado no tiene permiso para realizar esta operación.";
            return RedirectToAction("Index");
        }
    }
}
