using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

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
                var data = context.SanPhams
                                  .Select(sp => new
                                  {
                                      sp.MaSP,
                                      sp.TenSP,
                                      sp.LoaiSP,
                                      sp.GiaBan,
                                      sp.SoLuongTon,
                                      sp.NgayNhapKho,
                                      sp.ThoiGianBaoHanh,
                                      sp.MaTH,
                                      TenThuongHieu = sp.ThuongHieu.TenTH, 
                                      sp.GiaGoc,
                                      sp.MoTa
                                  })
                                  .ToList();

                dataGridView1.DataSource = data;
            }
        }

        public 
    }
}
