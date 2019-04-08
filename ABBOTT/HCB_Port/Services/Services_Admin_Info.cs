using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HCB_Port.Models;
using HCB_Port.Services.Base;

namespace HCB_Port.Services
{
    public class Services_Admin_Info : HCPServices<Admin_Info>
    {
        #region Config

        public static Services_Admin_Info _instance { get; set; }

        public static Services_Admin_Info Instance()
        {
            _instance = new Services_Admin_Info(ServiceControtor<Admin_Info>.Instance());
            return Services_Admin_Info._instance;
        }

        public Services_Admin_Info(ServiceControtor<Admin_Info> controtor)
            : base(controtor)
        {
        }

        #endregion

        internal Message Event_Add_Edit_Admin_Info(Admin_Info item)
        {
            Message ms = new Message();
            try
            {
                var check = (this).Get(a => a.ID == item.ID || a.Code == item.Code);
                if (check != null)
                {
                    check.Code = item.Code;
                    check.FullName = item.FullName;
                    check.Email = item.Email;
                    check.Area = item.Area;
                    check.Region = item.Region;
                    check.Status = item.Status;
                    check.Phone = item.Phone;
                    check.Create_Date = DateTime.Now;
                    check.Create_User = item.Create_User;
                    check.Status = "Updated";
                    (this).Update(check);

                    ms.code = "0";
                    ms.msg = "Cập Nhật Thông Tin Admin Thành Công.";
                    ms.sub_code = check.ID.ToString();

                    return ms;
                }

                item.Create_Date = DateTime.Now;
                item.Status = "Actived";
                (this).Add(item);

                ms.code = "0";
                ms.msg = "Thêm Thông Tin Admin Thành Công.";
                ms.sub_code = item.ID.ToString();

                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;
                return ms;
            }
        }

        internal Message Event_Block_Unblock_Admin_Info(string id, string user)
        {
            Message ms = new Message();
            try
            {
                int idAdmin = int.Parse(id);
                var check = (this).Get(a => a.ID == idAdmin);
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
                    ms.msg = "Khóa Admin Thành Công.";
                    ms.sub_code = check.ID.ToString();
                    return ms;
                }

                check.Status = "Actived";
                check.Create_Date = DateTime.Now;
                check.Create_User = user;

                (this).Update(check);

                ms.code = "0";
                ms.msg = "Mở Khóa Admin Thành Công.";
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

        internal Message Event_Delete_Admin_Info(string id, string user)
        {
            Message ms = new Message();
            try
            {
                int idAdmin = int.Parse(id);
                var check = (this).Get(a => a.ID == idAdmin);
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
                ms.msg = "Xóa Admin Thành Công.";
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

        internal int Get_ID_Admin(string code_admin)
        {
            var item = Get(r => r.Code == code_admin);
            if (item != null)
            {
                return item.ID;
            }
            else
            {
                return 0;
            }
        }
    }
}