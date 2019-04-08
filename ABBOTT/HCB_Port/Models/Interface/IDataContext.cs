using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HCB_Port.Models.Interface
{
    public interface IDataContext 
    {
        IDbSet<T> DbSet<T>() where T : class;
        DbEntityEntry<T> EntityEntry<T>(T item) where T : class;
        Database Database();
        int Commit();
    }
}
