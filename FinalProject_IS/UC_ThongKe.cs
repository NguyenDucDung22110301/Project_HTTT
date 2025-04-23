using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity.Migrations.Model;
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
    public partial class UC_ThongKe : UserControl
    {
        public string loaitk = "doanhthu";
        public UC_ThongKe()
        {
            InitializeComponent();
            int month = dtpMonth.Value.Month;
            int year = dtpMonth.Value.Year;
            DsLoiNhuanCao();
            LoadDoanhThuTheoThang(month, year);
        }
        #region DoanhThu
        private void LoadDoanhThuTheoThang(int month, int year)
        {
            try
            {
                string query = @"
                            SELECT 
                                DAY(Ngay) AS Ngay,
                                SUM(DoanhThu) AS DoanhThu
                            FROM (
                                SELECT 
                                    NgayGioTao AS Ngay,
                                    TongTien AS DoanhThu
                                FROM HoaDon
                                WHERE MONTH(NgayGioTao) = @Month AND YEAR(NgayGioTao) = @Year

                                UNION ALL

                                SELECT 
                                    NgayGioTao AS Ngay,
                                    ThanhTien AS DoanhThu
                                FROM HoaDonDichVu
                                WHERE MONTH(NgayGioTao) = @Month AND YEAR(NgayGioTao) = @Year AND LoaiPhieu = 'DV'
                            ) AS TongHop
                            GROUP BY DAY(Ngay)
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
                    ChartType = SeriesChartType.Column,
                    IsValueShownAsLabel = true
                };

                foreach (DataRow row in dt.Rows)
                {
                    int ngay = Convert.ToInt32(row["Ngay"]);
                    decimal doanhThu = Convert.ToDecimal(row["DoanhThu"]);
                    series.Points.AddXY(ngay + "/" + month, doanhThu);
                }

                chartDoanhThu.Series.Add(series);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void LoadDoanhThuTheoNam(int year)
        {
            string query = @"
                            SELECT 
                                MONTH(Ngay) AS Thang,
                                SUM(DoanhThu) AS DoanhThu
                            FROM (
                                SELECT 
                                    NgayGioTao AS Ngay,
                                    TongTien AS DoanhThu
                                FROM HoaDon
                                WHERE YEAR(NgayGioTao) = @Year

                                UNION ALL

                                SELECT 
                                    NgayGioTao AS Ngay,
                                    ThanhTien AS DoanhThu
                                FROM HoaDonDichVu
                                WHERE YEAR(NgayGioTao) = @Year AND LoaiPhieu = 'DV'
                            ) AS TongHop
                            GROUP BY MONTH(Ngay)
                            ORDER BY Thang";

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
                ChartType = SeriesChartType.Column,
                IsValueShownAsLabel = true
            };

            foreach (DataRow row in dt.Rows)
            {
                int thang = Convert.ToInt32(row["Thang"]);
                decimal doanhThu = Convert.ToDecimal(row["DoanhThu"]);
                series.Points.AddXY(thang + "/" + year, doanhThu);
            }

            chartDoanhThu.Series.Add(series);
        }

        private void DsBanChay()
        {
            try
            {
                string query = @"
                            SELECT TOP 10
                                sp.MaSP,
                                sp.TenSP, 
                                SUM(ct.SoLuongSP) AS DoanhSo,
                                SUM(ct.ThanhTien) AS DoanhThu
                            FROM ChiTietHD_SanPham ct
                            JOIN SanPham sp ON ct.MaSP = sp.MaSP
                            GROUP BY sp.MaSP, sp.TenSP
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
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        #endregion

        #region LoiNhuan
        public void DsLoiNhuanCao()
        {
            try
            {
                string query = @"
                            WITH GiaNhapTrungBinhCTE AS (
                                SELECT 
                                    MaSP,
                                    SUM(SoLuongNhap) AS TongSoLuongNhap,
                                    AVG(DonGiaNhap) AS DonGiaNhapTB
                                FROM ChiTietPhieuNhan
                                GROUP BY MaSP
                            ),
                            DoanhThu AS (
	                            SELECT 
		                            sp.MaSP,
		                            sp.TenSP, 
		                            SUM(ct.SoLuongSP) AS DoanhSo,
		                            SUM(ct.ThanhTien) AS DoanhThu
	                            FROM ChiTietHD_SanPham ct
	                            JOIN SanPham sp ON ct.MaSP = sp.MaSP
	                            GROUP BY sp.MaSP, sp.TenSP
                            )
                            SELECT TOP 10
                                dt.MaSP,
                                dt.TenSP,
                                dt.DoanhSo,
                                dt.DoanhThu,
                                ISNULL(gntb.DonGiaNhapTB * gntb.TongSoLuongNhap, 0) AS GiaTriNhap,
                                ISNULL(dt.DoanhThu - (gntb.DonGiaNhapTB * gntb.TongSoLuongNhap), 0) AS LoiNhuan
                            FROM DoanhThu dt
                            LEFT JOIN GiaNhapTrungBinhCTE gntb ON dt.MaSP = gntb.MaSP
                            ORDER BY LoiNhuan DESC";

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
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void LoadLoiNhuanTheoThang(int month, int year)
        {
            try
            {
                string query = @"
                                select 
	                                DAY(LoiNhuanTrenHD.NgayGioTao) as Ngay, 
	                                MONTH(LoiNhuanTrenHD.NgayGioTao) as Thang, 
	                                SUM(LoiNhuanTrenNgay) as LoiNhuan
                                from (
	                                select NgayGioTao, SoluongSP * (DonGia - sp.GiaGoc) as LoiNhuanTrenNgay
	                                from (
		                                SELECT 
			                                hd.MaHD, MaSP, NgayGioTao, SoLuongSP, DonGia
		                                FROM ChiTietHD_SanPham ctsp, HoaDon hd
		                                WHERE hd.MaHD = ctsp.MaHD
	                                ) as DoanhThuNgay, SanPham sp
	                                WHERE DoanhThuNgay.MaSP = sp.MaSP
                                    AND MONTH(NgayGioTao) = @Month AND YEAR(NgayGioTao) = @Year
	                                GROUP BY NgayGioTao, SoluongSP, DonGia, sp.GiaGoc
                                ) as LoiNhuanTrenHD
                                GROUP BY NgayGioTao;";

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
                chartDoanhThu.Titles.Clear();
                chartDoanhThu.Titles.Add($"Lợi nhuận từng ngày trong tháng {month}/{year}");

                Series series = new Series("Lợi nhuận theo ngày")
                {
                    ChartType = SeriesChartType.Column,
                    IsValueShownAsLabel = true
                };

                foreach (DataRow row in dt.Rows)
                {
                    int ngay = Convert.ToInt32(row["Ngay"]);
                    decimal loinhuan = row["LoiNhuan"] != DBNull.Value ? Convert.ToDecimal(row["LoiNhuan"]) : 0;
                    series.Points.AddXY($"{ngay}/{month}", loinhuan);
                }

                chartDoanhThu.Series.Add(series);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi tải dữ liệu lợi nhuận: " + ex.Message);
            }
        }

        private void LoadLoiNhuanTheoNam(int year)
        {
            try
            {
                string query = @"
                                WITH DoanhThu AS (
                                    SELECT 
                                        MONTH(HoaDon.NgayGioTao) AS Thang,
                                        SUM(ThanhTien) AS Thu
                                    FROM ChiTietHD_SanPham 
                                    JOIN HoaDon ON HoaDon.MaHD = ChiTietHD_SanPham.MaHD
                                    WHERE YEAR(HoaDon.NgayGioTao) = @Year
                                    GROUP BY MONTH(HoaDon.NgayGioTao)
                                ),
                                TienVon AS (
                                    SELECT 
                                        MONTH(NgayNhan) AS Thang,
                                        SUM(SoLuongNhap * DonGiaNhap) AS Von
                                    FROM ChiTietPhieuNhan
                                    WHERE YEAR(NgayNhan) = @Year
                                    GROUP BY MONTH(NgayNhan)
                                )
                                SELECT 
                                    ISNULL(dt.Thang, tv.Thang) AS Thang,
                                    ISNULL(dt.Thu, 0) AS Thu,
                                    ISNULL(tv.Von, 0) AS Von,
                                    ISNULL(dt.Thu, 0) - ISNULL(tv.Von, 0) AS LoiNhuan
                                FROM DoanhThu dt
                                FULL OUTER JOIN TienVon tv ON dt.Thang = tv.Thang
                                ORDER BY Thang";

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
                chartDoanhThu.Titles.Clear();
                chartDoanhThu.Titles.Add($"Lợi nhuận từng tháng năm {year}");

                Series series = new Series("Lợi nhuận theo tháng")
                {
                    ChartType = SeriesChartType.Column,
                    IsValueShownAsLabel = true
                };

                foreach (DataRow row in dt.Rows)
                {
                    int thang = Convert.ToInt32(row["Thang"]);
                    decimal loinhuan = row["LoiNhuan"] != DBNull.Value ? Convert.ToDecimal(row["LoiNhuan"]) : 0;
                    series.Points.AddXY(thang + "/" + year, loinhuan);
                }

                chartDoanhThu.Series.Add(series);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        #endregion

        #region ChucNang
        private void dtpMonth_ValueChanged(object sender, EventArgs e)
        {
            int month = dtpMonth.Value.Month;
            int year = dtpMonth.Value.Year;
            if (loaitk == "doanhthu")
            {
                LoadDoanhThuTheoThang(month, year);
            }
            else
            {
                LoadLoiNhuanTheoThang(month, year);
            }
        }

        private void dtpYear_ValueChanged(object sender, EventArgs e)
        {
            int year = dtpYear.Value.Year;
            if (loaitk == "doanhthu")
            {
                LoadDoanhThuTheoNam(year);
            }
            else
            {
                LoadLoiNhuanTheoNam(year);
            }
        }
        private void ReloadThongKe()
        {
            dtgvTopSales.DataSource = null;
            chartDoanhThu.Series.Clear();
            chartDoanhThu.Titles.Clear();
            UC_ThongKe_Load(this, EventArgs.Empty);
        }
        private void btnLoiNhuan_Click(object sender, EventArgs e)
        {
            loaitk = "loinhuan";
            ReloadThongKe();
        }

        private void btnDoanhThu_Click(object sender, EventArgs e)
        {
            loaitk = "doanhthu";
            ReloadThongKe();
        }

        private void UC_ThongKe_Load(object sender, EventArgs e)
        {
            int month = dtpMonth.Value.Month;
            int year = dtpMonth.Value.Year;
            if (loaitk == "doanhthu")
            {
                lb_TopSanPham.Text = "Sản phẩm bán chạy nhất";
                lbThongKeThang.Text = "Doanh Thu Tháng";
                lbThongKeNam.Text = "Doanh Thu Năm";
                DsBanChay();
                LoadDoanhThuTheoThang(month, year);
            }
            else if (loaitk == "loinhuan")
            {
                lb_TopSanPham.Text = "Sản phẩm có lợi nhuận cao nhất";
                lbThongKeThang.Text = "Lợi Nhuận Tháng";
                lbThongKeNam.Text = "Lợi Nhuận Năm";
                DsLoiNhuanCao();
                LoadLoiNhuanTheoThang(month, year);
            }
        }
        #endregion
    }
}
