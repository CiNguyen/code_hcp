using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;

namespace HCB_Port.Services
{
    public class Services_Files
    {

        internal static MemoryStream Get_Template_Excel(HttpServerUtilityBase Server, string filename)
        {
            MemoryStream ms = new MemoryStream();
            FileStream fs = new FileStream(Server.MapPath(@"\Contents\File_Templates\" + filename + ".xlsx"),
                FileMode.Open, FileAccess.Read);
            IWorkbook templateWorkbook = new XSSFWorkbook(fs);
            templateWorkbook.Write(ms);
            return ms;
        }

           internal static DataTable Get_Import_Excel(HttpServerUtilityBase server, string Sheet_Name, HttpFileCollectionBase Total_File, string name_file)
        {
            DataTable dt = new DataTable();
            string fileExtension = System.IO.Path.GetExtension(Total_File[name_file].FileName);
            string fileLocation = server.MapPath("~/Contents/File_uploads/") + Total_File[name_file].FileName;

            if (fileExtension == ".xls" || fileExtension == ".xlsx")
            {
                // kiem tra ton tai if có thì delete
                if (System.IO.File.Exists(fileLocation))
                {
                    System.IO.File.Delete(fileLocation);
                }
                // save file lại
                Total_File[name_file].SaveAs(fileLocation);
                //tao ra 1 chuoi connect string
                string excelConnectionString = string.Empty;

                //excel 2007
                if (fileExtension == ".xls")
                {
                    excelConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" +
                                            fileLocation + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
                }
                //connection String for xlsx file format.
                //excel 2012
                else if (fileExtension == ".xlsx")
                {
                    excelConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" +
                                            fileLocation + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
                }

                //Create Connection to Excel work book and add oledb namespace
                //moc du lieu dổ exel dổ ra table
                OleDbConnection excelConnection = new OleDbConnection(excelConnectionString);
                try
                {

                    OleDbCommand cmd = new OleDbCommand("Select * From [" + Sheet_Name + "$]", excelConnection);
                    excelConnection.Open();
                    dt = new DataTable();
                    OleDbDataAdapter dataAdapter = new OleDbDataAdapter(cmd);
                    dataAdapter.Fill(dt);
                    excelConnection.Close();
                }
                catch
                {
                    excelConnection.Close();
                    System.IO.File.Delete(fileLocation);
                    return dt;
                }
            }
            System.IO.File.Delete(fileLocation);
            return dt;
        }
    }
}