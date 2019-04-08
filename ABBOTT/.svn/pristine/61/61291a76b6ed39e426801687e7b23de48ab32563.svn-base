using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using HCB_Port.Models.Interface;
using HCB_Port.Models.Implement;
using System.Data;
using System.Web.Mvc;

namespace HCB_Port.Services.Base
{
    public class HCPServices<T> : IService<T> where T : class
    {
        private IRepository<T> Repository { get; set; }
        private IUnitOfWork UnitOfWork { get; set; }

        

        public HCPServices(ServiceControtor<T> controtor)
        {
            Repository = controtor.Repository;
            UnitOfWork = controtor.UnitOfWork;
        }

        public bool Add(T item)
        {
            try
            {
                Repository.Add(item);
                UnitOfWork.Commit();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Delete(T item)
        {
            try
            {
                Repository.Delete(item);
                UnitOfWork.Commit();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public T Get(Expression<Func<T, bool>> where)
        {
            return Repository.Get(where);
        }

        public T GetById(int id)
        {
            return Repository.GetById(id);
        }

        public IQueryable<T> List()
        {
            return Repository.List();
        }

        public IQueryable<T> ListMany(Expression<Func<T, bool>> where)
        {
            return Repository.ListMany(where);
        }

        public bool Update(T item)
        {
            try
            {
                Repository.Update(item);
                UnitOfWork.Commit();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public DataTable ExcuteStoreProduce(string storeName, params SelectListItem[] parameters)
        {
            return Repository.ExcuteStoreProduce(storeName, parameters);
        }

        public List<T> Excute(string storeName, params object[] parameters)
        {
            return Repository.Excute(storeName, parameters);
        }


    }

    public class ServiceControtor<T> where T : class
    {
        private IDataContext DataContext { get; set; }
        public IDatabaseFactory DatabaseFactory { get; set; }
        public IUnitOfWork UnitOfWork { get; set; }
        public IRepository<T> Repository { get; set; }

        private static ServiceControtor<T> _instance;

        public ServiceControtor()
        {
            DatabaseFactory = new DatabaseFactory();
            DataContext = DatabaseFactory.GetDb();
            UnitOfWork = new UnitOfWork(DataContext);
            Repository = new Repository<T>(DataContext);
        }

        public static ServiceControtor<T> Instance()
        {
            _instance = new ServiceControtor<T>();
            return ServiceControtor<T>._instance;
        }
    }
}