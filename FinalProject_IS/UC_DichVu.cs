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
    public partial class UC_DichVu : UserControl
    {
        public UC_DichVu()
        {
            InitializeComponent();
            LoadDsHoaDonDichVu();
        }

        public void LoadDsHoaDonDichVu()
        {
            dtgvDichVu.DataSource = DichVuDAO.DSDichVu();
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            dtgvDichVu.DataSource = DichVuDAO.DSDichVuTheoTen(rTbx_Search.Text);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.SelectedIndex == 0)
            {
                dtgvDichVu.DataSource = DichVuDAO.DSDichVuSapXep("MaHDDV");
            }
            else
            {
                dtgvDichVu.DataSource = DichVuDAO.DSDichVuSapXep("ThanhTien");
            }

        }
    }
}
