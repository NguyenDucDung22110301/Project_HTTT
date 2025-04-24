namespace FinalProject_IS
{
    partial class F_ChiTietSanPham
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dtgv_ChiTiet = new System.Windows.Forms.DataGridView();
            this.btn_HuyPhieu = new System.Windows.Forms.Button();
            this.btn_Ca = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dtgv_ChiTiet)).BeginInit();
            this.SuspendLayout();
            // 
            // dtgv_ChiTiet
            // 
            this.dtgv_ChiTiet.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dtgv_ChiTiet.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgv_ChiTiet.Location = new System.Drawing.Point(12, 33);
            this.dtgv_ChiTiet.Name = "dtgv_ChiTiet";
            this.dtgv_ChiTiet.RowHeadersWidth = 51;
            this.dtgv_ChiTiet.RowTemplate.Height = 24;
            this.dtgv_ChiTiet.Size = new System.Drawing.Size(1160, 159);
            this.dtgv_ChiTiet.TabIndex = 52;
            // 
            // btn_HuyPhieu
            // 
            this.btn_HuyPhieu.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(128)))));
            this.btn_HuyPhieu.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(222)))), ((int)(((byte)(222)))));
            this.btn_HuyPhieu.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn_HuyPhieu.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_HuyPhieu.ForeColor = System.Drawing.Color.White;
            this.btn_HuyPhieu.Location = new System.Drawing.Point(742, 238);
            this.btn_HuyPhieu.Name = "btn_HuyPhieu";
            this.btn_HuyPhieu.Size = new System.Drawing.Size(205, 27);
            this.btn_HuyPhieu.TabIndex = 54;
            this.btn_HuyPhieu.Text = "+Hủy bỏ";
            this.btn_HuyPhieu.UseVisualStyleBackColor = false;
            // 
            // btn_Ca
            // 
            this.btn_Ca.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(90)))), ((int)(((byte)(161)))), ((int)(((byte)(203)))));
            this.btn_Ca.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(222)))), ((int)(((byte)(222)))));
            this.btn_Ca.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btn_Ca.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btn_Ca.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(188)))), ((int)(((byte)(238)))), ((int)(((byte)(246)))));
            this.btn_Ca.Location = new System.Drawing.Point(967, 238);
            this.btn_Ca.Name = "btn_Ca";
            this.btn_Ca.Size = new System.Drawing.Size(205, 27);
            this.btn_Ca.TabIndex = 53;
            this.btn_Ca.Text = "Cập nhật";
            this.btn_Ca.UseVisualStyleBackColor = false;
            this.btn_Ca.Click += new System.EventHandler(this.btn_Ca_Click);
            // 
            // F_ChiTietSanPham
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(1184, 277);
            this.Controls.Add(this.dtgv_ChiTiet);
            this.Controls.Add(this.btn_HuyPhieu);
            this.Controls.Add(this.btn_Ca);
            this.Name = "F_ChiTietSanPham";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "F_ChiTietSanPham";
            this.Load += new System.EventHandler(this.F_ChiTietSanPham_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtgv_ChiTiet)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dtgv_ChiTiet;
        private System.Windows.Forms.Button btn_HuyPhieu;
        private System.Windows.Forms.Button btn_Ca;
    }
}