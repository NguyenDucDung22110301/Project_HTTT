using FinalProject_IS.DAOs;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FinalProject_IS
{
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }
        public Form5(string maKH, string hoTen, string sdt, string chiTieu, string maLoai) : this() // Gọi hàm khởi tạo mặc định để InitializeComponent() chạy trước
        {
            // Gán dữ liệu vào các controls
            txtMaKH.Text = maKH;
            txtName.Text = hoTen;
            txtSDT.Text = sdt;
            txtTongChiTieu.Text = chiTieu;
            txtMaLoaiKH.Text = maLoai;

            // Có thể bạn muốn Mã Khách Hàng không cho phép sửa đổi
            txtMaKH.ReadOnly = true;
            txtMaKH.Enabled = false;
            txtTongChiTieu.ReadOnly = true;
            txtTongChiTieu.Enabled = false;
            txtMaLoaiKH.ReadOnly = true;
            txtMaLoaiKH.Enabled = false;
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            try
            {
                KhachHang khachHang = new KhachHang();
                khachHang.HoTen = txtName.Text;
                khachHang.SoDienThoai = txtSDT.Text;
                KhachHangDAO.UpdateKhachHang(khachHang);

                // [Tùy chọn] Hiển thị thông báo thành công cho người dùng
                MessageBox.Show("Cập nhật thông tin khách hàng thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                // Ghi lại lỗi (logging) để theo dõi và gỡ lỗi
                Console.WriteLine($"Lỗi khi cập nhật khách hàng: {ex.Message}");

                // Hiển thị thông báo lỗi thân thiện cho người dùng
                MessageBox.Show("Đã xảy ra lỗi trong quá trình cập nhật. Vui lòng thử lại sau.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
           this.Close();        
        }
    }
}
