using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HCB_Port.Models;
using HCB_Port.Models.ViewModel;
using HCB_Port.Services.Base;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;

namespace HCB_Port.Services
{
    public class Services_Event_Info : HCPServices<Event_Info>
    {
        #region Config

        public static Services_Event_Info _instance { get; set; }
        public static Services_Event_Info Instance()
        {
            _instance = new Services_Event_Info(ServiceControtor<Event_Info>.Instance());
            return Services_Event_Info._instance;
        }
        public Services_Event_Info(ServiceControtor<Event_Info> controtor)
            : base(controtor)
        { }

        #endregion

        #region Import file template
        internal Message Event_Import_Event_Info(Event_Info model, int rowIndex)
        {
            Message ms = new Message();
            try
            {
                if (string.IsNullOrEmpty(model.Abbott_Code))
                {
                    ms.code = "1";
                    ms.msg = "Thiếu mã Abbott.";
                    ms.sub_code = "Dòng Số: " + rowIndex;
                    return ms;
                }
                if (string.IsNullOrEmpty(model.Name))
                {
                    ms.code = "1";
                    ms.msg = "Thiếu tên dự án.";
                    ms.sub_code = "Dòng Số: " + rowIndex;
                    return ms;
                }

                ms = Event_Add_Event_Info(model);
                ms.msg = model.Name;
                ms.sub_code = model.ID.ToString();
                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;
                return ms;
            }
        }
        #endregion
        internal Message Event_Add_Event_Info(Event_Info data)
        {
            Message ms = new Message();
            try
            {
                var check = (this).Get(a => a.Id_Admin_Info == data.Id_Admin_Info && a.Abbott_Code == data.Abbott_Code && a.Event_Time == data.Event_Time && a.Request_Date == data.Request_Date && a.Area == data.Area);
                if (check == null)
                {
                    data.Status = "Actived";
                    (this).Add(data);

                    ms.code = "0";
                    ms.msg = "Thêm thông tin Event Info thành công !";
                    ms.sub_code = data.ID.ToString();
                    return ms;
                }
                else
                {
                    check.Id_Admin_Info = data.Id_Admin_Info;
                    check.Abbott_Code = data.Abbott_Code;
                    check.Name = data.Name;
                    check.Event_Time = data.Event_Time;
                    check.Request_Date = data.Request_Date;
                    check.Area = data.Area;
                    check.Description = data.Description;
                    check.Note = data.Note;
                    check.Status = "Actived";
                    check.Create_Date = data.Create_Date;
                    check.Create_User = data.Create_User;

                    (this).Update(check);

                    ms.code = "0";
                    ms.msg = "Cập nhật Event Info thành công !";
                    ms.sub_code = data.ID.ToString();
                }
                
                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;
                return ms;
            }
        }

        internal Message Event_Add_Edit_Event_Info(AddEventInfoClass form)
        {
            Message ms = new Message();
            try
            {
                
                ms.code = "1";
                ms.msg = "";
                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;
                return ms;
            }
        }

        internal Message Event_Block_Unblock_Event_Info(string id, string user)
        {
            Message ms = new Message();
            try
            {
                int idEvent = int.Parse(id);
                var check = (this).Get(a => a.ID == idEvent);
                if (check == null)
                {
                    ms.code = "1";
                    ms.msg = "Dữ Liệu Không Tồn Tại Trong Hệ Thống";
                    return ms;
                }

                if (check.Status != "Blocked")
                {
                    check.Status = "Blocked";
                    check.Create_Date = DateTime.Now;
                    check.Create_User = user;

                    (this).Update(check);

                    ms.code = "0";
                    ms.msg = "Khóa Event Thành Công.";
                    ms.sub_code = check.ID.ToString();
                    return ms;
                }

                check.Status = "Actived";
                check.Create_Date = DateTime.Now;
                check.Create_User = user;

                (this).Update(check);

                ms.code = "0";
                ms.msg = "Mở Khóa Event Thành Công.";
                ms.sub_code = check.ID.ToString();
                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;

                return ms;
            }
        }

        internal Message Event_Delete_Event_Info(string id, string user)
        {
            Message ms = new Message();
            try
            {
                int idEvent = int.Parse(id);
                var check = (this).Get(a => a.ID == idEvent);
                if (check == null)
                {
                    ms.code = "1";
                    ms.msg = "Dữ Liệu Không Tồn Tại Trong Hệ Thống";
                    return ms;
                }

                check.Status = "Deleted";
                check.Create_Date = DateTime.Now;
                check.Create_User = user;

                (this).Update(check);

                ms.code = "0";
                ms.msg = "Xóa Event Thành Công.";
                ms.sub_code = check.ID.ToString();
                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;

                return ms;
            }
        }

        internal int Get_ID_Event(int id_event)
        {
            var item = Get(r => r.ID == id_event);
            if (item != null)
            {
                return item.ID;
            }
            else
            {
                return 0;
            }
        }

        internal MemoryStream Get_Template_Excel_Report_TimeSheet(HttpServerUtilityBase Server, string nameFile, string nameSheet, string fromdate, string todate)
        {
          
            MemoryStream ms = new MemoryStream();
            FileStream fs = new FileStream(Server.MapPath(@"\Contents\File_Templates\" + nameFile + ".xlsx"),
            FileMode.Open, FileAccess.Read);
            IWorkbook workbook = new XSSFWorkbook(fs);
            ISheet sheet = workbook.GetSheet(nameSheet);
            DataTable dt = new DataTable();
            dt = ExcuteStoreProduce("Get_Export_From_ToTime_Event_Payment", new SelectListItem[] {
                new SelectListItem(){Text = "@fromtime", Value = fromdate},
                    new SelectListItem(){Text = "@totime", Value = todate},
               
            });

            
            var query = dt.AsEnumerable().ToList();
            int temp = 3;
            foreach (var item in query)
            {
                IRow row = sheet.CreateRow(temp);

                for (int i = 0; i <= 33; i++)
                {
                    ICell value = row.CreateCell(i);
                    value.SetCellValue(item.ItemArray[i].ToString());
                  
                }
                temp++;
            }
            workbook.Write(ms);
            return ms;
        }
    }
}