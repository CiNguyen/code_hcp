using HCB_Port.Models;
using HCB_Port.Services.Base;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System.Web.Mvc;

namespace HCB_Port.Services
{
    public class Services_HCP_Info : HCPServices<HCP_Info>
    {
        #region Config

        public static Services_HCP_Info _instance { get; set; }
        public static Services_HCP_Info Instance()
        {
            _instance = new Services_HCP_Info(ServiceControtor<HCP_Info>.Instance());
            return Services_HCP_Info._instance;
        }
        public Services_HCP_Info(ServiceControtor<HCP_Info> controtor)
            : base(controtor)
        { }

        #endregion

        internal Message Event_Add_Edit_HCP(HCP_Info data)
        {
            Message ms = new Message();
            try
            {
                var check = (this).Get(a => a.ID == data.ID || a.Citizen_ID == data.Citizen_ID);
                if (check == null)
                {
                    data.Status = "Actived";
                    (this).Add(data);

                    data.Code = "HCP_" + data.ID.ToString().PadLeft(5, '0');
                    (this).Update(data);

                    ms.code = "0";
                    ms.msg = "Thêm thông tin HCP Info thành công !";
                    ms.sub_code = data.ID.ToString();
                    return ms;
                }

                if (check.Full_Name != data.Full_Name)
                {
                    ms.code = "1";
                    ms.msg = "Tồn Tại CMND Của Người Khác";
                    ms.sub_code = data.Citizen_ID + " - " + data.Full_Name;
                    return ms;
                }
                check.Full_Name = data.Full_Name;
                check.Issue_Date = data.Issue_Date;
                check.Place_Issue = data.Place_Issue;
                check.PIT_Code = data.PIT_Code;
                check.Position = data.Position;
                check.Birth_Day = data.Birth_Day;
                check.Address = data.Address;
                check.Bank_Name = data.Bank_Name;
                check.Bank_Account = data.Bank_Account;
                check.Note = data.Note;
                check.Status = "Actived";
                check.Create_Date = data.Create_Date;
                check.Create_User = data.Create_User;
                check.CMND_MT = data.CMND_MT;
                check.CMND_MS = data.CMND_MS;

                (this).Update(check);

                ms.code = "0";
                ms.msg = "Cập nhật HCP Info thành công !";
                ms.sub_code = data.ID.ToString();
                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;
                return ms;
            }
        }

        internal Message Event_Import_HCP_Info(HCP_Info model, int rowIndex)
        {
            Message ms = new Message();
            try
            {
                if (string.IsNullOrEmpty(model.Full_Name))
                {
                    ms.code = "1";
                    ms.msg = "Thiếu Họ Tên.";
                    ms.sub_code = "Dòng Số: " + rowIndex;
                    return ms;
                }

                ms = Event_Add_Edit_HCP(model);
                ms.msg = model.Full_Name;

                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;
                return ms;
            }
        }

        internal Message Event_Block_Unblock_HCP_Info(string id, string user)
        {
            Message ms = new Message();
            try
            {
                int idInfo = int.Parse(id);
                var check = (this).Get(a => a.ID == idInfo);
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
                    ms.msg = "Khóa HCP Info Thành Công.";
                    ms.sub_code = check.ID.ToString();
                    return ms;
                }

                check.Status = "Actived";
                check.Create_Date = DateTime.Now;
                check.Create_User = user;

                (this).Update(check);

                ms.code = "0";
                ms.msg = "Mở Khóa HCP Info Thành Công.";
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

        internal Message Event_Delete_HCP_Info(string id, string user)
        {
            Message ms = new Message();
            try
            {
                int idInfo = int.Parse(id);
                var check = (this).Get(a => a.ID == idInfo);
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
                ms.msg = "Xóa HCP Info Thành Công.";
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

        internal MemoryStream Get_Template_Excel_Report_HCP(HttpServerUtilityBase Server, string nameFile, string nameSheet, string fromdate, string todate , string Place_Issue2)
        {

            MemoryStream ms = new MemoryStream();
            FileStream fs = new FileStream(Server.MapPath(@"\Contents\File_Templates\" + nameFile + ".xlsx"),
            FileMode.Open, FileAccess.Read);
            IWorkbook workbook = new XSSFWorkbook(fs);
            ISheet sheet = workbook.GetSheet(nameSheet);
            DataTable dt = new DataTable();
            dt = ExcuteStoreProduce("Get_Export_From_ToTime_HCP_Info", new SelectListItem[] {
                new SelectListItem(){Text = "@fromtime", Value = fromdate},
                    new SelectListItem(){Text = "@totime", Value = todate},
                    new SelectListItem(){Text = "@place", Value = Place_Issue2},
            });


            var query = dt.AsEnumerable().ToList();
            int temp = 3;
            foreach (var item in query)
            {
                IRow row = sheet.CreateRow(temp);

                for (int i = 0; i <= 16; i++)
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