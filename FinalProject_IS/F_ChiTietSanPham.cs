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
    public partial class F_ChiTietSanPham : Form
    {
        private int masanpham;
        public F_ChiTietSanPham(int masanpham)
        {
            InitializeComponent();
            this.masanpham = masanpham;
        }

        private void F_ChiTietSanPham_Load(object sender, EventArgs e)
        {
            dtgv_ChiTiet.DataSource = SanPhamDAO.DSSanPhamTheoID(masanpham);
        }

        private void btn_Ca_Click(object sender, EventArgs e)
        {
            SanPham sp = new SanPham();
            sp.MaSP = masanpham;
            sp.TenSP = dtgv_ChiTiet[1, 0].Value.ToString();
            sp.LoaiSP = dtgv_ChiTiet[2, 0].Value.ToString();
            sp.GiaBan = Convert.ToInt32(dtgv_ChiTiet[3, 0].Value);
            sp.SoLuongTon = Convert.ToInt32(dtgv_ChiTiet[4, 0].Value);
            sp.NgayNhapKho = Convert.ToDateTime(dtgv_ChiTiet[5, 0].Value);
            sp.ThoiGianBaoHanh = Convert.ToInt32(dtgv_ChiTiet[6, 0].Value);
            sp.MaTH = Convert.ToInt32(dtgv_ChiTiet[7, 0].Value);
            sp.GiaGoc = Convert.ToDecimal(dtgv_ChiTiet[8, 0].Value);
            sp.MoTa = dtgv_ChiTiet[9, 0].Value.ToString();

            SanPhamDAO.UpdateSanPham(sp);
            this.Close();

        }
    }
}
