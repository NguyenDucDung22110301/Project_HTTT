Use ShopBadminton
go

IF EXISTS (
    SELECT 1 FROM (
        SELECT COUNT(*) AS cnt FROM ChiTietPhieuNhan UNION
        SELECT COUNT(*) FROM PhieuNhan UNION
        SELECT COUNT(*) FROM ChiTietPhieuNhapHang UNION
        SELECT COUNT(*) FROM PhieuNhapHang UNION
        SELECT COUNT(*) FROM HoaDonLuong UNION
        SELECT COUNT(*) FROM HoaDonDichVu UNION
        SELECT COUNT(*) FROM ChiTietHD_SanPham UNION
        SELECT COUNT(*) FROM HoaDon UNION
        SELECT COUNT(*) FROM KhuyenMai UNION
        SELECT COUNT(*) FROM SanPham UNION
        SELECT COUNT(*) FROM ThuongHieu UNION
        SELECT COUNT(*) FROM NhanVien UNION
        SELECT COUNT(*) FROM ChucVu UNION
        SELECT COUNT(*) FROM KhachHang UNION
        SELECT COUNT(*) FROM LoaiKhachHang
    ) AS AllCounts
    WHERE cnt > 0
)
BEGIN
    DELETE FROM ChiTietPhieuNhan;
    DELETE FROM PhieuNhan;

    DELETE FROM ChiTietPhieuNhapHang;
    DELETE FROM PhieuNhapHang;

    DELETE FROM HoaDonLuong;
    DELETE FROM HoaDonDichVu;
    DELETE FROM ChiTietHD_SanPham;
    DELETE FROM HoaDon;
    DELETE FROM KhuyenMai;
    DELETE FROM SanPham;
    DELETE FROM ThuongHieu;
    DELETE FROM NhanVien;
    DELETE FROM ChucVu;
    DELETE FROM KhachHang;
    DELETE FROM LoaiKhachHang;

    TRUNCATE TABLE HoaDonLuong;
    TRUNCATE TABLE HoaDonDichVu;
    TRUNCATE TABLE ChiTietHD_SanPham;
    TRUNCATE TABLE ChiTietPhieuNhapHang;
    TRUNCATE TABLE ChiTietPhieuNhan;

    DBCC CHECKIDENT ('KhachHang', RESEED, 0);
    DBCC CHECKIDENT ('LoaiKhachHang', RESEED, 0);
    DBCC CHECKIDENT ('NhanVien', RESEED, 0);
    DBCC CHECKIDENT ('ChucVu', RESEED, 0);
    DBCC CHECKIDENT ('ThuongHieu', RESEED, 0);
    DBCC CHECKIDENT ('SanPham', RESEED, 0);
    DBCC CHECKIDENT ('KhuyenMai', RESEED, 0);
    DBCC CHECKIDENT ('HoaDon', RESEED, 0);
    DBCC CHECKIDENT ('HoaDonDichVu', RESEED, 0);
    DBCC CHECKIDENT ('PhieuNhapHang', RESEED, 0);
    DBCC CHECKIDENT ('PhieuNhan', RESEED, 0);
END






-- Dữ liệu cho bảng LOAI_KHACH_HANG
INSERT INTO LoaiKhachHang (TenLoai, ChiTieuToiThieu, GiamGiaToiDa) VALUES
(N'Đồng', 20000000, 0.01), -- Chi tiêu tối thiểu 20 triệu, giảm 1%
(N'Bạc', 50000000, 0.02), -- Chi tiêu tối thiểu 50 triệu, giảm 2%
(N'Vàng', 100000000, 0.03), -- Chi tiêu tối thiểu 100 triệu, giảm 3%
(N'Kim Cương', 150000000, 0.04), -- Chi tiêu tối thiểu 150 triệu, giảm 4%
(N'Bạch Kim', 200000000, 0.05); -- Chi tiêu tối thiểu 200 triệu, giảm 5%

-- Dữ liệu cho bảng CHUC_VU
INSERT INTO ChucVu (TenChucVu) VALUES
(N'Nhân viên'),
(N'Quản lý');
-- Dữ liệu cho bảng NHAN_VIEN
INSERT INTO NhanVien (HoTen, NgaySinh, GioiTinh, Email, MaChucVu, LuongCoBan) VALUES
(N'Nguyễn Văn A', '1990-05-10', N'Nam', 'nvana@example.com', 1, 5000000),
(N'Trần Thị B', '1985-08-15', N'Nữ', 'ntb@example.com', 2, 10000000),
(N'Lê Minh C', '1992-03-20', N'Nam', 'lmc@example.com', 1, 6000000),
(N'Phan Thị D', '1987-11-10', N'Nữ', 'ptd@example.com', 1, 5500000),
(N'Vũ Thanh E', '1995-07-30', N'Nam', 'vte@example.com', 1, 7500000);

-- Dữ liệu cho bảng KHACH_HANG
INSERT INTO KhachHang (HoTen, SoDienThoai, TongChiTieu, MaLoaiKH) VALUES
(N'Nguyễn Văn D', '0912345678', 60000000, 2),
(N'Lê Thị B', '0987654321', 120000000, 3),
(N'Trần Minh H', '0922334455', 150000000, 4),
(N'Phan Minh K', '0944123456', 200000000, 5),
(N'Vũ Thi M', '0933445566', 30000000, 1);

-- Dữ liệu cho bảng HOA_DON
INSERT INTO HoaDon (NgayGioTao, MaKH, MaNV, TongTien, MaKM, LoaiHoaDon) VALUES
('2025-04-01 10:30:00', 1, 2, 0, NULL, 'SP'),
('2025-04-02 15:00:00', 2, 3, 0, NULL, 'SP'),
('2025-04-03 09:00:00', 3, 4, 0, NULL, 'SP'),
('2025-04-04 11:45:00', 4, 5, 0, NULL, 'SP+DV'),
('2025-04-05 13:20:00', 5, 1, 0, NULL, 'SP'),
('2025-05-01 10:30:00', 1, 2, 0, NULL, 'SP'),
('2025-05-01 13:30:00', 3, 1, 0, NULL, 'SP+DV'),
('2025-07-01 10:30:00', 4, 2, 0, NULL, 'SP'),
('2025-08-01 11:30:00', 2, 1, 0, NULL, 'SP'),
('2025-08-01 10:30:00', 5, 2, 0, NULL, 'SP+DV');

-- Dữ liệu cho bảng ThuongHieu
INSERT INTO ThuongHieu (TenTH)
VALUES
(N'Victor'),
(N'Lining'),
(N'Kumpoo'),
(N'Yonex'),
(N'VNB'),
(N'VS'),
(N'Gosen'),
(N'Vicleo'),
(N'Felet'),
(N'Kawasaki'),
(N'The 3rd Game'),
(N'Apacs'),
(N'Mizuno'),
(N'FlyPower'),
(N'Kamito'),
(N'Proace'),
(N'Pro Kennex'),
(N'Taro'),
(N'IXE'),
(N'Victec'),
(N'Redson');


-- Dữ liệu cho bảng SanPham
INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor ARS 90K Metallic Tặng Vợt ARS 9000 + Vợt Victor ARS 8000', 'Vot', 5430000, 
70, '2/25/2025', 3, 1, 
4658409, N'- Độ cứng:  Siêu cứng. - Điểm cân bằng: 292mm. - Sức căng tối đa: 3U ≦ 31 lbs(14kg). - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor ARS 9 Tặng Vợt Victor ARS 9 + Vợt Kawasaki P26', 'Vot', 2640000, 
100, '9/18/2025', 2, 1, 
2115325, N'- Độ cứng: Trung bình. - Khung vợt: Graphite + Resin. - Thân vợt: Graphite + Resin + 6.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: 3U G5. - Sức căng tối đa: 3U  ≦26 lbs (11,5Kg). - Điểm cân bằng: 295mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'SET Vợt Cầu Lông Kumpoo B.Duck Cool', 'Vot', 1650000, 
78, '5/14/2025', 5, 3, 
1353211, N'- Khung vợt được thiết kế theo dạng hộp nhằm khả năng kiểm soát và ổn định, tăng độ linh độ và các cú đánh có độ chính xác hơn. Vùng chữ T cũng được gia cố bằng sợi carbon để cải thiện khả năng chống xoắn và độ bền.. - Độ cứng: Trung bình. - Trọng lượng: 4U. - Điểm cân bằng: 305 mm. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor Ryuga II Pro Tặng Vợt Victor ARS 9000 + Vợt Victor ARS 8000', 'Vot', 5680000, 
89, '9/23/2025', 3, 1, 
4026728, N'- Vợt được cải tiến về thông số kĩ thuật cải tiến về khả năng tấn công. Được sử dụng công nghệ WES 2.0 giúp cho vợt cải thiện về hiệu suất chống xoắn, có khả năng truyền lực tốt hơn, khớp chữ T giúp tăng cường khả năng tăng tốc vợt nhanh, mang đến những cú đập cắm cầu uy lực hơn và độ đàn hồi vợt cũng nhanh hơn. Thân vợt với thiết kế đường kính chỉ 6.6m so với Ryuga 1 là 6.8mm, giảm lực cản gió để thực hiện các pha vung vợt nhanh và linh hoạt hơn.. - Độ cứng: Cứng. - Chiều dài tổng thể: 675mm. - Khung vợt: High Resilience Modulus Graphite+HARD CORED TECHNOLOGY. - Trọng lượng: 4U và 3U. - Chu vi cán vợt: G5. - Sức căng tối đa: 4U  ≦ 31 lbs (14 Kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông Lining Bladex 900 Master New 2024', 'Vot', 7000000, 
81, '9/27/2025', 10, 2, 
6903960, N'- Thân vợt: TB Nano + M46 + Ultra Carbon Fiber. - Độ cứng: Trung bình. - Trọng lượng: 4U. - Điểm cân bằng: Nhẹ đầu.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VNB V88 xanh chính hãng', 'Vot', 638000, 
52, '8/15/2025', 1, 5, 
575321, N'- Độ cứng: Cứng trung bình. - Khung vợt: Carbon High Modulus Graphite Carbon. - Thân vợt: Carbon High Modulus Graphite Carbon. - Trọng lượng: 4U (82+-2gr).. - Điểm cân bằng: 300+-3mm. - Chiều dài tổng thể: 675 mm. - Điểm swing weight: 84,4 kg/cm2. - Chu vi cán vợt: G5. - Sức căng tối đa: 30 (13.6) LBS. - Màu sắc: Đen phối Xanh Dương.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo Small Tiger Wings Trắng', 'Vot', 790000, 
9, '9/13/2025', 6, 3, 
631636, N'High Modulus Carbon Fiber đảm bảo độ bền bỉ, giúp khung vợt chịu được mức căng cao. Khung vợt còn có cấu tạo mặt chuẩn, tạo điểm ngọt lớn hơn, làm tăng âm thanh khi đánh cầu, tạo sự phấn khích cho người chơi.. - Độ cứng: Trung bình. - Trọng lượng: 82 + - 2 g ( 4U ). - Chu vi cán vợt: G5. - Điểm cân bằng: 298 +- 5 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Titan 7 Pro', 'Vot', 750000, 
75, '8/25/2025', 1, 6, 
532816, N'- Độ cứng: Trung bình. - Điểm cân bằng: 295+-3mm (Hơi nặng đầu). - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'SET Vợt Cầu Lông Kumpoo Small Energy', 'Vot', 990000, 
23, '12/2/2025', 8, 3, 
963682, N'- Độ cứng: Trung bình. - Trọng lượng: 4U. - Điểm cân bằng: 295 +- 5 mm. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo Flower Partner', 'Vot', 620000, 
49, '9/4/2025', 6, 3, 
551538, N'- Độ cứng: Trung bình. - Trọng lượng: 82 + - 2 g ( 4U ). - Chu vi cán vợt: G5. - Điểm cân bằng: 295 +- 5 mm ( Cân bằng).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo K01', 'Vot', 690000, 
6, '6/2/2025', 5, 3, 
598645, N'Carbon Graphite đảm bảo độ bền bỉ, giúp khung vợt chịu được mức căng cao. Khung vợt còn có cấu tạo mặt chuẩn, tạo điểm ngọt lớn hơn, làm tăng âm thanh khi đánh cầu, tạo sự phấn khích cho người chơi.. - Độ cứng: Trung bình. - Trọng lượng: 5U. - Chu vi cán vợt: G6. - Điểm cân bằng: 302 +- 5 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Gosen Grapower Max 1.0', 'Vot', 929000, 
28, '1/29/2025', 1, 7, 
701157, N'được tối ưu hóa dành cho người chơi có lối đánh thiên công, đập cầu mạnh mẽ với thiết kế nặng đầu. Trọng lượng 4U, đũa cứng ở mức trung bình giúp tăng thêm lực đập và vẫn duy trì được độ kiểm soát, phù hợp với những người chơi trình độ trung bình trở lên.. - Khung vợt được làm có độ dày lên đến 10mm giúp tăng khả năng trợ lực cho những cú đánh. Vợt được làm chất liệu graphite siêu bền đảm bảo về tuổi thọ, hỗ trợ khung vợt chịu mức căng lên tới 30 lbs.. - Độ cứng đũa: Trung bình. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Sức căng tối đa: 30 lbs. Khung vợt có độ dày lên tới 10mm tiếp thêm khả năng trợ lực cho những cú đánh cho người chơi.. Khung vợt carbon siêu bền cho vợt chịu được mức căng lên tới 30 lbs, đảm bảo về tuổi thọ cho vợt..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Gosen Graenergy Pro T', 'Vot', 919000, 
15, '4/5/2025', 1, 7, 
802824, N'được tối ưu hóa dành cho người chơi có lối đánh phản tạt, phản công linh hoạt. Trọng lượng 4U, đũa cứng ở mức trung bình giúp tăng thêm lực khi đánh và duy trì được độ kiểm soát, phù hợp với những người chơi mới.. - Khung vợt được làm có độ dày lên đến 10mm giúp tăng khả năng trợ lực cho những cú đánh. Vợt được làm chất liệu graphite siêu bền đảm bảo về tuổi thọ, hỗ trợ khung vợt chịu mức căng lên tới 30 lbs.. - Độ cứng đũa: Trung bình. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Sức căng tối đa: 30 lbs. Khung vợt có độ dày lên tới 10mm tiếp thêm khả năng trợ lực cho những cú đánh cho người chơi.. Khung vợt carbon siêu bền cho vợt chịu được mức căng lên tới 30 lbs, đảm bảo về tuổi thọ cho vợt..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Gosen Mira Light Aura', 'Vot', 899000, 
5, '4/14/2025', 1, 7, 
736715, N'- Độ cứng đũa: Dẻo. - Trọng lượng: 5U. - Chu vi cán vợt: G6. - Sức căng tối đa: 30 lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Gosen Trivista GX800', 'Vot', 909000, 
20, '11/4/2025', 6, 7, 
851964, N'- Độ cứng đũa: Dẻo. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Sức căng tối đa: 30 lbs. Khung vợt carbon siêu bền cho vợt chịu được mức căng lên tới 30 lbs, đảm bảo về tuổi thọ cho vợt..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông Kumpoo Fecility New Year Chính Hãng', 'Vot', 1600000, 
93, '7/2/2025', 6, 3, 
1278974, N'- Khung vợt được thiết kế theo dạng vát nhằm giảm lực cản của không khí, tăng khả năng vung vợt nhanh hơn, cơ động hơn. Vùng chữ T cũng được gia cố bằng sợi carbon để cải thiện khả năng chống xoắn và độ bền.. - Độ cứng: Trung bình. - Trọng lượng: 4U. - Điểm cân bằng: 295 +- 8mm. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Tectonic 6', 'Vot', 2300000, 
28, '3/13/2025', 5, 2, 
2051525, N'- Khung vợt: Carbon T1100G. - Thân vợt: Carbon Fiber. - Điểm cân bằng: 302mm (Nặng đầu). - Trọng lượng: 4U/ 5U. - Độ cứng đũa: Trung bình. - Chiều dài tổng thể vợt: 675mm. - Điểm swing weight: 5U 83,1 kg/cm2, 4U 84 kg/cm2. - Chu vi cán vợt: S2 (G5). - Sức căng tối đa: 28LBS (12,7kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Tectonic 3', 'Vot', 1450000, 
31, '8/21/2025', 10, 2, 
1327606, N'- Khung vợt: Carbon T1100G. - Thân vợt: Carbon Fiber. - Điểm cân bằng: 298mm. - Trọng lượng: 4U/ 5U. - Độ cứng đũa: Trung bình dẻo. - Chiều dài tổng thể vợt: 675mm. - Chu vi cán vợt: S2 (G5). - Sức căng tối đa: 26LBS (11,8kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining HC1800', 'Vot', 1000000, 
43, '3/11/2025', 1, 2, 
755594, N'- Trọng lượng: 3U. - Điểm cân bằng: 290 mm.. - Độ cứng: Trung bình.. Thân vợt mỏng 7mm sẽ giúp giảm thiểu tối đa lực cản của không khí, giúp cây vợt lướt đi trong gió dễ dàng đồng thời gia tăng hiệu suất hồi phục giúp cây vợt trở về trạng thái ban đầu một cách nhanh nhất để chuẩn bị cho cú đánh tiếp theo..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Axforce 20', 'Vot', 1200000, 
49, '3/27/2025', 2, 2, 
1170072, N'- Điểm cân bằng: 298mm (Hơi nặng đầu). - Trọng lượng: 3U/ 4U. - Độ cứng đũa: Trung bình - Dẻo. - Chu vi cán vợt: G5. - Chiều dài tổng thể vợt: 675mm. - Sức căng tối đa: 26lbs - 11,5kg. - BOX WING FRAME: Thân vợt được xây dựng với kiểu khung hộp độc đáo, giúp giảm bớt lực cản gió làm tăng tốc độ vung vợt nhanh hơn và tăng sức mạnh cho những pha đập cầu của bạn. Điều này giúp ổn định chuyển động của khung vợt và hỗ trợ đẩy mạnh lực về phía khung để truyền vào những cú đánh của bạn, làm cho chúng trở nên hiểm hóc và khó đoán hơn..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Lightning 3000', 'Vot', 1200000, 
61, '12/12/2025', 8, 2, 
990787, N'- Độ cứng: Cứng. - Khung vợt: Carbon Fiber. - Thân vợt: Carbon Fiber. - Trọng lượng: 3U 85 - 89 grams. - Chu vi cán vợt: S2 (G5). - Sức căng tối đa: 30 LBS. - Điểm cân bằng: 285 mm. - Chiều dài tổng thể: 675 mm. - Điểm swing weight: 84,4 kg/cm2.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Titan 8 Chính Hãng', 'Vot', 570000, 
16, '7/15/2025', 10, 6, 
549132, N'- Ưu điểm lớn nhất của dòng vợt này phải kể đến là độ bền ở khung. Khung vợt cầu lông VS Titan 8 được cấu tạo từ vật liệu hợp chất cacbon được thí nghiệm kỹ lưỡng, đem tới độ bền cho người dùng.. - Độ cứng: Trung bình. - Khung vợt: Nano Carbon. - Thân vợt: Nano Carbon. - Trọng lượng. - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm. - Sức căng tối đa: 22 – 36lbs ( Tối đa 16,3 kg ). - Điểm cân bằng: 305 mm (Nặng đầu). Khung vợt hình lục giác giúp giảm lực cản không khí. Điều này làm giảm độ xoắn của mặt gỗ, giúp xoay mặt vợt nhanh hơn theo đúng hướng mong muốn chính xác hơn..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Energy 72 Chính Hãng', 'Vot', 390000, 
53, '3/21/2025', 3, 8, 
310495, N'Màu sắc của Vicleo Energy 72 được thiết kế rất tinh tế, kết hợp giữa màu đen, vàng và cam, tạo nên một vẻ đẹp tinh tế và hiện đại.. - Màu sắc: Đen - Vàng - Cam. - Điểm cân bằng: 298mm (Hơi nặng đầu). - Độ cứng: Hơi dẻo. - Trọng lượng/ Chu vi cán vợt   4U (~ 85g ) | G5. - Sức căng tối đa: 22 – 24lbs (10.8kg). : Khung vợt Vicleo Energy 72 được thiết kế với rãnh mỏng, bảo vệ cho dây căng vợt và giảm thiểu tối đa ma sát giữa cây căng vợt và khung vợt..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining HC1100', 'Vot', 1050000, 
84, '9/2/2025', 6, 2, 
741822, N'- Khung vợt: Carbon Fiber. - Thân vợt: Polyurethane + non woven. - Trọng lượng: 80-84g grams (4U/W2). - Chu vi cán vợt:  S2. - Sức căng tối đa: Vertical 20-24 lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kawasaki Passion P25', 'Vot', 700000, 
56, '7/13/2025', 7, 10, 
546992, N'- Độ cứng : Trung Bình. - Trọng lượng : 4U. - Chu vi cán vợt : G1. - Sức căng tối đa : 18 – 28lbs ~ 12,7kg. : Khung vợt cầu lông Kawasaki Passion P25 xanh sử dụng hệ thống tập trung 4D với tỉ lệ đánh cao hơn 40% so với các cây vợt thông thường và nó có hiệu quả giúp người mới bắt đầu xác định điểm ngọt của mình..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining HC1000', 'Vot', 1050000, 
31, '2/17/2025', 7, 2, 
831735, N'- Độ cứng: Trung bình.. - Khung vợt: Carbon Fiber. - Thân vợt: Carbon Fiber. - Trọng lượng: W2 80 - 84 grams. - Chu vi cán vợt: S1 (G6). - Sức căng tối đa: 30 LBS. - Điểm cân bằng: 290 mm (Cân bằng). - Chiều dài tổng thể: 675 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Fortune 300', 'Vot', 769000, 
57, '7/16/2025', 7, 9, 
736574, N'- Màu sắc: Tím Xanh (Royal Blue). - Độ cứng: Trung bình. - Trọng lượng: 4U (Avg 82g). - Chu vi cán vợt: G1 (theo tiêu chuẩn cán cầm Felet).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo K520S', 'Vot', 639000, 
48, '8/4/2025', 3, 3, 
620556, N'- Độ cứng: Trung bình. - Trọng lượng: 82g ± 2g (4U). - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor ARS 100X Chính Hãng', 'Vot', 3100000, 
8, '9/17/2025', 2, 1, 
2601957, N'- Độ cứng: Cứng trung bình. - Khung vợt: High Resilience Modulus Graphite + Nano Fortify TR＋. - Thân vợt: High Resilience Modulus Graphite + PYROFIL + 6.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: 3U G5. - Sức căng tối đa: 3U  ≦29 lbs (13 Kg). - Điểm cân bằng: Hơi nặng đầu (~ 300mm). - Chiều dài tổng thể: 675mm. - Màu sắc: Nhám phối Đen Trắng Cam.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông The 3rd Game Diamond 12 - Xanh', 'Vot', 1300000, 
47, '6/2/2025', 7, 11, 
1112014, N'- Độ cứng: Trung bình. - Điểm cân bằng: 285 - 290mm. - Điểm swing weight: 81 kg/cm2. - Khung vợt: Hamill Carbon Technology. - Thân vợt : Ni-ti Fiber + High Modulus Graphite. - Trọng lượng: 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Nanoflare 1000 Tour Chính Hãng', 'Vot', 3279000, 
11, '4/21/2025', 3, 4, 
2825679, N'- Màu sắc: Đen - Vàng (Lightning Yellow). - Độ cứng: Cứng (Extra Stiff). - Khung vợt: HM Graphite,Nanocell NEO,EX-HYPER MG. - Điểm swing weight: 4U 85,8 kg/cm2. - Trọng lượng: 4U (Avg 83g). - Chu vi cán vợt: 4UG5, 4UG6, 3UG4, 3UG5, 3UG6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Nanoflare 1000 Game Chính Hãng', 'Vot', 2059000, 
36, '10/3/2025', 9, 4, 
1944731, N'- Màu sắc: Đen - Vàng (Lightning Yellow). - Độ cứng: Trung bình. - Khung vợt: Graphite,Nanocell NEO,HM Graphite. - Điểm swing weight: 83,8 kg/cm2. - Trọng lượng: 4U (Avg 83g). - Chu vi cán vợt: G5, G6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Tantrum 300 II  Chính Hãng', 'Vot', 1850000, 
13, '12/28/2025', 3, 12, 
1502313, N'Khung vợt được làm từ chất liệu Japan HM Graphite giúp tối ưu trọng lượng của vợt và độ cững cho khung.. - Khung vợt: 30 Tonne Japan HM Graphite + Nano. - Thân vợt: Japan Toray M40 (40T) HM Graphite + Nano. - Độ cứng: Dẻo. - Trọng lượng: 3U (88 - 90g). - Điểm cân bằng: 285 ± 5mm (vợt cân bằng). - Chu vi cán vợt: G2. - Sức căng tối đa: 35Lbs ~ 16kg. - Màu sắc: Bạc - Vàng - Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Blizzard Pro Chính Hãng', 'Vot', 2500000, 
57, '10/24/2025', 9, 12, 
1918644, N'Khung vợt 30T Japan High Modulus Graphite + Graphite T-Throat. Sức căng tối đa lên đến 38 lBS (17,2 kg) được sử dụng khung 30T Japan High Modulus Graphite + Graphite T-Throat cho thấy độ bền hoàn hảo cho khung vợt cực kì chất lượng này.. - Độ cứng: Trung bình.. - Khung vợt: 30T Japan High Modulus Graphite + Graphite T-Throat. - Thân vợt: 40T Japan High Modulus Graphite. - Trọng lượng: 4U (84 ± 2g). - Điểm cân bằng: 295 ± 3mm (Hơi nặng đầu). - Độ cứng: 8,5 - Trung bình. - Chu vi cán vợt: G1. - Sức căng tối đa: 38 LBS. - Màu sắc: Đỏ - Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Precision 1.0 Chính Hãng', 'Vot', 980000, 
7, '12/2/2025', 4, 12, 
728186, N'- Khung vợt: 30 Tonne Japan HM Graphite. - Thân vợt: 24 Tonne Japan Graphite. - Trọng lượng: 4U (82 ± 2g). - Điểm cân bằng: 290 ± 3mm (Slighty Head Heavy). - Chu vi cán vợt: G1 (Asia), G2 (Europe). - Sức căng tối đa: 38Lbs ~ 17,2kg. - Màu sắc: Đen - Vàng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Nanoflare 1000 Play Chính Hãng', 'Vot', 1519000, 
38, '11/24/2025', 1, 4, 
1329552, N'- Màu sắc: Đen - Vàng (Lightning Yellow). - Độ cứng: Trung bình. - Khung vợt: Graphite. - Điểm swing weight: 86,8 kg/cm2. - Trọng lượng: 4U (Avg 83g). - Chu vi cán vợt: G5, G6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Honor Pro Chính Hãng', 'Vot', 2500000, 
26, '9/16/2025', 3, 12, 
2335563, N'là dòng vợt thuộc phân khúc cao cấp của hãng Apacs được ra mắt trong thời gian gần đây mang đến sự kết hợp hoàn hảo giữa hiệu suất và thẩm mỹ với thiết kế độc đáo và đầy tinh tế. Màu sắc được phối bởi màu đen tạo nên sự mạnh mẽ cho cây vợt kết hợp với các chi tiết xanh lá nổi bật gây ấn tượng ngay từ cái nhìn đầu tiên. Đặc biệt chất liệu vợt được nâng cấp và cải tiến rõ rệt.. - Độ cứng: Trung bình.. - Khung vợt: 40 Tonne Japan HM Graphite + T-THROAT. - Thân vợt: 50 Tonne Japan Graphite. - Trọng lượng: 3U (88 ± 2g). - Điểm cân bằng: 305 ± 3mm (Head Heavy). - Chu vi cán vợt: G1 (Asia), G2 (Europe). - Sức căng tối đa: 38 LBS. - Màu sắc: Đen - Xanh Lá.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Woven TJ 1000 Power chính hãng', 'Vot', 1569000, 
68, '4/17/2025', 10, 9, 
1442286, N'');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Woven TJ 1000 Speed chính hãng', 'Vot', 1569000, 
29, '10/28/2025', 6, 9, 
1450324, N'- Màu sắc: Trắng (White). - Độ cứng: Trung bình. - Trọng lượng: 4U (82 ± 2g). - Chu vi cán vợt: G1 (theo tiêu chuẩn cán cầm Felet).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Vicleo Power 800 chính hãng', 'Vot', 390000, 
61, '4/12/2025', 4, 8, 
283610, N'- Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 87 +- 2g. - Chiều dài tổng thể: 675mm. - Màu sắc: Đỏ - Trắng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Woven TJ 1000 Control chính hãng', 'Vot', 1569000, 
53, '7/28/2025', 4, 9, 
1382988, N'Trọng lượng 4U của vợt cầu lông Felet Woven TJ 1000 Control là lựa chọn lý tưởng cho mọi đối tượng người chơi, từ người mới bắt đầu cho đến những người chơi có kinh nghiệm, giúp họ dễ dàng làm quen và kiểm soát vợt một cách dễ dàng.. - Màu sắc: Xanh (Blue) - Đen. - Độ cứng: Trung bình. - Trọng lượng: 4U (82±2g). - Chu vi cán vợt: G1 (theo tiêu chuẩn cán cầm Felet). Trọng lượng 4U tương đối nhẹ nhàng, phù hợp cho mọi đối tượng người chơi từ học sinh, sinh viên cho đến người mới tập luyện hoặc chơi phong trào ở ở mức độ trung bình..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Vicleo Power 810 chính hãng', 'Vot', 390000, 
56, '3/16/2025', 5, 8, 
295388, N'- Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 87 +- 2g. - Chiều dài tổng thể: 675mm. - Màu sắc: Vàng - Đen. - Khung vợt nhẹ được làm từ vật liệu carbon siêu nhẹ có thể sử dụng dể dàng đối với người chơi ở mọi cấp độ..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Vicleo Power 830 chính hãng', 'Vot', 390000, 
7, '1/11/2025', 1, 8, 
298764, N'- Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 87 +- 2g. - Chiều dài tổng thể: 675mm. - Màu sắc: Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Vicleo Power 900 chính hãng', 'Vot', 390000, 
59, '2/9/2025', 8, 8, 
305547, N'- Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 87 +- 2g. - Chiều dài tổng thể: 675mm. - Màu sắc: Xám - Đen. - Khung vợt có thiết kế hình vuông giúp đảm bảo tính tương đồng về độ dài và góc của các dây dọc cũng như dây ngang, tăng tối đa điểm ngọt theo mọi hướng, khung vợt lớn hơn nên khi cầu chạm mặt vợt ở những điểm khác nhau trên mặt vợt vẫn mang lại cảm giác đánh tốt nhất..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Vicleo Power 880 chính hãng', 'Vot', 390000, 
8, '1/24/2025', 2, 8, 
356081, N'- Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 87 +- 2g (3U). - Chiều dài tổng thể: 675mm. - Màu sắc: Đen - Trắng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kawasaki 3270 chính hãng', 'Vot', 950000, 
59, '4/13/2025', 8, 10, 
741630, N'Chất liệu khung của vợt là 24T High Modulus Graphite, đảm bảo sự bền bỉ và độ cứng tối ưu. Màu sắc trắng tinh khôi của vợt tạo nên vẻ đẹp tinh tế và sang trọng.. - Độ cứng: Hơi Dẻo. - Trọng lượng: 5U. - Chu vi cán vợt: G1. - Sức căng tối đa: 18 – 28lbs ~ 12,7kg. : Khung vợt cầu lông Kawasaki 3270 sử dụng hệ thống tập trung 4D với tỉ lệ đánh cao hơn 40% so với các cây vợt thông thường và nó có hiệu quả giúp người mới bắt đầu xác định điểm ngọt của mình..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Vicleo Power 1200 chính hãng', 'Vot', 390000, 
8, '6/30/2025', 6, 8, 
275975, N'- Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 87 +- 2g. - Chiều dài tổng thể: 675mm. - Màu sắc: Đỏ. - Khung vợt có thiết kế hình vuông giúp đảm bảo tính tương đồng về độ dài và góc của các dây dọc cũng như dây ngang, tăng tối đa điểm ngọt theo mọi hướng, khung vợt lớn hơn nên khi cầu chạm mặt vợt ở những điểm khác nhau trên mặt vợt vẫn mang lại cảm giác đánh tốt nhất..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Vicleo Power 8800 chính hãng', 'Vot', 390000, 
47, '3/28/2025', 10, 8, 
315272, N'- Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 87 +- 2g. - Chiều dài tổng thể: 675mm. - Màu sắc: Đen. - Khung vợt có thiết kế hình vuông của.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Windstorm 74', 'Vot', 2070000, 
23, '5/5/2025', 3, 2, 
1532332, N'- Thân vợt có độ cứng trung bình cho cảm giác vung vợt nhanh và chắc chắn hơn. Hạn chế được tối đa cảm giác rung lắc hay xoắn vặn vợt sau sau mỗi cú đánh và cảm giác ổn định hơn dù điểm tiếp xuc giữ vợt và cầu không nằm trong điểm ngọt của mặt khung.. - Độ cứng: Cứng trung bình. - Khung vợt: Commercial Grade Carbon Fiber. - Thân vợt: Commercial Grade Carbon Fiber. - Trọng lượng: 74G. - Chu vi cán vợt: S1. - Sức căng tối đa: Dọc 24-28 lbs, Ngang 26-30 lbs. - Điểm cân bằng: 310 mm ( Rất nặng đầu ).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Bladex 600', 'Vot', 3749000, 
38, '3/13/2025', 6, 2, 
3141368, N'');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Bladex Sonar', 'Vot', 2029000, 
31, '10/24/2025', 5, 2, 
1458879, N'- Điểm swing weight: 81,5 kg/cm2. - Trọng lượng: 4U. Khung vợt được lấp đầy bởi công nghệ high - tech light shock absorption để giảm sốc. Quá trình này đảm bảo rằng lực đánh sẽ truyền đi một cách trơn tru và giải phóng triệt để để giảm chấn thương một cách hiệu quả. Hệ thống hấp thụ chấn mật độ cao này giúp cải thiện tối đa hiệu suất tăng cường tốc độ linh hoạt cho tấn công..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Axforce 60', 'Vot', 3939000, 
4, '4/15/2025', 6, 2, 
3747378, N'- Thân vợt: FRTP Tech. - Khung vợt: TB Nano + Superb Carbon. - Trọng lượng: 4U,5U. - Điểm swing weight: 5U 83,2 kg/cm2, 4U:. - Độ cứng đũa: Trung bình. - Điểm cân bằng: Nặng đầu. - Sức căng tối đa: 29 LBS (13kg). - Màu sắc: Trắng. : Khung vợt được thiết kế với dạng hộp giúp cấu trúc khung ổn định và và sẽ cải thiện tối đa độ chính xác khi đánh cầu.. : Thân vợt được tích hợp công nghệ FRTP TECH với đường kính siêu mỏng chỉ 6,6mm nhằm tăng khả năng uốn cong của siêu phẩm vợt cầu lông Axforce 60 chính hãng và giúp người chơi nâng cao hiệu suất tấn công trên sân đấu..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Axforce BigBang', 'Vot', 1900000, 
78, '9/6/2025', 9, 2, 
1548851, N'có điểm cân bằng nặng đầu, dành cho lối chơi thiên công, với 2 phiên bản: đen và trắng. Thân vợt dẻo giúp hỗ trợ lực thêm trong những cú đập có thêm sức mạnh và độ cắm.. - Thân vợt: Carbon Fiber. - Khung vợt: Dynamic Optimum Frame. - Điểm cân bằng: 305mm - 315mm (Nặng đầu). - Trọng lượng: 7U - G6 ( 66+-4g). - Điểm swing weight: 76 kg/cm2. - Độ cứng đũa: Dẻo. - Sức căng tối đa: 27 LBS. - Màu sắc: Đen, Trắng. : Khung vợt được làm bằng vật liệu và cấu trúc siêu nhẹ dẫn đến cấu hình cực kỳ nhẹ. Điều này giúp các lông thủ chơi trong thời gian dài mà không bị mỏi tay, dễ dàng tập trung vào việc điều cầu và thực hiện các pha đập cầu của mình..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Promax FX7', 'Vot', 1750000, 
15, '8/16/2025', 3, 13, 
1445038, N'- Độ cứng đũa: Trung bình. - Điểm cân bằng: Cân bằng. - Trọng lượng: 4UG5. Khung vợt cầu lông Mizuno Promax FX7 được thiết kế khí động học, giảm lực cản và tối đa hóa tốc độ của đầu vợt..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Aggressor 001 chính hãng', 'Vot', 1269000, 
43, '6/12/2025', 1, 9, 
1142550, N'Khung vợt cầu lông. - Màu sắc: Tím. - Độ cứng: Cứng. - Trọng lượng: 3U 86 ± 2g. - Chu vi cán vợt: G1 (theo tiêu chuẩn cán cầm Felet).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Aggressor 002 chính hãng', 'Vot', 1269000, 
52, '3/28/2025', 7, 9, 
1176301, N'Khung vợt Felet Aggressor 002 được thiết kế chống rung hiệu quả để cho ra những quả đánh ổn định, tránh tiêu hao lực thất thoát ra bên ngoài. Hệ thống chống xoắn tại khớp nối giúp hình dạng cây vợt trở lại trạng thái ban đầu nhanh chóng sau mỗi quả đánh để chuẩn bị cho các cú vung vợt tiếp theo.. Khung vợt cầu lông. - Màu sắc: Đen. - Độ cứng: Cứng. - Trọng lượng: 3U 86 ± 2g. - Chu vi cán vợt: G1 (theo tiêu chuẩn cán cầm Felet).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Zephyr DS79 - Đen cam vàng chính hãng', 'Vot', 1950000, 
24, '7/22/2025', 7, 13, 
1789297, N'- Màu sắc: Đen - Cam - Vàng. - Độ cứng đũa: Trung bình. - Trọng lượng: 5U. : Trọng lượng vợt siêu nhẹ 5U (76-80g).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Vicleo Turbo 7500 chính hãng', 'Vot', 499000, 
67, '4/15/2025', 4, 8, 
448214, N'Trọng lượng nhẹ 82 gam (4U) cùng thân vợt khá dẻo sẽ là lựa chọn tuyệt vời cho người mới chơi có lực cổ tay yếu, điểm cân bằng 300mm sẽ phù hợp với lối chơi tấn công với những quả cầu cắm chính xác.. Khung vợt chất liệu High Cacbon siêu khỏe cho mức căng lưới cao và độ bền khung cũng được gia tăng đáng kể. - Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 82 ± 2g. - Chiều dài tổng thể: 675mm. - Điểm cân bằng: 300 (Nặng đầu). - Màu sắc: Trắng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Vicleo Turbo 7100 chính hãng', 'Vot', 499000, 
46, '11/13/2025', 9, 8, 
395710, N'Khung vợt. Trọng lượng nhẹ 82 gam (4U) cùng thân vợt khá dẻo sẽ là lựa chọn tuyệt vời cho người mới chơi có lực cổ tay yếu, điểm cân bằng 300mm sẽ phù hợp với lối chơi tấn công với những quả cầu cắm chính xác.. - Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 82 ± 2g. - Chiều dài tổng thể: 675mm. - Điểm cân bằng: 300 (Nặng đầu). - Màu sắc: Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Power 1000 Chính Hãng', 'Vot', 390000, 
62, '8/4/2025', 1, 8, 
366387, N'Khung vợt khỏe, độ đàn hồi cao mang lại khả năng trợ lực đắc lực cho người chơi.Với tốc độ vợt nhanh, thân vợt trung bình, trợ lực nên dễ dàng chặn, hất cầu hoặc chỉnh hướng cầu trong phòng thủ. - Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 86 ± 2g (3U). - Chiều dài tổng thể: 675mm. - Màu sắc: Đen - Xanh - Cam. - Khung vợt có thiết kế hình vuông giúp đảm bảo tính tương đồng về độ dài và góc của các dây dọc cũng như dây ngang, tăng tối đa điểm ngọt theo mọi hướng, khung vợt lớn hơn nên khi cầu chạm mặt vợt ở những điểm khác nhau trên mặt vợt vẫn mang lại cảm giác đánh tốt nhất..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Blade 7500', 'Vot', 570000, 
24, '12/4/2025', 6, 6, 
405269, N'- VS Blade 7500 là cây vợt cân bằng phù hợp với người chơi ưa thích lối chơi công thủ toàn diện linh hoạt, hơi thiên công. Thân vợt trung bình giúp kiểm soát đường cầu đi chính xác hơn.. - Màu sắc: Trắng. - Trọng lượng: 82g ± 2g - 4U. - Điểm cân bằng: 295 ± 3mm. - Độ cứng: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Flypower Gerhana 3 chính hãng', 'Vot', 1290000, 
71, '2/12/2025', 8, 14, 
1005310, N'- Trọng lượng: 3U. - Chu vi cán vợt: G2. - Sức căng tối đa: 30lbs ~ 13,7kg. - Điểm cân bằng: 290mm( cân bằng). - Màu sắc: Xanh biển. : Khung vợt được cấu tạo theo dạng hộp giúp người chơi bộc phát tối đa hết sức mạnh trong mọi cú đánh khi sử dụng vợt Flypower Gercana 3 chính hãng trên sân đấu.. Trọng lượng vợt 3U cho cảm giác đầm tay với những pha phông cầu cao sâu về cuối sân dễ dàng mà không phải tốn quá nhiều lực.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kawasaki P25', 'Vot', 740000, 
22, '6/6/2025', 7, 10, 
720758, N'- Độ cứng : Trung Bình. - Màu sắc: Đỏ, Trắng, Xanh. - Điểm cân bằng: 295 ± 2mm (Cân bằng). - Trọng lượng : 85 - 89gr (3U). - Chu vi cán vợt : G1. - Sức căng tối đa : 18 – 28lbs ~ 12,7kg.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Bladex 73', 'Vot', 1800000, 
66, '12/28/2025', 3, 2, 
1783614, N'Với lực căng tối đa là 26lbs (pound), vợt Lining Bladex 73 có thể tạo ra những cú giao cầu hiểm hóc. Điểm cân bằng 292mm (nhẹ đầu) giúp người chơi có thể tạo ra những cú đánh đầy ấn tượng và chính xác.. Màu sắc: Xanh, Hồng. Trọng lượng (gam): 6U G6. Điểm cân bằng: 292mm (nhẹ đầu).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Bladex Spiral', 'Vot', 880000, 
56, '12/1/2025', 3, 2, 
706515, N'- Trọng lượng vợt ở mức 85g cùng điểm cân bằng 297 +-2 mm, là cây vợt phù hợp với lối đánh công thủ toàn diện và hơi thiên công, giúp người chơi có thể linh hoạt trong phòng thủ và trong tấn công có những cú đập cầu có thêm lực và độc cắm.. - Độ cứng: Trung bình. - Thân vợt: Carbon Fiber. - Khung vợt: Carbon Fiber. - Trọng lượng: 4U  ( 85+/-2g). - Điểm cân bằng : 297 ± 2mm. - Chu vi cán vợt : S1 (G5). - Sức căng tối đa: 11.5Kg.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Power 7700 Chính Hãng', 'Vot', 390000, 
51, '12/11/2025', 3, 8, 
354332, N'- Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 4U. - Chiều dài tổng thể: 675mm. - Màu sắc: Xanh. - Khung vợt có thiết kế hình vuông của.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Power 820 Chính Hãng', 'Vot', 390000, 
67, '5/13/2025', 4, 8, 
290830, N'- Khung vợt: High Modulus Graphite. - Thân vợt: High Modulus Graphite. - Trọng lượng: 4U. - Độ cứng đũa: dẻo. - Chiều dài tổng thể: 675mm. - Màu sắc: Vàng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kawasaki Passion P23', 'Vot', 700000, 
90, '9/25/2025', 8, 10, 
686373, N'- Trọng lượng: 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 28Lbs. - Điểm cân bằng: Nặng đầu.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Windstorm 72', 'Vot', 2450000, 
48, '4/6/2025', 7, 2, 
2359747, N'Độ cứng: Trung bình.. - Khung vợt: Commercial Grade Carbon Fiber. - Thân vợt: Commercial Grade Carbon Fiber. - Điểm cân bằng: 315 mm (Siêu nặng đầu). - Trọng lượng: 5U. - Chu vi cán vợt: S1. - Sức căng tối đa: 30 LBS (13.61kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno 11 Quick Đen', 'Vot', 4289000, 
60, '11/4/2025', 2, 13, 
3292105, N'- Màu sắc: Đen x Vàng Gold x Tím. - Điểm cân bằng: 298 +-2 mm (Hơi nặng đầu). - Trọng lượng: 4U. - Độ cứng: Cứng. - Chu vi cán vợt: G6. - Chiều dài tổng thể: 675 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining HC1200', 'Vot', 950000, 
59, '9/16/2025', 8, 2, 
782432, N'- Độ cứng: Trung bình.. - Khung vợt: Carbon Fiber. - Thân vợt: Carbon Fiber. - Trọng lượng: W2 83 Grams. - Chu vi cán vợt: S1 (G6). - Sức căng tối đa: 30 LBS. - Điểm cân bằng: 290 mm (Cân bằng). - Chiều dài tổng thể: 675 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông The 3rd Game XM6', 'Vot', 1300000, 
77, '9/25/2025', 5, 11, 
1248293, N'The 3rd Game XM6 hướng tới đa số đối tượng người phong trào với các thông số cơ bản dễ tiếp cận, dễ chơi. Trọng lượng vợt 85g (4U), điểm cân bằng ở khoảng 290-295mm thích hợp với lối chơi công thủ toàn diện, hơi thiên công cho những cú smash cầu mạnh mẽ, uy lực bên cạnh khả năng phòng thủ ổn định.. Khung vợt The 3rd Game XM6 được thiết kế với công nghệ Hamill Carbon Technology và Solid Feel Core Technology, kết hợp với độ dẻo cứng vừa phải, giúp tăng độ bền và độ cứng của vợt, tạo ra một cảm giác chắc chắn và ổn định khi đánh. Thiết kế Isometric cũng giúp tăng diện tích tiếp xúc với bóng, giúp tăng độ chính xác và khả năng kiểm soát.. - Trọng lượng: 4U. - Độ cứng đũa: Trung bình. - Màu sắc: Đỏ đen. - Chu vi cán vợt: G5. - Điểm cân bằng: 290-295mm (vợt cân bằng).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kawasaki 1973', 'Vot', 740000, 
98, '10/19/2025', 7, 10, 
603375, N'- Điểm cân bằng: Cân bằng. - Độ cứng: Trung bình. - Trọng lượng: 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Titanium Ti 88 chính hãng', 'Vot', 2500000, 
5, '10/23/2025', 6, 9, 
1860363, N'- Màu sắc: Đen. - Khung vợt: Titanium Technology + 40 Tone Japan Hot Melt Graphite + Nano Science. - Thân vợt: 7.0mm Nano Booster Shaft. - Trọng lượng: 4U/82gram, 3U/86gram. - Độ cứng: Cứng. - Chu vi cán vợt: G1. - Chiều dài tổng thể: 675mm. - Điểm cân bằng: 297mm. : Khung vợt được thiết kế kiểu lục giác để tối ưu hóa hiệu xuất linh hoạt của vợt mang đến tốc độ và sức mạnh tối đa, bằng cách tăng cường tính năng khí độc học của khung vợt..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Aero - Carbon Lite', 'Vot', 1229000, 
18, '8/13/2025', 6, 9, 
991061, N'- Độ cứng đũa vợt: Cứng. - Trọng lượng: (~70gr). - Chu vi cán vợt: G2 (theo tiêu chuẩn cán cầm Felet). - Trọng lượng siêu nhẹ, linh hoạt nên dễ dàng điều khiển và kiểm soát trong thời gian ngắn, hoàn toàn phù hợp cho những người mới tập chơi hoặc người có cổ tay yếu..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kawasaki Porcelain Q5', 'Vot', 1140000, 
25, '8/7/2025', 3, 10, 
810062, N'- Điểm cân bằng 302 +- 3 mm ở mức nặng đầu, đũa vợt hơi dẻo mang lại khả năng trợ lực, dành cho những người chơi có lối đánh tấn công đập cầu uy lực và chính xác.. - Điểm cân bằng: 302 ± 3mm (nặng đầu). - Độ cứng: Trung bình. + Khung vợt: 24T+30T High module graphite. - Trọng lượng: 5U (79 ± 2g).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Synergy S1', 'Vot', 1069000, 
87, '2/25/2025', 4, 9, 
955398, N'- Màu sắc: Đen. - Độ cứng đũa vợt: trung bình. - Trọng lượng: 4U 82g. - Chu vi cán vợt: G1 (theo tiêu chuẩn cán cầm Felet).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Halbertec 2000', 'Vot', 1149000, 
67, '4/24/2025', 2, 2, 
1014865, N'- Màu sắc: Trắng - Đen (Black Tan). - Trọng lượng: 3U (85 - 89g) và 4U (80-84g). - Độ cứng: Dẻo. - Điểm cân bằng: 293 ± 2 mm (Cân bằng). - Điểm swing weight: 4U 86,4 kg/cm2, 3U 88,6 kg/cm2. : Khung vợt cầu lông Lining Halbertec 2000 được thiết kế để mở rộng điểm ngọt của vợt, cho phép tốc độ đánh ổn định hơn và cao hơn, đồng thời tăng cường độ nảy mà không làm giảm độ bền..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor ARS 90K II', 'Vot', 2850000, 
57, '6/3/2025', 10, 1, 
2649951, N'Khung vợt được làm bằng chất liệu High Resilience Modulus Graphite và Nano Fortify TR giúp tăng độ bền và giảm thiểu rung khi đánh, giúp lực truyền từ tay vào quả cầu được chính xác, đảm bảo tối ưu cảm giác cầu cho người chơi.. - Màu sắc: Đen. - Độ cứng:. - Điểm swing weight: 83,5 kg/cm2. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: 3UG5, 4UG5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông The 3rd Game Prajna', 'Vot', 1800000, 
94, '6/5/2025', 6, 11, 
1586176, N'- Điểm cân bằng: ~295mm (hơi nặng đầu)\. - Độ cứng: Hơi cứng. + Khung vợt: Carbon 50T. - Trọng lượng / Cán cầm: 4U / G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kamito Power Gear 688', 'Vot', 580000, 
78, '1/11/2025', 2, 15, 
558934, N'- Màu sắc: Xanh chuối cam, Xanh hồng. - Trọng lượng: 4U. - Độ cứng thân vợt: Dẻo. - Điểm cân bằng: 295 - 297mm (Hơi Nặng Đầu).. - Chu vi cán vợt: G5..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kamito Power Gear 88', 'Vot', 580000, 
2, '8/3/2025', 6, 15, 
427732, N'- Màu sắc: Đen Xanh, Đen Cam. - Trọng lượng: 4U. - Độ cứng thân vợt: Dẻo. - Điểm cân bằng: 295 - 297mm (Hơi Nặng Đầu).. - Chu vi cán vợt: G5..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Halbertec 5000', 'Vot', 2190000, 
35, '1/16/2025', 10, 2, 
2166075, N'- Màu sắc: Trắng - Đen - Tím. - Điểm cân bằng: 295 ± 2 (Hơi nặng đầu). - Trọng lượng: 85 ± 1g (4u). - Điểm swing weight: 86,6 kg/cm2. - Độ cứng đũa: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Thunder T1', 'Vot', 1369000, 
67, '8/20/2025', 7, 9, 
1094574, N'- Điểm cân bằng: 290 ± 3 mm. - Độ cứng: Trung bình. - Trọng lượng / Cán cầm: 82±g / G1.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Fanatic 113 chính hãng', 'Vot', 1169000, 
96, '4/5/2025', 10, 9, 
939335, N'');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Fortius 20', 'Vot', 3990000, 
6, '4/8/2025', 6, 13, 
2800789, N'- Màu sắc: Đen - Vàng. - Điểm cân bằng:. - Trọng lượng: 5U. - Độ cứng: Cứng. - Chu vi cán vợt: G6. - Chiều dài tổng thể: 675 mm. : Thân vợt mảnh làm giảm lực cản không khí và tăng khả năng đàn hồi. Bên cạnh đó thân cũng được nén nhằm làm giảm trọng lượng tổng thể của vợt, từ đó tạo ra những cú đập tốc độ cao một cách dễ dàng..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Astrox Lite 37i chính hãng', 'Vot', 689000, 
99, '11/5/2025', 6, 4, 
551492, N'Khung vợt cầu lông. - Màu sắc: Đen phối đỏ xanh. - Độ cứng đũa: Siêu dẻo (Hi - flex). - Trọng lượng: 5U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VS Thor 100', 'Vot', 600000, 
51, '9/19/2025', 2, 6, 
507819, N'- Khung vợt: Carbon Fiber. - Độ cứng: Trung bình. - Điểm cân bằng: Trung bình. - Trọng lượng / Cán cầm: 4U / G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Voltric Lite 47i chính hãng', 'Vot', 689000, 
63, '5/13/2025', 9, 4, 
531322, N'Khung vợt AERO-BOX giảm lực cản không khí, gia tăng tốc độ vung vợt (điểm yếu của những người chơi mới) và từ đó đưa cầu bay đi xa hơn. Kết hợp khung viền khí động học ở góc 12 giờ của mặt vợt, Voltric Lite 47i cho ra những cú đánh chớp nhoáng, khiến đối thủ phải chật vật chạy theo đường cầu.. Khung vợt được kết hợp giữa 2 dạng AERO và BOX giúp tối ưu sự cân bằng của hai yếu tố tốc độ và ổn định..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Astrox Lite 43i chính hãng', 'Vot', 689000, 
18, '5/6/2025', 10, 4, 
572031, N'Khung vợt AERO-BOX giảm lực cản không khí, gia tăng tốc độ vung vợt (điểm yếu của những người chơi mới) và từ đó đưa cầu bay đi xa hơn. Kết hợp khung viền khí động học ở góc 12 giờ của mặt vợt, Astrox Lite 43i cho ra những cú đánh chớp nhoáng, khiến đối thủ phải chật vật chạy theo đường cầu.. Khung vợt được kết hợp giữa 2 dạng AERO và BOX giúp tối ưu sự cân bằng của hai yếu tố tốc độ và ổn định..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Proace Stroke 316III', 'Vot', 1000000, 
25, '5/3/2025', 3, 16, 
867628, N'- Khung vợt: Graphite. - Độ cứng: Trung bình. - Điểm cân bằng: Cân bằng. - Trọng lượng / Cán cầm: 4U / G2 (~G4 Yonex). Khung vợt được mở rộng theo dạng vuông (tương tự ISOMETRIC của Yonex) giúp tăng diện tích điểm ngọt, hỗ trợ người chơi đánh cầu dễ dàng hơn..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Proace Sabre 28', 'Vot', 2000000, 
74, '11/28/2025', 1, 16, 
1616668, N'- Khung vợt: HM Graphite + Carbon nanotube. - Độ cứng: Cứng. - Điểm cân bằng: Cân bằng. - Trọng lượng / Cán cầm: 4U / G2 (~G4 Yonex).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Voltric Lite 35i chính hãng', 'Vot', 689000, 
1, '5/6/2025', 7, 4, 
675973, N'Khung vợt AERO-BOX giảm lực cản không khí, gia tăng tốc độ vung vợt (điểm yếu của những người chơi mới) và từ đó đưa cầu bay đi xa hơn. Kết hợp khung viền khí động học ở góc 12 giờ của mặt vợt, Voltric Lite 35i cho ra những cú đánh chớp nhoáng, khiến đối thủ phải chật vật chạy theo đường cầu.. Khung vợt được kết hợp giữa 2 dạng AERO và BOX giúp tối ưu sự cân bằng của hai yếu tố tốc độ và ổn định..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo 99 Pro', 'Vot', 730000, 
46, '5/26/2025', 8, 3, 
674974, N'Điểm cân bằng của bản Kumpoo 99 Pro này được nâng lên 295mm, hơi nặng đầu, giúp người chơi có thể tung ra những cú phông cầu và đập cầu có lực tốt hơn.. Thân vợt dẻo, trợ lực cho người chơi mới, tay còn yếu và chưa nắm vững kĩ thuật..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Proace SDS 200', 'Vot', 666000, 
97, '3/3/2025', 10, 16, 
503819, N'- Khung vợt: H.M Graphite. - Độ cứng: Trung bình. - Điểm cân bằng: Nhẹ đầu. - Trọng lượng / Cán cầm: 4U / G2.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Turbo Charging 10B', 'Vot', 1249000, 
21, '3/22/2025', 9, 2, 
990018, N'- Độ cứng: Trung Bình. - Khung vợt: Military Grade Carbon Fiber. - Thân vợt: Military Grade Carbon Fiber. - Trọng lượng: 84g (W2). - Điểm cân bằng: 305 mm (Nặng đầu). - Điểm swing weight: 89,5 kg/cm2. - Chu vi cán vợt: S1 (G6). - Màu sắc: Trắng phối Xanh Trời. Trọng lượng vừa phải 4U, đũa vợt có trợ lực nên khá phù hợp với người có lực cổ tay trung bình, người chơi cầu lông phong trào, mới tập chơi..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining 3D Calibar 001', 'Vot', 1150000, 
28, '8/12/2025', 1, 2, 
1002839, N'- Độ cứng: Trung bình.. - Khung vợt: Commercial Grade Carbon Fiber. - Thân vợt: Commercial Grade Carbon Fiber. - Trọng lượng: 82g (W2). - Điểm cân bằng: 305mm (Nặng đầu). - Chu vi cán vợt: S1 (G6). - Chiều dài tổng thể: 670mm (Ngắn). - Màu sắc: Xanh Dương phối Xám.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kamito Tiến Minh Legend Limited 2023', 'Vot', 1800000, 
15, '5/28/2025', 4, 15, 
1659400, N'- Độ cứng: Trung bình. - Điểm cân bằng: 295 mm. - Trọng lượng / Tay cầm:. Khung vợt được gia tăng khả năng hấp thụ chấn động, giảm rung và đem lại sự ổn định, giúp những cú vung vợt trở nên mượt mà hơn..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining 3D Calibar 001C', 'Vot', 1150000, 
58, '3/22/2025', 9, 2, 
846031, N'- Độ cứng: Trung bình.. - Khung vợt: Commercial Grade Carbon Fiber. - Thân vợt: Commercial Grade Carbon Fiber. - Trọng lượng: 86g (W3). - Điểm cân bằng: 302mm (Nặng đầu). - Chu vi cán vợt: S1 (G6). - Chiều dài tổng thể: 670mm (Ngắn). - Điểm swing weight: 85,8 kg/cm2. - Màu sắc: Đen phối Xám.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set vợt cầu lông Kamito TM Legend 2023 chính hãng', 'Vot', 2200000, 
14, '8/2/2025', 1, 15, 
1678381, N'Khung vợt được gia tăng khả năng hấp thụ chấn động, giảm rung và đem lại sự ổn định, giúp những cú vung vợt trở nên mượt mà hơn..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Tectonic 1', 'Vot', 870000, 
92, '5/27/2025', 8, 2, 
672143, N'Thân vợt Lining Tectonic 1 có độ dẻo, sẽ trợ lực tốt cho người chơi, kể cả những người có lực cổ tay yếu thì đây là cây vợt giúp bạn có những pha thủ cầu nhanh và linh hoạt.. Khung vợt cầu lông Lining Tectonic 1 khá cứng cáp, chịu được mức cân cao.. - Khung vợt: Carbon Fiber. - Thân vợt: High Carbon. - Điểm cân bằng: 290mm. - Trọng lượng: 3U và 4U. - Độ cứng đũa: Dẻo. - Chiều dài tổng thể vợt: 675mm. - Sức căng tối đa: 26LBS (11,8kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Bladex 800', 'Vot', 4200000, 
30, '8/3/2025', 6, 2, 
3196502, N'- Trọng lượng: 3U/ 4U. - Điểm cân bằng: 288mm (Nhẹ Đầu). - Độ cứng: 7.909 (Siêu Cứng). - Khung vợt: CARBON FIBER. - Thân vợt: M46 + ULTRA CARBON. - Chu vi cán vợt: S2 (G5). - Sức căng tối đa: 31LBS (14,1kg). : Khung vợt cầu lông Lining được thiết kế vát nhằm hạn chế lực cản của gió, từ đó gia tăng tốc độ vung vợt, điều này rất có lợi cho các tay vợt chuyên đôi, cụ thể là đánh lưới..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Axforce 50', 'Vot', 2600000, 
6, '9/9/2025', 1, 2, 
2257203, N'-   Vợt cầu lông Lining Axforce 50 có trọng lượng 4u cùng điểm swing 83.4 kg không quá khó để thuần vợt, đây là cây vợt đầm đầu với điểm cân bằng 298 mm, thân hơi dẻo giúp hỗ trợ lực cho các pha cầu tấn công. Thân vợt được xây dựng với kiểu khung hộp độc đáo, giúp giảm bớt lực cản gió làm tăng tốc độ vung vợt nhanh hơn và tăng sức mạnh cho những pha đập cầu của bạn. Thêm vào đó, kết cấu vợt không quá cứng giúp bạn linh hoạt và điều cầu một các dễ dàng, chính xác.. -   Chiều dài tổng thể: 675 mm. -    Điểm swing weight: 83,4 kg/cm2. -   Điểm cân bằng: 298mm ( Hơi nặng đầu). -   Độ cứng: Hơi dẻo. -   Trọng lượng/ Chu vi cán vợt: 4U-G5. Khung vợt được thiết kế với dạng hộp giúp cấu trúc khung ổn định và và sẽ cải thiện tối đa độ chính xác khi đánh cầu..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Axforce 100', 'Vot', 4600000, 
51, '5/23/2025', 7, 2, 
4012534, N'Khung vợt được thiết kế với dạng hộp giúp cấu trúc khung ổn định và sẽ cải thiện tối đa độ chính xác..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Axforce 90 Xanh Dragon Max', 'Vot', 5200000, 
86, '6/22/2025', 4, 2, 
4592656, N'Khung vợt được thiết kế với dạng hộp giúp cấu trúc khung ổn định và và sẽ cải thiện tối đa độ chính xác khi đánh cầu..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Halbertec 8000', 'Vot', 4290000, 
98, '1/5/2025', 7, 2, 
4070922, N'- Khung vợt: Med Carbon Fiber. - Độ cứng: Cứng. - Điểm cân bằng: 298mm (4U), 295mm (3U). - Trọng lượng / Cán cầm: 4U/G5, 3U/G5. - Điểm swing weight: 3U: 88,4 kg/cm2,.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo LanTing', 'Vot', 950000, 
73, '10/30/2025', 9, 3, 
857834, N'- Màu sắc: Trắng. - Độ cứng: Cứng. - Trọng lượng: 4U (82 ± 2g). - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Axforce 90 Đỏ Tiger Max', 'Vot', 5200000, 
97, '8/3/2025', 6, 2, 
5115062, N'- Khung vợt: M50 + TB Nano + Superb Carbon. - Độ cứng: Trung bình. - Điểm cân bằng: 308mm (4U), 302mm (3U). - Trọng lượng / Cán cầm: 4U/G5, 3U/G5. - Điểm swing weight: 3U: 88 kg/cm2. Khung vợt được thiết kế với dạng hộp giúp cấu trúc khung ổn định và và sẽ cải thiện tối đa độ chính xác khi đánh cầu..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Pines chính hãng', 'Vot', 950000, 
10, '11/19/2025', 7, 3, 
849415, N'Khung vợt cầu lông Kumpoo Pines chính hãng có mặt vát mỏng giúp giảm tối đa lực cản không khí để cho ra những cú vung vợt nhanh và linh hoạt.. Màu sắc Trắng - Xanh Dương được phủ lên cây vợt cầu lông. - Màu sắc: Trắng - Xanh Dương. - Độ cứng: Trung bình. - Trọng lượng: 82 ± 2g (4U).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Axforce 70', 'Vot', 4090000, 
17, '9/15/2025', 4, 2, 
3782334, N'Khung vợt của Axforce 70 sử dụng chất liệu M40X, một loại sợi carbon cao cấp của Lining. Ngoài ra, Axforce 70 cũng sử dụng High Resilient Carbon Fiber. Đây là một loại sợi carbon có tính năng đàn hồi cao, giúp tăng cường sự phản hồi của vợt. Tính năng này giúp người chơi tạo ra cú đánh mạnh mẽ với tốc độ nhanh hơn và tiết kiệm năng lượng, đồng thời cung cấp sự linh hoạt và điều khiển tốt hơn trong mỗi cú đánh.. - Khung vợt: M40X+High Resilient Carbon Fiber. - Độ cứng: Trung Bình. - Điểm cân bằng: 305mm. - Trọng lượng / Cán cầm: 4U/G5, 5U/G5. - Điểm swing weight:. Khung vợt được lấp đầy bởi công nghệ high - tech light shock absorption để giảm sốc. Quá trình này đảm bảo rằng lực đánh sẽ truyền đi một cách trơn tru và giải phóng triệt để để giảm chấn thương một cách hiệu quả. Hệ thống hấp thụ chấn mật độ cao này giúp cải thiện tối đa hiệu suất tăng cường tốc độ linh hoạt cho tấn công.. : Thân vợt được tích hợp công nghệ FRTP TECH với đường kính siêu mỏng chỉ 6,6mm nhằm tăng khả năng uốn cong của siêu phẩm vợt cầu lông Axforce 70 chính hãng và giúp người chơi nâng cao hiệu suất tấn công trên sân đấu.. Khung vợt được thiết kế với dạng hộp giúp cấu trúc khung ổn định và và sẽ cải thiện tối đa độ chính xác khi đánh cầu..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Proace Vip 15', 'Vot', 789000, 
28, '10/27/2025', 6, 16, 
720257, N'- Khung vợt: H.M Graphite. - Điểm cân bằng: Cân bằng. - Trọng lượng / Cán cầm: 4U/G5. - Độ cứng: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Felet Galaxy Flare-10', 'Vot', 1399000, 
76, '2/22/2025', 3, 9, 
1124716, N'- Thân vợt: 7.0mm Nano Booster Shaft. - Trọng lượng: 4U/82 gram+-, 3U/86 gram+- 2U/90gr+-. - Độ cứng: Cứng. - Chu vi cán vợt: G1. - Chiều dài tổng thể: 675mm. - Điểm cân bằng: 293 +- 4 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Felet Aero Mars-10 (Red) Chính Hãng', 'Vot', 1399000, 
85, '6/22/2025', 7, 9, 
1339536, N'- Thân vợt: 7.0mm Nano Booster Shaft. - Trọng lượng: 4U/82gram;. - Độ cứng: Trung bình. - Chu vi cán vợt: G2. - Chiều dài tổng thể: 675mm. - Điểm cân bằng: 290+-3mm. Khung vợt được thiết kế với các rãnh nhỏ ở bốn góc, tăng cường khả năng cắt giảm không khí. Điều này giúp người chơi tăng cường tốc độ trong các pha ra vợt..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining HC 1600 Red', 'Vot', 940000, 
45, '7/13/2025', 2, 2, 
773103, N'được thiết kế có khả năng tấn công và phòng thủ toàn diện. Độ cứng trung bình mang lại khả năng hỗ trợ lực ổn, không quá gây áp lực lên cánh tay, rất dễ làm quen và kiểm soát.. - Độ cứng: Trung bình. - Trọng lượng: 80-84 gram (4U). - Điểm cân bằng: 295mm ( cân bằng). - Chu vi cán vợt: S2. - Sức căng tối đa: 20-26 lbs. : Khung vợt được thiết kế dựa trên khái niệm khung đẳng cự, với cùng điểm ngọt được mở rộng tối đa. Phần đầu vợt thiết kế hình hộp góc cạnh, cung cấp độ cứng cáp và ổn định, cho từng pha tấn công uy lực hơn. Kết hợp cùng kiểu khung thuôn, các cạnh mượt cho khả năng giảm lực cản không khí..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Z-Power 800 RP+', 'Vot', 980000, 
58, '4/26/2025', 2, 12, 
752189, N'Khung vợt được bố trí hệ thống 76 lỗ gen hiện đại giúp tăng sức bền của dây vợt. Bên cạnh đó thì chất liệu khung vợt Carbon cao cấp Nhật Bản đem lại cho cây vợt bộ khung chịu được mức căng khá cao lên đến 35 Lbs.. - Trọng lượng: 5U. - Điểm cân bằng: 295 ± 2mm (Hơi nặng đầu). - Độ cứng đũa: 10 - Siêu dẻo. - Chu vi cán vợt: G1 (Asia), G2 (Europe). - Sức căng tối đa: 38 LBS ~ 17.2 kg. - Màu sắc: Xanh - Trắng - Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Z-Power 800 RP+  chính hãng', 'Vot', 1000000, 
46, '9/9/2025', 5, 12, 
832302, N'Khung vợt được bố trí hệ thống 76 lỗ gen hiện đại giúp tăng sức bền của dây vợt. Bên cạnh đó thì chất liệu khung vợt Carbon cao cấp Nhật Bản đem lại cho cây vợt bộ khung chịu được mức căng khá cao lên đến 35 Lbs.. - Trọng lượng: 5U. - Điểm cân bằng: 295 ± 2mm (Hơi nặng đầu). - Độ cứng đũa: 10 - Siêu dẻo. - Chu vi cán vợt: G1 (Asia), G2 (Europe). - Sức căng tối đa: 38 LBS ~ 17.2 kg. - Màu sắc: Xanh - Trắng - Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor Auraspeed 9000 chính hãng', 'Vot', 1450000, 
1, '6/13/2025', 10, 1, 
1131576, N'- Độ cứng: Hơi cứng. - Điểm cân bằng: Cân bằng. Trọng lượng: 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor DriveX 10 Metallic chính hãng', 'Vot', 2800000, 
64, '3/9/2025', 10, 1, 
2360056, N'- Điểm cân bằng: Nặng đầu (303 mm). - Điểm swing weight: 89 kg/cm2. - Độ cứng:. - Trọng lượng: 3U, 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Z-Power 900 RP+  chính hãng', 'Vot', 1100000, 
20, '1/2/2025', 4, 12, 
856764, N'Khung vợt. - Trọng lượng: 6U (78 ± 2g). - Điểm cân bằng: 300 ± 2mm (Nặng đầu). - Độ cứng đũa: 10 - Siêu dẻo. - Chu vi cán vợt: G1 (Asia), G2 (Europe). - Sức căng tối đa: 35 LBS ~ 15.9 kg. - Màu sắc: Xanh - Trắng - Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare 800 Tour chính hãng', 'Vot', 2619000, 
34, '12/4/2025', 8, 4, 
2383576, N'- Màu sắc: Xanh sẫm đen (Deep Green). - Trọng lượng: 4U (Avg 83g), 3U (Avg 88g). - Độ cứng đũa: Cứng. - Chu vi cán vợt: G5, G6 (4U) và G4, G5, G6 (3U).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Velton', 'Vot', 750000, 
95, '1/11/2025', 5, 9, 
745244, N'- Màu sắc: Xanh phối đen trắng. - Trọng lượng: 4U. - Điểm cân bằng:  290 ± 5mm. - Độ cứng đũa vợt: Trung bình. - Khung vợt: Power Frame. - Chu vi cán vợt: G1.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare 800 Game chính hãng', 'Vot', 1779000, 
74, '4/7/2025', 7, 4, 
1467791, N'- Màu sắc: Xanh sẫm đen (Deep Green). - Trọng lượng: 4U (Avg 83g). - Độ cứng: Cứng. - Chu vi cán vợt: G5, G6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Arcana 80S', 'Vot', 1199000, 
11, '2/22/2025', 9, 9, 
1195230, N'- Màu sắc: Trắng đen. - Trọng lượng: 3U (86gr) và 4U (82gr). - Điểm cân bằng: 290 - 295mm (cân bằng). - Độ cứng đũa vợt: Trung bình. - Chu vi cán vợt: G2 (theo tiêu chuẩn cán cầm Felet).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Hi-Tex 200', 'Vot', 650000, 
84, '10/17/2025', 7, 9, 
615237, N'- Màu sắc: Trắng đen. - Khung vợt: High Modulus Carbon Graphite. - Thân vợt: High Modulus Carbon Graphite. - Trọng lượng: 80-84 gram (4U). - Điểm cân bằng: 290±5 mm ( cân bằng). - Sức căng tối đa: 31 lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Astrox 77 Pro Đỏ China Limited', 'Vot', 13500000, 
13, '11/29/2025', 6, 4, 
12597719, N'- Màu sắc: Đỏ. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Độ cứng: Cứng. - Khung vợt: HM Graphite. - Thân vợt : HM Graphite / Namd.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kawasaki 3570', 'Vot', 950000, 
40, '3/2/2025', 6, 10, 
911314, N'- Việc điều khiển và kiểm soát trở nên dễ dàng hơn bao giờ hết với vợt này. Trọng lượng nhẹ 5U giúp người chơi linh hoạt trong các cú đánh trên sân một cách dễ dàng. Cán cầm của vợt cầu lông Kawasaki 3570 được thiết kế vừa vặn, tạo cảm giác thoải mái và tiện lợi trong quá trình sử dụng.. - Độ cứng: Trung bình. - Màu sắc: Trắng, Đen. - Trọng lượng: 5U. - Chu vi cán vợt: G1. - Sức căng tối đa: 18 – 28lbs ~ 12,7kg. : Khung vợt cầu lông Kawasaki 3570 sử dụng hệ thống tập trung 4D với tỉ lệ đánh cao hơn 40% so với các cây vợt thông thường và nó có hiệu quả giúp người mới bắt đầu xác định điểm ngọt của mình..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Astrox 77 Pro Xanh China Limited', 'Vot', 13500000, 
63, '3/17/2025', 7, 4, 
11736328, N'- Màu sắc: Xanh - Đen. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Độ cứng: Siêu cứng. - Khung vợt: H.M. Graphite + Tungsten. - Thân vợt : HM Graphite + Namd.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor BS12 SE 55TH', 'Vot', 3399000, 
23, '6/28/2025', 9, 1, 
2779785, N'Khung vợt của Victor BRS-12 55TH SE được làm từ High Resilience Modulus Graphite kết hợp với HARD CORED TECHNOLOGY và Nano Resin, tạo nên một sự kết hợp đặc biệt giúp tăng độ bền và giảm chấn cho vợt. Nước sơn lì cũng được sử dụng để tăng tính thẩm mỹ và bảo vệ khung vợt.. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. - Điểm swing weight: 85 kg/cm2. - Độ cứng: Cứng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Warrior W1', 'Vot', 1269000, 
65, '7/14/2025', 1, 9, 
1051293, N'- Trọng lượng: 4U. - Độ cứng: Trung bình. - Chiều dài tổng thể: 675mm. - Điểm cân bằng: 290 +-3mm, cân bằng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs EDGE SABER 10', 'Vot', 725000, 
20, '11/25/2025', 2, 12, 
644304, N'Thiết kế có 3 phiên bản màu sắc nổi bật. Thân vợt có độ dẻo trung bình, trợ lực tốt cho người chơi. Phần cán cầm vợt khá vừa tay, phù hợp với đại đa số người chơi phong trào tại Việt Nam.. - Trọng lượng: 4U (84g). - Điểm cân bằng: 285 ± 3mm (Cân bằng). - Chu vi cán vợt: G2. - Sức căng tối đa: 38 LBS ~ 17.2 kg.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Nanoflare 800 Play Chính Hãng', 'Vot', 1250000, 
6, '4/9/2025', 6, 4, 
1239276, N'- Màu sắc: Xanh sẫm đen (Deep Green). - Trọng lượng: 4U (Avg 83g). - Độ cứng đũa: Trung bình. - Chu vi cán vợt: G5, G6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Felet Woven 999 Chính Hãng', 'Vot', 2979000, 
96, '3/19/2025', 9, 9, 
2265566, N'Khung vợt được thiết kế dạng Box Farm tích hợp 3 công nghệ trong một mang tới hiệu suất thi đấu cao. Bên cạnh đó, vợt còn được hãng đưa vào một số công nghệ tiên tiến để nâng cao hiệu quả, hỗ trợ đảm bảo cho người chơi có cảm giác cầu tốt nhất.. Thân vợt: 7.0mm Japan High Strength + Nano Booster Tube. Trọng lượng: 4U/82 gram+-, 3U/86 gram+-. Chu vi cán vợt: G1. Chiều dài tổng thể: 675mm. Điểm cân bằng: 293-297mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Sport Force', 'Vot', 1399000, 
4, '7/29/2025', 5, 9, 
1027919, N'Khung vợt của Felet Sport Force được thiết kế với sự chịu lực cao, đ. - Độ cứng đũa vợt: Trung Bình. - Trọng lượng: 4U (82g) và 3U (86g). - Chu vi cán vợt: G1 (theo tiêu chuẩn cán cầm Felet).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Axforce 80', 'Vot', 4320000, 
5, '9/21/2025', 10, 2, 
4129686, N'- Màu sắc: Đen Nhám phối Hồng và Vàng. - Khung vợt: Carbon Thế Hệ Mới. - Thân vợt: Carbon Thế Hệ Mới. - Điểm cân bằng: 305mm (Nặng đầu). - Độ cứng: Cứng. - Trọng lượng: 3U/ 4U/ 5U. - Điểm swing weight: 5U 81 kg/cm2. - Chu vi cán vợt: S2 (G5). : Khung vợt được thiết kế với dạng hộp.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Felet Woven 888 Chính Hãng', 'Vot', 2979000, 
12, '2/5/2025', 2, 9, 
2209121, N'Khung vợt được thiết kế dạng Box Farm tích hợp 3 công nghệ trong một mang tới hiệu suất thi đấu cao. Bên cạnh đó, vợt còn được hãng đưa vào một số công nghệ tiên tiến để nâng cao hiệu quả, hỗ trợ đảm bảo cho người chơi có cảm giác cầu tốt nhất.. Thân vợt: 7.0mm Nano Booster Shaft + Full Woven Shaft. Trọng lượng: 4U/82 gram+-, 3U/86 gram+-. Độ cứng: Trung Bình. Chu vi cán vợt: G1. Chiều dài tổng thể: 675mm. Điểm cân bằng: 293-297mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Felet Dome 08', 'Vot', 800000, 
63, '10/8/2025', 5, 9, 
760420, N'Thân vợt được chế tạo từ vật liệu nhẹ nhưng vô cùng bền, giúp người chơi dễ dàng kiểm soát và tăng cường sức mạnh ở mỗi cú đánh. Đặc biệt, khung linh hoạt và cấu trúc độc đáo của vợt không chỉ tăng cường sức mạnh mà còn kiểm soát đường cầu bay đúng hướng, làm nổi bật khả năng tấn công và phòng thủ.. - Khung vợt: High Modulus Carbon Graphite. - Thân vợt: High Modulus Carbon Graphite. - Trọng lượng: 80-84 gram (4U). - Điểm cân bằng: 290±5 mm ( cân bằng). - Sức căng tối đa: 31 lbs. - Chu vi cán vợt: G1. Trọng lượng 4U, đũa vợt dẻo trung bình có khả năng trợ lực nên những người chơi có cổ tay chưa tốt hoàn toàn có thể sử dụng và làm quen trong khoảng thời gian ngắn..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kawasaki Explore 2023', 'Vot', 620000, 
14, '7/30/2025', 3, 10, 
527048, N'- Độ cứng : Trung Bình. - Màu sắc: Đen. - Điểm cân bằng: Cân bằng. - Trọng lượng : 4U. - Chu vi cán vợt : G1. - Sức căng tối đa : 30Lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo mua vợt cầu lông Victor ARS 90K II tặng vợt Victor ARS 8000 + vợt Victor ARS 9000 + Vợt Kawasaki 3570', 'Vot', 5030000, 
6, '1/27/2025', 9, 1, 
3836178, N'Khung vợt được làm bằng chất liệu High Resilience Modulus Graphite và Nano Fortify TR giúp tăng độ bền và giảm thiểu rung khi đánh, giúp lực truyền từ tay vào quả cầu được chính xác, đảm bảo tối ưu cảm giác cầu cho người chơi.. - Điểm cân bằng: Hơi nặng đầu. - Độ cứng:. + Khung vợt: High Resilience Modulus Graphite + Nano Fortify TR+ + HARD CORED TECHNOLOGY. - Điểm swing weight: 83,5 kg/cm2. - Trọng lượng / Tay cầm: 4u (~86g) /  G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông The 3rd Game Arc FB', 'Vot', 1500000, 
46, '5/9/2025', 10, 11, 
1319612, N'- Độ cứng: Cứng. - Trọng lượng: 5U. - Điểm cân bằng: 300mm. - Chu vi cán vợt: G6. - Màu sắc: Đỏ.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor TK-Ryuga Metallic', 'Vot', 3500000, 
72, '7/10/2025', 4, 1, 
3083793, N'Khung vợt hình hộp Power Box với cạnh cứng và sử dụng Metallic Carbon Fiber mang lại độ bền và khả năng chịu lực lên đến 14.5kg, làm tăng hiệu suất của cây vợt trong những tình huống tấn công. Hệ thống tăng cường sức mạnh WES 2.0 hứa hẹn sẽ tạo ra những pha đập cầu sắc bén và khó dự đoán.. - Độ cứng: Cứng. - Điểm cân bằng: 305 mm ( Nặng đầu). - Điểm swing weight: 3U 91,8 kg/cm2. - Sức căng tối đa: 32lbs ( 14,5 kg). - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. Khung vợt được thiết kế cứng cáp, bền bỉ, cung cấp độ chính xác và hiệu quả khi người chơi thực hiện nhồi cầu, smash cầu liên tục áp đảo sân cầu đối phương..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông The 3rd Game Thunder Bolt II', 'Vot', 1800000, 
17, '4/6/2025', 9, 11, 
1465823, N'Điểm cân bằng: 295 ± 2 ( Cân Bằng). Trọng lượng: 4U. Chu vi cán vợt: G6. Độ cứng: Trung Bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông The 3rd Game K800', 'Vot', 500000, 
43, '1/20/2025', 6, 11, 
470458, N'- Trọng lượng: 4U. - Độ cứng đũa: Trung bình. - Màu sắc: Xanh Ngọc, Đen, Trắng, Hồng. - Chu vi cán vợt: G6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông The 3rd Game Top Speed II', 'Vot', 1800000, 
28, '1/10/2025', 2, 11, 
1315330, N'Thân vợt hơi cứng giúp điểm đánh chính xác và ổn định khi vung vợt, mang lại trải nghiệm chơi cầu lông toàn diện hơn. Với trọng lượng 4U, và điểm cân bằng nặng đầu, vợt cầu lông The 3rd Game Top Speed II mang lại khả năng tấn công áp đảo đối thủ, giúp tay vợt thực hiện các cú smash mạnh mẽ và đập cầu chính xác.. Điểm cân bằng: Nặng đầu. Chiều dài tổng thể: 675mm. Trọng lượng: 4U. Chu vi cán vợt: G6. Độ cứng: Hơi cứng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo Power Control K520', 'Vot', 650000, 
47, '5/13/2025', 4, 3, 
627066, N'Điểm cân bằng: 290 ± 5 mm (Nhẹ đầu). Độ cứng: Trung Bình. Trọng lượng: 4U (82+-2g). Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Felet Kisona 21', 'Vot', 850000, 
6, '6/11/2025', 8, 9, 
708494, N'- Độ cứng: Trung bình. - Trọng lượng: 4U (~82g) và 3U (~86g). - Chu vi cán vợt: G1 (theo tiêu chuẩn cán cầm Felet).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Prokennex Lion', 'Vot', 498000, 
13, '12/10/2025', 9, 17, 
361659, N'- Có điểm cân bằng 300 +- 5 mm, nặng đầu, dành cho người chơi có lối đánh thiên công, tăng khả năng smash cầu có thêm độ cắm và sức nặng. Độ cứng trung bình trợ lực, phù hợp với người chơi có lực cổ tay ổn, trình độ trung bình trở lên.. - Độ cứng: 8.5 - Trung bình. - Khung vợt: Carbon Fiber. - Thân vợt: Carbon Fiber. - Trọng lượng: 82. - Chu vi cán vợt: G5. - Điểm cân bằng: 300 +- 5 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Proace Abs-Power 1800', 'Vot', 4900000, 
19, '5/11/2025', 8, 16, 
3433949, N'- Độ cứng: Trung bình. - Trọng lượng vợt: 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Baggaria A5', 'Vot', 800000, 
18, '5/24/2025', 3, 9, 
683140, N'Trọng lượng vừa phải 4U. - Khung vợt: High Modulus Carbon Graphite. - Thân vợt: High Modulus Carbon Graphite. - Trọng lượng: 4U. - Chu vi cán vợt: G1. - Điểm cân bằng: 290 ± 5 (mm).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Astrox 3 DG', 'Vot', 1349000, 
92, '12/19/2025', 3, 4, 
1082646, N'- Độ cứng: Trung bình. - Khung vợt: HM Graphite / Tungsten. - Thân vợt : HM Graphite / NANOMESH NEO. - Trọng lượng: 4U (Avg 83g). - Chu vi cán vợt: G4, G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Pro Kennex Power Pro 705', 'Vot', 768000, 
97, '12/1/2025', 5, 17, 
572900, N'Thân vợt Pro Kennex Power Pro 705 được làm từ chất liệu Carbon cao cấp cùng lớp phủ Titan trợ lực giúp đánh cầu nhẹ nhàng hơn.. - Độ cứng: Dẻo. - Khung vợt: High Modulus Carbon + Titanium. - Thân vợt: High Modulus Carbon + Titanium. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Điểm cân bằng: 290 ± 5mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kamito VTT Gowo KMVCL230427', 'Vot', 1600000, 
93, '8/30/2025', 10, 15, 
1145243, N'- Kamito VTT GoWo không chỉ là một chiếc vợt thông thường, mà còn là sự kết hợp của sự tỉ mỉ trong thiết kế màu sắc và tính năng đặc biệt. Thân vợt dẻo, nhẹ và cao cấp giúp tối ưu hóa khả năng điều khiển và cảm giác cầm nắm.. - Màu sắc: Xanh Lá phối Hồng. - Độ cứng thân vợt: Dẻo.. - Điểm cân bằng: 290+/-3mm. - Trọng lượng: 4U.. - Chiều dài tổng thể: 675 mm..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Pro Kennex Power Pro 704', 'Vot', 668000, 
50, '4/17/2025', 8, 17, 
599804, N'- Độ cứng: Dẻo. - Khung vợt: High Modulus Carbon + Titanium. - Thân vợt: High Modulus Carbon + Titanium. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Điểm cân bằng: 285 ± 5mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare Nextage', 'Vot', 1689000, 
1, '11/6/2025', 5, 4, 
1290022, N'- Độ cứng: Medium. - Khung vợt: HT Graphite,Nanocell NEO. - Trọng lượng: 4U (Avg 83g). - Chu vi cán vợt: G4, G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Nine Tailed Fox (Cửu Vĩ Hồ)', 'Vot', 920000, 
65, '8/13/2025', 4, 3, 
795868, N'- Màu sắc: Trắng phối Hồng, Xanh. - Độ cứng: Trung bình (8.5). - Trọng lượng: 5U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VS Titan 1000', 'Vot', 790000, 
21, '5/11/2025', 6, 6, 
663185, N'Thân vợt VS Titan 1000 có độ cứng trung bình để đảm bảo có thể mang lại khả năng trợ lực cho những người chơi có lực cổ tay chưa thực sự tốt. Bên cạnh đó, khung vợt còn được cấu tạo theo cấu trúc hình hộp giúp cắt giảm diện tích tiếp xúc không khí, đem lại lực vung nhanh hơn để cho ra những cú đánh nhanh và chuẩn.. - Trọng lượng: 4U (82 ± 2g). - Điểm cân bằng: 305 ± 3mm (Nặng đầu). - Độ cứng: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'SET Vợt Cầu Lông VS YouLong Đỏ Tết 2024', 'Vot', 2090000, 
14, '11/6/2025', 1, 6, 
2041875, N'- Độ cứng: Trung bình. - Khung vợt: Japan High Modulus Graphite 40T. - Thân vợt: Japan High Modulus Graphite 40T. - Điểm cân bằng: 305 ± 3mm. - Trọng lượng: 4U ( 82 ± 2g ). - Điểm swing weight: 84,8 kg/cm2. - Chu vi cán vợt: G6. - Sức căng tối đa: 36LBS (17kg). - Màu sắc: Đỏ/Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Power Control E55LS new', 'Vot', 680000, 
7, '11/23/2025', 1, 3, 
489956, N'- Khung vợt được đúc từ Carbon cao cấp chịu được mức căng tương đối cao lên đến 28Lbs. Nước sơn Trắng phối Xanh Đỏ bên ngoài mang sự tinh tế cho bộ khung để tạo nên phong cách tối giản để người chơi dễ dàng phối đồ trên sân.. - Màu sắc: Trắng phối Đỏ Xanh. - Độ cứng: Trung bình. - Khung vợt: HM Graphite. - Thân vợt: HM Graphite. - Điểm cân bằng: 290 ± 5mm (Cân bằng). - Trọng lượng: 82 ± 2g (4U). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo Power Control K520 Pro', 'Vot', 599000, 
75, '4/26/2025', 7, 3, 
466698, N'- Độ cứng: Trung bình. - Khung vợt: Carbon Fiber. - Thân vợt: Carbon Fiber. - Trọng lượng: 82. - Chu vi cán vợt: G5. - Điểm cân bằng: 290.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Voltric Lite 40i', 'Vot', 689000, 
98, '7/2/2025', 3, 4, 
518124, N'- Khung vợt bao gồm sự kết hợp của hai loại đặc tính khung: Khung vợt cứng hơn ở mặt trên và linh hoạt ở mặt bên mang lại lực và khả năng kiểm soát tốt hơn trong khi mặt mỏng ở mặt trên mang lại tính khí động học tốt hơn nên người chơi sẽ có tốc độ vung vợt tốt hơn.. - Độ cứng: Dẻo (Flexible Shaft). - Màu sắc: Đen phối Cam Xanh. - Trọng lượng: 5U. - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Power Control E56LS new', 'Vot', 680000, 
25, '8/16/2025', 4, 3, 
479157, N'- Khung vợt được đúc từ Carbon cao cấp chịu được mức căng tương đối cao lên đến 28Lbs. Nước sơn trắng bên ngoài mang sự tinh tế cho bộ khung để tạo nên phong cách tối giản để người chơi dễ dàng phối đồ trên sân.. - Màu sắc: Trắng phối Xanh Dương. - Độ cứng: Trung bình. - Khung vợt: HM Graphite. - Thân vợt: HM Graphite. - Điểm cân bằng: 290 ± 5mm (Cân bằng). - Trọng lượng: 82 ± 2g (4U). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Power Control E57LS new', 'Vot', 680000, 
69, '5/11/2025', 2, 3, 
664689, N'Khung vợt được đúc từ Carbon cao cấp chịu được mức căng tương đối cao lên đến 28Lbs. Nước sơn đen phối xanh lá mang lại phong cách mạnh mẽ cho người chơi trên sân.. - Màu sắc: Đen phối Xanh Lá. - Độ cứng: Trung bình. - Khung vợt: HM Graphite. - Thân vợt: HM Graphite. - Điểm cân bằng: 290 ± 5mm (Cân bằng). - Trọng lượng: 82 ± 2g (4U). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Power Control E88LS new', 'Vot', 780000, 
85, '11/28/2025', 1, 3, 
734812, N'- Khung vợt được đúc từ Carbon cao cấp chịu được mức căng tương đối cao lên đến 28Lbs. Nước sơn trắng bên ngoài mang sự tinh tế cho bộ khung để tạo nên phong cách tối giản để người chơi dễ dàng phối đồ trên sân.. - Màu sắc: Đen phối Vàng. - Độ cứng: Trung bình. - Khung vợt: HM Graphite. - Thân vợt: HM Graphite. - Điểm cân bằng: 290 ± 5mm (Cân bằng). - Trọng lượng: 82 ± 2g (4U). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Power Control E89LS new', 'Vot', 780000, 
87, '9/22/2025', 10, 3, 
662394, N'Khung vợt được đúc từ Carbon cao cấp chịu được mức căng tương đối cao lên đến 28Lbs.. - Độ cứng: Trung bình. - Màu sắc: Xanh phối Đen. - Khung vợt: HM Graphite. - Thân vợt: HM Graphite. - Điểm cân bằng: 290 ± 5mm (Cân bằng). - Trọng lượng: 82 ± 2g (4U). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Power Control E58LS new', 'Vot', 680000, 
45, '2/4/2025', 7, 3, 
610844, N'- Khung vợt được đúc từ Carbon cao cấp chịu được mức căng tương đối cao lên đến 28Lbs. Nước sơn trắng bên ngoài mang sự tinh tế cho bộ khung để tạo nên phong cách tối giản để người chơi dễ dàng phối đồ trên sân.. - Màu sắc: Trắng Tím. - Độ cứng: Trung bình. - Khung vợt: HM Graphite. - Thân vợt: HM Graphite. - Điểm cân bằng: 290 ± 5mm (Cân bằng). - Trọng lượng: 82 ± 2g (4U). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Acrospeed 01 Focus', 'Vot', 4070000, 
41, '8/22/2025', 2, 13, 
2886428, N'- Màu sắc: Đen phối Cam. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Độ cứng: Trung bình. - Chiều dài tổng thể: 675 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Arcsaber 73 Light', 'Vot', 699000, 
59, '4/29/2025', 8, 4, 
505455, N'- Độ cứng: Siêu dẻo (Flexible Shaft). - Khung vợt: HM Graphite. - Thân vợt: HM Graphite. - Trọng lượng: 5U. - Chu vi cán vợt: G5. - Chiều dài tổng thể: 665mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoray 72 Light', 'Vot', 699000, 
91, '6/6/2025', 9, 4, 
606165, N'- Độ cứng đũa: Siêu dẻo (Hi - flex). - Trọng lượng: 5U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Fortius 11 Power', 'Vot', 4020000, 
63, '7/5/2025', 7, 13, 
3339400, N'- Màu sắc: Đen. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Độ cứng: Cứng. - Chiều dài tổng thể: 675 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Acrospeed 01 Accel', 'Vot', 4070000, 
72, '4/18/2025', 5, 13, 
3729961, N'- Màu sắc: Đen phối Xanh Lá. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Độ cứng: Trung bình. - Chiều dài tổng thể: 675 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Blizzard Pro New', 'Vot', 2500000, 
77, '10/6/2025', 3, 12, 
2006131, N'- Khung vợt 30T Japan High Modulus Graphite + Graphite T-Throat được làm từ chất liệu siêu cứng và bền, đem lại độ bền vượt trội lên đến 17.2kg. C. - Độ cứng: Trung bình.. - Khung vợt: 30T Japan High Modulus Graphite + Graphite T-Throat. - Thân vợt: 40T Japan High Modulus Graphite. - Trọng lượng: 86 ± 2g. - Điểm cân bằng: 305 ± 3mm (Nặng đầu). - Chu vi cán vợt: G1. - Sức căng tối đa: 38 LBS. - Màu sắc: Trắng - Vàng Gold.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Blackiron', 'Vot', 1200000, 
94, '4/18/2025', 5, 2, 
857584, N'');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Honor Pro New', 'Vot', 2500000, 
31, '8/22/2025', 6, 12, 
1865077, N'thuộc phân khúc cao cấp với phiên bản màu sắc hoàn toàn mới so với phiên bản cũ 2023. Màu sắc được phối bởi màu đen tạo nên sự mạnh mẽ cho cây vợt kết hợp với các chi tiết xanh lá nổi bật gây ấn tượng ngay từ cái nhìn đầu tiên. Đặc biệt chất liệu vợt được nâng cấp và cải tiến rõ rệt.. - Độ cứng: Trung bình.. - Khung vợt: 40 Tonne Japan HM Graphite + T-THROAT. - Thân vợt: 50 Tonne Japan Graphite. - Trọng lượng:. - Điểm cân bằng: 305 ± 3mm (Head Heavy). - Chu vi cán vợt: G1. - Sức căng tối đa: 38 LBS. - Màu sắc: Đen - Xanh Lá.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Versus Pro New', 'Vot', 2400000, 
65, '6/3/2025', 6, 12, 
2067859, N'- Trọng lượng: 3U (86 ± 3g). - Điểm cân bằng: 305 ± 3mm (Head Heavy). - Sức căng tối đa: 38 LBS. - Màu sắc: Trắng phối Xanh Dương.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Ziggler LHI Pro III', 'Vot', 2300000, 
81, '5/9/2025', 7, 12, 
2133527, N'- Trọng lượng: 85 ± 2g. - Điểm cân bằng: 300 ± 3mm (Head Heavy). - Độ cứng đũa: 8.0 - Trung bình ( Medium Stiff). - Sức căng tối đa: 38 LBS. - Màu sắc: Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông VS Star Wish', 'Vot', 1100000, 
100, '2/5/2025', 1, 6, 
969956, N'- Trọng lượng: 4U (82 ± 2g) và 5U (79 ± 2g). - Điểm cân bằng: 295 ± 3mm (Cân bằng). - Độ cứng: Hơi dẻo. - Màu sắc: Xanh navy đen phố hồng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kawasaki P26', 'Vot', 740000, 
16, '2/24/2025', 5, 10, 
581929, N'- Khung vợt được cấu trúc theo kiểu khung máy bay AEROFOIL FRAME đem lại tốc độ vung vợt nhanh và linh hoạt hơn. chất liệu Carbon cao cấp 30T cùng các hạt nano siêu mịn mang lại mức căng tương đối cao ở mức 28 Lbs.. - Màu sắc: Trắng phối Xanh. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Độ cứng: Trung bình. - Chiều dài tổng thể: 675 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kawasaki P37', 'Vot', 970000, 
53, '4/29/2025', 10, 10, 
699266, N'- Khung vợt được cấu trúc theo kiểu cấu trúc khung máy bay AEROFOIL FRAME đem lại tốc độ vung vợt nhanh và linh hoạt hơn.. - Màu sắc: Trắng. - Trọng lượng: 4U (84g). - Chu vi cán vợt: G6. - Độ cứng: Trung bình. - Chiều dài tổng thể: 675 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining A700', 'Vot', 900000, 
6, '3/19/2025', 7, 2, 
776615, N'Khung vợt cầu lông Lining A700 được đúc từ chất liệu Carbon Graphite cao cấp cho mức căng dây tối đa là 28Lbs dành cho dây ngành và 26 Lbs cho dây dọc.. - Khung vợt: Graphite. - Thân vợt: Carbon Fibre. - Độ cứng: Trung bình. - Trọng lượng: 84g (4U). - Sức căng tối đa: 28 Lbs. - Màu sắc: Xám - Vàng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining A800', 'Vot', 900000, 
3, '6/3/2025', 10, 2, 
662813, N'Khung vợt cầu lông Lining A800 được đúc từ chất liệu Carbon Graphite cao cấp cho mức căng dây tối đa là 28Lbs dành cho dây ngành và 26 Lbs cho dây dọc.. - Khung vợt: Graphite. - Thân vợt: Carbon Fibre. - Độ cứng: Trung bình. - Trọng lượng: 3U. - Sức căng tối đa: 28 Lbs (Dây ngang) và 26 Lbs (Dây dọc).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo AK7', 'Vot', 990000, 
9, '2/25/2025', 10, 3, 
874757, N'Màu sắc của vợt AK7 rất thu hút với sự kết hợp tinh tế giữa màu trắng và các hoạ tiết tím nổi bật, tạo nên một thiết kế đẹp mắt và hiện đại. Nước sơn nhám bền bỉ giúp bảo vệ ngoại hình được tốt hơn.. - Màu sắc: Trắng. - Độ cứng đũa: Cứng (8.2 ± 0.2mm). - Chu vi cán vợt: G5. - Trọng lượng: 4U (82 ± 2g).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining A900', 'Vot', 900000, 
59, '12/6/2025', 4, 2, 
771554, N'Khung vợt cầu lông Lining A900 được đúc từ chất liệu Carbon Graphite cao cấp cho mức căng tối đa lên đến 13kg.. - Khung vợt: Graphite. - Thân vợt: Carbon Fibre. - Độ cứng: Cứng. - Trọng lượng: 85g. - Chu vi cán vợt: G6. - Sức căng tối đa: 28 Lbs (12.7kg). - Màu sắc: Đen - Xanh Lá.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông Kumpoo K520S', 'Vot', 790000, 
8, '4/7/2025', 2, 3, 
562914, N'- Độ cứng: Trung bình. - Trọng lượng: 82g ± 2g (4U). - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Astrox 100ZZ Kurenai', 'Vot', 5079000, 
62, '5/18/2025', 2, 4, 
4223855, N'- Độ cứng: Siêu cứng. - Điểm cân bằng: Nặng đầu. - Chiều dài tổng thể vợt: 675mm. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: 3U - G5, 6. - Màu sắc: Kurenai (Đỏ Thẫm).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Axforce 80 Đỏ (Rồng Lửa) Chen Long Limited', 'Vot', 9500000, 
91, '8/22/2025', 9, 2, 
7015414, N'Độ cứng: Trung bình. - Điểm cân bằng: 300 ± 3mm (Nặng đầu). - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 30 LBS (13.6kg). - Màu sắc: Đỏ phối Trắng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông Victor Spider Man Limited', 'Vot', 5500000, 
73, '1/23/2025', 2, 1, 
4767182, N'Trọng lượng 4U, đũa vợt hơi dẻo trợ lực nên đây là cây vợt được đánh giá là khá dễ kiểm soát, đầu vợt được thiết kế theo lối thiên công.. - Màu sắc: Đen phối đỏ thẩm. - Độ cứng: Hơi Dẻo. - Chiều dài tổng thể: 675mm. - Khung vợt: High Resilience Modulus Graphite + Nano Resin. - Thân vợt: High Resilience Graphite + 6.8 SHAFT. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 4U  ≦28 lbs (12.5 Kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo Power Control R89', 'Vot', 560000, 
5, '5/3/2025', 3, 3, 
555033, N'- Độ cứng: 8.5. - Khung vợt: Carbon Fiber. - Thân vợt: Carbon Fiber. - Trọng lượng: 82. - Chu vi cán vợt: G5. - Điểm cân bằng: 290.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Embisu E5', 'Vot', 750000, 
40, '3/7/2025', 2, 9, 
745581, N'- Khung vợt: High Modulus Carbon Graphite. - Thân vợt: High Modulus Carbon Graphite. - Trọng lượng: 4U. - Độ cứng đũa: Trung bình. - Chu vi cán vợt: G1. - Điểm cân bằng: 290 - 295 (mm).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo Veluriyam', 'Vot', 690000, 
45, '10/19/2025', 6, 3, 
578950, N'Cán vợt được làm bằng chất liệu tổng hợp với độ bám cao, giúp người chơi cầm vợt chắc chắn và thoải mái. Khung vợt được làm bằng carbon fiber siêu nhẹ và có độ bền cao. Đường kính đũa vợt mỏng của Kumpoo Veluriyam giúp người chơi dễ dàng cầm nắm và điều khiển vợt một cách chính xác.. Khung vợt: Carbon fiber. Trọng lượng: 5U (77±2g). Điểm cân bằng: 302±5mm ( Nặng đầu). Độ cứng trục giữa: 8.5±0.5m ( Trung bình).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Felet Arcana 80S Plus', 'Vot', 1399000, 
37, '5/22/2025', 5, 9, 
1070349, N'- Độ cứng: Trung bình. - Khung vợt: ARCANA Frame. - Thân vợt: 5.0mm Long Theory Of Science ( Control Shaft System ). - Trọng lượng: 3U,4U. - Chu vi cán vợt: G5. - Điểm cân bằng: 290 +- 5 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor Jetspeed S10', 'Vot', 3600000, 
41, '11/14/2025', 8, 1, 
3324736, N'- Độ cứng: Cứng. - Khung vợt: Ultra High Modulus Graphite + Nano Fortify. - Thân vợt :  Ultra High Modulus Graphite + PYROFIL by Mitsubishi + 6.8 SHAFT. - Trọng lượng: 4U, 3U. - Chu vi cán vợt: G5. - Điểm cân bằng: Cân bằng. : Thân vợt Victor Jetspeed S10 được cấu tạo bởi nhiều sợi carbon hình ống, tối ưu hóa khả năng phục hồi và tăng lực đàn hồi của thân vợt, tăng độ nảy khi đánh, tạo ra lực đẩy cao, giúp tăng cường sức mạnh tấn công trên mỗi cú đánh..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Arcana 90', 'Vot', 1199000, 
70, '6/29/2025', 9, 9, 
921512, N'');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Arcsaber 11 Pro', 'Vot', 4559000, 
54, '2/7/2025', 1, 4, 
3957653, N'- Điểm cân bằng: Khoảng 295mm (Hơi nặng đầu). - Độ cứng: Super Slim Shaft (Cứng). - Màu sắc: Grayish Pearl (Ngọc Trai Xám). - Trọng lượng/ Chu vi cán vợt: 3U (Ave.88g)/G5. - Chiều dài tổng thể: 675mm..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining A880', 'Vot', 800000, 
58, '4/11/2025', 7, 2, 
662261, N'- Thân vợt cầu lông Lining A880 được làm bằng hợp kim nhôm, giúp tăng độ bền và độ cứng của vợt. Cán vợt được làm bằng sợi cacbon chất lượng cao, giúp tăng tính linh hoạt và độ cân bằng của vợt.. - Điểm cân bằng: Cân bằng. - Trọng lượng đánh dấu: 3U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining A762', 'Vot', 800000, 
19, '11/12/2025', 5, 2, 
688421, N'- Màu sắc: Gold. - Độ cứng đũa: Dẻo. - Trọng lượng: 3U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining A880T', 'Vot', 800000, 
99, '10/9/2025', 1, 2, 
663468, N'- Khung vợt được đúc từ chất liệu Carbon Graphite cao cấp cho mức căng tối đa lên đến 11,7kg.. - Khung vợt: Graphite. - Thân vợt: Carbon Fibre. - Độ cứng đũa: Dẻo. - Trọng lượng: 3U. - Chu vi cán vợt: G5. - Sức căng tối đa: 20 - 26LBS.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Astrox 88 Play 2024', 'Vot', 1259000, 
64, '8/12/2025', 8, 4, 
1244550, N'- Điểm đáng chú ý nhất là vẻ ngoài nổi bật với sự kết hợp tinh tế của màu đen, bạc và xanh dương, tạo nên vẻ đẹp hiện đại và thu hút. Thân vợt linh hoạt, giúp người chơi thực hiện chuyển đổi các động tác một cách dễ dàng.. - Độ cứng: Trung bình. - Thân vợt: Graphite. - Trọng lượng / Cán vợt: 4U (Trung bình 83g) G5. -Màu sắc: Đen / Bạc. Khung vợt Astrox 88 Play 2024 kết hợp giữa thiết kế truyền thống và hiện đại, các cạnh khung mượt của Aero Frame giúp giảm tối đa sức cản không khí cùng sự cứng cáp, ổn định của Box Frame đem lại cho người chơi cây vợt toàn diện hơn và ổn định hơn, vừa phòng thủ nhanh vừa bung lực mạnh mẽ.. Khung vợt đẳng cự với phần đầu hơi vuông, được Yonex nghiên cứu trong suốt 30 năm giúp mở rộng điểm tiếp xúc trên vợt cầu lông Yonex, tăng điểm đánh trên mặt khung, nâng cao cảm giác cầu ổn định và độ chính xác trong từng pha cầu. Đồng thời, công nghệ này cũng cung cấp cho vợt khả năng bộc phát lực mạnh mẽ, hỗ trợ cho các pha cầu lệch tâm, hụt lực có hướng bay tốt nhất..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining HC 1900', 'Vot', 900000, 
92, '9/16/2025', 8, 2, 
766612, N'Với thiết kế khung vợt DYNAMIN-OPT-IMUM FRAME tập trung vào ba yếu tố chính: độ bền, độ cứng và khả năng giảm chấn. Thiết kế khung vợt này sử dụng các kỹ thuật mới để tối ưu hóa cấu trúc khung vợt, giảm trọng lượng và tăng độ bền. Độ cứng của khung vợt cầu lông Lining HC 1900 cũng được tăng cường để tăng cường sức mạnh và tốc độ của cú đánh.. - Màu sắc: Trắng - Xanh Ngọc. - Độ cứng: Trung bình. - Trọng lượng: 85 - 89gr (W3). - Chu vi cán vợt: S2.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Titan 1', 'Vot', 390000, 
22, '6/13/2025', 7, 8, 
277929, N'- Độ cứng: Hơi dẻo. - Điểm cân bằng: 295mm. - Trọng lượng: 4U (84g). - Màu sắc: Xanh Dương.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Titan 3', 'Vot', 390000, 
94, '10/23/2025', 4, 8, 
342387, N'- Độ cứng: Hơi dẻo. - Điểm cân bằng: 295mm. - Trọng lượng: 4U (84g).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Titan 2', 'Vot', 390000, 
50, '9/7/2025', 9, 8, 
386240, N'- Khung vợt được thiết kế khí động học, giúp tăng cường sức mạnh và tốc độ cho từng cú đánh. Với cấu trúc khung carbon chắc chắn, có độ căng dây lên đến 26lbs, đảm bảo độ bền.. - Độ cứng: Hơi dẻo. - Điểm cân bằng: 295mm. - Trọng lượng: 4U..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo Power Balanced 11', 'Vot', 790000, 
10, '4/5/2025', 1, 3, 
781746, N'- Trọng lượng: 82 + 2 g (4U). - Độ cứng: Trung bình. - Điểm cân bằng: 290 +- 5 mm (Cân bằng). - Khung vợt: Carbon Graphite. - Thân vợt: Carbon Graphite. - Điểm swing weight: 83,4 kg/cm2. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Titan 4', 'Vot', 390000, 
63, '11/4/2025', 5, 8, 
336845, N'- Độ cứng: Hơi dẻo. - Điểm cân bằng: 295mm. - Trọng lượng: 4U (84g). - Màu sắc: Tím/ Xanh Ngọc.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Titan 5', 'Vot', 390000, 
42, '3/1/2025', 9, 8, 
287815, N'- Trọng lượng: 4U. - Điểm cân bằng: 295+-5mm. - Độ cứng: Hơi dẻo. - Màu sắc: Đỏ cherry.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Cặp Vợt cầu lông Lining Axforce 9', 'Vot', 850000, 
21, '4/27/2025', 5, 2, 
655218, N'- Vợt ra mắt 2 phiên bản trọng lượng gồm 3U và 4U để người chơi lựa chọn theo phong cách đánh cũng như là độ khỏe của cổ tay, cùng với cán cầm G5 giúp cảm giác cầm nắm tốt hơn khi đánh cầu. Khung vợt cũng được mở rộng để giúp người chơi dễ dàng đưa trái cầu vào đúng điểm ngọt của mặt vợt.. - Điểm cân bằng: 300mm. - Độ cứng: Trung bình. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kawasaki Super Light K5', 'Vot', 750000, 
77, '4/23/2025', 9, 10, 
590298, N'- Trọng lượng: 5U (76+/-2gam).. - Điểm cân bằng: 305+/-3mm.. - Độ cứng: Hơi dẻo.. - Ngoài ra với trọng lượng 5U rất phù hợp cho những bạn có thể linh hoạt nhẹ nhàng kiểm soát đem lại sự ổn định cho người chơi. Thân vợt hơi dẻo nên sẽ dành cho những bạn mới tập chơi, có cổ tay chưa khỏe vẫn sử dụng được..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo mua vợt cầu lông Victor ARS 3200 tặng vợt Victor ARS 3200 + vợt Kawasaki P25', 'Vot', 2730000, 
81, '9/13/2025', 8, 1, 
2523537, N'- Độ cứng: Dẻo. - Khung vợt: Graphite + Resin. - Thân vợt :Graphite + Resin + 7.0 SHAFT. - Trọng lượng: 3U:≦27 lbs(12Kg). - Chu vi cán vợt: G5. - Điểm cân bằng: 290 mm. - Màu sắc: Xanh dương.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Kongfu Rabbit', 'Vot', 1130000, 
10, '4/18/2025', 3, 6, 
1026360, N'Thân vợt có độ cứng trung bình để đảm bảo có thể mang lại khả năng trợ lực cho những người chơi có lực cổ tay chưa thực sự tốt. Bên cạnh đó, khung vợt còn được cấu tạo theo cấu trúc hình hộp giúp cắt giảm diện tích tiếp xúc không khí, đem lại lực vung nhanh hơn để cho ra những cú đánh nhanh và chuẩn.. - Trọng lượng: 4U (82 ± 2g). - Điểm cân bằng: 298 ± 3mm (Hơi nặng đầu). - Độ cứng: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex NanoFlare 002C', 'Vot', 1190000, 
74, '2/7/2025', 5, 1, 
858318, N'- Trọng lượng: 4U (83g+/-3g).. - Độ cứng đũa: Dẻo.. - Điểm cân bằng: Hơi nặng đầu (295+/-3mm).. - Chu vi cán vợt: G5..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex NanoFlare 002F', 'Vot', 1190000, 
85, '7/2/2025', 6, 4, 
938486, N'- Trọng lượng: 4U (83g+/-3g).. - Độ cứng đũa: Dẻo.. - Điểm cân bằng: Cân bằng (290+/-3mm).. - Chu vi cán vợt: G5..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex NanoFlare 002A', 'Vot', 1190000, 
17, '10/8/2025', 9, 4, 
985122, N'- Trọng lượng: 4U (83g).. - Độ cứng đũa: Dẻo.. - Điểm cân bằng: nhẹ đầu (285+/-3mm).. - Chu vi cán vợt: G5.. - Vợt cầu lông Yonex NanoFlare 002A phù hợp cho những bạn mới tập chơi, có lực tay yếu và có lối đánh phòng thủ phản tạt. Trọng lượng 4U, độ cứng đũa dẻo rất linh hoạt giúp cho người chơi dễ dàng xoay chuyển với tốc độ một cách nhanh chóng..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor Thruster Ryuga D', 'Vot', 3050000, 
5, '3/24/2025', 7, 1, 
2887434, N'- Thân vợt: High Resilience Modulus Graphite+ PYROFIL+ 6.8 SHAFT. - Khung vợt: High Resilience Modulus Graphite+ HARD CORED TECHNOLOGY. - Điểm cân bằng: 307mm. - Độ cứng: Cứng. - Trọng lượng: 3U:≤32 lbs(14.5Kg). - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Carbon Woven 18', 'Vot', 1599000, 
98, '12/12/2025', 7, 9, 
1453632, N'- Thân vợt: 7.0mm Power Booster Shaft. - Trọng lượng: 4U/82gr, 3U/86gr. - Độ cứng: Trung bình. - Chu vi cán vợt: G1. - Chiều dài tổng thể: 675mm. - Điểm cân bằng: 290+-3mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Alunzo 990', 'Vot', 1069000, 
40, '3/30/2025', 2, 9, 
875607, N'- Khung vợt: Power Frame. - Thân vợt: Trung bình. - Trọng lượng: 4U - 82+ gram. - Điểm cân bằng: 4U - 290±5mm. - Khung vợt chịu được mức căng cao lên đến 31 LBS giúp người chơi an tâm căng vợt theo ý thích..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor Ryuga II', 'Vot', 3049000, 
24, '1/11/2025', 5, 1, 
2944677, N'- Điểm cân bằng: Khoảng 300. - Độ cứng : Cứng. - Khung vợt: HHigh Resilience Modulus Graphite + HARD CORED TECHNOLOGY.. - Thân vợt: High Resilience Modulus Graphite + PYROFIL + 6.6 SHAFT.. - Trọng lượng : 3U và 4U. - Chu vi cán vợt : G5. - Chiều dài tổng thể: 675 mm.. - Điểm swing weight: 3U 87 kg/cm2. - Sức căng tối đa : 3U: ≦ 32 lbs (14,5kg). - Màu sắc: Đen phối tím.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Axforce 9', 'Vot', 480000, 
78, '1/16/2025', 1, 2, 
392555, N'- Điểm cân bằng: 300mm (Hơi nặng đầu). - Độ cứng: Trung bình. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet 3K Woven Fence', 'Vot', 2599000, 
84, '9/22/2025', 6, 9, 
1861008, N'- Độ cứng: Trung bình. - Khung vợt: Low Aero Dynamic (L.A.D) + High Speed Frame. - Thân vợt: 7.0mm Nano Booster Shaft (NBT). - Điểm cân bằng: 295+-2mm. - Trọng lượng:. - Chu vi cán vợt: G2.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông VS Dragon', 'Vot', 1850000, 
7, '6/18/2025', 6, 6, 
1688410, N'- Trọng lượng: 5U (79 ± 2g). - Điểm cân bằng: 305 ± 3mm (Nặng đầu). - Độ cứng: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Blade 8000', 'Vot', 539000, 
90, '3/28/2025', 3, 6, 
533876, N'- Khung vợt được làm từ chất liệu Nano Carbon cao cấp, tạo sự chắc chắn và bền bỉ. Vợt có độ cứng trung bình, trọng lượng 4U rất phù hợp cho những người mới chơi có lực tay yếu, đặc biệt là người mới.. + Điểm cân bằng: 295mm (Cân bằng). + Độ cứng: Trung bình. + Trọng lượng: 4U. + Chu vi cán vợt: G5. + Sức căng tối đa: 22-30lbs (13.6kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Blade 8200', 'Vot', 570000, 
81, '4/22/2025', 9, 6, 
473182, N'Với khả năng chịu mức căng cao lên đến 30lbs, VS Blade 8200 cho phép bạn tùy chỉnh độ căng theo ý muốn, tạo ra những cú đánh mạnh mẽ và chính xác. Độ cứng đũa vợt trung bình giúp cung cấp sự linh hoạt và cảm giác tốt trong quá trình chơi.. - Độ cứng: Trung bình. - Điểm cân bằng: 295 ± 3mm (Cân bằng). - Trọng lượng: 4U (82 ± 2g). Khung vợt cầu lông VS Blade 8200 được vát ở các cạnh tạo nên cấu trúc khung có hình lục giác giúp giảm lực cản không khí. Giúp tăng cường cho mỗi cú đập để tạo nên một dòng vợt thiên công hiệu quả.. Carbon nhập khẩu từ Nhật Bản nhờ kết hợp với công nghệ nano nên khung và thân vợt có tính linh hoạt rất cao. Thân vợt có độ đàn hồi hơn, cùng sự phục hồi tốt hơn mong đợi. Vợt được làm từ Graphite mô đun cao của Nhật Bản với chữ 24T đã được kiểm tra chất lượng graphite trong phòng thí nghiệm. Khả năng chịu tải của Graphite trên một đơn vị diện tích lên tới 24 tấn, điều mà chỉ được sử dụng trong gỗ cao cấp của thương hiệu nổi tiếng. Kết hợp cùng với phân tử vật liệu siêu nhỏ Nano Tec len lỏi trong các phân tử cacbon để gia cố khung vợt chắc chắn hơn nhưng vẫn đảm bảo độ bền và nhẹ..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Blade 7300', 'Vot', 570000, 
23, '6/8/2025', 5, 6, 
461623, N'- Độ cứng: Trung bình.. - Khung vợt: Nano Carbon. - Thân vợt: Nano Carbon. - Trọng lượng: 4U (83 + -2g). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675 mm. - Điểm cân bằng: Khoảng 292mm (Cân bằng).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Blade 8100', 'Vot', 570000, 
1, '10/22/2025', 5, 6, 
459046, N'- Độ cứng: Trung Bình. - Điểm cân bằng: 295(+-3mm). - Chiều dài tổng thể: 675 mm. - Trọng lượng/ Chu vi cán vợt: 4U-G5. - Màu sắc: Đen, Vàng. Khung vợt hình lục giác giúp giảm lực cản không khí. Điều này làm giảm độ xoắn của mặt gỗ, giúp xoay mặt vợt nhanh hơn theo đúng hướng mong muốn chính xác hơn.. Carbon nhập khẩu từ Nhật Bản nhờ kết hợp với công nghệ nano nên khung và thân vợt có tính linh hoạt rất cao. Thân vợt có độ đàn hồi hơn, cùng sự phục hồi tốt hơn mong đợi. Vợt được làm từ Graphite mô đun cao của Nhật Bản với chữ 24T đã được kiểm tra chất lượng graphite trong phòng thí nghiệm. Khả năng chịu tải của Graphite trên một đơn vị diện tích lên tới 24 tấn, điều mà chỉ được sử dụng trong gỗ cao cấp của thương hiệu nổi tiếng. Kết hợp cùng với công nghệ Nano Tec, khung vợt chắc chắn nhưng vẫn bền và nhẹ..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Blade 7100', 'Vot', 570000, 
64, '10/28/2025', 2, 6, 
495262, N'- Màu sắc: Gold phối Xám. - Độ cứng: Trung bình.. - Khung vợt: Nano Carbon. - Thân vợt: Nano Carbon. - Trọng lượng: 4U (83 + -2g). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675 mm. - Điểm cân bằng: Khoảng 292mm (Cân bằng).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Blade 7200', 'Vot', 570000, 
37, '1/20/2025', 5, 6, 
535337, N'- Độ cứng: Trung bình. - Điểm cân bằng: Cân bằng. - Trọng lượng: 3U (85 +- 2g). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Blade 7000', 'Vot', 570000, 
47, '12/9/2025', 10, 6, 
410247, N'- Màu sắc: Đỏ phối Xám. - Độ cứng: Trung bình.. - Khung vợt: Nano Carbon. - Thân vợt: Nano Carbon. - Trọng lượng: 4U (83 + -2g). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675 mm. - Điểm cân bằng: Khoảng 292mm (Cân bằng).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Astrox 02 Ability', 'Vot', 1239000, 
34, '5/9/2025', 8, 4, 
950385, N'- Độ cứng: Trung bình. - Trọng lượng: 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Titan 7', 'Vot', 570000, 
66, '8/19/2025', 10, 6, 
415928, N'- Trọng lượng: 4U (82 ± 2g). - Điểm cân bằng: 290 ± 3mm (Cân bằng). - Độ cứng: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Cặp vợt cầu lông Kumpoo Power Control 520AS', 'Vot', 820000, 
21, '1/2/2025', 8, 3, 
744874, N'- Màu sắc: đỏ, vàng phối trắng. - Độ cứng: Trung bình. - Trọng lượng: 82. - Chu vi cán vợt: G5. - Điểm cân bằng: 290.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Astrox 02 Feel', 'Vot', 1239000, 
56, '2/12/2025', 7, 4, 
1120405, N'- Trọng lượng: 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Cặp vợt cầu lông Kumpoo Power Control 520BS', 'Vot', 820000, 
80, '7/8/2025', 8, 3, 
737257, N'- Màu sắc: tím, xanh phối xanh lá. - Độ cứng: Trung bình. - Trọng lượng: 82. - Chu vi cán vợt: G5. - Điểm cân bằng: 290.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Astrox 02 Clear', 'Vot', 1239000, 
49, '4/4/2025', 2, 4, 
971643, N'- Trọng lượng: 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Power Control 520BS', 'Vot', 410000, 
1, '11/14/2025', 10, 3, 
382678, N'- Màu sắc: tím, xanh phối xanh lá. - Độ cứng: Trung bình. - Trọng lượng: 82. - Chu vi cán vợt: G5. - Điểm cân bằng: 290.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Mizuno Altair T327', 'Vot', 1400000, 
64, '2/20/2025', 6, 13, 
1123478, N'- Độ cứng: Dẻo. - Trọng lượng: 5U. - Chu vi cán vợt: G5. - Điểm cân bằng: Cân bằng. - Sức căng tối đa: 30lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Mizuno Altair T329', 'Vot', 1400000, 
48, '5/9/2025', 9, 13, 
1160248, N'- Độ cứng: Dẻo. - Trọng lượng: 5U. - Chu vi cán vợt: G5. - Điểm cân bằng: 295mm. - Sức căng tối đa: 30lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Prototype X-3', 'Vot', 3000000, 
74, '11/3/2025', 6, 13, 
2601610, N'- Độ cứng: Trung bình. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm. - Sức căng tối đa: 30 LBS (13.6 kg). - Điểm cân bằng: Nặng đầu.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Fortius 11 Quick', 'Vot', 4289000, 
66, '9/12/2025', 8, 13, 
3025772, N'- Điểm cân bằng: 295-296mm. - Trọng lượng: 4U. - Độ cứng: Cứng. - Chu vi cán vợt: G6. - Chiều dài tổng thể: 675 mm. - Điểm swing weight: 87,5 kg/cm2.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Halbertec 7000', 'Vot', 3400000, 
20, '10/18/2025', 9, 2, 
3163069, N'Thân vợt sử dụng carbon T1100 với công nghệ cao đi cùng thiết kế trục 6.8mm High-Modulus Slim Shaft giúp vợt nâng cao cảm ứng nhanh nhạy hơn, cho tốc độ ra vợt nhanh hơn, tăng hiệu suất phòng thủ của vợt Lining Halbertec 7000 nhưng nhưng vẫn đảm bảo các pha tấn công hiệu quả để cho ra một cây vợt toàn diện bậc nhất.. Khung vợt Lining Halbertec 7000 được làm từ chất liệu Med Carbon Fiber cao cấp giúp cây vợt đạt được mức căng cực kỳ ấn tượng lên đến 31lbs (3U) và 30lbs (4U).. - Độ cứng: Cứng. - Trọng lượng: 3U, 4U. - Màu sắc: Cam - Xanh Lá.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Axforce 40', 'Vot', 1850000, 
2, '12/30/2025', 2, 2, 
1678455, N'- Màu sắc: Đen phối Hồng.. - Độ cứng: Dẻo.. - Trọng lượng: 3U, 4U..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Arcana Frame', 'Vot', 1190000, 
53, '3/1/2025', 2, 9, 
836721, N'- Màu sắc: Green blue neon. - Thân vợt: (POWER SHAFT SYSTEM)  5.0MM SHORT THEORY OF SCIENCE. - Độ cứng: Trung bình. - Trọng lượng: 4U - 82+-gr và 3U - 86+-gr. - Chu vi cán vợt: G1.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Halbertec 6000', 'Vot', 2850000, 
36, '4/22/2025', 8, 2, 
2507045, N'– Độ cứng: Trung bình. – Điểm cân bằng: 295mm. – Trọng lượng: 4U, 5U. – Chu vi cán vợt: G6. – Sức căng tối đa: ≤ 29lbs ~ 13kg. – Màu sắc: Trắng/Xanh ngọc/Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông VS Star Wish New', 'Vot', 1100000, 
3, '2/13/2025', 6, 6, 
1038109, N'- Trọng lượng: 4U (82 ± 2g). - Điểm cân bằng: 295 ± 3mm (Cân bằng). - Độ cứng: Dẻo.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Arcsaber 1 Clear', 'Vot', 559000, 
84, '9/1/2025', 2, 4, 
544662, N'- Độ cứng: Siêu dẻo (Flexible Shaft). - Màu sắc: Xanh. - Trọng lượng: 5U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Arcsaber 1 Ability', 'Vot', 559000, 
82, '1/4/2025', 9, 4, 
425160, N'- Độ cứng: Siêu dẻo. - Màu sắc: Black/grey. - Trọng lượng: 5U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Lightning 2000', 'Vot', 1090000, 
16, '4/28/2025', 10, 2, 
828825, N'- Độ cứng: Trung bình.. - Trọng lượng: 84g (4U). - Sức căng tối đa:  13.5kg. - Điểm cân bằng: 290 +- 2mm. - Chiều dài tổng thể: 675 mm. - Điểm swing weight: 84kg/cm2.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VS Moonlight 17', 'Vot', 600000, 
38, '8/28/2025', 2, 6, 
522507, N'- Độ cứng: Trung bình.. - Trọng lượng: 4U (83 + -2g). - Chu vi cán vợt: G6. - Chiều dài tổng thể: 675 mm. - Điểm cân bằng: 295 +- 3 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Arcsaber 1 Feel', 'Vot', 559000, 
27, '10/2/2025', 2, 4, 
540977, N'- Khung vợt được thiết kế kết hợp giữa kiểu khung Aero Frame và khung BOX Frame tạo nên một cấu trúc độc đáo để giảm lực cản của gió nhưng vẫn giữ được độ bền, đảm bảo đem lại độ xoáy nhanh và cảm giác chắc chắn trong từng cú đánh khi tiếp mặt vợt tiếp xúc với cầu. - Độ cứng: Siêu dẻo. - Trọng lượng: 5U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông Victor IRON MAN GB', 'Vot', 5400000, 
15, '8/11/2025', 5, 1, 
4131713, N'- Được thiết kế với các màu đỏ, đen và hòa tiết vàng tạo nên nét đặc trưng của Người Sắt trong phim, nước sơn nhám đẹp mắt cùng tông màu tối mang lại sự mạnh mẽ. Trọng lượng 4U, đũa vợt có độ cứng trung bình trợ lực cho người chơi, điểm cân bằng là 296mm nên vợt thuộc lối chơi công thủ toàn diện, khá dễ làm quen và kiểm soát.. - Điểm cân bằng: 296mm. - Độ cứng: Trung Bình. - Khung vợt: High Resilience Modulus Graphite+Nano Resin+METALLIC CARBON FIBER. - Thân vợt: High Resilience Modulus Graphite+Nano Resin. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 28lbs. - Điểm swing weight: 83.6kg/cm2.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor Thruster Ryuga II Pro', 'Vot', 3690000, 
29, '11/23/2025', 8, 1, 
3417199, N'- Độ cứng: Cứng. - Chiều dài tổng thể: 675mm. - Khung vợt: High Resilience Modulus Graphite+HARD CORED TECHNOLOGY. - Trọng lượng: 4U, 3U. - Chu vi cán vợt: G5, G6. - Sức căng tối đa: 4U  ≦ 31 lbs (14 Kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Lush Moutain', 'Vot', 990000, 
4, '6/2/2025', 5, 3, 
940622, N'- Trọng lượng: 4U. - Độ cứng: 8,5 ± 0,3mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kamito Newstar Attack', 'Vot', 650000, 
2, '5/5/2025', 3, 15, 
565262, N'- Màu sắc: Đen. - Trọng lượng: 4U. - Độ cứng: Trung bình. - Điểm cân bằng: Nặng đầu 4/5. - Chu vi cán vợt: G5..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Felet Hypermax', 'Vot', 1069000, 
29, '10/9/2025', 8, 9, 
1067194, N'- Điểm cân bằng: 290 - 295mm. - Độ cứng: Trung bình. - Trọng lượng: 4U - 82+-gr và 3U - 86+-gr. - Chu vi cán vợt: G1.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kamito Newstar Lite', 'Vot', 680000, 
94, '5/2/2025', 9, 15, 
568228, N'- Màu sắc: Trắng. - Trọng lượng: 5U. - Độ cứng: Trung bình. - Điểm cân bằng: Cân bằng 3/5. - Chu vi cán vợt: G5..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kamito Newstar Drive', 'Vot', 650000, 
36, '10/7/2025', 2, 15, 
626338, N'- Màu sắc: Xanh. - Trọng lượng: 4U. - Độ cứng: Trung bình. - Điểm cân bằng: Cân bằng 3/5. - Chu vi cán vợt: G5..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VS V-Dragon', 'Vot', 570000, 
17, '10/20/2025', 10, 6, 
469298, N'- Vợt được làm bằng chất liệu Carbon đảm bảo độ bền, có khả năng chịu lực tốt, chống va đập hiệu quả. Khung vợt hình lục giác được thiết kế gồm các cạnh được vót nhọn cho khả năng cắt gió để mang lại tốc độ tối đa trong những pha vung vợt cùng khả năng xoay chuyển linh hoạt. Thân vợt độ cứng trung bình giúp người chơi dễ dàng điều khiển đồng thời cũng hỗ trợ lực tốt giúp tạo ra những cú đánh mạnh mẽ khi cần thiết.. - Độ cứng: Trung bình.. - Trọng lượng: 4U (83 + -2g). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675 mm. - Điểm cân bằng: 295 +- 3 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VS Cupid', 'Vot', 570000, 
13, '1/24/2025', 5, 6, 
460017, N'- Độ cứng: Trung Bình. - Trọng lượng: 4U (82 ± 2g). - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông Kumpoo K520 Pro', 'Vot', 790000, 
99, '12/8/2025', 2, 3, 
667144, N'- Độ cứng: Trung bình. - Trọng lượng: 4U. - Điểm cân bằng: 290 +- 5 mm. - Điểm swing weight: 85,6 kg/cm2. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Apacs Fantala Pro 101', 'Vot', 2500000, 
56, '7/9/2025', 9, 12, 
2238339, N'- Được áp dụng công nghệ vật liệu Carbon Graphite cao cấp cùng với thân đũa nhỏ 6.6mm đem lại cảm giác linh hoạt, năng động, giúp xoay chuyển từ tấn công sang phòng thủ hoặc ngược lại một cách nhanh chóng. Khung vợt có thể chịu lực căng tối đa lên tới 38 lbs (17.2kg) cùng với công nghệ thiết kế 76 lỗ giúp có nhiều lỗ xỏ hơn tạo ra kiểu đan dây có hiệu suất cao hơn và tăng độ bền lên tới 7%. Phần Khung cũng được làm nhỏ hơn làm giảm lực cản của không khí giúp người chơi có thể vung vợt nhanh hơn. - Trọng lượng: 4U (84 ± 2g). - Điểm cân bằng: 295 ± 3mm. - Độ cứng: Trung Bình. - Sức căng tối đa: 38 LBS.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông Victor Iron Man Metallic', 'Vot', 5500000, 
26, '6/10/2025', 7, 1, 
5348613, N'- Được thiết kế với các màu đỏ, đen và hòa tiết vàng tạo nên nét đặc trưng của Người Sắt trong phim, nước sơn nhám đẹp mắt cùng tông màu tối mang lại sự mạnh mẽ. Trọng lượng 4U, đũa vợt có độ cứng trung bình trợ lực cho người chơi, điểm cân bằng là 296mm nên vợt thuộc lối chơi công thủ toàn diện, khá dễ làm quen và kiểm soát.. - Điểm cân bằng: 296mm. - Độ cứng: Trung Bình. - Khung vợt: High Resilience Modulus Graphite+Nano Resin+METALLIC CARBON FIBER. - Thân vợt: High Resilience Modulus Graphite+Nano Resin. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 28lbs. - Điểm swing weight: 83.6kg/cm2.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Nanoflare 70 (RP)', 'Vot', 3799000, 
34, '6/3/2025', 6, 4, 
3110586, N'- Độ cứng đũa: Cứng. - Trọng lượng: 4U (Avg 83g). - Chu vi cán vợt: G5, G6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VS ACE Power 11 Max', 'Vot', 649000, 
38, '2/27/2025', 1, 6, 
565353, N'- Điểm cân bằng: 295mm. - Độ cứng: Hơi dẻo. - Khung vợt: Japan High Elastic Carbon Fiber. - Thân vợt: Japan High Elastic Carbon Fiber. - Trọng lượng: 4U (82 + -2g). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor Thruster Ryuga Metallic', 'Vot', 3700000, 
21, '1/3/2025', 10, 1, 
2735634, N'- Khung vợt hình hộp Power Box với cạnh cứng và sử dụng Metallic Carbon Fiber mang lại độ bền và khả năng chịu lực lên đến 14.5kg, làm tăng hiệu suất của cây vợt trong những tình huống tấn công. Hệ thống tăng cường sức mạnh WES 2.0 hỗ trợ tạo ra những pha đập cầu sắc bén và hiểm hoc.. - Độ cứng: Cứng. - Điểm cân bằng: 305 mm ( Nặng đầu). - Điểm swing weight: 91,8 kg/cm2. - Sức căng tối đa: 32lbs ( 14,5 kg). - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. Khung vợt được thiết kế cứng cáp, bền bỉ, cung cấp độ chính xác và hiệu quả khi người chơi thực hiện nhồi cầu, smash cầu liên tục áp đảo sân cầu đối phương..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Astrox 70 (SA)', 'Vot', 3799000, 
100, '10/4/2025', 2, 4, 
3525346, N'- Độ cứng đũa: Hơi dẻo. - Trọng lượng: 4U (Avg 83g). - Chu vi cán vợt: G5, G6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Prokennex Storm Breaker 618', 'Vot', 538000, 
15, '9/9/2025', 6, 17, 
463895, N'- Độ cứng: Dẻo. - Trọng lượng: 4U. - Điểm cân bằng: 288 ± 5mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Astrox BKEX', 'Vot', 1750000, 
24, '12/24/2025', 4, 4, 
1684230, N'- Khung vợt: Graphite / VDM / Tungsten / Carbon. - Điểm cân bằng: Hơi Nặng đầu. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Độ cứng đũa: Trung Bình. - Sức căng tối đa: 20 lbs - 30 lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor Auraspeed HS Plus', 'Vot', 4250000, 
30, '5/2/2025', 1, 1, 
4188637, N'- Màu sắc: Đen. - Độ cứng: Rất Cứng. - Điểm cân bằng: Hơi nặng đầu. - Chiều dài tổng thể: 675mm. - Khung vợt: High Resilience Modulus Graphite+FORMOSA CARBON FIBER. - Thân vợt: High Resilience Modulus Graphite+PYROFIL+6.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: 3U G5. - Sức căng tối đa: 3U≦29 lbs(13kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kumpoo Pandora', 'Vot', 650000, 
80, '12/23/2025', 5, 3, 
548597, N'- Độ cứng: Trung bình. - Trọng lượng: 5U. - Điểm cân bằng: 302 +- 5 mm. - Chu vi cán vợt: G6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Nanoflare Wex', 'Vot', 1750000, 
72, '7/6/2025', 6, 4, 
1459158, N'- Màu sắc: Trắng. - Độ cứng: Trung Bình. - Khung vợt: HT Graphite,Nanocell NEO. - Trọng lượng: 4U (Avg 83g). - Chu vi cán vợt: G4, G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set Vợt Cầu Lông Felet Woven Eighty 8', 'Vot', 2650000, 
55, '7/26/2025', 9, 9, 
2640167, N'- Được thiết kế 88 lỗ thêm số lượng 12 lỗ so với tiêu chuẩn, làm tăng mật độ dây mà không làm tăng diện tích bề mặt vợt, mở rộng điểm ngọt tăng hiệu suất cho người chơi một cách hiệu quả. Khung vợt được thiết kế vành vợt hình lục giác, giúp tăng tốc độ vung vợt, có chịu được lực căng tối đa 35 lbs đảm bảo về độ bền. Được sử dụng thêm công nghệ Nano Booster Tube là kỹ thuật phân tán siêu âm chân không có tính cơđộng cao, làm cho toàn bộ thân vợt bền hơn và phần khung vợt có thể chiệu được lực căng cao hơn nhiều.. - Trọng lượng: 3U, 4U. - Độ cứng: Trung bình. - Điểm cân bằng: 295 +- 3mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo Sakura', 'Vot', 650000, 
74, '9/7/2025', 2, 3, 
555333, N'- Điểm cân bằng: 295 ± 5mm. - Độ cứng: Trung bình. - Trọng lượng: 4U (82 ± 2g).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Chucker', 'Vot', 550000, 
50, '11/21/2025', 4, 9, 
502856, N'Khung vợt và thân vợt được làm từ vật liệu Carbon Graphie giúp vợt có độ bền bỉ tốt bởi sức căng tối đa mà cây vợt có thể chịu được lên đến tận 31lbs.. - Trọng lượng: 4U. - Điểm cân bằng: 290±5 mm. - Sức căng tối đa: 31lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Vicleo Power 2', 'Vot', 490000, 
22, '7/16/2025', 5, 8, 
476022, N'- Trọng lượng: 4U. - Điểm cân bằng: 296 +-3mm. - Độ cứng: Trung Bình. Khung vợt trang bị lỗ gen cải tiến mới giúp bảo vệ dây vợt khỏi ma sát và tránh dãn dây khi sử dụng, nâng cao cảm giác đánh chuẩn xác và cung cấp sức mạnh ổn định, kéo dài tuổi thọ dây đáng kể..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Halbertec 9000', 'Vot', 5200000, 
78, '11/4/2025', 3, 2, 
4775052, N'- Màu sắc: Đen phối tím, xanh lá. - Trọng lượng: 3U, 4U. - Độ cứng đũa: Siêu cứng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Taro Power E80', 'Vot', 399000, 
59, '10/24/2025', 9, 18, 
309758, N'- Màu sắc: Xanh/Tím. - Độ cứng đũa: Trung bình. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Điểm cân bằng: 295.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'SET Vợt cầu lông Yonex NanoFlare FL New 2024', 'Vot', 3500000, 
31, '5/1/2025', 2, 4, 
2672216, N'- Điểm cân bằng: 296 +-2 mm. - Độ cứng đũa: Cứng trung bình. - Trọng lượng: 4U (80 - 84g). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm. - Sức căng tối đa: 28lbs (12,5kg)..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'SET Vợt cầu lông Yonex Astrox SV New 2024', 'Vot', 3500000, 
74, '4/10/2025', 2, 4, 
2972275, N'- Điểm cân bằng: 308mm. - Độ cứng đũa: Cứng trung bình. - Trọng lượng: 4U (80 - 84g). - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675mm. - Sức căng tối đa: 28lbs (12,5kg)..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Taro Power E70', 'Vot', 499000, 
61, '8/1/2025', 8, 18, 
450277, N'- Màu sắc: Xanh/Trắng hồng. - Độ cứng đũa: Trung bình. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Điểm cân bằng: 295.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS YouLong', 'Vot', 1240000, 
67, '8/22/2025', 8, 6, 
882199, N'- Độ cứng: Trung bình. - Điểm cân bằng: 305 ± 3mm. - Trọng lượng: 4U ( 82 ± 2g ). - Sức căng tối đa: 36LBS.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor ARS 90K Metallic', 'Vot', 3400000, 
26, '9/28/2025', 4, 1, 
2663355, N'Thân vợt cứng giúp hỗ trợ lực cho người chơi, có điểm cân bằng 295mm hướng tới lối chơi linh hoạt công thủ toàn diện, linh hoạt chuyển đổi từ tấn công sang phòng thủ một cách nhanh chóng.. - Độ cứng: Cứng. - Điểm cân bằng: 295mm. - Sức căng tối đa: 3U ≦ 31 lbs(14kg). - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor TK-Ryuga Metallic Tặng Vợt Victor ARS 8000 + Vợt Victor ARS 9000', 'Vot', 5690000, 
9, '4/14/2025', 1, 1, 
4434998, N'- Tổng thể, đũa vợt cầu lông Victor TK-Ryuga Metallic được trang bị thêm một lớp phủ kim loại Metallic giúp hạn chế tối đa rung lắc cho người chơi.Với việc sử dụng vật liệu trục Pyrofil giúp vợt trở nên cứng cáp hơn mang lại khả năng xử lý cầu nhạy bén. Khung vợt hình hộp Power Box với cạnh cứng và sử dụng Metallic Carbon Fiber mang lại độ bền và khả năng chịu lực lên đến 14.5kg, làm tăng hiệu suất của cây vợt trong những tình huống tấn công. Hệ thống tăng cường sức mạnh WES 2.0 hứa hẹn sẽ tạo ra những pha đập cầu sắc bén và khó dự đoán.. - Độ cứng: Cứng. - Điểm cân bằng: 305 +/- 5 mm ( Nặng đầu). - Sức căng tối đa: 3U: 32lbs ( 14,5 kg). - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. Khung vợt được thiết kế cứng cáp, bền bỉ, cung cấp độ chính xác và hiệu quả khi người chơi thực hiện nhồi cầu, smash cầu liên tục áp đảo sân cầu đối phương..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex NanoFlare 555', 'Vot', 3349000, 
97, '3/3/2025', 2, 4, 
2940899, N'được thiết kế dành cho lối chơi công thủ toàn diện, hơi thiên công với điểm cân bằng ở mức 295 +- 2mm hơi nặng đầu hỗ trợ người chơi có những cú đập thêm phần cắm và uy lực. Độ cứng trung bình giúp người chơi không quá khó để làm để làm quen và kiểm soát.. - Điểm cân bằng: 295 +- 2mm. - Độ cứng đũa: Trung bình. - Trọng lượng: 4U (80 - 84g). - Chu vi cán vợt: G5. - Sức căng tối đa: 28lbs (12,5kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Tập Điểm Ngọt IXE Power Area 900', 'Vot', 450000, 
32, '10/26/2025', 7, 19, 
426862, N'- Điểm cân bằng: 295 +- 5 mm. - Trọng lượng: 5U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor TK-F Ultra', 'Vot', 3400000, 
15, '11/18/2025', 6, 1, 
2738122, N'- Độ cứng: Dẻo. - Khung vợt: High Resilience Modulus Graphite + HARD CORED TECHNOLOGY. - Thân vợt : High Resilience Modulus Graphite + Metallic Carbon Fiber + PYROFIL + 5.8 SHAFT. - Trọng lượng: 3U, 4U. - Điểm cân bằng: Nhẹ đầu. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex NanoFlare 370 Speed', 'Vot', 1919000, 
80, '7/11/2025', 3, 4, 
1646511, N'- Điểm cân bằng: 286 +- 5mm. - Độ cứng đũa: Trung bình. - Trọng lượng: 4U, 5U. - Chu vi cán vợt: G5. - Sức căng tối đa: 27lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Mizuno Fioria Lite', 'Vot', 1560000, 
75, '3/3/2025', 1, 13, 
1342977, N'- Độ cứng: Trung Bình. - Điểm cân bằng: 295mm. - Trọng lượng: 5U. - Chiều dài tổng thể: 675mm. - Sức căng tối đa: 28lbs (12,5kg). - Màu sắc: trắng hồng, trắng tím, trắng xanh lá, trắng xanh ngọc.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Aeronaut 9000C', 'Vot', 4850000, 
68, '2/27/2025', 7, 2, 
4114867, N'- Trọng lượng: 88g (W3). - Điểm cân bằng: 298mm. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Dynalite 770', 'Vot', 1610000, 
85, '2/11/2025', 8, 13, 
1133723, N'- Độ cứng: Dẻo. - Điểm cân bằng: Nặng đầu. - Trọng lượng: 5U. - Sức căng tối đa: < 11,5 kg.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Duralite 69', 'Vot', 1600000, 
37, '10/4/2025', 9, 1, 
1466610, N'- Độ cứng: Dẻo. - Điểm cân bằng: Nặng đầu. - Trọng lượng: 5U. - Sức căng tối đa: < 11,5 kg.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Dynalite 780', 'Vot', 1610000, 
11, '4/1/2025', 9, 13, 
1212497, N'- Độ cứng: Dẻo. - Điểm cân bằng: Nặng đầu. - Trọng lượng: 5U. - Sức căng tối đa: < 11,5 kg.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare 700 Tour', 'Vot', 2669000, 
80, '12/29/2025', 9, 4, 
1972996, N'- Độ cứng: Trung Bình. - Trọng lượng: 5U: 19 - 27 lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare 700 Game', 'Vot', 1919000, 
66, '6/6/2025', 8, 4, 
1405820, N'- Trọng lượng: 4U5, 6: 20 - 28 lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor DX-10 Metalic Tặng Vợt Victor DX9999 + Vợt Victor ARS 8000 + Vợt Kawasaki Aurora', 'Vot', 5330000, 
46, '7/7/2025', 8, 1, 
4800944, N'- Điểm cân bằng: Nặng đầu (303 mm). - Điểm swing weight: 89 kg/cm2. - Độ cứng: Cứng. - Trọng lượng: 3U, 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare 700 Play', 'Vot', 1339000, 
17, '7/8/2025', 3, 4, 
1288956, N'- Trọng lượng: 4U5: 20 - 28 lbs. - Điểm cân bằng: Cân bằng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Prokennex Dragon', 'Vot', 598000, 
62, '10/19/2025', 10, 17, 
458019, N'- Trọng lượng: 4U ~ 85 gam. - Sức căng tối đa: 28 lbs (12.7kg). - Màu sắc : Xanh dương, Cam, Xám, Trắng, Trắng đỏ. - Độ cứng: Trung bình. : Thân vợt được phủ Titan giúp vợt được trợ lực tốt hơn và mạnh hơn..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor TK-F Ultra Tặng Vợt Victor DX9999 + Vợt Victor ARS 8000', 'Vot', 5830000, 
53, '7/23/2025', 3, 1, 
4169048, N'- Độ cứng: Dẻo. - Khung vợt: High Resilience Modulus Graphite + HARD CORED TECHNOLOGY. - Thân vợt : High Resilience Modulus Graphite + Metallic Carbon Fiber + PYROFIL + 5.8 SHAFT. - Trọng lượng: 3U, 4U. - Điểm cân bằng: Nhẹ đầu. - Chu vi cán vợt: 5G.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor Mjolnir Metallic Limited 2024', 'Vot', 4650000, 
78, '9/15/2025', 8, 1, 
3452804, N'Khung vợt được phủ lên bởi các họa tiết sấm sét cùng với gam màu xanh phối hợp với đen, là nét đặc trưng của chiếc búa trong loạt phim đình đám này, thân vợt có thêm những họa tiết tạo hình cán búa làm tổng thể cây vợt có một ngoại hình mạnh mẽ, độc đáo.. - Độ cứng: Cứng. - Điểm cân bằng: Nặng đầu. - Chiều dài tổng thể: 675mm. - Khung vợt: High ResilienceModulus Graphite+Metallic Carbon Fiber+HARD CORED TECHNOLOGY. - Thân vợt: High Resilient Modulus Graphite+6.8 SHAFT. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: ≦30 lbs(13.5kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Bladex 700', 'Vot', 3300000, 
24, '2/23/2025', 10, 2, 
2864592, N'- Khung vợt: CARBON FIBER. - Thân vợt: M46 + ULTRA CARBON. - Trọng lượng: 3U ,4U, 5U. - Điểm cân bằng: 292mm (3U), 296 mm (4U), 302mm (5U). - Độ cứng đũa: Cứng. - Chiều dài tổng thể vợt: 675mm. - Chu vi cán vợt: S1 (G6). - Sức căng tối đa: 30 LBS (14kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Windstorm 72 Power', 'Vot', 2450000, 
82, '3/2/2025', 6, 2, 
2146806, N'- Có phong cách phối màu sặc sỡ cùng các chi tiết được làm tỉ mỉ tạo nên độ nổi bật, hiện đại và năng động. Được trang bị các công nghệ tiên tiến như Super Light là công nghệ vật liệu siêu nhẹ, kết hợp với công nghệ TB Nano đảm bảo độ đàn hồi và độ bền. Khung vợt được tích hợp công nghệ Dynamic Optimus Frame tối ưu khung hình động lực học, giúp tăng cường tốc độ linh hoạt cho tấn công và phòng thủ.. - Độ cứng: Dẻo. - Trọng lượng: 6U. - Chu vi cán vợt: G6. - Sức căng tối đa: 13.5kg.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Axforce Cannon Pro', 'Vot', 1940000, 
72, '5/15/2025', 8, 2, 
1892867, N'- Độ cứng: Trung bình. - Điểm cân bằng: 296mm. - Trọng lượng: 4U, 5U. - Chu vi cán vợt: G5. - Sức căng tối đa: 28 lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Turbo Charging Marshal', 'Vot', 1890000, 
44, '12/25/2025', 7, 2, 
1732067, N'- Màu sắc: Đen, Trắng. - Khung vợt: Dynamic Optimum Frame. - Trọng lượng: 3U, 4U. - Độ cứng đũa: Dẻo.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Astrox 88S Pro 2024', 'Vot', 4529000, 
86, '9/5/2025', 9, 4, 
3694848, N'- Độ cứng: Cứng. - Điểm cân bằng: 298mm. - Trọng lượng / Cán vợt: 4U (Trung bình 83g)/G5,6;.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Yonex Astrox 88D Pro 2024', 'Vot', 4529000, 
59, '7/27/2025', 1, 4, 
3202689, N'mang đến một thiết kế mới hoàn toàn với màu sơn đen – bạc độc đáo, kết hợp với họa tiết xanh dương tinh tế, tạo nên vẻ đẹp hiện đại và thu hút. Với chiều dài vợt được kéo dài hơn 10mm, vợt tập trung sức mạnh và cung cấp phản đòn uy lực. Khung vợt mở rộng vùng điểm ngọt, tăng cường cảm giác và ổn định trong mỗi cú đánh.. - Độ cứng: Cứng. - Điểm cân bằng: 301mm (nặng đầu). - Trọng lượng / Cán vợt: 4U (Trung bình 83g)/G5,6;. - Màu sắc: Đen / Bạc. - Trọng lượng 4U phù hợp cho người có lực cổ tay trung bình, trong khi trọng lượng 3U dành cho những người có lực cổ tay khoẻ..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Halbertec Motor', 'Vot', 1100000, 
95, '7/4/2025', 3, 2, 
1079030, N'- Độ cứng: Trung bình. - Trọng lượng: 84g (4U). - Sức căng tối đa: 30 Lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Aeronaut 7000B', 'Vot', 4050000, 
93, '5/13/2025', 1, 2, 
3376970, N'- Thân vợt có độ cứng trung bình cho cảm giác vung vợt nhanh và chắc chắn hơn. Hạn chế được tối đa cảm giác rung lắc hay xoắn vặn vợt sau mỗi cú đánh và cảm giác ổn định hơn dù điểm tiếp xuc giữ vợt và cầu không nằm trong điểm ngọt của mặt khung.. - Độ cứng: Trung bình. - Trọng lượng: 87g (W3). - Điểm cân bằng: 298mm (Hơi nặng đầu). - Chu vi cán vợt: S1 (G6). - Màu sắc: Xanh Dương phối Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare 1000Z', 'Vot', 5099000, 
64, '1/15/2025', 5, 4, 
3693723, N'ới thiết kế nhẹ đầu, mang lại sự nhẹ nhàng và linh hoạt trong mỗi cú đánh. Trọng lượng nhẹ giúp bạn xoay chuyển vợt một cách nhanh chóng và dễ dàng. Đồng thời, điểm cân bằng ở phía đầu vợt giúp những pha đập cầu nhanh và uy lực. Với cây vợt này, bạn có thể đánh bại đối thủ với những pha cầu nhanh như chớp.. - Màu sắc: Đen - Vàng (Lightning Yellow). - Độ cứng:  Siêu Cứng (Extra Stiff). - Khung vợt: HM Graphite,NANOMETRIC DR,M40X,EX-HYPER MG. - Thân vợt : HM Graphite / Ultra PE FIBER. - Trọng lượng: 4U (Avg 83g). - Chu vi cán vợt: 4UG5, 4UG6, 3UG4, 3UG5, 3UG6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Calibar 900B', 'Vot', 4690000, 
42, '2/5/2025', 6, 2, 
3520993, N'- Độ cứng: Trung bình.. - Điểm cân bằng: 292 mm (Cân Bằng). - Điểm swing weight: 87 kg/cm2. - Trọng lượng: 3U. - Chu vi cán vợt: S2 (G5). - Sức căng tối đa: 32LBS.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Calibar 900', 'Vot', 3939000, 
44, '6/19/2025', 5, 2, 
3057356, N'- Thân vợt có độ cứng cao cho cảm giác vung vợt nhanh và chắc chắn hơn. Hạn chế được tối đa cảm giác rung lắc hay xoắn vặn vợt sau sau mỗi cú đánh và cảm giác ổn định hơn dù điểm tiếp xúc giữ vợt và cầu không nằm trong điểm ngọt của mặt khung.. - Độ cứng: Cứng. - Khung vợt: Military Grade Carbon Fiber. - Thân vợt: Military Grade Carbon Fiber. - Trọng lượng: W2 81-85 grams. - Chu vi cán vợt: S2, Small 3 1/4"/82.6mm. - Sức căng tối đa: Dọc 26-30 lbs, Ngang 28-32 lbs. - Điểm cân bằng: 308 mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Bladex 900', 'Vot', 4080000, 
84, '1/7/2025', 2, 2, 
3680157, N'- Khung vợt: MED High Elastic Carbon. - Thân vợt: Fiber M46 + ULTRA High Elastic Carbon Fiber. - Độ cứng: Trung bình. - Trọng lượng: 3U, 4U. - Điểm cân bằng: 290mm. - Điểm swing weight: 85 kg/cm2.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Altius 5.3 Ryũjin', 'Vot', 3640000, 
74, '1/2/2025', 6, 13, 
3210444, N'- Độ cứng đũa: Cứng. - Điểm cân bằng: Nặng đầu. - Trọng lượng: 4U. là công nghệ thân vợt được Mizuno áp dụng lên các dòng vợt Fortius, Altius của hãng. Thân vợt nhỏ hơn các vợt thông thường giúp giảm lực cản, cho khả năng đàn hồi cao hơn. Ngoài ra công nghệ này còn làm giảm trọng lượng tổng thể của vợt, tăng khả năng linh hoạt..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor TK-FC LTD Tặng Vợt Victor ARS 9000 + Vợt Victor TK220H II + Vợt Kawasaki Aurora', 'Vot', 5330000, 
33, '10/10/2025', 3, 1, 
4787897, N'- Độ cứng: Cứng. - Khung vợt: High Resilience Modulus Graphite + Nano Fortify TR + HARD CORED TECHNOLOGY. - Thân vợt: High Resilience Modulus Graphite + PYROFIL + 6.5 SHAFT. - Điểm cân bằng:  Nặng đầu. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 31LBS (14KG). - Chiều dài tổng thể: 675mm. - Điểm swing weight: 87 kg/cm2. - Màu sắc: Trắng nhám phối Gold.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare Starbucks', 'Vot', 1590000, 
71, '4/14/2025', 6, 4, 
1317647, N'- Có điểm cân bằng nhẹ đầu, thích hợp dành cho những người chơi có lối đánh công thủ toàn diện, thiên về phản tạt, điều cầu. Độ cứng đũa trung bình hỗ trợ lực, trọng lượng 4U không quá khó để làm quen và kiểm soát, nhất là với những người chơi mới.. - Độ cứng đũa: Trung bình. - Điểm cân bằng: Nhẹ đầu. - Trọng lượng: 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Proace Stroke 318III', 'Vot', 1000000, 
53, '5/28/2025', 3, 16, 
729448, N'- Khung vợt: Graphite. - Độ cứng: Hơi dẻo. - Điểm cân bằng: Cân bằng. - Trọng lượng / Cán cầm: 4U / G2 (~G4 Yonex). Khung vợt được mở rộng theo dạng vuông (tương tự ISOMETRIC của Yonex) giúp tăng diện tích điểm ngọt, hỗ trợ người chơi đánh cầu dễ dàng hơn..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Fortius 55 Strive', 'Vot', 3842000, 
66, '6/10/2025', 8, 13, 
3756771, N'có điểm cân bằng nặng đầu, là mẫu vợt cao cấp được thiết kế cho lối chơi thiên công, smash cầy đầy uy lực và chính xác. Độ cứng đũa ở mức cứng,thích hợp cho những người chơi lâu năm, có cổ tay khỏe mới có thể điều khiển và kiểm soát vợt.. - Độ cứng đũa: Cứng. - Điểm cân bằng: Nặng đầu. - Trọng lượng: 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Fortius 50 Swift', 'Vot', 2817000, 
15, '5/22/2025', 10, 13, 
1992617, N'- Độ cứng: Cứng. - Trọng lượng: 5U. - Chu vi cán vợt: G5. - Chiều dài tổng thể: 675 mm. - Sức căng tối đa: 30LBS - Khoảng 13,6kg.. - Điểm cân bằng: Head Heavy -[]-l-l-I-I- Head Light (Siêu Nặng Đầu). Thân vợt nhỏ hơn các vợt thông thường giúp giảm lực cản, cho khả năng đàn hồi cao hơn. Ngoài ra còn làm giảm trọng lượng tổng thể của vợt, tăng khả năng linh hoạt..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno XYST 07', 'Vot', 3033000, 
41, '10/9/2025', 5, 13, 
2973580, N'có điểm cân bằng nặng đầu, là mẫu vợt cao cấp được thiết kế cho lối chơi thiên công, smash cầy đầy uy lực. Độ cứng đũa ở mức trung bình,thích hợp cho những người chơi có cổ tay ổn mới có thể điều khiển và kiểm soát vợt.. - Độ cứng đũa: Trung bình. - Điểm cân bằng: Nặng đầu. - Trọng lượng: 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare 700 Pro 2024', 'Vot', 4199000, 
7, '10/22/2025', 5, 4, 
3500689, N'- Độ cứng: Trung Bình. - Trọng lượng: 5U: 19 - 27 lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Mizuno Altius 5.1 Kinryũ', 'Vot', 3640000, 
99, '5/3/2025', 5, 13, 
3332247, N'- Độ cứng đũa: Cứng. - Điểm cân bằng: Nặng đầu. - Trọng lượng: 4U. là công nghệ thân vợt được Mizuno áp dụng lên các dòng vợt Fortius, Altius của hãng. Thân vợt nhỏ hơn các vợt thông thường giúp giảm lực cản, cho khả năng đàn hồi cao hơn. Ngoài ra công nghệ này còn làm giảm trọng lượng tổng thể của vợt, tăng khả năng linh hoạt..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Titan 6', 'Vot', 570000, 
56, '1/22/2025', 5, 6, 
402693, N'- Độ cứng: Trung bình. - Điểm cân bằng: 290 mm. - Trọng lượng / Cán cầm: 4U / G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Titan 9', 'Vot', 570000, 
42, '4/15/2025', 10, 6, 
561933, N'- Độ cứng: Trung bình. - Điểm cân bằng: 300 +- 3 mm. - Trọng lượng / Cán cầm: 4U / G5. Khung vợt cầu lông VS Titan 9 được vát ở các cạnh tạo nên cấu trúc khung có hình lục giác giúp giảm lực cản không khí. Giúp tăng cường cho mỗi cú đập để tạo nên một dòng vợt thiên công hiệu quả..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Bladex 500', 'Vot', 2250000, 
100, '2/18/2025', 6, 2, 
1630231, N'- Khung vợt: CARBON FIBER. - Độ cứng đũa: Cứng. - Điểm cân bằng: 295mm. - Trọng lượng: 3U/ 4U. - Chiều dài tổng thể vợt: 675mm. - Điểm swing weight: 4U 84 kg/cm2. - Chu vi cán vợt: 3UG5. - Sức căng tối đa: 28LBS (12,7kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Titan 5', 'Vot', 570000, 
32, '7/29/2025', 1, 6, 
522284, N'- Độ cứng: Trung bình. - Điểm cân bằng: 290 +- 3 mm. - Trọng lượng / Cán cầm: 4U / G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kamito Novablitz Pro', 'Vot', 1999000, 
80, '7/19/2025', 3, 15, 
1585337, N'- Độ cứng: Dẻo.. - Điểm cân bằng: Cân bằng. - Trọng lượng: 3U, 4U. - Chiều dài tổng thể: 675 mm..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Lining Axforce 10', 'Vot', 950000, 
35, '4/18/2025', 7, 2, 
752336, N'- Độ cứng: Trung bình. - Điểm cân bằng: 295 +- 5mm. - Sức căng tối đa: 29lbs. - Trọng lượng: 3U, 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Axforce Cannon', 'Vot', 980000, 
21, '8/25/2025', 6, 2, 
813184, N'- Độ cứng: Trung bình. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Sức căng tối đa: 31 LBS ~ 14.3kg.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Woven 1000', 'Vot', 2950000, 
46, '5/30/2025', 7, 9, 
2456659, N'- Khung vợt được tích hợp công nghệ ISOTECH giúp khung có dạng đầu hình vuông, giúp mở rộng điểm ngọt, hỗ trợ người chơi dễ dàng đánh chính xác hơn ngay cả khi điểm tiếp xúc cầu không nằm ở giữa, giảm việc đánh lỗi và mang đến cảm giác chắc, tăng độ chính xác và độ ổn định cho người chơi. Vợt chịu được mức căng cao lên tới 38 lbs mà không bị biến dạng nhờ khả năng gia cố khung vợt, tạo nên độ bền chắc chắn.. - Điểm cân bằng: 295 ± 3 mm. - Độ cứng: Cứng. - Khung vợt: ISOTECH. - Trọng lượng: 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor THRUSTER RYUGA CLS', 'Vot', 1530000, 
18, '12/13/2025', 6, 1, 
1459760, N'- Thân vợt: High Resilience Graphite + Nano Resin + 6.8 SHAFT. - Khung vợt: High Resilience Graphite + Nano Resin. - Điểm cân bằng: 307mm. - Độ cứng: Cứng. - Trọng lượng: 4U: ≤ 30 lbs (13.5 kg). - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Woven 100 Pro (Black/Blue) chính hãng', 'Vot', 2970000, 
57, '1/25/2025', 5, 9, 
2912074, N'Khung vợt được làm có thể chịu được mức căng cao lên tới 38 lbs mà không bị biến dạng nhờ khả năng gia cố khung vợt, tạo nên độ bền chắc chắn. Đ. - Điểm cân bằng: 295 ± 3 mm. - Độ cứng: Cứng. - Trọng lượng: 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Felet Woven 100 Pro (Black/Green) chính hãng', 'Vot', 2970000, 
64, '11/26/2025', 7, 9, 
2239925, N'Khung vợt được làm có thể chịu được mức căng cao lên tới 38 lbs mà không bị biến dạng nhờ khả năng gia cố khung vợt, tạo nên độ bền chắc chắn. Đ. - Điểm cân bằng: 290 ± 3 mm. - Độ cứng: Cứng. - Trọng lượng: 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set vợt cầu lông Lining Halbertec 9000 Limited - Olympic Paris 2024', 'Vot', 12300000, 
11, '1/26/2025', 2, 2, 
9674019, N'- Trọng lượng: 3U, 4U. - Độ cứng đũa: Siêu cứng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Arcsaber 2 Ability', 'Vot', 1139000, 
7, '2/21/2025', 8, 4, 
813362, N'- Độ cứng: Siêu dẻo. - Màu sắc: Black / Pink. - Trọng lượng: 4U. - Chu vi cán vợt: G5,6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Arcsaber 2 Clear', 'Vot', 1139000, 
13, '6/5/2025', 9, 4, 
898656, N'- Độ cứng: Siêu dẻo. - Màu sắc: Black / Pink. - Trọng lượng: 4U. - Chu vi cán vợt: G5,6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Arcsaber 2 Feel', 'Vot', 1139000, 
8, '10/30/2025', 3, 4, 
1121344, N'- Độ cứng: Siêu dẻo. - Màu sắc: Black / Pink. - Trọng lượng: 4U. - Chu vi cán vợt: G5,6.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare 001A 2024', 'Vot', 959000, 
71, '3/22/2025', 4, 4, 
888885, N'- Độ cứng: Siêu dẻo (Hi-Flex). - Khung vợt: Graphite. - Thân vợt :  Graphite. - Điểm cân bằng: Cân bằng. - Trọng lượng: 5U (Avg 78g). - Chu vi cán vợt: G4,5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor TK - TTY Ultima Tặng Vợt Victor ARS 8000 + Vợt Victor ARS 9000', 'Vot', 6050000, 
56, '4/13/2025', 6, 1, 
4382981, N'- Được tích hợp nhiều các công nghệ tiên tiến và tối tân nhất của hãng như Hard Cored Technology, Free Core…cung cấp cho người chơi hiệu suất cao nhất. Khung vợt đặc biệt sử dụng kết hợp những đặc tính mạnh mẽ và tối ưu nhất của ba kiểu khung Power Box, Diamond Aero và Aero Frame cho khả năng linh hoạt và gia tăng độ kiểm soát cho nguồi chơi.. - Độ cứng: Cứng. - Khung vợt: High Resilience Modulus Graphite + HARD CORED TECHNOLOGY. - Thân vợt: High Resilience Modulus Graphite + PYROFIL+6.5 SHAFT. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 31 LBS. - Điểm cân bằng: Nặng đầu.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare 001F 2024', 'Vot', 959000, 
8, '1/14/2025', 5, 4, 
740343, N'- Độ cứng: Siêu dẻo (Hi-Flex). - Khung vợt: Graphite. - Thân vợt :  Graphite. - Điểm cân bằng: Cân bằng. - Trọng lượng: 5U (Avg 78g). - Chu vi cán vợt: G4,5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare 001C 2024', 'Vot', 959000, 
62, '12/3/2025', 4, 4, 
722460, N'- Độ cứng: Siêu dẻo (Hi-Flex). - Khung vợt: Graphite. - Thân vợt :  Graphite. - Điểm cân bằng: Cân bằng. - Trọng lượng: 5U (Avg 78g). - Chu vi cán vợt: G4,5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor TK - TTY Ultima', 'Vot', 3800000, 
37, '7/7/2025', 1, 1, 
2842412, N'- Được tích hợp nhiều các công nghệ tiên tiến và tối tân nhất của hãng như Hard Cored Technology, Free Core…cung cấp cho người chơi hiệu suất cao nhất. Khung vợt đặc biệt sử dụng kết hợp những đặc tính mạnh mẽ và tối ưu nhất của ba kiểu khung Power Box, Diamond Aero và Aero Frame cho khả năng linh hoạt và gia tăng độ kiểm soát cho nguồi chơi.. - Độ cứng: Cứng. - Khung vợt: High Resilience Modulus Graphite + HARD CORED TECHNOLOGY. - Thân vợt: High Resilience Modulus Graphite + PYROFIL+6.5 SHAFT. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 31 LBS. - Điểm cân bằng: Nặng đầu.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Câu Lông Kumpoo Flower Partner Pro', 'Vot', 620000, 
53, '10/20/2025', 10, 3, 
523835, N'- Độ cứng: Trung bình. - Trọng lượng: 82 + - 2 g ( 4U ). - Chu vi cán vợt: G5. - Điểm cân bằng: 290 +- 5 mm ( Cân bằng).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victec Woven Power chính hãng', 'Vot', 2200000, 
1, '1/21/2025', 4, 20, 
1929492, N'- Độ cứng đũa: Trung bình. - Trọng lượng: 3U. - Chu vi cán vợt: G5. - Sức căng tối đa: 30 lbs. - Độ cứng đũa: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victec Woven Titanium chính hãng', 'Vot', 2500000, 
14, '4/24/2025', 2, 20, 
2108738, N'- Độ cứng đũa: Trung bình. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 30 lbs. - Độ cứng đũa: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Prokennex Laser 7Z Power chính hãng', 'Vot', 7270000, 
67, '3/15/2025', 6, 17, 
5168864, N'- Độ cứng: Cứng Trung bình. - Khung vợt: Khung hộp 8 cạnh sử dụng công nghệ Hybrid lai tấm carbon kết hợp bột carbon cao cấp. - Trọng lượng: 4U1 (81-85gr). - Điểm cân bằng: 298 ± 3mm. - Độ cứng đũa: Cứng trung bình. - Khung vợt dạng hộp sử dụng vật liệu lai kết hợp giữa sợi carton cao cấp và bột carton ứng suất cao giúp hạn chế tối đa bọt khí siêu nhỏ trong carbon thành phẩm, từ đó khung vợt trở nên tinh khiết và truyền tải hết sức mạnh đến quả cầu cao hơn.. - Phần đỉnh khung vợt dày hơn 1 chút để giúp người chơi tạo ra những cú đập liên tục siêu mạnh và uy lực. Thân vợt đường kính chỉ 6.5mm sử dụng carbon lai 46 tấn giúp tạo ra lực nảy và độ đàn hồi siêu mạnh..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Aeronaut 6000', 'Vot', 1950000, 
81, '5/28/2025', 8, 2, 
1917307, N'- Thân vợt có độ cứng trung bình cho cảm giác vung vợt nhanh và chắc chắn hơn. Hạn chế được tối đa cảm giác rung lắc hay xoắn vặn vợt sau mỗi cú đánh và cảm giác ổn định hơn dù điểm tiếp xuc giữ vợt và cầu không nằm trong điểm ngọt của mặt khung.. - Độ cứng: Trung bình. - Khung vợt: Commercial Grade Carbon Fiber. - Thân vợt: Commercial Grade Carbon Fiber. - Trọng lượng: 87g (W3). - Điểm cân bằng: 290mm +/- 5 (Nhẹ đầu). - Chu vi cán vợt: S1 (G6). - Màu sắc: Xanh phối Cam.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Redson Shape SG', 'Vot', 4000000, 
95, '2/23/2025', 4, 21, 
3706763, N'- Độ cứng: Trung bình. - Trọng lượng: 3U, 4U, 5U ( Với phiên bản màu trắng sẽ có thêm trọng lượng 5U). - Sức căng tối đa: 3U 28 lbs, 4U và 5U 26 lbs. - Điểm cân bằng: 3U (285-290mm), 4U (290-295mm), 5U (295-300mm).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Aeronaut 6000C', 'Vot', 1950000, 
2, '8/29/2025', 6, 2, 
1655389, N'- Thân vợt có độ cứng trung bình cho cảm giác vung vợt nhanh và chắc chắn hơn. Hạn chế được tối đa cảm giác rung lắc hay xoắn vặn vợt sau mỗi cú đánh và cảm giác ổn định hơn dù điểm tiếp xuc giữ vợt và cầu không nằm trong điểm ngọt của mặt khung.. - Độ cứng: Trung bình. - Khung vợt: Military Grade Carbon Fiber. - Thân vợt: Military Grade Carbon Fiber. - Trọng lượng: 87g (W3). - Điểm cân bằng: 295 mm (Hơi nặng đầu). - Chu vi cán vợt: S1 (G6). - Màu sắc Aeronaut 6000C: Xanh đen/ Đỏ/ Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Aeronaut 6000I', 'Vot', 2190000, 
28, '8/14/2025', 2, 2, 
1610730, N'- Độ cứng: Trung bình. - Khung vợt: Military Grade Carbon Fiber. - Thân vợt: Military Grade Carbon Fiber. - Trọng lượng: 79+-3 gram (W1). - Điểm cân bằng: 315+-4 mm ( Siêu nặng đầu ). - Chu vi cán vợt: S1 (G6). - Điểm swing weight: 83 kg/cm2. - Màu sắc: Tím/ Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kamito Galaxy Play', 'Vot', 999000, 
39, '5/16/2025', 3, 15, 
859001, N'- Độ cứng: Cứng. - Khung vợt: JAPANESE T700. - Thân vợt: JAPANESE T700. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Điểm cân bằng: 295 +/- 3mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Kamito Galaxy Pro', 'Vot', 1499000, 
77, '6/16/2025', 9, 15, 
1274191, N'- Độ cứng: Cứng. - Khung vợt: JAPANESE 40T. - Thân vợt: Japanes Ultra Carbon. - Trọng lượng: 4U. - Chu vi cán vợt: G5. - Điểm cân bằng: 280 +/- 2mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Redson RG08 AQ', 'Vot', 4350000, 
73, '6/6/2025', 10, 21, 
3258953, N'có điểm cân bằng ở mức cân bằng, hướng đến những người chơi có lối đánh công thủ toàn diện. Thân vợt cứng mang lại khả năng phản tạt tối ưu, yêu cầu người chơi phải có lực tay tốt, trình độ trung bình trở lên.. - Màu sắc được làm hài hòa cùng các chi tiết được làm tỉ mỉ, tạo độ nổi bật và hiện đại.. - Độ cứng: Cứng. - Trọng lượng: 4U. - Sức căng tối đa:. - Điểm cân bằng: 290 - 295mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Set Vợt Cầu Lông Victor TK-CNY GB Tặng Vợt Victor DX 3H + Vợt Victor ARS 9000', 'Vot', 6025000, 
72, '1/10/2025', 4, 1, 
4270824, N'Được thiết kế hướng đến những người chơi có lối đánh tấn công, đập cầu đầy mạnh mẽ và uy lực. Thân vợt siêu cứng, đem lại khả năng kiểm soát và sức mạnh vượt trội nhưng yêu cầu người chơi phải có cổ tay khỏe mới có thể phát huy được hết khả năng của vợt.. Khung vợt hình hộp Power Box với cạnh cứng mang lại độ bền và khả năng chịu lực lên đến 14.5kg, làm tăng hiệu suất của vợt và đảm bảo độ bền bỉ.. - Độ cứng: Siêu cứng. - Điểm cân bằng: Nặng đầu. - Sức căng tối đa: < 31lbs ( 14 kg). - Trọng lượng: 4U. - Chu vi cán vợt: G5. Khung vợt được thiết kế cứng cáp, bền bỉ, cung cấp độ chính xác và hiệu quả khi người chơi thực hiện nhồi cầu, smash cầu liên tục áp đảo sân cầu đối phương..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Redson RG08 CQ', 'Vot', 4350000, 
98, '2/27/2025', 2, 21, 
4240965, N'có điểm cân bằng ở mức cân bằng, hướng đến những người chơi có lối đánh công thủ toàn diện. Thân vợt cứng mang lại khả năng phản tạt tối ưu, yêu cầu người chơi phải có lực tay tốt, trình độ trung bình trở lên.. - Màu sắc được làm hài hòa cùng các chi tiết được làm tỉ mỉ, tạo độ nổi bật và hiện đại.. - Độ cứng: Cứng. - Trọng lượng: 4U. - Sức căng tối đa:. - Điểm cân bằng: 290 - 295mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Mizuno Acrospeed 7', 'Vot', 3150000, 
53, '1/11/2025', 3, 13, 
2657997, N'Khung vợt được tích hợp công nghệ Enerzy Frame có thiết kế một mặt cắt ngang, giúp truyền tải lực tốt hơn, có điểm ngọt được mở rộng giúp hạn chế những cú đánh lệch tâm, tăng khả năng đánh chính xác cho người chơi. Bên cạnh đó, còn có công nghệ TORQUE TECHNOLOGY giúp người chơi truyền tải tối đa năng lượng từ người chơi đến quả cầu, các rãnh vợt được thiết kế giúp tăng khả năng chịu lực, giảm sốc để kiểm soát cầu tốt hơn.. - Điểm cân bằng: Nhẹ đầu. - Độ cứng: Dẻo. - Trọng lượng: 5U. - Chu vi cán vợt: G6. - Sức căng tối đa: 19 - 25 lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Mizuno Acrospeed 8', 'Vot', 3150000, 
58, '9/10/2025', 8, 13, 
2467985, N'Khung vợt được thiết kế với mặt cắt ngang có hình dáng chữ V, tác dụng giúp truyền tải lực tốt hơn. Điểm ngọt được mở rộng giúp hạn chế những cú đánh lệch tâm, tăng khả năng đánh chính xác cho người chơi. Bên cạnh đó, còn có công nghệ TORQUE TECHNOLOGY hỗ trợ người chơi truyền tải tối đa năng lượng từ người chơi đến quả cầu, rãnh vợt được thiết kế giúp tăng khả năng chịu lực, giảm sốc để kiểm soát cầu tốt hơn.. - Điểm cân bằng: Hơi nhẹ đầu. - Độ cứng: Dẻo. - Trọng lượng: 4U. - Chu vi cán vợt: G6. - Sức căng tối đa: 18 - 25 lbs.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Victor DX-3H 2025', 'Vot', 1249000, 
50, '10/28/2025', 5, 1, 
958361, N'- Điểm cân bằng: Cân bằng. - Độ cứng: Cứng. - Khung vợt: High Resilience Graphite. - Thân vợt: High Resilience Graphite + 6.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 3U≦31 lbs(14kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor Brave Sword 12 Pro', 'Vot', 3200000, 
76, '8/1/2025', 5, 1, 
2760879, N'High Resilience Modulus Graphite kết hợp với Nano Resin đảm bảo độ bền bỉ, cải thiện khả năng truyền lực và khả năng kiểm soát. Khung vợt được thiết kế dạng lưỡi kiếm giúp tăng tốc độ vung vợt. Trục vợt siêu mỏng (6.8 mm) giúp giảm trọng lượng nhưng vẫn đảm bảo độ cứng và ổn định.. - Điểm cân bằng: Cân bằng. - Độ cứng: Trung bình. - Khung vợt: High Resilience Modulus Graphite + Nano Resin. - Thân vợt: High Resilience Modulus Graphite + Nano Resin + 6.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: < 30 LBS.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set vợt cầu lông Victor Thruster K CNY 2025', 'Vot', 4190000, 
16, '7/14/2025', 10, 1, 
3682347, N'Được thiết kế hướng đến những người chơi có lối đánh tấn công, đập cầu đầy mạnh mẽ và uy lực. Thân vợt siêu cứng, đem lại khả năng kiểm soát và sức mạnh vượt trội nhưng yêu cầu người chơi phải có cổ tay khỏe mới có thể phát huy được hết khả năng của vợt.. Khung vợt hình hộp Power Box với cạnh cứng mang lại độ bền và khả năng chịu lực lên đến 14.5kg, làm tăng hiệu suất của vợt và đảm bảo độ bền bỉ. Đũa vợt có đường kính siêu mỏng chỉ 6,6mm giúp tăng tốc độ vung vợt, mang lại độ linh hoạt cho người chơi.. - Độ cứng: Siêu cứng. - Điểm cân bằng: Nặng đầu. - Sức căng tối đa: < 31lbs ( 14 kg). - Trọng lượng: 4U. - Chu vi cán vợt: G5. Khung vợt được thiết kế cứng cáp, bền bỉ, cung cấp độ chính xác và hiệu quả khi người chơi thực hiện nhồi cầu, smash cầu liên tục áp đảo sân cầu đối phương..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor Thruster Ryuga Muse', 'Vot', 3040000, 
89, '11/5/2025', 10, 1, 
2925257, N'Khung vợt hình hộp Power Box kết hợp với công nghệ Hard Core mang lại độ bền và khả năng chịu lực lên đến 13.5kg, làm tăng hiệu suất của cây vợt trong những tình huống tấn công. Với việc sử dụng vật liệu trục Pyrofil giúp vợt trở nên cứng cáp hơn mang lại khả năng xử lý cầu nhạy bén.. - Độ cứng: Cứng. - Điểm cân bằng: Nặng đầu. - Sức căng tối đa: < 30 lbs (13,5 kg). - Trọng lượng: 5U. - Chu vi cán vợt: G5. Khung vợt được thiết kế cứng cáp, bền bỉ, cung cấp độ chính xác và hiệu quả khi người chơi thực hiện nhồi cầu, smash cầu liên tục áp đảo sân cầu đối phương..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Nanoflare Junior', 'Vot', 1419000, 
34, '10/5/2025', 6, 4, 
1057358, N'Tổng thể vợt mang tông màu tươi sáng, cùng với các chi tiết được làm tỉ mỉ tạo độ bắt mắt cho người dùng. Khung vợt được thiết kế mở rộng điểm ngọt, giúp hạn chế những cú đánh lệch tâm, nhằm tăng cao hiệu suất cho người chơi. Có cấu trúc khung giúp giảm lực cản không khí nhằm tăng khả năng linh hoạt, cho tốc độ vung vợt nhanh hơn.. Được làm bằng vật liệu đảm bảo độ bền bỉ, cho khả năng đàn hồi, hỗ trợ lực để đánh đi xa hơn. Thân vợt siêu mỏng nhằm giảm diện tích tiếp xúc với gió, tăng độ linh hoạt cho người chơi và tốc độ đánh được tăng cao.. - Độ cứng: Siêu dẻo. - Khung vợt: Graphite, Nanocell NEO, HM Graphite. - Thân vợt : Graphite. - Trọng lượng: 4U. - Chu vi cán vợt: G7.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor TK 220H II', 'Vot', 2240000, 
38, '6/23/2025', 6, 1, 
1958208, N'- Khung vợt: Graphite+Resin+Fiber Reinforced System (FRS).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Arcsaber 0 Clear', 'Vot', 599000, 
41, '3/11/2025', 5, 4, 
593058, N'- Khung vợt được thiết kế kết hợp giữa kiểu khung Aero Frame và khung BOX Frame tạo nên một cấu trúc độc đáo để giảm lực cản của gió nhưng vẫn giữ được độ bền, đảm bảo đem lại độ xoáy nhanh và cảm giác chắc chắn trong từng cú đánh khi tiếp mặt vợt tiếp xúc với cầu. Ngoài ra ở khớp nối chữ T còn áp dụng công nghệ BUILT-IN T-JOINT, giúp tăng cường độ ổn định cho khung và giảm thiểu tình trạng xoắn vợt khi thực hiện những pha cầu nhanh, liên tục.. - Màu sắc: White/Navy. - Độ cứng: Siêu dẻo. - Trọng lượng: 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor Ryuga D Tặng Vợt Victor Auraspeed 8000 + Vợt Victor ARS 9000', 'Vot', 5330000, 
5, '10/5/2025', 8, 1, 
5273219, N'- Điểm cân bằng: Khoảng 307mm. - Độ cứng: Cứng. - Khung vợt: High Resilience Modulus Graphite+HARD CORED TECHNOLOGY. - Thân vợt: High Resilience Modulus Graphite+PYROFIL+6.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 3U ≦ 32 lbs (14.5 Kg). - Chiều dài tổng thể: 675mm. - Màu sắc: Trắng phối Cam, Đen.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor BS12 SE 55TH Tặng Vợt Victor ARS 9000 + DX3H + Áo victor T-39011 Đen', 'Vot', 5480000, 
86, '4/13/2025', 4, 1, 
4100081, N'- Khung vợt Victor BS12 SE 55TH được chế tạo từ High Resilience Modulus Graphite, kết hợp với Hard Core Technology và Nano Resin, tạo nên độ bền vượt trội và khả năng giảm chấn hiệu quả. Lớp nước sơn lì tinh tế không chỉ tăng tính thẩm mỹ mà còn bảo vệ khung vợt khỏi các tác động bên ngoài.. - Màu sắc: Xanh đen - Trắng. - Trọng lượng: 4U - G5, 3U - G5. - Điểm swing weight: 4U 85 kg/cm2. - Độ cứng: Cứng. : Khung vợt được kết hợp khả năng điều khiển của cấu trúc “hình kim cương” với sự ổn định và mượt mà của cấu trúc “hình kiếm”, khung AERO-DIAMOND giảm thiểu lực cản không khí và cải thiện độ ổn định khi xử lý cầu trong mỗi trận đấu..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor TK-F Ultra Tặng Vợt Victor ARS 9000 + Vợt Victor DX3H', 'Vot', 5830000, 
27, '1/19/2025', 6, 1, 
4125320, N'- Độ cứng: Cứng. - Khung vợt: High Resilience Modulus Graphite + HARD CORED TECHNOLOGY. - Thân vợt : High Resilience Modulus Graphite + Metallic Carbon Fiber + PYROFIL + 5.8 SHAFT. - Trọng lượng: 3U, 4U. - Điểm cân bằng: 295mm +/- 3. - Chu vi cán vợt: 5G.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Yonex Arcsaber 0 Ability', 'Vot', 599000, 
45, '7/25/2025', 1, 4, 
531321, N'- Khung vợt được thiết kế kết hợp giữa kiểu khung Aero Frame và khung BOX Frame tạo nên một cấu trúc độc đáo để giảm lực cản của gió nhưng vẫn giữ được độ bền, đảm bảo đem lại độ xoáy nhanh và cảm giác chắc chắn trong từng cú đánh khi tiếp mặt vợt tiếp xúc với cầu. Ngoài ra ở khớp nối chữ T còn áp dụng công nghệ BUILT-IN T-JOINT, giúp tăng cường độ ổn định cho khung và giảm thiểu tình trạng xoắn vợt khi thực hiện những pha cầu nhanh, liên tục.. - Màu sắc: White/Brown. - Độ cứng: Siêu dẻo. - Trọng lượng: 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor ARS 100X Tặng Vợt Victor ARS 9000 + Vợt Victor ARS 8000 + Vợt Kawasaki 3570', 'Vot', 5330000, 
21, '10/22/2025', 1, 1, 
5052687, N'- Độ cứng: Cứng trung bình. - Khung vợt: High Resilience Modulus Graphite + TR＋Nano Fortify TR＋ + HARD CORED TECHNOLOGY. - Thân vợt: High Resilience Modulus Graphite + Metallic Carbon Fiber + PYROFIL + 5.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 3U ≦ 31 lbs (14 Kg). - Điểm cân bằng: Hơi nặng đầu.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông VS Titan 10', 'Vot', 570000, 
21, '3/5/2025', 9, 6, 
412387, N'- Vợt có trọng lượng 4U, đây là trọng lượng lý tưởng cho những ai yêu thích sự linh hoạt trong lối chơi. Vợt nhẹ giúp người chơi dễ dàng kiểm soát trong các pha cầu nhanh và giảm mỏi tay khi chơi lâu. Điểm cân bằng 290 ± 3mm thích hợp với lối chơi công thủ toàn diện. Chiều dài vợt. - Độ cứng: Trung bình. - Điểm cân bằng: 290 ± 3 mm. - Trọng lượng / Cán cầm: 4U / G5. Khung vợt cầu lông VS Titan 10 được vát ở các cạnh tạo nên cấu trúc khung có hình lục giác, giúp giảm lực cản không khí. Đồng thời tăng độ trợ lực cho mỗi cú đập, để tạo nên một cây vợt thiên công hiệu quả..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor ARS HS Plus Tặng Vợt Victor ARS 8000 + Vợt Victor ARS 9000', 'Vot', 5680000, 
15, '3/6/2025', 5, 1, 
5669429, N'- Màu sắc: Đen. - Độ cứng: Rất Cứng. - Điểm cân bằng: Hơi nặng đầu. - Chiều dài tổng thể: 675mm. - Khung vợt: High Resilience Modulus Graphite + FORMOSA CARBON FIBER. - Thân vợt: High Resilience Modulus Graphite + PYROFIL + 6.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: 3U/G5. - Sức căng tối đa: 3U≦29 lbs (13kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor Ryuga Muse Tặng Vợt Victor ARS 8000 + Tặng Vợt Victor ARS 9000', 'Vot', 5180000, 
51, '7/19/2025', 3, 1, 
4332509, N'- Khung vợt hình hộp Power Box kết hợp với công nghệ Hard Core mang lại độ bền và khả năng chịu lực lên đến 13.5kg, làm tăng hiệu suất của cây vợt trong những tình huống tấn công. Với việc sử dụng vật liệu trục Pyrofil giúp vợt trở nên cứng cáp hơn mang lại khả năng xử lý cầu nhạy bén.. - Độ cứng: Cứng. - Điểm cân bằng: Nặng đầu. - Sức căng tối đa: < 30 lbs (13,5 kg). - Trọng lượng: 5U. - Chu vi cán vợt: G5. Khung vợt được thiết kế cứng cáp, bền bỉ, cung cấp độ chính xác và hiệu quả khi người chơi thực hiện nhồi cầu, smash cầu liên tục áp đảo sân cầu đối phương..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor DX-10 Metalic Tặng Vợt Victor ARS 9000 + Vợt Victor ARS 8000 + Vợt Kawasaki P26', 'Vot', 5330000, 
51, '7/22/2025', 10, 1, 
4820175, N'- Thân vợt Victor DriveX 10 Metallic được đánh giá ở mức cứng cho khả năng ra vợt nhanh và tốc độ trở về trạng thái cân bằng nhanh cho phép những pha cầu phản ứng nhanh, tấn công liên tục dồn ép khiến đối thủ không kịp trở tay.. - Khung vợt Victor DriveX 10 Metallic được gia cố cứng cáp hơn với công nghệ Hard Cored Technology không những giúp giảm thiểu kích thước vật liệu mà còn giúp người chơi tăng cảm giác cầu cho các pha xử lý tăng hiệu suất sức mạnh và độ chính xác.. - Điểm cân bằng: Nặng đầu (303 mm). - Độ cứng: Cứng. - Trọng lượng: 3U, 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor BS12 Pro Tặng Vợt Victor DX3H + Vợt Victor ARS 9000', 'Vot', 5310000, 
33, '7/8/2025', 1, 1, 
3838510, N'High Resilience Modulus Graphite kết hợp với Nano Resin đảm bảo độ bền bỉ, cải thiện khả năng truyền lực và khả năng kiểm soát. Khung vợt được thiết kế dạng lưỡi kiếm giúp tăng tốc độ vung vợt. Trục vợt siêu mỏng (6.8 mm) giúp giảm trọng lượng nhưng vẫn đảm bảo độ cứng và ổn định.. - Điểm cân bằng: Cân bằng (295mm). - Độ cứng: Trung bình. - Khung vợt: High Resilience Modulus Graphite + Nano Resin. - Thân vợt: High Resilience Modulus Graphite + Nano Resin + 6.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: < 30 LBS.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Woods N90', 'Vot', 5049000, 
47, '9/10/2025', 5, 2, 
5000210, N'- Thân vợt cầu lông Lining Woods N90 khá thon, gọn và có độ cứng trung bình cho những pha thủ cầu và xử lý cực kỳ linh hoạt. Ngoài ra, ở khả năng phản tạt, Lining Woods N90 thể hiện tốt và nhanh, một điểm cộng của nữa dòng vợt này chính là công nghệ trợ lực của các dòng vợt nano giúp người chơi đánh ít tốn sức hơn bình thường.. - Độ cứng: Trung bình.. - Khung vợt: Carbon Fiber. - Thân vợt:  Carbon Fiber. - Trọng lượng: 4U. - Chu vi cán vợt: S2. - Sức căng tối đa: 30LBS. - Điểm cân bằng: 304 mm. - Màu sắc: Đỏ/ Đen..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Axforce 30', 'Vot', 1299000, 
49, '3/13/2025', 5, 2, 
1185117, N'- Màu sắc: Hồng, Xanh. - Độ cứng: Dẻo. - Khung vợt: Dynamic Optimum Frame. - Thân vợt: Carbon Fiber. - Trọng lượng: 5U/G6 (Phiên bản màu Hồng), 4U/G5 (Phiên bản màu Xanh). - Điểm cân bằng: 304 mm (Nặng đầu).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set vợt cầu lông Victor Doraemon DX-DRM GB', 'Vot', 3600000, 
42, '1/27/2025', 6, 1, 
3020724, N'- Màu sắc: Xanh. - Độ cứng: Trung bình. - Điểm cân bằng:. - Sức căng tối đa: 26 lbs (11.5kg). - Trọng lượng: 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set vợt cầu lông Victor Doraemon TK-DRM', 'Vot', 2349000, 
27, '1/20/2025', 8, 1, 
2188934, N'- Màu sắc: Xám. - Độ cứng: Trung bình. - Điểm cân bằng: Nặng đầu. - Sức căng tối đa: 3U (16.5kg), 4U(16kg). - Trọng lượng: 3U, 4U. - Chu vi cán vợt: 3U/G5, 4U/G6. Khung vợt được thiết kế cứng cáp, bền bỉ, cung cấp độ chính xác và hiệu quả khi người chơi thực hiện nhồi cầu, smash cầu liên tục áp đảo sân cầu đối phương..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Set vợt cầu lông Victor Doraemon DRM SET', 'Vot', 4000000, 
31, '7/18/2025', 1, 1, 
3207534, N'- Khung vợt hình hộp Power Box với cạnh cứng mang lại độ bền và khả năng chịu lực lên đến 14.5kg, làm tăng hiệu suất của vợt và đảm bảo độ bền bỉ. Đũa vợt có đường kính mỏng chỉ 6,8mm giúp tăng tốc độ vung vợt, mang lại độ linh hoạt cho người chơi.. - Màu sắc: Xanh và Hồng. - Độ cứng: Trung bình ( Màu Xanh), Siêu dẻo ( Màu Hồng). - Điểm cân bằng: Màu Hồng: Nặng đầu. - Sức căng tối đa: 32lbs ( 14,5 kg). - Trọng lượng: 4U. - Chu vi cán vợt: G5. Khung vợt được thiết kế cứng cáp, bền bỉ, cung cấp độ chính xác và hiệu quả khi người chơi thực hiện nhồi cầu, smash cầu liên tục áp đảo sân cầu đối phương..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Power 1 - Hồng Chính Hãng', 'Vot', 490000, 
98, '5/19/2025', 8, 8, 
408551, N'- Với công nghệ xử lý vật liệu Nano Carbon hiện đại, tăng cường mật độ phân tử từ đó cho liên kết chặt chẽ hơn, bền bỉ hơn, nâng cao sức chịu lực lên tới 20%. Khung vợt cho phép mức căng dây cao tối đa lên tới 13.5kg, người chơi có thể thoải mái lựa chọn mức căng phù hợp với trình độ chơi của mình.. - Khung vợt: Carbon. - Thân vợt: Carbon. - Độ cứng đũa: Trung bình. - Trọng lượng: 4U/G5. - Điểm cân bằng: 296 +/- 3mm (Hơi nặng đầu). - Chiều dài tổng thể: 675mm. - Màu sắc: Hồng. Khung vợt cầu lông Vicleo Power 1 cung cấp cho người chơi khả năng xử lý cầu toàn diện và hiệu quả hơn với sự kết hợp giữa cấu trúc hình hộp và thiết kế vát như lưỡi kiếm, vừa đem lại khả năng bộc phát lực cầu mạnh mẽ, ổn định vừa cho tốc độ càn quét nhanh trong không khí, tăng sự nhạy bén, kiểm soát tối đa trên sân..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor DX-10 Metallic Tặng Vợt Victor ARS 9000 + Vợt Victor ARS 8000', 'Vot', 5330000, 
5, '10/17/2025', 5, 1, 
4084840, N'- Điểm cân bằng: Nặng đầu (303 mm). - Điểm swing weight: 89 kg/cm2. - Độ cứng: Cứng. - Trọng lượng: 3U, 4U.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Turbo 1 - Tím Chính Hãng', 'Vot', 390000, 
6, '1/4/2025', 6, 8, 
336027, N'- Trọng lượng: 4U. - Điểm cân bằng: 298+-3mm. - Độ cứng: Hơi dẻo. - Màu sắc: Đen Tím.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Power 3 - Xanh Ngọc Chính Hãng', 'Vot', 490000, 
9, '3/30/2025', 7, 8, 
462871, N'- Khung vợt: Carbon. - Thân vợt: Carbon. - Độ cứng đũa: Trung bình. - Trọng lượng: 4U/G5. - Điểm cân bằng: 296 +/- 3mm (Hơi nặng đầu). - Chiều dài tổng thể: 675mm. - Màu sắc: Xanh Ngọc. Khung vợt cầu lông Vicleo Power 3 cung cấp cho người chơi khả năng xử lý cầu toàn diện và hiệu quả hơn với sự kết hợp giữa cấu trúc hình hộp và thiết kế vát như lưỡi kiếm, vừa đem lại khả năng bộc phát lực cầu mạnh mẽ, ổn định vừa cho tốc độ càn quét nhanh trong không khí, tăng sự nhạy bén, kiểm soát tối đa trên sân..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Turbo 3 - Đỏ Chính Hãng', 'Vot', 390000, 
46, '9/3/2025', 6, 8, 
357369, N'- Trọng lượng: 4U. - Điểm cân bằng: 298+-3mm. - Độ cứng: Hơi dẻo. - Màu sắc: Đen Đỏ.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Vicleo Turbo 5 - Hồng Chính Hãng', 'Vot', 390000, 
1, '12/18/2025', 2, 8, 
316632, N'- Trọng lượng: 4U. - Điểm cân bằng: 298+-3mm. - Độ cứng: Hơi dẻo. - Màu sắc: Hồng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo JingZhou Chính Hãng', 'Vot', 930000, 
58, '3/12/2025', 3, 3, 
696138, N'- Màu sắc: Trắng phối xanh lá. - Độ cứng: Trung bình (8.5). - Trọng lượng: 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor Auraspeed 100X Ultra New 2025', 'Vot', 4850000, 
10, '3/11/2025', 7, 1, 
3554295, N'- Thân vợt được làm từ sự kết hợp giữa sợi carbon cường độ cao 46T và sợi carbon kim loại, được thiết kế với độ dày siêu mỏng chỉ 5,8mm. Thiết kế tiên tiến này giúp tăng độ chính xác của cú đánh và mang lại độ đàn hồi của thân gậy vượt trội, khuếch đại sức mạnh của các cú đánh liên tục và các pha tấn công.. - Độ cứng: Cứng. - Khung vợt: High Resilience Modulus Graphite + TR＋Nano Fortify TR＋ + HARD CORED TECHNOLOGY. - Thân vợt: High Resilience Modulus Graphite + Metallic Carbon Fiber + PYROFIL + 5.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 3U ≦ 31 lbs (14 Kg). - Điểm cân bằng: 290+-5mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Kumpoo YangZhou Chính Hãng', 'Vot', 930000, 
5, '5/11/2025', 4, 3, 
845908, N'- Màu sắc: Trắng phối xanh dương. - Độ cứng: Trung bình (8.5). - Trọng lượng: 4U. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Axforce BigBang new', 'Vot', 1900000, 
20, '8/24/2025', 8, 2, 
1491408, N'- Màu sắc: Trắng, Đen. - Độ cứng: Dẻo. - Thân vợt: Carbon Fiber. - Trọng lượng: 4U/G6, 5U/G6. - Điểm cân bằng: 308mm+/-2mm (Nặng đầu).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Axforce 90 New - Loh Kean Yew 2024', 'Vot', 4349000, 
9, '6/29/2025', 7, 2, 
3789012, N'- Khung vợt: M46 + T1100 + Ultra Carbon, Vật liệu lưu trữ năng lượng polymer và hấp thụ sốc. - Độ cứng: Cứng. - Điểm cân bằng: Nặng đầu. - Trọng lượng / Cán cầm: 5U/G5, 4U/G5, 3U/G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Prokennex Turbo 717 - Trắng Đỏ Chính Hãng', 'Vot', 818000, 
86, '9/28/2025', 3, 17, 
646901, N'- Màu sắc: Trắng đỏ. - Độ cứng: Dẻo. - Khung vợt: AERO + DYNAMIC + OPTIMUM FRAME. - Trọng lượng: 4U/G6. - Điểm cân bằng: 298 ± 5mm. Trọng lượng của vợt siêu nhẹ với cân nặng 4U đã được căng lưới trợ lực sẵn, thiết kế đặc biệt ở phần thân vợt giúp người chơi có được những cú đập cầu mạnh mẽ, smash tuyệt vời..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Halbertec 4000', 'Vot', 1760000, 
74, '10/25/2025', 8, 2, 
1663471, N'được thương hiệu Lining cho ra mắt năm 2025 tiếp nối sự thành công của các dòng vợt Lining Halberte đang làm mưa làm gió trên thị trường cầu lông thời gian vừa qua. Để giúp người chơi được đa dạng hơn về sự lựa chọn phù hợp về trình độ cũng như giá thành hơn. Lining Halbertec 4000 có một thiết kế cực kỳ bắt mắt và hiện đại, với màu sắc nổi bật và kiểu dáng thể thao cuốn hút. Khung vợt được làm từ chất liệu carbon cao cấp, không chỉ giúp vợt có vẻ ngoài sang trọng mà còn đảm bảo độ bền vững vượt trội trong quá trình sử dụng.. - Màu sắc: Trắng - Đen - Đỏ. - Điểm cân bằng: 295 ± 2. - Trọng lượng: 3U, 4U. - Độ cứng đũa: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Prokennex Turbo 716 - Trắng Xanh Chính Hãng', 'Vot', 738000, 
79, '8/2/2025', 6, 17, 
612677, N'- Màu sắc: Trắng xanh. - Độ cứng: Dẻo. - Khung vợt: AERO + DYNAMIC + OPTIMUM FRAME. - Trọng lượng: 4U/G6. - Điểm cân bằng: 288 ± 5mm. Trọng lượng của vợt siêu nhẹ với cân nặng 4U đã được căng lưới trợ lực sẵn, thiết kế đặc biệt ở phần thân vợt giúp người chơi có được những cú đập cầu mạnh mẽ, smash tuyệt vời..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Cặp Vợt Cầu Lông Kumpoo E30', 'Vot', 690000, 
19, '11/12/2025', 9, 3, 
671739, N'- Độ cứng: Dẻo ( 9.5 +/- 5). - Trọng lượng: 3U. - Chu vi cán vợt: G5. - Điểm cân bằng: Hơi nặng đầu.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt Cầu Lông Felet Aero Carbon', 'Vot', 2499000, 
100, '5/8/2025', 9, 9, 
2040504, N'- Màu sắc: Trắng. - Thân vợt: 7.0mm Nano Booster Shaft.. - Trọng lượng: 4U. - Độ cứng: Cứng trung bình. - Chu vi cán vợt: G1. - Chiều dài tổng thể: 675mm. - Điểm cân bằng: 293-297mm.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Redson Shape ESG', 'Vot', 4349000, 
17, '4/21/2025', 6, 21, 
3319458, N'với công nghệ độc đáo, vợt có khung hình DIMPLE làm giảm sức cản không khí. Không chỉ kế thừa những tinh hoa từ các phiên bản tiền nhiệm mà còn được nâng cấp với những cải tiến vượt trội, hứa hẹn mang đến sức mạnh, sự chính xác và cảm giác đánh cầu đỉnh cao. Khung vợt được gia cố bằng sợi carbon cao cấp và công nghệ Bumpy Frame, giúp Redson Shape ESG chịu được lực căng dây lớn và các va chạm mạnh mẽ trong thi đấu.. - Độ cứng: Trung bình và Cứng ( Có 2 phiên bản). - Trọng lượng: 3U, 4U. - Sức căng tối đa: 3U (20 - 28 lbs), 4U (20 - 26 lbs). - Điểm cân bằng: 3U (285 - 290mm), 4U (290 - 295mm) đối với phiên bản có độ cứng trung bình. Khung vợt được thiết kế theo dạng khí động học, giảm lực cản không khí lên đến 10%, cho phép người chơi vung vợt nhanh hơn và thực hiện các cú đánh chính xác hơn..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor ARS 100X Tặng Vợt Victor ARS 9990K + Vợt Victor TK Ryuga CLS', 'Vot', 5330000, 
2, '8/3/2025', 4, 1, 
5069157, N'- Độ cứng: Cứng trung bình. - Khung vợt: High Resilience Modulus Graphite + Nano Fortify TR＋. - Thân vợt: High Resilience Modulus Graphite + PYROFIL + 6.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: 3U G5. - Sức căng tối đa: 3U  ≦29 lbs (13 Kg). - Điểm cân bằng: Hơi nặng đầu (~ 300mm). - Chiều dài tổng thể: 675mm. - Màu sắc: Nhám phối Đen Trắng Cam.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Lining Halbertec 3000', 'Vot', 1390000, 
29, '10/16/2025', 7, 2, 
997416, N'- Màu sắc: Trắng - Đen - Xanh. - Điểm cân bằng: 295 ± 2 mm. - Trọng lượng: 4U, 5U. - Độ cứng đũa: Trung bình.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông Victor Thruster Ryuga II TD chính hãng', 'Vot', 3100000, 
81, '2/7/2025', 6, 1, 
2914068, N'- Độ cứng: Cứng. - Chiều dài tổng thể: 675mm. - Khung vợt: High Resilience Modulus Graphite+HARD CORED TECHNOLOGY. - Trọng lượng: 4U/G6, 3U/G5. - Sức căng tối đa: 3U:≦30 lbs(13.5Kg).');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Combo Mua Vợt Cầu Lông Victor ARS 100X Ultra G Tặng Vợt Victor ARS 9990K + Vợt Victor ARS 8000', 'Vot', 5830000, 
28, '9/9/2025', 4, 1, 
4600165, N'- Thân vợt được làm từ sự kết hợp giữa sợi carbon cường độ cao 46T và sợi carbon kim loại, được thiết kế với độ dày siêu mỏng chỉ 5,8mm. Thiết kế tiên tiến này giúp tăng độ chính xác của cú đánh và mang lại độ đàn hồi của thân gậy vượt trội, khuếch đại sức mạnh của các cú đánh liên tục và các pha tấn công.. - Độ cứng: Cứng. - Khung vợt: High Resilience Modulus Graphite + TR＋Nano Fortify TR＋ + HARD CORED TECHNOLOGY. - Thân vợt: High Resilience Modulus Graphite + Metallic Carbon Fiber + PYROFIL + 5.8 SHAFT. - Trọng lượng: 3U, 4U. - Chu vi cán vợt: G5. - Sức căng tối đa: 3U ≦ 31 lbs (14 Kg). - Điểm cân bằng: Hơi nặng đầu.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VNB V200 Đỏ chính hãng', 'Vot', 529000, 
73, '1/16/2025', 6, 5, 
484979, N'- Khung vợt: Carbon High Modulus Graphite Carbon. - Thân vợt: Carbon High Modulus Graphite Carbon. - Trọng lượng: 4U (84+-2gr). - Chu vi cán vợt: G5. - Điểm cân bằng: 295mm. - Điểm swing weight: 83 kg/cm2. - Sức căng tối đa: 28-30 LBS. - Màu sắc: Đen/Đỏ..');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VNB V200 Xanh chính hãng', 'Vot', 529000, 
33, '10/24/2025', 5, 5, 
421571, N'Khung vợt với cấu trúc mặt cắt hình lưỡi kiếm giúp vợt giảm mức độ cản gió, vung vợt nhanh và cảm giác thanh thoát hơn. Trong tấn công thì vung vợt nhanh là một lợi thế.. - Độ cứng: Trung bình.. - Khung vợt: Carbon High Modulus Graphite Carbon. - Thân vợt:. - Trọng lượng:. - Điểm cân bằng: 300mm. Điểm swing weight: 83 kg/cm2. - Chu vi cán vợt: G5. - Sức căng tối đa: 28-30 LBS. - Màu sắc: Đen/ Xanh dương.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VNB TC88B', 'Vot', 799000, 
3, '6/2/2025', 7, 5, 
657971, N'- Điểm cân bằng: 305 ± 3mm - Nặng Đầu. - Trọng lượng: 82 ± 2g - 4U. - Độ cứng đũa: 8.1 - Khá Cứng. - Sức căng tối đa: 30LBS - 13,6KG. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VNB TC88C', 'Vot', 799000, 
9, '3/22/2025', 3, 5, 
601388, N'- Điểm cân bằng: 305 ± 3mm - Nặng Đầu. - Trọng lượng: 86 ± 2g - 3U. - Độ cứng đũa: 8.1 - Khá Cứng. - Sức căng tối đa: 30LBS - 13,6KG. - Chu vi cán vợt: G5.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VNB Carbon Training 150g chính hãng', 'Vot', 698000, 
15, '2/17/2025', 10, 5, 
512699, N'- Khung vợt: High Modulus Graphite + Carbon Fiber. - Thân vợt:  High Modulus Graphite + Carbon Fiber. - Trọng lượng: 150 +- 5 gam. - Chu vi cán vợt: S2 (G4, 5). - Sức căng tối đa: 28-30 LBS (13.6kg). - Điểm cân bằng: 310 +- 5 mm. - Màu sắc: Đỏ/ Xanh tím.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VNB V200i Hồng', 'Vot', 529000, 
8, '11/11/2025', 7, 5, 
485547, N'- Được đan từ sợi carbon nên vợt có độ cứng trung bình, giúp những cú phông cầu trở nên thuận tiện và dễ dàng hơn. Bên cạnh đó, vợt cho khả năng phản tạt, trả cầu rất ổn định. Khung vợt với cấu trúc mặt cắt lưỡi kiếm giúp vợt giảm mức độ cản gió, vung vợt nhanh và cảm giác thanh thoát hơn. Cả ở hai mặt công và thủ, V200i thể hiện rất toàn vẹn khả năng của mình.. - Khung vợt: Carbon High Modulus Graphite Carbon. - Thân vợt: Carbon High Modulus Graphite Carbon. - Trọng lượng: 5U (75+-2gr). - Chu vi cán vợt: G5. - Điểm cân bằng: 300 mm ( Nặng dầu ). - Sức căng tối đa: 28-30 LBS. - Màu sắc: Hồng/ Đen/ Trắng.');
            

INSERT INTO SanPham (TenSP, LoaiSP, GiaBan, SoLuongTon, NgayNhapKho, ThoiGianBaoHanh, MaTH, GiaGoc, MoTa)
VALUES (N'Vợt cầu lông VNB V88 cam chính hãng', 'Vot', 638000, 
43, '10/30/2025', 1, 5, 
570867, N'- Độ cứng:  Cứng trung bình. - Khung vợt: Carbon High Modulus Graphite Carbon. - Thân vợt: Carbon High Modulus Graphite Carbon. - Trọng lượng: 4U (82+-2gr).. - Điểm cân bằng: 300+-3mm. - Chiều dài tổng thể: 675 mm. - Điểm swing weight: 84,4 kg/cm2. - Chu vi cán vợt: G5. - Sức căng tối đa: 30 (13.6) LBS. - Màu sắc: Đen/ Cam.');

-- Dữ liệu cho bảng CHI_TIET_HOA_DON_SAN_PHAM
INSERT INTO ChiTietHD_SanPham (MaHD, MaSP, SoLuongSP, DonGia) VALUES
(1, 1, 1, 0),   
(2, 101, 2, 0),   
(3, 201, 3, 0),   
(4, 301, 2, 0),
(4, 101, 1, 0),
(5, 400, 1, 0),
(5, 11, 2, 0),
(6, 21, 3, 0),
(6, 121, 1, 0),
(7, 331, 3, 0),
(7, 221, 2, 0),
(8, 111, 1, 0),
(9, 371, 4, 0),
(10, 91, 2, 0),
(10, 101, 1, 0);

UPDATE ChiTietHD_SanPham
SET DonGia = (
    SELECT GiaBan
    FROM SanPham
    WHERE SanPham.MaSP = ChiTietHD_SanPham.MaSP
);

UPDATE HoaDon
SET TongTien = (
    SELECT SUM(SoLuongSP * DonGia)
    FROM ChiTietHD_SanPham
    WHERE HoaDon.MaHD = ChiTietHD_SanPham.MaHD
);

-- Dữ liệu cho bảng HOA_DON_DICH_VU
INSERT INTO HoaDonDichVu (NgayGioTao, MaKH, SoDienThoai, MaNV, TenVot, LoaiDay, NgayGioLayVot, SoKG, ThanhTien, LoaiPhieu) VALUES
('2025-04-01 10:00:00', 1, '0912345678', 2, 'Vợt A', 'Dây nylon', '2025-04-01 14:00:00', 0.3, NULL, 'DV'),
('2025-04-02 15:30:00', 2, '0987654321', 3, 'Vợt B', 'Dây Kevlar', '2025-04-02 17:00:00', 0.25, NULL, 'DV'),
('2025-04-03 09:15:00', 3, '0922334455', 4, 'Vợt C', 'Dây nylon', '2025-04-03 12:00:00', 0.35, NULL, 'DV'),
('2025-04-04 11:00:00', 4, '0944123456', 5, 'Vợt D', 'Dây Kevlar', '2025-04-04 13:00:00', 0.4, 500000, 'DV'),
('2025-04-05 13:10:00', 5, '0933445566', 1, 'Vợt E', 'Dây nylon', '2025-04-05 15:00:00', 0.28, NULL, 'DV');

-- Dữ liệu cho bảng HOA_DON_LUONG
INSERT INTO HoaDonLuong (MaNV, SoGioLam, NgayXuat, TongTien) VALUES
(1, 160, '2025-04-01', 9600000),
(2, 170, '2025-04-02', 13600000),
(3, 165, '2025-04-03', 9900000),
(4, 150, '2025-04-04', 8250000),
(5, 180, '2025-04-05', 13500000);

Select * From LoaiKhachHang;
Select * From KhachHang;
Select * From ChucVu;
Select * From NhanVien;
Select * From ThuongHieu;
Select * From SanPham;
Select * From KhuyenMai;
Select * From HoaDon; 
Select * From ChiTietHD_SanPham;
Select * From HoaDonDichVu;
Select * From HoaDonLuong;
Select * From PhieuNhapHang;
Select * From ChiTietPhieuNhapHang;
Select * From PhieuNhan;
Select * From ChiTietPhieuNhan;






use master
go