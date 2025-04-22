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
    public class PhieuNhanDAO
    {
        public static List<PhieuNhan> DSPhieuNhan()
        {
            List<PhieuNhan> dsPhieuNhan = new List<PhieuNhan>();

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                string query = "SELECT * FROM PhieuNhan";

                SqlDataAdapter dataAdapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();

                dataAdapter.Fill(dataTable);

                foreach (DataRow row in dataTable.Rows)
                {
                    PhieuNhan pn = new PhieuNhan
                    {
                        MaPhieuNhan = Convert.ToInt32(row["MaPhieuNhan"]),
                        NgayTao = Convert.ToDateTime(row["NgayTao"]),
                    };
                    dsPhieuNhan.Add(pn);
                }
            }

            return dsPhieuNhan;
        }

        public static void InsertPhieu(PhieuNhan phieu)
        {
            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                string query = @"INSERT INTO PhieuNhan Values(@NgayTao)";



                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@NgayTao", phieu.NgayTao);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static void InsertChiTietPhieu(ChiTietPhieuNhan chitiet)
        {
            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                string query = @"INSERT INTO ChiTietPhieuNhan Values(@MaPhieuNhan, @MaSP, @TenSP, @LoaiSP
                                                                        ,@SoLuongNhap, @DonGiaNhap, @ThuongHieu
                                                                        ,@ThoiGianBaoHanh, @MoTa, @TongTien, @NgayNhan)";



                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@MaPhieuNhan", chitiet.MaPhieuNhan);
                    cmd.Parameters.AddWithValue("@MaSP", chitiet.MaSP);
                    cmd.Parameters.AddWithValue("@TenSP", chitiet.TenSP);
                    cmd.Parameters.AddWithValue("@LoaiSP", chitiet.LoaiSP);
                    cmd.Parameters.AddWithValue("@SoLuongNhap", chitiet.SoLuongNhap);
                    cmd.Parameters.AddWithValue("@DonGiaNhap", chitiet.DonGiaNhap);
                    cmd.Parameters.AddWithValue("@ThuongHieu", chitiet.ThuongHieu);
                    cmd.Parameters.AddWithValue("@ThoiGianBaoHanh", chitiet.ThoiGianBaoHanh);
                    cmd.Parameters.AddWithValue("@MoTa", chitiet.MoTa);
                    cmd.Parameters.AddWithValue("@TongTien", chitiet.TongTien);
                    cmd.Parameters.AddWithValue("@NgayNhan", chitiet.NgayNhan);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public static int GetNewPhieuNhanID()
        {
            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                conn.Open();

                string query = "SELECT ISNULL(MAX(MaPhieuNhan), 0) FROM PhieuNhan";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    object result = cmd.ExecuteScalar();
                    int maxID = Convert.ToInt32(result);
                    return maxID + 1;
                }
            }
        }
    }
}
