using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HCB_Port.Models.ViewModel
{
    public class AddEventInfoClass
    {
        [JsonProperty("feeJSON")]
        public Dictionary<string, FeeJson> FeeJson { get; set; }

        [JsonProperty("rateJSON")]
        public Dictionary<string, RateJson> RateJson { get; set; }

        [JsonProperty("ticketJSON")]
        public Dictionary<string, TicketJson> TicketJson { get; set; }

        [JsonProperty("mealJSON")]
        public Dictionary<string, MealJson> MealJson { get; set; }

        [JsonProperty("hotelJSON")]
        public Dictionary<string, HotelJson> HotelJson { get; set; }

        [JsonProperty("carJSON")]
        public Dictionary<string, CarJson> CarJson { get; set; }

        [JsonProperty("otherJSON")]
        public Dictionary<string, OtherJson> OtherJson { get; set; }

        [JsonProperty("totalrow")]
        public List<string> Totalrow { get; set; }

        [JsonProperty("form")]
        public Dictionary<string, string> form { get; set; }
    }

    public partial class FeeJson
    {
        [JsonProperty("fee")]
        public long Fee { get; set; }
    }
    public partial class RateJson
    {
        [JsonProperty("ratenames")]
        public double Ratenames { get; set; }
    }
    public partial class TicketJson
    {
        [JsonProperty("tickets")]
        public long Tickets { get; set; }
    }
    public partial class MealJson
    {
        [JsonProperty("meals")]
        public long Meals { get; set; }
    }
    public partial class HotelJson
    {
        [JsonProperty("hotels")]
        public long Hotels { get; set; }
    }
    public partial class CarJson
    {
        [JsonProperty("cars")]
        public long Cars { get; set; }
    }
    public partial class OtherJson
    {
        [JsonProperty("others")]
        public long Others { get; set; }
    }
}
