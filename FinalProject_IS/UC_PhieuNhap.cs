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
    public partial class UC_PhieuNhap : UserControl
    {
        public UC_PhieuNhap()
        {
            InitializeComponent();
            LoadDsPhieuNhapHang();
        }

        public void LoadDsPhieuNhapHang()
        {
            dtgvPhieuNhap.DataSource = PhieuNhapHangDAO.DSPhieuNhapHang();
            DataGridViewButtonColumn btnColumn = new DataGridViewButtonColumn();
            btnColumn.Name = "Action";               
            btnColumn.HeaderText = "Action";         
            btnColumn.Text = "View";                 
            btnColumn.UseColumnTextForButtonValue = true; 

            dtgvPhieuNhap.Columns.Add(btnColumn);

        }

        private void btn_ThemPhieu_Click(object sender, EventArgs e)
        {
            int ID = PhieuNhapHangDAO.GetNewPhieuNhapID();
            Form2 phieu = new Form2(ID);
            phieu.Show();
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            dtgvPhieuNhap.DataSource = PhieuNhapHangDAO.DSPhieuNhapHangTheoMa(rtxb_SearchBox.Text);
        }
    }
}
