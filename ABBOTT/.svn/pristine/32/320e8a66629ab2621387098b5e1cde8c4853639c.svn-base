using System;
using System.Collections;
using System.Collections.Generic;
using HCB_Port.Models;
using HCB_Port.Services.Base;

namespace HCB_Port.Services
{
    public class Services_service_costs : HCPServices<Service_Cost>
    {
        #region Config

        public static Services_service_costs _instance { get; set; }
        public static Services_service_costs Instance()
        {
            _instance = new Services_service_costs(ServiceControtor<Service_Cost>.Instance());
            return Services_service_costs._instance;
        }
        public Services_service_costs(ServiceControtor<Service_Cost> controtor)
            : base(controtor)
        { }

        #endregion

        internal Message Event_Import_Service_Cost(Service_Cost model, int rowIndex, int id_event )
        {
            Message ms = new Message();
            try
            {
                ms = Event_Add_Service_Cost(model, id_event);
                ms.msg = "Up dữ liệu thành công !";

                return ms;
            }
            catch (Exception ex)
            {
                ms.code = "1";
                ms.msg = ex.Message;
                return ms;
            }
        }
        internal Message Event_Add_Service_Cost(Service_Cost data , int id_event )
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
                   // int id_detail1 = Services_service_criteria.Instance().Get_ID_Service_Criteria(id_detail);
                    data.ID_Event = id_event1;
                    //for(int i = 1; i <= 8; i++)
                    //{
                    //    data.ID_Service_Criteria = i;
                    //}
                    
                    (this).Update(data);

                    ms.code = "0";
                    ms.msg = "Thêm thông tin chi phí dịch vụ chuyên nghiệp thành công !";
                    ms.sub_code = data.ID.ToString();
                    return ms;
                }

                check.ID_Service_Criteria = data.ID_Service_Criteria;
                check.ID_Event = data.ID_Event;
                check.Honorarium_fee = data.Honorarium_fee;
                check.Air_ticket = data.Air_ticket;
                check.Meal_fee = data.Meal_fee;
                check.Hotel_fee = data.Hotel_fee;
                check.Car_rental = data.Car_rental;
                check.Other_fees = data.Other_fees;
                check.Total_costs = data.Total_costs;
                check.Status = "Actived";
                check.Create_Date = data.Create_Date;
                check.Create_User = data.Create_User;

                (this).Update(check);

                ms.code = "0";
                ms.msg = "Cập nhật Service Cost thành công !";
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
    }
}