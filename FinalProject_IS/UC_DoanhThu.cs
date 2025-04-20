using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;
using FinalProject_IS.DAOs;

namespace FinalProject_IS
{
    public partial class UC_DoanhThu : UserControl
    {
        public UC_DoanhThu()
        {
            InitializeComponent();
            int month = dtpMonth.Value.Month;
            int year = dtpMonth.Value.Year;
            DsBanChayNhat();
            LoadDoanhThuTheoThang(month, year);
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

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Month", month);
                    cmd.Parameters.AddWithValue("@Year", year);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }

            chartDoanhThu.Series.Clear();
            chartDoanhThu.Titles.Clear(); // Clear tiêu đề cũ
            chartDoanhThu.Titles.Add($"Doanh thu tháng {month}/{year}");
            Series series = new Series("Doanh thu theo ngày")
            {
                ChartType = SeriesChartType.Column
            };

            foreach (DataRow row in dt.Rows)
            {
                int ngay = Convert.ToInt32(row["Ngay"]);
                decimal doanhThu = Convert.ToDecimal(row["DoanhThu"]);
                series.Points.AddXY("Ngày " + ngay, doanhThu);
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
                        ORDER BY Thang ";

            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Year", year);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }

            chartDoanhThu.Series.Clear();
            chartDoanhThu.Titles.Clear(); // Clear tiêu đề cũ
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

        private void DsBanChayNhat()
        {
            string query = @"
                            SELECT TOP 10 
                                sp.TenSP, 
                                SUM(ct.SoLuongSP) AS DoanhSo,
                                SUM(ct.ThanhTien) AS DoanhThu
                            FROM ChiTietHD_SanPham ct
                            JOIN SanPham sp ON ct.MaSP = sp.MaSP
                            GROUP BY sp.TenSP
                            ORDER BY DoanhSo DESC";

            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(DataProvider.ConnStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }

            dtgvTopSales.DataSource = dt;
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
