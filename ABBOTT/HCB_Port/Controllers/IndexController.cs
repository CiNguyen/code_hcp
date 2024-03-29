﻿using HCB_Port.Models;
using HCB_Port.Models.ViewModel;
using HCB_Port.Services;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Xml.Serialization;

namespace HCB_Port.Controllers
{
    public class IndexController : Controller
    {
        //
        // GET: /Index/

        #region Menu

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Dashboard()
        {
            return PartialView();
        }

        public ActionResult HCP_Info()
        {
            return PartialView();
        }

        public ActionResult Event_Payment()
        {
            return PartialView();
        }

        #endregion

        public ActionResult Admin_Info_Table()
        {
            var list = Services_Admin_Info.Instance().ListMany(a => a.Status != "Deleted").ToList();

            ViewData["list_admin_info"] = list;

            return PartialView();
        }

        public ActionResult Event_Info_Table(string requestTime, string eventTime)
        {
            if (Session["user"] != null)
            {
                var temp = ServiceStoreProduce.Instance().Get_List_Event_Info(requestTime, eventTime);

                ViewData["list_event_info"] = temp;
                return PartialView();
            }
            else
            {
                ViewBag.Msg = "Phiên làm việc của bạn đã hết hạn, vui lòng đăng nhập lại để tiếp tục!!";
                return RedirectToAction("Index", "GUI");
            }
        }

        public JsonResult Event_Login(string username, string password)
        {
            var checkUsername = Services_Username.Instance().Get(a => a.UserName1 == username);
            if (checkUsername == null)
            {
                return Json(new
                {
                    code = "1",
                    msg = "Sai Username."
                });
            }

            var checkPassword = Services_Username.Instance().Get(a => a.UserName1 == username && a.PassWord == password);
            if (checkPassword == null)
            {
                return Json(new
                {
                    code = "1",
                    msg = "Sai Password."
                });
            }

            Session["user"] = username;

            return Json(new
            {
                code = "0",
                msg = "Đăng Nhập Thành Công."
            });
        }

        public ActionResult HCP_TableView(string province)
        {
            //Call services storeprocedure get list table HCB
            var list = ServiceStoreProduce.Instance().Get_List_HCP_Info(province);

            ViewData["list_hcp_info"] = list;

            return PartialView();
        }

        public ActionResult Costs_TableView()
        {
            //Call services storeprocedure get list table service costs
            using (var db = new HCB_ABBOTTEntities())
            {
                var list = db.Service_Criteria.ToList();
                ViewData["list_service_costs"] = list;
            }
            ViewBag.Usr = Session["user"].ToString();
            return PartialView();
        }

        public ActionResult Detail_Event_Info(string id)
        {
            Session["idEventInfo"] = id;

            return PartialView();
        }

        public ActionResult History_Payment_By_Event_Table()
        {
            int idEvent = int.Parse(Session["idEventInfo"].ToString());

            var list = ServiceStoreProduce.Instance()
                .Get_List_History_Payment_By_Event(idEvent);

            ViewData["history_payment"] = list;

            return PartialView();
        }

        public ActionResult Add_History_Payment_To_Event()
        {
            return PartialView();
        }

        public ActionResult Edit_History_Payment(string id)
        {
            int idHistory = int.Parse(id);

            var temp = Services_History_Payment.Instance().Get(a => a.ID == idHistory);

            ViewData["history_payment_info"] = temp;

            return PartialView();
        }

        public JsonResult Event_Add_Edit_History_Payment(History_Payment model)
        {
            model.Create_User = Session["user"].ToString();

            var ms = Services_History_Payment.Instance().Event_Add_Edit_History_Payment(model);

            return Json(ms);
        }

        public ActionResult Edit_Event_Info()
        {
            int idEvent = int.Parse(Session["idEventInfo"].ToString());

            var temp = Services_Event_Info.Instance().Get(a => a.ID == idEvent);

            ViewData["event_info"] = temp;

            return PartialView();
        }

        public ActionResult HCP_EditView(int id)
        {
            var data = Services_HCP_Info.Instance().Get(a => a.ID == id);

            ViewData["hcp_info"] = data;
            return PartialView();
        }
        public ActionResult Costs_EditView(int id)
        {
            var data = Services_service_costs.Instance().Get(a => a.ID == id);

            ViewData["service_costs"] = data;
            return PartialView();
        }

        public ActionResult Event_Add_Edit_HCP_Info(string data, string CMND_MT, string CMND_MS, string issue)
        {
            Message ms = new Message();
            DateTime issue_date = Convert.ToDateTime(issue);
            HCP_Info hcp = JsonConvert.DeserializeObject<HCP_Info>(data);
            string cm_truoc = Cut_Image(CMND_MT);
            string cm_sau = Cut_Image(CMND_MS);
            hcp.CMND_MT = ResizeBase64String_500(cm_truoc);
            hcp.CMND_MS = ResizeBase64String_500(cm_sau);
            hcp.Status = "Update";
            hcp.Issue_Date = issue_date;
            hcp.Create_Date = DateTime.Now.Date;
            hcp.Create_User = Session["user"].ToString();
            ms = Services_HCP_Info.Instance().Event_Add_Edit_HCP(hcp);
            return Json(ms);
        }

        //public ActionResult Event_Add_Edit_Service_Costs(Service_costs data)
        //{
        //    Message ms = new Message();
        //    data.Status = "Update";
        //    data.Create_Date = DateTime.Now.Date;
        //    data.Create_User = Session["user"].ToString();
        //    ms = Services_service_costs.Instance().Event_Add_Edit_Service_Costs(data);
        //    return Json(ms);
        //}

        public ActionResult HCP_CreateView()
        {
            return PartialView();
        }

        public ActionResult Create_New_Admin_Info()
        {
            return PartialView();
        }

        [HttpPost]
        public JsonResult Event_Add_Edit_Admin_Info(Admin_Info obj)
        {
            obj.Create_User = Session["user"].ToString();
            var result = Services_Admin_Info.Instance().Event_Add_Edit_Admin_Info(obj);

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Edit_Admin_Info(string id)
        {
            int idAdmin = int.Parse(id);

            ViewData["admin_info"] = Services_Admin_Info.Instance().Get(a => a.ID == idAdmin);

            return PartialView();
        }

        public ActionResult HCP_Info_Template_File()
        {
            MemoryStream stream = Services_Files.Get_Template_Excel(Server, "Template_HCP_Info");
            string fileName = "Template_HCP_Info_" + DateTime.Now.ToShortDateString() + ".xlsx";

            return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName);
        }
        public ActionResult Event_Payment_Template_File()
        {
            MemoryStream stream = Services_Files.Get_Template_Excel(Server, "Template_Event_Payment");
            string fileName = "Template_Event_Payment_" + DateTime.Now.ToShortDateString() + ".xlsx";

            return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName);
        }

        public ActionResult Create_New_Event_Info()
        {
            if (Session["user"] == null)
            {
                return RedirectToAction("Index", "GUI");
            }
            return PartialView();
        }

        [HttpPost]
        public JsonResult Event_Add_Edit_Event_Info(string data)
        {
            AddEventInfoClass temp = JsonConvert.DeserializeObject<AddEventInfoClass>(data);
            Message ms = new Message();
            using (var db = new HCB_ABBOTTEntities())
            {
                //add event
                #region event
                Event_Info ei = new Event_Info();
                ei.Abbott_Code = temp.form["Abbott_Code"];
                ei.Id_Admin_Info = Int32.Parse(temp.form["Id_Admin_Info"]);
                ei.Name = temp.form["Name"];
                ei.Event_Time = DateTime.Parse(temp.form["Event_Time"]);
                ei.Request_Date = DateTime.Parse(temp.form["Request_Date"]);
                ei.Area = temp.form["Area"];
                ei.Description = temp.form["Description"];
                ei.Note = temp.form["Note"];
                ei.Status = "Actived";
                ei.Create_Date = DateTime.Now;
                ei.Create_User = temp.form["CreateUser"];
                db.Event_Info.Add(ei);
                db.SaveChanges();
                #endregion
                //add s cost
                #region add sv cost
                string usr = Session["user"].ToString();
                int id_username = db.UserNames.FirstOrDefault(r => r.UserName1 == usr).ID;
                for (int i = 1; i <= 8; i++)
                {
                    var fee = temp.FeeJson[i.ToString()];
                    Service_Cost sc = new Service_Cost();
                    sc.ID_Event = ei.ID;
                    sc.ID_Service_Criteria = i;
                    sc.Honorarium_fee = fee.Fee;
                    sc.Air_ticket = temp.TicketJson[i.ToString()].Tickets;
                    sc.Meal_fee = temp.MealJson[i.ToString()].Meals;
                    sc.Hotel_fee = temp.HotelJson[i.ToString()].Hotels;
                    sc.Car_rental = temp.CarJson[i.ToString()].Cars;
                    sc.Other_fees = temp.OtherJson[i.ToString()].Others;
                    sc.Total_costs = double.Parse(temp.Totalrow[i - 1]);

                    db.Service_Cost.Add(sc);
                    db.SaveChanges();
                }
                #endregion
                //add rate
                #region add rate


                //for (int i = 1; i <= 8; i++)
                //{
                //        if (i==2 || i==4 || i==7) {
                //        User_Create_Rate us_cr = new User_Create_Rate();
                //        us_cr.Id_User_Name = id_username;
                //        us_cr.Rate = temp.RateJson[i.ToString()].Ratenames;
                //        us_cr.Status = "Actived";
                //        us_cr.Create_Date = DateTime.Now;
                //        us_cr.Create_User = temp.form["CreateUser"];
                //        if(i == 2) { us_cr.Id_rate = 1; }
                //        if (i == 4) { us_cr.Id_rate = 2; }
                //        if (i == 7) { us_cr.Id_rate = 3; }

                //        db.User_Create_Rate.Add(us_cr);
                //        db.SaveChanges();
                //    }

                //}
                #endregion

                //add history payment
                #region history payment
                bool invoice_1 = false;
                if (temp.form["Invoice_Abbott"].ToString() == "0")
                {
                    invoice_1 = true;
                }

                History_Payment hp = new History_Payment();
                hp.Id_Event = ei.ID;
                hp.HCP_Code = temp.form["HCP_Code"];
                hp.Number_Contract = temp.form["Number_Contract"];
                hp.FromDate = DateTime.Parse(temp.form["FromDate"]);
                hp.ToDate = DateTime.Parse(temp.form["ToDate"]);
                hp.Value_Contract = double.Parse(temp.form["Value_Contract"]);
                hp.PPL_GetContract_Date = DateTime.Parse(temp.form["PPL_GetContract_Date"]);
                hp.Rep_Name = temp.form["Rep_Name"];
                hp.Sup_Name = temp.form["Sup_Name"];
                hp.Description = temp.form["Description"];
                //hp.Requested_Value = double.Parse(temp.form["Requested_Value"]);
                //hp.Requested_Date = DateTime.Parse(temp.form["Requested_Date"]);
                hp.PPL_Payment_Date = DateTime.Parse(temp.form["PPL_Payment_Date"]);
                hp.Payment_Value = double.Parse(temp.form["Payment_Value"]);
                hp.Invoice_Abbott = invoice_1;
                hp.Report_Abbott_Date = DateTime.Parse(temp.form["Report_Abbott_Date"]);
                //hp.Account_Name = temp.form["Account_Name"];
                hp.Note = temp.form["Note"];
                hp.Status = "Actived";
                hp.Create_User = temp.form["CreateUser"];
                hp.Create_Date = DateTime.Now;
                db.History_Payment.Add(hp);
                db.SaveChanges();
                #endregion

                ms.code = "0";
                ms.msg = "Thêm Thành Công !";
            }
            Session["idEvent"] = ms.sub_code;

            return Json(ms);
        }

        [HttpPost]
        public JsonResult Event_Add_History_Payment(List<History_Payment> array)
        {
            var ms = Services_History_Payment.Instance().Add_Edit_History_Payment_List(array, Session["idEvent"].ToString(), Session["user"].ToString());

            return Json(ms);
        }

        //[HttpPost]
        //public JsonResult Event_Add_Service_Costs(Service_costs form)
        //{
        //    form.Create_User = Session["user"].ToString();
        //    var result = Services_service_costs.Instance().Event_Edit_Service_Costs(form);

        //    return Json(result, JsonRequestBehavior.AllowGet);
        //}

        public ActionResult Import_HCP_Info()
        {
            return PartialView();
        }

        public ActionResult Export_HCP_Info()
        {
            return PartialView();
        }

        [HttpPost]
        public JsonResult EventExportHCP_Info()
        {
            string fromdate = Request["fromdate"].ToString();
            string todate = Request["todate"].ToString();
            string Place_Issue2 = Request["Place_Issue2"].ToString();

            var nameFile = "Template_Export_HCP_Info";
            string nameSheet = "Template_Export_HCP_Info";

            MemoryStream ms = new MemoryStream();
            ms = Services_HCP_Info.Instance().Get_Template_Excel_Report_HCP(Server, nameFile, nameSheet, fromdate, todate, Place_Issue2);
            string file_name = "Template_Export_HCP_Info" + System.DateTime.Now.ToShortDateString().Replace("/", "_") + ".xlsx";

            Session[file_name] = ms;
            return Json(new { success = true, file_name }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Event_Check_ImportFile_HCP_Info()
        {
            int totalRecord = 0;
            DataTable dt = new DataTable();

            dt = Services_Files.Get_Import_Excel(Server, "Template_HCP_Info", Request.Files, "file");

            Session["hcp_info"] = dt;
            Session["hcp_info_error"] = null;

            totalRecord = dt.Rows.Count;

            return Json(new { total = totalRecord });
        }

        [HttpPost]
        public JsonResult Event_Import_HCP_Info(int rowIndex)
        {
            List<Message> ms_error = new List<Message>();
            if (Session["hcp_info_error"] != null) ms_error = (List<Message>)Session["sos_schedule_error"];
            Message ms = new Message();
            DataTable dt = (DataTable)Session["hcp_info"];

            var rowCurrent = dt.Rows[rowIndex];

            HCP_Info model = new HCP_Info()
            {
                Full_Name = rowCurrent[1].ToString(),
                Birth_Day = !string.IsNullOrEmpty(rowCurrent[2].ToString()) ? DateTime.Parse(rowCurrent[2].ToString()) : (DateTime?)null,
                Address = rowCurrent[3].ToString(),
                Citizen_ID = !string.IsNullOrEmpty(rowCurrent[4].ToString()) ? rowCurrent[4].ToString() : "",
                Issue_Date = !string.IsNullOrEmpty(rowCurrent[5].ToString()) ? DateTime.Parse(rowCurrent[5].ToString()) : (DateTime?)null,
                Place_Issue = rowCurrent[6].ToString(),
                PIT_Code = rowCurrent[7].ToString(),
                Position = rowCurrent[8].ToString(),
                Bank_Name = rowCurrent[9].ToString(),
                Bank_Account = rowCurrent[10].ToString(),
                Note = rowCurrent[11].ToString(),
                Create_User = Session["user"].ToString(),
                Create_Date = DateTime.Now
            };

            ms = Services_HCP_Info.Instance().Event_Import_HCP_Info(model, rowIndex);

            if (ms.code == "1")
            {
                ms_error.Add(ms);
                ms.code = "0";
            }
            if (rowIndex == dt.Rows.Count - 1)
            {
                if (ms_error.Count > 0)
                {
                    Session["sos_schedule_error"] = ms_error;
                    ms.code = "1";
                    ms.msg = "Vui lòng xem file Excel Lỗi !";
                    ms.sub_code = "Danh Sách Thông Tin Chấm SOS Lỗi";
                }
                else
                {
                    ms.code = "2";
                    ms.msg = "Đã Up Danh Sách Thông Tin Chấm SOS Thành Công";
                }
            }
            else
            {
                Session["sos_schedule_error"] = ms_error;
            }
            return Json(ms);
        }

        public ActionResult Import_Event_History_Payment()
        {
            return PartialView();
        }
        public ActionResult Export_Event_History_Payment()
        {
            return PartialView();
        }

        [HttpPost]
        public JsonResult EventExportHistory_Payment()
        {
            string fromdate = Request["fromdate"].ToString();
            string todate = Request["todate"].ToString();
            
            var nameFile = "Template_Export_Event_Payment";
            string nameSheet = "Template_Export_Event_Payment";

            MemoryStream ms = new MemoryStream();
            ms = Services_Event_Info.Instance().Get_Template_Excel_Report_TimeSheet(Server, nameFile, nameSheet, fromdate, todate);
            string file_name = "Template_Export_Event_Payment" + System.DateTime.Now.ToShortDateString().Replace("/", "_") + ".xlsx";

            Session[file_name] = ms;
            return Json(new { success = true, file_name }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult DownloadExcelReportExcel(string fName)
        {
            var ms = Session[fName] as MemoryStream;
            if (ms == null)
                return new EmptyResult();
            Session[fName] = null;
            return File(ms.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fName);
        }
        [HttpPost]
        public JsonResult Event_Check_Import_Template_Event_Payment()
        {
            int totalRecord = 0;
            int totalRecord2 = 0;
            int totalRecord3 = 0;
            DataTable dt = new DataTable();
            DataTable dt2 = new DataTable();
            DataTable dt3 = new DataTable();

            dt = Services_Files.Get_Import_Excel(Server, "Template_Event_Payment", Request.Files, "file");
            dt2 = Services_Files.Get_Import_Excel(Server, "Template_History_Payment", Request.Files, "file");
            dt3 = Services_Files.Get_Import_Excel(Server, "Template_Service_Cost", Request.Files, "file");

            Session["event_payment"] = dt;
            Session["history_payment"] = dt2; 
            Session["service_cost"] = dt3;
            Session["event_payment_error"] = null;
            Session["history_payment_error"] = null;
            Session["service_cost_error"] = null;

            totalRecord = dt.Rows.Count;
            totalRecord2 = dt2.Rows.Count;
            totalRecord3 = dt3.Rows.Count;

            return Json(new { total = totalRecord, total2 = totalRecord2, total3 = totalRecord3 });
        }
        [HttpPost]
        public JsonResult Event_Import_Event_Info(int rowIndex)
        {


            List<Message> ms_error = new List<Message>();
            if (Session["event_payment_error"] != null)
                ms_error = (List<Message>)Session["list_file_error"];

            Message ms = new Message();
            DataTable dt = (DataTable)Session["event_payment"];
            DataTable dt2 = (DataTable)Session["history_payment"];
            DataTable dt3 = (DataTable)Session["service_cost"];

            var rowCurrent = dt.Rows[rowIndex];
            int id_Admin = Services_Admin_Info.Instance().Get_ID_Admin(rowCurrent[1].ToString());
            if (id_Admin == 0)
            {
                ms.code = "1";
                ms.msg = "Code admin của bạn không tồn tại , vui lòng kiểm tra lại . Cảm ơn !";
                return Json(ms);
            }

            Event_Info model = new Event_Info()
            {
                Id_Admin_Info = id_Admin,
                Abbott_Code = !string.IsNullOrEmpty(rowCurrent[2].ToString()) ? rowCurrent[2].ToString() : "",
                Name = !string.IsNullOrEmpty(rowCurrent[3].ToString()) ? rowCurrent[3].ToString() : "",
                Event_Time = !string.IsNullOrEmpty(rowCurrent[4].ToString()) ? DateTime.Parse(rowCurrent[4].ToString()) : (DateTime?)null,
                Request_Date = !string.IsNullOrEmpty(rowCurrent[5].ToString()) ? DateTime.Parse(rowCurrent[5].ToString()) : (DateTime?)null,
                Area = !string.IsNullOrEmpty(rowCurrent[6].ToString()) ? rowCurrent[6].ToString() : "",
                Description = !string.IsNullOrEmpty(rowCurrent[7].ToString()) ? rowCurrent[7].ToString() : "",
                Note = !string.IsNullOrEmpty(rowCurrent[8].ToString()) ? rowCurrent[8].ToString() : "",
                Status = "Actived",
                Create_User = Session["user"].ToString(),
                Create_Date = DateTime.Now
            };

            ms = Services_Event_Info.Instance().Event_Import_Event_Info(model, rowIndex);
            var id_event = int.Parse(ms.sub_code);
            if (ms.code == "0")
            {
                dt2 = (DataTable)Session["history_payment"];
                rowCurrent = dt2.Rows[rowIndex];
                bool invoice_abb = false;
                if (rowCurrent[12].ToString().Equals("0"))
                {
                    invoice_abb = true;
                }

                History_Payment add2 = new History_Payment()
                {
                    HCP_Code = !string.IsNullOrEmpty(rowCurrent[1].ToString()) ? rowCurrent[1].ToString() : "",
                    Number_Contract = !string.IsNullOrEmpty(rowCurrent[2].ToString()) ? rowCurrent[2].ToString() : "",
                    FromDate = !string.IsNullOrEmpty(rowCurrent[3].ToString()) ? DateTime.Parse(rowCurrent[3].ToString()) : (DateTime?)null,
                    ToDate = !string.IsNullOrEmpty(rowCurrent[4].ToString()) ? DateTime.Parse(rowCurrent[4].ToString()) : (DateTime?)null,
                    Value_Contract = !string.IsNullOrEmpty(rowCurrent[5].ToString()) ? Double.Parse(rowCurrent[5].ToString()) : (Double?)null,
                    PPL_GetContract_Date = !string.IsNullOrEmpty(rowCurrent[6].ToString()) ? DateTime.Parse(rowCurrent[6].ToString()) : (DateTime?)null,
                    Rep_Name = !string.IsNullOrEmpty(rowCurrent[7].ToString()) ? rowCurrent[7].ToString() : "",
                    Sup_Name = !string.IsNullOrEmpty(rowCurrent[8].ToString()) ? rowCurrent[8].ToString() : "",
                    Description = !string.IsNullOrEmpty(rowCurrent[9].ToString()) ? rowCurrent[9].ToString() : "",
                    PPL_Payment_Date = !string.IsNullOrEmpty(rowCurrent[10].ToString()) ? DateTime.Parse(rowCurrent[10].ToString()) : (DateTime?)null,
                    Payment_Value = !string.IsNullOrEmpty(rowCurrent[11].ToString()) ? Double.Parse(rowCurrent[11].ToString()) : (Double?)null,
                    Invoice_Abbott = invoice_abb,
                    Report_Abbott_Date = !string.IsNullOrEmpty(rowCurrent[13].ToString()) ? DateTime.Parse(rowCurrent[13].ToString()) : (DateTime?)null,
                    Note = !string.IsNullOrEmpty(rowCurrent[14].ToString()) ? rowCurrent[14].ToString() : "",
                    Status = "Actived",
                    Create_User = Session["user"].ToString(),
                    Create_Date = DateTime.Now
                };
                ms = Services_History_Payment.Instance().Event_Import_History_Payment(add2, rowIndex, id_event);
            }
            if (ms.code == "0")
            {
                if (dt3.Rows.Count > (rowIndex))
                {
                    dt3 = (DataTable)Session["service_cost"];
                    rowCurrent = dt3.Rows[rowIndex];

                    Service_Cost add3 = new Service_Cost()
                    {
                        ID_Service_Criteria = int.Parse(rowCurrent[0].ToString()),
                        Honorarium_fee = Double.Parse(rowCurrent[1].ToString()),
                        Air_ticket = Double.Parse(rowCurrent[2].ToString()),
                        Meal_fee = Double.Parse(rowCurrent[3].ToString()),
                        Hotel_fee = Double.Parse(rowCurrent[4].ToString()),
                        Car_rental = Double.Parse(rowCurrent[5].ToString()),
                        Other_fees = Double.Parse(rowCurrent[6].ToString()),
                        Total_costs = Double.Parse(rowCurrent[7].ToString()),
                        Status = "Actived",
                        Create_User = Session["user"].ToString(),
                        Create_Date = DateTime.Now
                    };
                    ms = Services_service_costs.Instance().Event_Import_Service_Cost(add3, rowIndex, id_event);
                }

            }

            if (ms.code == "1")
            {
                ms_error.Add(ms);
                ms.code = "0";
            }
            if (rowIndex == dt.Rows.Count - 1)
            {
                if (ms_error.Count > 0)
                {
                    Session["list_file_error"] = ms_error;
                    ms.code = "1";
                    ms.msg = "Vui lòng xem file Excel Lỗi !";
                    ms.sub_code = "Danh Sách Thông Tin Sự Kiện & Thanh Toán Lỗi";
                }
                else
                {
                    ms.code = "2";
                    ms.msg = "Đã Up Danh Sách Thông Tin Sự Kiện & Thanh Toán Thành Công";
                }
            }
            else
            {
                Session["list_file_error"] = ms_error;
            }
            return Json(ms);
        }

        public ActionResult Download_ErrorList(string fName)
        {
            List<Message> tam = new List<Message>();
            tam = (List<Message>)Session[fName];
            Session[fName] = null;
            var stream = new MemoryStream();
            //var products = httd.Areas.ToList();
            XmlSerializer serializer = new XmlSerializer(typeof(List<Message>));
            //We turn it into an XML and save it in the memory
            serializer.Serialize(stream, tam);
            stream.Position = 0;
            //We return the XML from the memory as a .xls file
            return File(stream, "application/vnd.ms-excel", "Error_List" + ".xls");
        }

        [HttpPost]
        public JsonResult Event_Block_Unblock_Admin_Info(string id, string user)
        {
            var result = Services_Admin_Info.Instance().Event_Block_Unblock_Admin_Info(id, user);

            return Json(result);
        }

        [HttpPost]
        public JsonResult Event_Delete_Admin_Info(string id, string user)
        {
            var result = Services_Admin_Info.Instance().Event_Delete_Admin_Info(id, user);

            return Json(result);
        }

        [HttpPost]
        public JsonResult Event_Block_Unblock_Event_Info(string id, string user)
        {
            var result = Services_Event_Info.Instance().Event_Block_Unblock_Event_Info(id, user);

            return Json(result);
        }

        [HttpPost]
        public JsonResult Event_Delete_Event_Info(string id, string user)
        {
            var result = Services_Event_Info.Instance().Event_Delete_Event_Info(id, user);

            return Json(result);
        }

        //[HttpPost]
        //public JsonResult Event_Block_Unblock_Service_Costs(string id, string user)
        //{
        //    var result = Services_service_costs.Instance().Event_Block_Unblock_Service_Costs(id, user);

        //    return Json(result);
        //}

        //[HttpPost]
        //public JsonResult Event_Delete_Service_Costs(string id, string user)
        //{
        //    var result = Services_service_costs.Instance().Event_Delete_Service_Costs(id, user);

        //    return Json(result);
        //}

        [HttpPost]
        public JsonResult Event_Delete_HCP_Info(string id, string user)
        {
            var result = Services_HCP_Info.Instance().Event_Delete_HCP_Info(id, user);

            return Json(result);
        }

        [HttpPost]
        public JsonResult Event_Block_Unblock_History_Payment(string id, string user)
        {
            var result = Services_History_Payment.Instance().Event_Block_Unblock_History_Payment(id, user);

            return Json(result);
        }

        [HttpPost]
        public JsonResult Event_Delete_History_Payment(string id, string user)
        {
            var result = Services_History_Payment.Instance().Event_Delete_History_Payment(id, user);

            return Json(result);
        }

        [HttpPost]
        public JsonResult Select_List_Admin_Info(string text, string value)
        {
            var temp = Services_Admin_Info.Instance().ListMany(a => a.Status != "Deleted" && a.Status != "Blocked")
                .ToList();

            List<SelectListItem> list = new List<SelectListItem>();

            if (!string.IsNullOrEmpty(text) && !string.IsNullOrEmpty(value))

                list.Add(new SelectListItem
                {
                    Text = text,
                    Selected = true,
                    Value = value
                });

            foreach (var item in temp)
            {
                list.Add(new SelectListItem
                {
                    Text = item.Code + " - " + item.FullName,
                    Value = item.ID.ToString()
                });
            }

            return Json(list);
        }

        [HttpPost]
        public JsonResult Select_List_HCP_Info(string text, string value)
        {
            var temp = Services_HCP_Info.Instance().ListMany(a => a.Status != "Blocked" && a.Status != "Deleted")
                .ToList();

            List<SelectListItem> list = new List<SelectListItem>();

            if (!string.IsNullOrEmpty(text) && !string.IsNullOrEmpty(value))

                list.Add(new SelectListItem
                {
                    Text = text,
                    Selected = true,
                    Value = value
                });

            foreach (var item in temp)
            {
                list.Add(new SelectListItem
                {
                    Text = item.Code + " - " + item.Full_Name + " - " + item.Citizen_ID,
                    Value = item.Code
                });
            }

            return Json(list);
        }

        [HttpPost]
        public JsonResult Select_List_Place_Issue(string text, string value)
        {
            var temp = ServiceStoreProduce.Instance().List_Select_Place_Issue().ToList();

            List<SelectListItem> list = new List<SelectListItem>();

            foreach (var item in temp)
            {
                list.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
                });
            }

            return Json(list);
        }

        #region function

        public JsonResult getRate_ByUsr(string usr)
        {
            try
            {
                var temp = ServiceStoreProduce.Instance().GetRate_ByUsr(usr);
                User_Create_Rate rate2 = null, rate4 = null, rate7 = null;
                var list_rate2 = temp.Where(r => r.Id_rate == 1).ToList();
                var list_rate4 = temp.Where(r => r.Id_rate == 2).ToList();
                var list_rate7 = temp.Where(r => r.Id_rate == 3).ToList();
                if (list_rate2.Count > 0) //nneu co
                {
                    rate2 = list_rate2.OrderByDescending(o => o.Create_Date).FirstOrDefault();
                }
                else
                {
                    using (var db = new HCB_ABBOTTEntities())
                    {
                        #region rate 2
                        int id_user = db.UserNames.Where(r => r.UserName1 == usr).FirstOrDefault().ID;
                        var rate_obj = db.Rates.Where(r => r.ID == 1).FirstOrDefault();
                        double? rate_string = rate_obj.Rate_Value;
                        int id_rate = rate_obj.ID;
                        rate2 = db.User_Create_Rate.Add(new User_Create_Rate()
                        {
                            Id_rate = id_rate,
                            Id_User_Name = id_user,
                            Create_Date = DateTime.Now,
                            Create_User = usr,
                            Rate = rate_string,
                            Status = "Actived"
                        });
                        db.SaveChanges();
                    };
                    #endregion
                }
                //rate 4
                if (list_rate4.Count > 0) //nneu co
                {
                    rate4 = list_rate4.OrderByDescending(o => o.Create_Date).FirstOrDefault();
                }
                else
                {
                    using (var db = new HCB_ABBOTTEntities())
                    {
                        #region rate 4
                        int id_user = db.UserNames.Where(r => r.UserName1 == usr).FirstOrDefault().ID;
                        var rate_obj = db.Rates.Where(r => r.ID == 2).FirstOrDefault();
                        double? rate_string = rate_obj.Rate_Value;
                        int id_rate = rate_obj.ID;
                        rate4 = db.User_Create_Rate.Add(new User_Create_Rate()
                        {
                            Id_rate = id_rate,
                            Id_User_Name = id_user,
                            Create_Date = DateTime.Now,
                            Create_User = usr,
                            Rate = rate_string,
                            Status = "Actived"
                        });
                        db.SaveChanges();
                    };
                    #endregion
                }
                //rate 7
                if (list_rate7.Count > 0) //nneu co
                {
                    rate7 = list_rate7.OrderByDescending(o => o.Create_Date).FirstOrDefault();
                }
                else
                {
                    using (var db = new HCB_ABBOTTEntities())
                    {
                        #region rate 7
                        int id_user = db.UserNames.Where(r => r.UserName1 == usr).FirstOrDefault().ID;
                        var rate_obj = db.Rates.Where(r => r.ID == 3).FirstOrDefault();
                        double? rate_string = rate_obj.Rate_Value;
                        int id_rate = rate_obj.ID;
                        rate7 = db.User_Create_Rate.Add(new User_Create_Rate()
                        {
                            Id_rate = id_rate,
                            Id_User_Name = id_user,
                            Create_Date = DateTime.Now,
                            Create_User = usr,
                            Rate = rate_string,
                            Status = "Actived"
                        });
                        db.SaveChanges();
                    };
                    #endregion
                }

                return Json(new { code = HttpStatusCode.OK.ToString(), rate_2 = rate2, rate_4 = rate4, rate_7 = rate7 });
            }
            catch (Exception e)
            {
                return Json(new
                {
                    code = HttpStatusCode.NotFound.ToString(),
                    data = e.Message
                });
            }
        }
        #endregion
        #region upload image
        public byte[] ResizeBase64String_500(string base64Image)
        {
            try
            {
                byte[] bytes = Convert.FromBase64String(base64Image);

                Image image;

                //Convert byte[] into image
                using (MemoryStream ms = new MemoryStream(bytes))
                {
                    image = Image.FromStream(ms);
                }
                var newSize = new Size();
                if (image.Height > 1080)
                {
                    newSize.Width = image.Width / 2;
                    newSize.Height = image.Height / 2;
                }
                else
                {
                    newSize.Width = image.Width / 1;
                    newSize.Height = image.Height / 1;
                }
                // Resize the image
                Bitmap b = new Bitmap(newSize.Width, newSize.Height);
                Graphics g = Graphics.FromImage((Image)b);
                g.InterpolationMode = InterpolationMode.HighQualityBicubic;

                g.DrawImage(image, 0, 0, newSize.Width, newSize.Height);
                g.Dispose();
                image = (Image)b;
                byte[] imageBytes;
                using (MemoryStream ms = new MemoryStream())
                {
                    // Convert Image to byte[]
                    image.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                    imageBytes = ms.ToArray();
                }
                return imageBytes;
            }
            catch (Exception e)
            {
                string msg = "Having some error in process, please make sure the base64 image string is OK or try again. Thanks!\n Detail: " + e.Message;
                return Encoding.ASCII.GetBytes(msg);

            }
        }

        public string Cut_Image(string image)
        {
            string cut = "";
            cut = image.Replace("data:image/jpeg;base64,","").Replace("data:image/jpg;base64,","").Replace("data:image/png;base64,","").Replace("data:image/gif;base64,","");
            return cut;
        }
        #endregion

    }
}
