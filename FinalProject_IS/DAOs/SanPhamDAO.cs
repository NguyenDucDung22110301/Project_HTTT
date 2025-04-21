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
    public class SanPhamDAO
    {
        public static List<SanPham> DSSanPham()
        {
            List<SanPham> dsSanPham = new List<SanPham>();

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                string query = "SELECT * FROM SanPham";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();

                dataAdapter.Fill(dataTable);

                foreach (DataRow row in dataTable.Rows)
                {
                    SanPham sp = new SanPham
                    {
                        MaSP = Convert.ToInt32(row["MaSP"]),
                        TenSP = row["TenSP"].ToString(),
                        LoaiSP = row["LoaiSP"].ToString(),
                        GiaBan = Convert.ToDecimal(row["GiaBan"]),
                        SoLuongTon = Convert.ToInt32(row["SoLuongTon"]),
                        NgayNhapKho = Convert.ToDateTime(row["NgayNhapKho"]),
                        ThoiGianBaoHanh = row["ThoiGianBaoHanh"] != DBNull.Value ? Convert.ToInt32(row["ThoiGianBaoHanh"]) : (int?)null,
                        GiaGoc = Convert.ToDecimal(row["GiaGoc"]),
                        MoTa = row["MoTa"].ToString()
                    };
                    dsSanPham.Add(sp);
                }
            }

            return dsSanPham;
        }

        public static int GetNewProductID()
        {
            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                conn.Open();

                string query = "SELECT ISNULL(MAX(MaSP), 0) FROM SanPham";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    object result = cmd.ExecuteScalar();
                    int maxID = Convert.ToInt32(result);
                    return maxID + 1; 
                }
            }
        }

        public static string GetProductNameByID(int productID)
        {
            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                conn.Open();

                string query = "Select TenSP From SanPham where MaSP = @productID;";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@productID", productID);
                    object result = cmd.ExecuteScalar();
                    string maxID = result.ToString();
                    return maxID;
                }
            }
        }

    }
}
