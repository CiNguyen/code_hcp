//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HCB_Port.Models
{
    using System;
    
    public partial class Get_List_HCP_Info_Result
    {
        public int ID { get; set; }
        public string Code { get; set; }
        public string Full_Name { get; set; }
        public string Citizen_ID { get; set; }
        public Nullable<System.DateTime> Issue_Date { get; set; }
        public string Place_Issue { get; set; }
        public string PIT_Code { get; set; }
        public string Position { get; set; }
        public Nullable<System.DateTime> Birth_Day { get; set; }
        public string Address { get; set; }
        public string Bank_Name { get; set; }
        public string Bank_Account { get; set; }
        public Nullable<int> Quantity_Event { get; set; }
        public Nullable<double> Money_Received { get; set; }
        public string Note { get; set; }
        public string Status { get; set; }
        public Nullable<System.DateTime> Create_Date { get; set; }
        public string Create_User { get; set; }
        public byte[] CMND_MT { get; set; }
        public byte[] CMND_MS { get; set; }
        public Nullable<int> History { get; set; }
        public Nullable<double> Total_Amount { get; set; }
    }
}