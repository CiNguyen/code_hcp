using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using HCB_Port.Models.Interface;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace HCB_Port.Models.Implement
{
    public class Repository<T> : IRepository<T> where T : class
    {
        public IDataContext DataContext { get; set; }
        public IDbSet<T> DbSet { get; set; }

        public Repository(IDataContext dataContext)
        {
            DataContext = dataContext;
            DbSet = DataContext.DbSet<T>();
        }

        public bool Add(T item)
        {
            try
            {
                DbSet.Add(item);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public T ConvertStringToClass(string json)
        {
            var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" };
            return JsonConvert.DeserializeObject<T>(json, dateTimeConverter);
        }

        public T ConvertStringToClassByFormData(string json)
        {
            var indexOf = json.IndexOf(':');

            json = json.Substring(indexOf + 1, json.Length - (indexOf + 2));

            var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" };

            return JsonConvert.DeserializeObject<T>(json, dateTimeConverter);
        }

        public bool Delete(T item)
        {
            try
            {
                Update(item);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public T Get(Expression<Func<T, bool>> where)
        {
            return DbSet.FirstOrDefault(where);
        }

        public IQueryable<T> List()
        {
            return DbSet;
        }

        public IQueryable<T> ListMany(Expression<Func<T, bool>> where, int? maxHint)
        {
            return maxHint != null ? DbSet.Where(where).Take(maxHint.Value) : DbSet.Where(where);
        }

        public bool Update(T item)
        {
            try
            {
                DataContext.EntityEntry(item).State = EntityState.Modified;
                return true;
            }
            catch 
            {
                return false;
            }
        }

        public T GetById(int id)
        {
            return DbSet.Find(id);
        }

        public DataTable ExcuteStoreProduce(string storeName, params SelectListItem[] parameters)
        {
            var dt = new DataTable();

            var conn = DataContext.Database().Connection;
            var connectionState = conn.State;
            try
            {
                if (connectionState != ConnectionState.Open)
                    conn.Open();
                using (var cmd = conn.CreateCommand())
                {
                    cmd.CommandText = storeName;
                    cmd.CommandType = CommandType.StoredProcedure;

                    foreach (var item in parameters)
                    {
                        cmd.Parameters.Add(new SqlParameter(item.Text, item.Value));
                    }

                    using (var reader = cmd.ExecuteReader())
                    {
                        dt.Load(reader);

                        return dt;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (connectionState != ConnectionState.Open)
                    conn.Close();
            }
        }

        public List<T> Excute(string storeName, params object[] parameters)
        {
            if (parameters == null || parameters.Length <= 0)
                return DataContext.Database().SqlQuery<T>(storeName).ToList();

            for (var i = 0; i <= parameters.Length - 1; i++)
            {
                var p = parameters[i] as DbParameter;

                storeName += i == 0 ? " " : ", ";

                if (p != null) storeName += "@" + p.ParameterName;
            }

            return DataContext.Database().SqlQuery<T>(storeName, parameters).ToList();
          
        }
    }
}