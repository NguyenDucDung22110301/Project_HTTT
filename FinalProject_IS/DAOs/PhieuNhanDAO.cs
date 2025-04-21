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
    }
}
