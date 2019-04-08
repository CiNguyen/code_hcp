using System;
using System.Collections.Generic;
using System.Linq;
using HCB_Port.Models;
using HCB_Port.Models.Interface;
using HCB_Port.Models.Implement;
using NPOI.OpenXmlFormats;

namespace HCB_Port.Services
{
    public class ServiceStoreProduce
    {
        private static ServiceStoreProduce _instance { get; set; }
        private static IDataContext DataContext { get; set; }
        private static IDatabaseFactory DatabaseFactory { get; set; }

        public static ServiceStoreProduce Instance()
        {
            DatabaseFactory = new DatabaseFactory();
            DataContext = DatabaseFactory.GetDb();
            _instance = new ServiceStoreProduce();
            return ServiceStoreProduce._instance;
        }

        internal List<Get_List_HCP_Info_Result> Get_List_HCP_Info(string province)
        {
            var temp = DataContext.Database()
                .SqlQuery<Get_List_HCP_Info_Result>("Get_List_HCP_Info @citizen_place={0}", province).ToList();

            return temp;
        }

        internal List<string> List_Select_Place_Issue()
        {
            var temp = DataContext.Database().SqlQuery<string>("List_Select_Place_Issue").ToList();

            return temp;
        }

        internal List<Get_List_Event_Info_Result> Get_List_Event_Info(string requestTime, string eventTime)
        {
            DateTime requestDate = DateTime.Parse(requestTime);
            var timeEvent = !string.IsNullOrEmpty(eventTime) ? DateTime.Parse(eventTime) : (DateTime?)null;

            var temp = DataContext.Database().SqlQuery<Get_List_Event_Info_Result>("Get_List_Event_Info @request_date = {0},@event_time = {1}", requestDate, timeEvent).ToList();

            return temp;
        }

        internal List<Get_History_Payment_By_Event_Result> Get_List_History_Payment_By_Event(int idEvent)
        {
            var temp = DataContext.Database().SqlQuery<Get_History_Payment_By_Event_Result>("Get_History_Payment_By_Event @id_event = {0}", idEvent).ToList();

            return temp;
        }
        internal List<Get_List_Chi_Tiet_Dich_Vu_Result> Get_List_Chi_Tiet_Dich_Vu()
        {
            var temp = DataContext.Database()
                .SqlQuery<Get_List_Chi_Tiet_Dich_Vu_Result>("Get_List_Chi_Tiet_Dich_Vu").ToList();

            return temp;
        }

        internal List<User_Create_Rate> GetRate_ByUsr(string usr)
        {
            return DataContext.Database().SqlQuery<User_Create_Rate>("GetRate_byUsr @username = {0}, @idRateArray = {1}", usr, "1,2,3").ToList();

        }

        internal List<Service_Cost> Get_Service_Cost_ByUsr(string usr, int id_event)
        {
            return DataContext.Database().SqlQuery<Service_Cost>("Get_Service_Cost_ByUsr @username = {0}, @idRateArray = {1}, @id_event = {2}", usr, "1,2,3,4,5,6,7,8", id_event).ToList();

        }

        internal List<Get_Export_From_ToTime_Event_Payment_Result> Get_Export_Event_Payment(string from_time, string to_time)
        {
            DateTime tu_ngay = DateTime.Parse(from_time);
            var den_ngay = !string.IsNullOrEmpty(to_time) ? DateTime.Parse(to_time) : (DateTime?)null;

            var temp = DataContext.Database().SqlQuery<Get_Export_From_ToTime_Event_Payment_Result>("Get_Export_Event_Payment @fromtime = {0},@totime = {1}", tu_ngay, den_ngay).ToList();

            return temp;
        }

        internal List<Get_Export_From_ToTime_HCP_Info_Result> Get_Export_From_ToTime_HCP_Info(string from_time, string to_time , string place_issue)
        {
            DateTime tu_ngay = DateTime.Parse(from_time);
            var den_ngay = !string.IsNullOrEmpty(to_time) ? DateTime.Parse(to_time) : (DateTime?)null;

            var temp = DataContext.Database().SqlQuery<Get_Export_From_ToTime_HCP_Info_Result>("Get_Export_From_ToTime_HCP_Info @fromtime = {0},@totime = {1},@place = {2}", tu_ngay, den_ngay , place_issue).ToList();

            return temp;
        }
    }
}