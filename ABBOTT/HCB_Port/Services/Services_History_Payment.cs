using System;
using System.Collections;
using System.Collections.Generic;
using HCB_Port.Models;
using HCB_Port.Services.Base;

namespace HCB_Port.Services
{
    public class Services_History_Payment : HCPServices<History_Payment>
    {
        #region Config

        public static Services_History_Payment _instance { get; set; }

        public static Services_History_Payment Instance()
        {
            _instance = new Services_History_Payment(ServiceControtor<History_Payment>.Instance());
            return Services_History_Payment._instance;
        }

        public Services_History_Payment(ServiceControtor<History_Payment> controtor)
            : base(controtor)
        {
        }

        #endregion

        internal Message Event_Import_History_Payment(History_Payment model, int rowIndex , int id_event)
        {
            Message ms = new Message();
            try
            {
                if (string.IsNullOrEmpty(model.HCP_Code))
                {
                    ms.code = "1";
                    ms.msg = "Thiếu mã HCP";
                    ms.sub_code = "Dòng Số: " + rowIndex;
                    return ms;
                }
                if (string.IsNullOrEmpty(model.Number_Contract))
                {
                    ms.code = "1";
                    ms.msg = "Thiếu hợp đồng số.";
                    ms.sub_code = "Dòng Số: " + rowIndex;
                    return ms;
                }

                ms = Event_Add_History_Payment(model, id_event);
                ms.msg = model.HCP_Code;

                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;
                return ms;
            }
        }
        internal Message Event_Add_History_Payment(History_Payment data, int id_event)
        {
            Message ms = new Message();
            try
            {
                var check = (this).Get(a => a.ID == data.ID);
                if (check == null)
                {
                    data.Status = "Actived";
                    (this).Add(data);
                    int id_event1 = Services_Event_Info.Instance().Get_ID_Event(id_event);
                    data.Id_Event = id_event1;
                    (this).Update(data);

                    ms.code = "0";
                    ms.msg = "Thêm thông tin History Payment thành công !";
                    ms.sub_code = data.ID.ToString();
                    return ms;
                }
                
                check.Id_Event = data.Id_Event;
                check.HCP_Code = data.HCP_Code;
                check.Number_Contract = data.Number_Contract;
                check.FromDate = data.FromDate;
                check.ToDate = data.ToDate;
                check.Value_Contract = data.Value_Contract;
                check.PPL_GetContract_Date = data.PPL_GetContract_Date;
                check.Rep_Name = data.Rep_Name;
                check.Sup_Name = data.Sup_Name;
                check.Description = data.Description;
                check.PPL_Payment_Date = data.PPL_Payment_Date;
                check.Payment_Value = data.Payment_Value;
                check.Invoice_Abbott = data.Invoice_Abbott;
                check.Report_Abbott_Date = data.Report_Abbott_Date;
                check.Note = data.Note;
                check.Status = "Actived";
                check.Create_Date = data.Create_Date;
                check.Create_User = data.Create_User;

                (this).Update(check);

                ms.code = "0";
                ms.msg = "Cập nhật History Payment thành công !";
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


        internal Message Add_Edit_History_Payment_List(List<History_Payment> list, string idEvent, string user)
        {
            Message ms = new Message();
            try
            {
                int eventId = int.Parse(idEvent);
                foreach (var item in list)
                {
                    item.Id_Event = eventId;
                    item.Create_User = user;
                    ms = Event_Add_Edit_History_Payment(item);
                    if (ms.code == "1")
                        return ms;
                }

                ms.code = "0";
                ms.msg = "Thêm Thành Công.";
                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;
                return ms;
            }
        }

        internal Message Event_Add_Edit_History_Payment(History_Payment item)
        {
            Message ms = new Message();
            try
            {
                var check = (this).Get(a => a.ID == item.ID || (a.Id_Event==item.Id_Event && a.HCP_Code == item.HCP_Code));
                if (check != null)
                {
                    check.Id_Event = item.Id_Event;
                    check.HCP_Code = item.HCP_Code;
                    check.Number_Contract = item.Number_Contract;
                    check.FromDate = item.FromDate;
                    check.ToDate = item.ToDate;
                    check.Value_Contract = item.Value_Contract;
                    check.PPL_GetContract_Date = item.PPL_GetContract_Date;
                    check.Rep_Name = item.Rep_Name;
                    check.Sup_Name = item.Sup_Name;
                    check.Requested_Value = item.Requested_Value;
                    check.Requested_Date = item.Requested_Date;
                    check.PPL_Payment_Date = item.PPL_Payment_Date;
                    check.Payment_Value = item.Payment_Value;
                    check.Invoice_Abbott = item.Invoice_Abbott;
                    check.Report_Abbott_Date = item.Report_Abbott_Date;
                    check.Account_Name = item.Account_Name;
                    check.Note = item.Note;
                    check.Status = "Updated";
                    check.Create_User = item.Create_User;
                    check.Create_Date = DateTime.Now;

                    (this).Update(check);

                    ms.code = "0";
                    ms.msg = "Cập Nhật History Payment Thành Công.";
                    ms.sub_code = check.ID.ToString();
                    return ms;
                }
                item.Create_Date = DateTime.Now;
                item.Status = "Actived";

                (this).Add(item);

                ms.code = "0";
                ms.msg = "Thêm History PaymentThành Công.";
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

        internal Message Event_Block_Unblock_History_Payment(string id, string user)
        {
            Message ms = new Message();
            try
            {
                int idHistory = int.Parse(id);
                var check = (this).Get(a => a.ID == idHistory);
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
                    ms.msg = "Khóa History Payment Thành Công.";
                    ms.sub_code = check.ID.ToString();
                    return ms;
                }

                check.Status = "Actived";
                check.Create_Date = DateTime.Now;
                check.Create_User = user;

                (this).Update(check);

                ms.code = "0";
                ms.msg = "Mở Khóa History Payment Thành Công.";
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

        internal Message Event_Delete_History_Payment(string id, string user)
        {
            Message ms = new Message();
            try
            {
                int idHistory = int.Parse(id);
                var check = (this).Get(a => a.ID == idHistory);
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
                ms.msg = "Xóa History Payment Thành Công.";
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
    }
}