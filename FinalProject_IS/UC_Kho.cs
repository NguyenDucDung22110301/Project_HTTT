using System;
using System.Configuration;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FinalProject_IS.DAOs;

namespace FinalProject_IS
{
    public partial class UC_Kho : UserControl
    {
        private int machucvu;
        public UC_Kho(int machucvu)
        {
            InitializeComponent();
            this.machucvu = machucvu;
            LoadSP();
        }

        public void LoadSP()    
        {
            dtgvKhoSP.DataSource = SanPhamDAO.DSSanPham();
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            MessageBox.Show(rTxb_Search.Text);
            dtgvKhoSP.DataSource = SanPhamDAO.DSSanPhamTheoTen(rTxb_Search.Text);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.SelectedIndex == 0) {
                dtgvKhoSP.DataSource = SanPhamDAO.DSSanPhamSapXep("TenSP");  
            }
            else
            {
                dtgvKhoSP.DataSource = SanPhamDAO.DSSanPhamSapXep("GiaBan");
            }
        }

        private void dtgvKhoSP_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if(this.machucvu == 1)
            {
                return;
            }
            F_ChiTietSanPham form = new F_ChiTietSanPham(Convert.ToInt32(dtgvKhoSP[0, e.RowIndex].Value));
            form.Show();
        }
    }
}
