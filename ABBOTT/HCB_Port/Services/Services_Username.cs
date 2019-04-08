using HCB_Port.Models;
using HCB_Port.Services.Base;

namespace HCB_Port.Services
{
    public class Services_Username: HCPServices<UserName>
    {
        #region Config

        public static Services_Username _instance { get; set; }
        public static Services_Username Instance()
        {
            _instance = new Services_Username(ServiceControtor<UserName>.Instance());
            return Services_Username._instance;
        }
        public Services_Username(ServiceControtor<UserName> controtor)
            : base(controtor)
        { }

        #endregion
    }
}