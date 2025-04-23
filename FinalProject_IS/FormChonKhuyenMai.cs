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
    public partial class FormChonKhuyenMai : Form
    {
        // Khi user OK, ta sẽ đọc ra 2 giá trị:
        //    MaKM đã chọn và %Giảm (GiaTriKhuyenMai)
        public int SelectedMaKM { get; private set; }
        public decimal SelectedDiscount { get; private set; }

        public FormChonKhuyenMai(DataTable dt)
        {
            InitializeComponent();

            // Hiển thị tên chương trình, nhưng ValueMember là MaKM và GiaTriKhuyenMai
            cmbKhuyenMai.DisplayMember = "TenChuongTrinh";
            cmbKhuyenMai.ValueMember = "MaKM";
            cmbKhuyenMai.DataSource = dt;
        }

      

        private void btn_OK_Click(object sender, EventArgs e)
        {
            var row = ((DataRowView)cmbKhuyenMai.SelectedItem).Row;
            SelectedMaKM = Convert.ToInt32(row["MaKM"]);
            SelectedDiscount = Convert.ToDecimal(row["GiaTriKhuyenMai"]);
            DialogResult = DialogResult.OK;
        }

        private void btn_cancel_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }
    }
}
