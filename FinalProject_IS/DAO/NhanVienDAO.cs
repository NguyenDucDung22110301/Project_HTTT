using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using System.Windows.Forms;

namespace FinalProject_IS.DAO
{
    public class NhanVienDAO
    {
        //tạm thời, nếu có đủ dữ liệu ở mọi bảng sẽ bỏ
        public class NhanVienView
        {
            public int MaNV {  get; set; }
            public string HoTen { get; set; }
            public DateTime NgaySinh { get; set; }
            public string GioiTinh { get; set; }
            public string Email { get; set; }
            public int? MaChucVu { get; set; }
            public decimal LuongCoBan { get; set; }
        }

        public static List<NhanVienView> LoadNhanVien()
        {
            using (var context = new ShopBadmintonEntities())
            {
                return context.NhanViens
                              .Select(nv => new NhanVienView
                              {
                                  MaNV = nv.MaNV,
                                  HoTen = nv.HoTen,
                                  NgaySinh = nv.NgaySinh,
                                  GioiTinh = nv.GioiTinh,
                                  Email = nv.Email,
                                  MaChucVu = nv.MaChucVu,
                                  LuongCoBan = nv.LuongCoBan
                              })
                              .ToList();
            }
        }

        //public static NhanVien GetById(int id)
        //{
        //    using (var context = new YourDbContext())
        //    {
        //        return context.NhanViens
        //                      .Include(nv => nv.ChucVu)
        //                      .FirstOrDefault(nv => nv.MaNV == id);
        //    }
        //}

        //public static void Add(NhanVien nv)
        //{
        //    using (var context = new YourDbContext())
        //    {
        //        context.NhanViens.Add(nv);
        //        context.SaveChanges();
        //    }
        //}

        //// Add Update, Delete, Search as needed
    }
}
