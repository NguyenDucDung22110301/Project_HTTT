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
    public partial class UC_NhanVien : UserControl
    {
        public UC_NhanVien()
        {
            InitializeComponent();
            LoadNV();
        }

        public void LoadNV()
        {
            dtgvNhanVien.DataSource = NhanVienDAO.DsNhanVien();
        }

        private void btn_ThemNV_Click(object sender, EventArgs e)
        {

        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            dtgvNhanVien.DataSource = NhanVienDAO.DsNhanVienTheoTen(rTbx_Search.Text);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.SelectedIndex == 0)
            {
                dtgvNhanVien.DataSource = NhanVienDAO.DSNhanVienSapXep("HoTen");
            }
            else
            {
                dtgvNhanVien.DataSource = NhanVienDAO.DSNhanVienSapXep("LuongCoBan");
            }
        }
    }
    
}
