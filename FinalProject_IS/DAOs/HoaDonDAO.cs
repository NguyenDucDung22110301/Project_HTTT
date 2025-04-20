using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject_IS.DAOs
{
    public class HoaDonDAO
    {
        public static List<HoaDon> DSHoaDon()
        {
            List<HoaDon> dsHoaDon = new List<HoaDon>();

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                string query = "SELECT * FROM HoaDon";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();

                dataAdapter.Fill(dataTable);

                foreach (DataRow row in dataTable.Rows)
                {
                    HoaDon hd = new HoaDon
                    {
                        MaHD = Convert.ToInt32(row["MaHD"]),
                        NgayGioTao = Convert.ToDateTime(row["NgayGioTao"]),
                        MaKH = Convert.ToInt32(row["MaKH"]),
                        MaNV = Convert.ToInt32(row["MaNV"]),
                        TongTien = Convert.ToInt32(row["TongTien"]),
                        MaKM = row["MaKM"] != DBNull.Value ? Convert.ToInt32(row["MaKM"]) : (int?)null,
                        LoaiHoaDon = row["LoaiHoaDon"].ToString()
                    };
                    dsHoaDon.Add(hd);
                }
            }

            return dsHoaDon;
        }
    }
}
