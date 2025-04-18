using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FinalProject_IS.DAO;

namespace FinalProject_IS
{
    public partial class UC_Kho : UserControl
    {
        public UC_Kho()
        {
            InitializeComponent();
            LoadSanPham();
        }

        public void LoadSanPham()
        {
            using (var context = new ShopBadmintonEntities())
            {
                var dssanpham = SanPhamDAO.LoadSanPham();
                dtgvSanPham.DataSource = dssanpham;
            }
        }
    }
}
