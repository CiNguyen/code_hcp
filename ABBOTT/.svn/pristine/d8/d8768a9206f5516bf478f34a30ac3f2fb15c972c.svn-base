using HCB_Port.Models.Interface;


namespace HCB_Port.Models.Implement
{
    public class DatabaseFactory : IDatabaseFactory
    {
        public IDataContext GetDb()
        {
            return new HCPContext();
        }
    }
}