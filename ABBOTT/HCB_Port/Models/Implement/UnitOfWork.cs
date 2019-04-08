using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HCB_Port.Models.Interface;

namespace HCB_Port.Models.Implement
{
    public class UnitOfWork : IUnitOfWork
    {
        public IDataContext DataContext { get; set; }

        public UnitOfWork(IDataContext dataContext)
        {
            DataContext = dataContext;
        }

        public int Commit()
        {
            return DataContext.Commit();
        }
    }
}