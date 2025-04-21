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
    public class KhachHangDAO
    {
        public static List<KhachHang> DSKhachHang()
        {
            List<KhachHang> dsKhachHang = new List<KhachHang>();

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                string query = "SELECT * FROM KhachHang";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();

                dataAdapter.Fill(dataTable);

                foreach (DataRow row in dataTable.Rows)
                {
                    KhachHang kh = new KhachHang
                    {
                        MaKH = Convert.ToInt32(row["MaKH"]),
                        HoTen = row["HoTen"].ToString(),
                        SoDienThoai = row["SoDienThoai"].ToString(),
                        TongChiTieu = Convert.ToDecimal(row["TongChiTieu"]),
                        MaLoaiKH = Convert.ToInt32(row["MaLoaiKH"]),
                    };
                    dsKhachHang.Add(kh);
                }
            }

            return dsKhachHang;
        }
    }
}
