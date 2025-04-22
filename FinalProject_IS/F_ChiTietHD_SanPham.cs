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
    public partial class F_ChiTietHD_SanPham : Form
    {
        private int maphieu;
        public F_ChiTietHD_SanPham(int maphieu)
        {
            InitializeComponent();
            this.maphieu = maphieu;
        }
        private void LoadBang(int id)
        {
            dtgv_ChiTietHD_SP.DataSource = HoaDonDAO.LayChiTietTheoMaHD(id);
        }

        private void F_ChiTietHD_SanPham_Load(object sender, EventArgs e)
        {
            LoadBang(this.maphieu);
        }
    }
}
