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
    public class PhieuNhapHangDAO
    {
        public static List<PhieuNhapHang> DSPhieuNhapHang()
        {
            List<PhieuNhapHang> dsPhieuNhapHang = new List<PhieuNhapHang>();

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                string query = "SELECT * FROM PhieuNhapHang";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();

                dataAdapter.Fill(dataTable);

                foreach (DataRow row in dataTable.Rows)
                {
                    PhieuNhapHang sp = new PhieuNhapHang
                    {
                        MaPhieuNhap = Convert.ToInt32(row["MaSP"]),
                        NgayTao = Convert.ToDateTime(row["NgayNhapKho"]),
                        TinhTrangPhieuNhap = row["TinhTrangPhieuNhap"].ToString()
                    };
                    dsPhieuNhapHang.Add(sp);
                }
            }

            return dsPhieuNhapHang;
        }
    }
}
