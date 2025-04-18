using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using System.Data.Entity;
using FinalProject_IS.DAO;

namespace FinalProject_IS
{
    public partial class UC_NhanVien : UserControl
    {
        public UC_NhanVien()
        {
            InitializeComponent();
            LoadNhanVien();
        }

        public void LoadNhanVien()
        {
            using (var context = new ShopBadmintonEntities())
            {
                var dsnhanvien = NhanVienDAO.LoadNhanVien();
                dtgvNhanVien.DataSource = dsnhanvien;
            }
        }
    }
}
