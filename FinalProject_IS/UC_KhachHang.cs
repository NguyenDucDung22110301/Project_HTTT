using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FinalProject_IS.DAOs;

namespace FinalProject_IS
{
    public partial class UC_KhachHang : UserControl
    {
        private int machucvu;
        public UC_KhachHang(int machucvu)
        {
            InitializeComponent();
            this.machucvu = machucvu;
            if(machucvu == 1)
            {
                btnSua.Hide();
            }
            LoadDsKhachHang();
        }

        public void LoadDsKhachHang()
        {
            dtgvKhachHang.DataSource = KhachHangDAO.DSKhachHang();
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            dtgvKhachHang.DataSource = KhachHangDAO.DSKhachHangTheoTen(rTxb_Search.Text);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.SelectedIndex == 0)
            {
                dtgvKhachHang.DataSource = KhachHangDAO.DSKhachHangSapXep("MaKH");
            }
            else
            {
                dtgvKhachHang.DataSource = KhachHangDAO.DSKhachHangSapXep("TongChiTieu");
            }
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            if (dtgvKhachHang.CurrentRow != null && dtgvKhachHang.CurrentRow.Index >= 0)
            {
                try
                {
                    string maKH = dtgvKhachHang.CurrentRow.Cells["MaKH"].Value?.ToString();
                    string hoTen = dtgvKhachHang.CurrentRow.Cells["HoTen"].Value?.ToString();
                    string soDienThoai = dtgvKhachHang.CurrentRow.Cells["SoDienThoai"].Value?.ToString();
                    string tongChiTieu = dtgvKhachHang.CurrentRow.Cells["TongChiTieu"].Value?.ToString();
                    string maLoaiKH = dtgvKhachHang.CurrentRow.Cells["MaLoaiKH"].Value?.ToString();

                    // Kiểm tra xem MaKH có lấy được không (phòng trường hợp dòng trống)
                    if (!string.IsNullOrEmpty(maKH))
                    {
                        Form5 form5 = new Form5(maKH, hoTen, soDienThoai, tongChiTieu, maLoaiKH);
                        DialogResult result = form5.ShowDialog();
                        // (Tùy chọn) Xử lý sau khi Form Sửa đóng lại
                        if (result == DialogResult.OK) // Giả sử Form Sửa trả về OK nếu cập nhật thành công
                        {
                            // Load lại dữ liệu trên DataGridView để thấy thay đổi
                            LoadDsKhachHang(); 
                        }
                    }
                    else
                    {
                        MessageBox.Show("Không thể lấy Mã Khách Hàng từ dòng được chọn.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Có lỗi xảy ra khi lấy dữ liệu: {ex.Message}", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng chọn một khách hàng để sửa.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
    }
}
