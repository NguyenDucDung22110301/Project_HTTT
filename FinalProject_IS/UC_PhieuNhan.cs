using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FinalProject_IS.DAOs;

namespace FinalProject_IS
{
    public partial class UC_PhieuNhan : UserControl
    {
        public UC_PhieuNhan()
        {
            InitializeComponent();
            LoadDsPhieuNhan();
        }

        public void LoadDsPhieuNhan()
        {
            dtgvPhieuNhan.DataSource = PhieuNhanDAO.DSPhieuNhan();
        }

        private void btn_Search_Click(object sender, EventArgs e)
        {
            dtgvPhieuNhan.DataSource = PhieuNhanDAO.DSPhieuNhanTheoMa(rtxb_SearchBox.Text);
        }

        private void btn_ThemPhieu_Click(object sender, EventArgs e)
        {
            int ID = PhieuNhapHangDAO.GetNewPhieuNhapID();
            Form2 phieu = new Form2(ID);
            phieu.Show();
        }

        private void btnFilter_Click(object sender, EventArgs e)
        {
            
        }

        private void cb_Box_Filter_SelectedIndexChanged(object sender, EventArgs e)
        {
            String values = cb_Box_Filter.Text;
            MessageBox.Show(values);
            String nameColum = string.Empty; ;
            if (values == "Sắp xếp theo ngày")
            {
                nameColum = "NgayTao";
            }
            else if (values == "Sắp xếp theo mã")
            {
                nameColum = "MaPhieuNhan";
            }
            try
            {
                dtgvPhieuNhan.DataSource = PhieuNhanDAO.DSSapXepPhieuNhan(nameColum);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Đã xảy ra lỗi: {ex.Message}");
            }

        }
    }
     
    
}
