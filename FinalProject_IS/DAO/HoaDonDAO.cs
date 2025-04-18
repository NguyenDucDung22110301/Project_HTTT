using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject_IS.DAO
{
    public class HoaDonDAO
    {
        //tạm thời, nếu có đủ dữ liệu ở mọi bảng sẽ bỏ
        public class HoaDonView
        {
            public int MaHD { get; set; }
            public DateTime NgayGioTao { get; set; }
            public int? MaKH { get; set; }
            public int? MaNV { get; set; }
            public decimal TongTien { get; set; }
            public int? MaKM { get; set; }
            public string LoaiHoaDon { get; set; }

        }

        public static List<HoaDonView> LoadHoaDon()
        {
            using (var context = new ShopBadmintonEntities())
            {
                return context.HoaDons
                              .Select(hd => new HoaDonView 
                              {
                                  MaHD = hd.MaHD,
                                  NgayGioTao = (DateTime)hd.NgayGioTao,
                                  MaKH = hd.MaKH,
                                  MaNV = hd.MaNV,
                                  TongTien = hd.TongTien,
                                  MaKM = hd.MaKM,
                                  LoaiHoaDon = hd.LoaiHoaDon
                              })
                              .ToList();

                //return context.HoaDons.ToList();
            }
        }
    }
}
