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
        public UC_KhachHang()
        {
            InitializeComponent();
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
    }
}
