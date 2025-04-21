using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity.Infrastructure;

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
        public static List<PhieuNhan> DSPhieuNhanTheoMa(string maphieu)
        {
            List<PhieuNhan> dsPhieuNhan = new List<PhieuNhan>();

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                string query = @"SELECT * FROM PhieuNhan
                         WHERE MaPhieuNhan LIKE @maphieu";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@maphieu", maphieu + "%");

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                    DataTable dataTable = new DataTable();

                    dataAdapter.Fill(dataTable);

                    foreach (DataRow row in dataTable.Rows)
                    {
                        PhieuNhan sp = new PhieuNhan
                        {
                            MaPhieuNhan = Convert.ToInt32(row["MaPhieuNhan"]),
                            NgayTao = Convert.ToDateTime(row["NgayTao"])
                        };

                        dsPhieuNhan.Add(sp);
                    }
                }
            }

            return dsPhieuNhan;
        }
        public static List<PhieuNhan> DSSapXepPhieuNhan(string columnName)
        {
            List<PhieuNhan> dsPhieuNhan = new List<PhieuNhan>();

            // Kiểm tra và xác thực tên cột để tránh SQL injection
            if (!IsValidColumnName(columnName))
            {
                throw new ArgumentException("Tên cột không hợp lệ.");
            }

            string query = $@"SELECT * FROM PhieuNhan
                      ORDER BY {columnName} DESC";

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                conn.Open(); // Mở kết nối

                using (SqlDataReader reader = cmd.ExecuteReader()) // Sử dụng SqlDataReader
                {
                    while (reader.Read())
                    {
                        PhieuNhan sp = new PhieuNhan
                        {
                            MaPhieuNhan = reader.GetInt32(reader.GetOrdinal("MaPhieuNhan")),
                            NgayTao = reader.GetDateTime(reader.GetOrdinal("NgayTao"))
                        };

                        dsPhieuNhan.Add(sp);
                    }
                }
            }

            return dsPhieuNhan;
        }

        // Phương thức để kiểm tra tên cột
        private static bool IsValidColumnName(string columnName)
        {
            // Kiểm tra tên cột với danh sách các tên cột hợp lệ
            var validColumns = new List<string> { "MaPhieuNhan", "NgayTao" }; // Thêm các cột hợp lệ ở đây
            return validColumns.Contains(columnName);
        }
    }
}
