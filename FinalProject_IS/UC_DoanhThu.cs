using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Windows.Forms.DataVisualization.Charting;

namespace FinalProject_IS
{
    public partial class UC_DoanhThu : UserControl
    {
        string conStr = @"Data Source=DESKTOP-O0DLACG;Initial Catalog=ShopBadminton;Integrated Security=True;TrustServerCertificate=True";
        public UC_DoanhThu()
        {
            InitializeComponent();
            TopSales();
            int month = DateTime.Now.Month;
            int year = DateTime.Now.Year;
            LoadDoanhThuTheoThang(month, year);
        }

        public void TopSales()
        {
            using (SqlConnection conn = new SqlConnection(conStr))
            {
                conn.Open();
                string query = @"
                    SELECT TOP 10 TenSP, SUM(SoLuongSP) AS DoanhSo, SUM(ThanhTien) as DoanhThu
                    FROM HoaDon
                    JOIN ChiTietHD_SanPham ON HoaDon.MaHD = ChiTietHD_SanPham.MaHD
                    JOIN SanPham ON ChiTietHD_SanPham.MaSP = SanPham.MaSP
                    GROUP BY TenSP
                    ORDER BY DoanhSo DESC;";

                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                dtgvTopSales.DataSource = dt;
            }
        }

        private void LoadDoanhThuTheoThang(int month, int year)
        {
            string query = @"
                            SELECT 
                                DAY(NgayGioTao) AS Ngay,
                                SUM(TongTien) AS DoanhThu
                            FROM HoaDon
                            WHERE MONTH(NgayGioTao) = @Month AND YEAR(NgayGioTao) = @Year
                            GROUP BY DAY(NgayGioTao)
                            ORDER BY Ngay";

            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Month", month);
                    cmd.Parameters.AddWithValue("@Year", year);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }

            // Hiển thị lên biểu đồ
            chartDoanhThu.Series.Clear();
            chartDoanhThu.Titles.Clear(); 
            chartDoanhThu.Titles.Add($"Doanh thu tháng {month}/{year}");
            Series series = new Series("Doanh thu theo ngày");
            series.ChartType = SeriesChartType.Column;

            foreach (DataRow row in dt.Rows)
            {
                int ngay = Convert.ToInt32(row["Ngay"]);
                decimal doanhThu = Convert.ToDecimal(row["DoanhThu"]);
                series.Points.AddXY(ngay, doanhThu);
            }

            chartDoanhThu.Series.Add(series);
        }

        private void LoadDoanhThuTheoNam(int year)
        {
            string query = @"
                            SELECT 
                                MONTH(NgayGioTao) AS Thang,
                                SUM(TongTien) AS DoanhThu
                            FROM HoaDon
                            WHERE YEAR(NgayGioTao) = @Year
                            GROUP BY MONTH(NgayGioTao)
                            ORDER BY Thang";

            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Year", year);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }

            chartDoanhThu.Series.Clear();
            chartDoanhThu.Titles.Clear(); 
            chartDoanhThu.Titles.Add($"Doanh thu năm {year}");
            Series series = new Series("Doanh thu theo tháng")
            {
                ChartType = SeriesChartType.Column
            };

            foreach (DataRow row in dt.Rows)
            {
                int thang = Convert.ToInt32(row["Thang"]);
                decimal doanhThu = Convert.ToDecimal(row["DoanhThu"]);
                series.Points.AddXY("Tháng " + thang, doanhThu);
            }

            chartDoanhThu.Series.Add(series);
        }


        private void dtpMonth_ValueChanged(object sender, EventArgs e)
        {
            int month = dtpMonth.Value.Month;
            int year = dtpMonth.Value.Year;
            LoadDoanhThuTheoThang(month, year);
        }

        private void dtpYear_ValueChanged(object sender, EventArgs e)
        {
            int year = dtpYear.Value.Year;
            LoadDoanhThuTheoNam(year);
        }
    }
}
