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

        private void rtxb_SearchBox_Click(object sender, EventArgs e)
        {
            dtgvPhieuNhan.DataSource = PhieuNhanDAO.DSPhieuNhanTheoMa(rtxb_SearchBox.Text);
        }
     
    }
}
