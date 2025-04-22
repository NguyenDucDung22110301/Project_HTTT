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

        private void btn_ThemPhieu_Click(object sender, EventArgs e)
        {
            int id = PhieuNhanDAO.GetNewPhieuNhanID();
            Form3 form = new Form3(id);
            form.Show();
        }
    }
}
