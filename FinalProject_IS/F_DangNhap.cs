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
    public partial class F_DangNhap : Form
    {
        public F_DangNhap()
        {
            InitializeComponent();
        }

        private void btn_XacNhan_Click(object sender, EventArgs e)
        {
            F_Main form = new F_Main();
            string email = txt_MaNV.Text;
            int manv = -1;
            if (txt_MatKhau.Text != "")
            {
                manv = Convert.ToInt32(txt_MatKhau.Text);
            }

                
            NhanVien nv = NhanVienDAO.KiemTraDangNhap(email, manv);
            if (nv != null)
            {
                form.manv = manv;
                form.tenNV = nv.HoTen;
                form.maChucVu = nv.MaChucVu ?? 0;

                form.Show();
            }
            else if(email == "" && manv == -1)
            {
                form.Show();
            }
            else
            {
                MessageBox.Show("Đăng nhập không thành công");
            }
        }
    }
}
