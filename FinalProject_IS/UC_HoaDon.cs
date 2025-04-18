using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FinalProject_IS.DAO;

namespace FinalProject_IS
{
    public partial class UC_HoaDon : UserControl
    {
        public UC_HoaDon()
        {
            InitializeComponent();
            LoadHoaDon();
        }

        public void LoadHoaDon()
        {
            var dshoadon = HoaDonDAO.LoadHoaDon();
            dtgvHoaDon.DataSource = dshoadon;
        }
    }
}
