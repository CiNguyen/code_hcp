using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace HCB_Port.Models.Interface
{
    public interface IService<T> where T : class
    {
        IQueryable<T> List();
        T GetById(int id);
        T Get(Expression<Func<T, bool>> where);
        bool Add(T item);
        bool Update(T item);
        bool Delete(T item);
        IQueryable<T> ListMany(Expression<Func<T, bool>> where);
        DataTable ExcuteStoreProduce(string storeName, params SelectListItem[] parameters);
        List<T> Excute(string storeName, params object[] parameters);
    }
}
