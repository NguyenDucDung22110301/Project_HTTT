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
    public partial class UC_HoaDon : UserControl
    {
        public UC_HoaDon()
        {
            InitializeComponent();
            LoadDsHoaDon();
        }

        public void LoadDsHoaDon()
        {
            dtgvHoaDon.DataSource = HoaDonDAO.DSHoaDon();
            DataGridViewButtonColumn btnColumn = new DataGridViewButtonColumn();
            btnColumn.Name = "Action";
            btnColumn.HeaderText = "Action";
            btnColumn.Text = "View";
            btnColumn.UseColumnTextForButtonValue = true;

            dtgvHoaDon.Columns.Add(btnColumn);
        }

        private void dtgvHoaDon_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dtgvHoaDon.Columns[e.ColumnIndex].Name == "Action" && e.RowIndex >= 0)
            {
                string idhoadon = dtgvHoaDon.Rows[e.RowIndex].Cells["MaHD"].Value.ToString();
                F_ChiTietHD_SanPham form = new F_ChiTietHD_SanPham(idhoadon);
                form.Show();
            }
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            dtgvHoaDon.DataSource = HoaDonDAO.DSHoaDonTheoTen(rTbx_Search.Text);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(comboBox1.SelectedIndex == 0)
            {
                dtgvHoaDon.DataSource = HoaDonDAO.DSHoaDonSapXep("MaHD");
            }
            else
            {
                dtgvHoaDon.DataSource = HoaDonDAO.DSHoaDonSapXep("TongTien");
            }
        }
    }
}
