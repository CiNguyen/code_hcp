using System;
using System.Collections;
using System.Collections.Generic;
using HCB_Port.Models;
using HCB_Port.Services.Base;

namespace HCB_Port.Services
{
    public class Services_service_criteria : HCPServices<Service_Criteria>
    {
        #region Config

        public static Services_service_criteria _instance { get; set; }
        public static Services_service_criteria Instance()
        {
            _instance = new Services_service_criteria(ServiceControtor<Service_Criteria>.Instance());
            return Services_service_criteria._instance;
        }
        public Services_service_criteria(ServiceControtor<Service_Criteria> controtor)
            : base(controtor)
        { }

        #endregion
        internal int Get_ID_Service_Criteria(int id_detail)
        {
            var item = Get(r => r.ID_Details == id_detail);
            if (item != null)
            {
                return item.ID_Details;
            }
            else
            {
                return 0;
            }
        }

    }
}