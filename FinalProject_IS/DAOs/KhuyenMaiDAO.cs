using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject_IS.DAOs
{
    public class KhuyenMaiDAO
    {
        public static List<KhuyenMai> DsKhuyenMai()
        {
            List<KhuyenMai> dsKhuyenMai = new List<KhuyenMai>();

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                string query = "SELECT * FROM KhuyenMai";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();

                dataAdapter.Fill(dataTable);

                foreach (DataRow row in dataTable.Rows)
                {
                    KhuyenMai km = new KhuyenMai
                    {
                        MaKM = Convert.ToInt32(row["MaKM"]),
                        TenChuongTrinh = row["TenChuongTrinh"].ToString(),
                        GiaTriKhuyenMai = Convert.ToDouble(row["GiaTriKhuyenMai"]),
                        DieuKienKhuyenMai = row["TenChuongTrinh"].ToString(),
                        NgayBatDau = Convert.ToDateTime(row["NgayBatDau"]),
                        NgayKetThuc = Convert.ToDateTime(row["NgayKetThuc"]),
                        SoLuong = Convert.ToInt32(row["SoLuong"])
                    };
                    dsKhuyenMai.Add(km);
                }
            }

            return dsKhuyenMai;
        }
    }
}
