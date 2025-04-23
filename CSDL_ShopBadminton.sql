Create Database ShopBadminton 
go
USE ShopBadminton
go

-- Bảng LOAI_KHACH_HANG
CREATE TABLE LoaiKhachHang (
    MaLoaiKH INT PRIMARY KEY identity(1,1),
    TenLoai NVARCHAR(50),
    ChiTieuToiThieu DECIMAL(18,2), -- là chi tiêu của khách hàng mỗi khi mua hàng ví dụ : 5,000,000 thì sẽ giảm bao nhiêu đó
    GiamGiaToiDa FLOAT CHECK (GiamGiaToiDa BETWEEN 0 AND 100) -- 5% nếu chi tiêu tối thiểu là 5,000,000
);
-- Bảng KHACH_HANG
CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY identity(1,1),
    HoTen NVARCHAR(50) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL,
    TongChiTieu DECIMAL(18,2) DEFAULT 0,
    MaLoaiKH INT,
    FOREIGN KEY (MaLoaiKH) REFERENCES LoaiKhachHang(MaLoaiKH)
);

-- Bảng CHUC_VU
CREATE TABLE ChucVu (
    MaChucVu INT PRIMARY KEY identity(1,1), -- được xác định trước 1: nhân viên 2: chức vụ
    TenChucVu NVARCHAR(50) NOT NULL -- giúp cho việc xác định nhân viên hoặc quản lí. 
);

-- Bảng NHAN_VIEN
CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY identity(1,1),
    HoTen NVARCHAR(100) NOT NULL,
    NgaySinh DATE NOT NULL,
    GioiTinh NVARCHAR(10) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    MaChucVu INT, -- này cho 1 combobox để thêm chức vụ
	--SDT VARCHAR(20) NULL,
    LuongCoBan DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (MaChucVu) REFERENCES ChucVu(MaChucVu) -- khi thêm nhân viên thì nên xác định trước là nhân viên hay là quản lí,
);

-- Bảng THUONG_HIEU
CREATE TABLE ThuongHieu (
    MaTH INT PRIMARY KEY identity (1,1),
    TenTH NVARCHAR(100) NOT NULL
);

-- Bảng SAN_PHAM
CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY identity (1,1), -- này là mã vạch
    TenSP NVARCHAR(Max) NOT NULL,
    LoaiSP NVARCHAR(50) NOT NULL,
    GiaBan DECIMAL(18,2) NOT NULL,
    SoLuongTon INT DEFAULT 0,
    NgayNhapKho DATE NOT NULL,
    ThoiGianBaoHanh INT, -- thời gian bảo hành khi nhập hàng từ nhà cung cấp - có thể bỏ 
    MaTH INT, -- có thể bỏ nếu mình chỉ là 1 shop bán lẻ
    GiaGoc DECIMAL(18,2) NOT NULL, -- đây là giá gốc khi nhập
    MoTa NVARCHAR(Max),
    FOREIGN KEY (MaTH) REFERENCES ThuongHieu(MaTH)
);


-- Bảng KHUYEN_MAI
CREATE TABLE KhuyenMai (
    MaKM INT PRIMARY KEY identity(1,1),
    TenChuongTrinh NVARCHAR(100) NOT NULL,
    GiaTriKhuyenMai FLOAT NOT NULL,
    DieuKienKhuyenMai NVARCHAR(255),
    NgayBatDau DATE NOT NULL,
    NgayKetThuc DATE NOT NULL,
    SoLuong INT NOT NULL
);

 CREATE TABLE KhachHang_KhuyenMai (
    MaKH       INT          NOT NULL,
    MaKM       INT          NOT NULL,
    NgaySuDung DATETIME     NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_KH_KM PRIMARY KEY (MaKH, MaKM),
    CONSTRAINT FK_KHKM_KH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    CONSTRAINT FK_KHKM_KM FOREIGN KEY (MaKM) REFERENCES KhuyenMai(MaKM)
);

INSERT INTO KhuyenMai (TenChuongTrinh, GiaTriKhuyenMai, DieuKienKhuyenMai, NgayBatDau, NgayKetThuc, SoLuong)
VALUES 
    ('Khuyến Mãi Mùa Hè', 15.5, 'Vơt Yonex', '2025-04-30', '2025-04-20', 100)
 

-- Bảng HOA_DON
CREATE TABLE HoaDon (
    MaHD INT PRIMARY KEY identity(1,1),
    NgayGioTao DATETIME,
    MaKH INT,
    MaNV INT,
    TongTien DECIMAL(18,2) NOT NULL,
    MaKM INT NULL,
    LoaiHoaDon VARCHAR(10) NOT NULL CHECK (LoaiHoaDon IN ('SP','SP+DV')),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    FOREIGN KEY (MaKM) REFERENCES KhuyenMai(MaKM) -- cái này chưa chắc đúng vì mình sẽ tìm đến ngày hết hạn
);


-- Bảng CHI_TIET_HOA_DON_SAN_PHAM
CREATE TABLE ChiTietHD_SanPham (
    MaHD INT NOT NULL,
    MaSP INT NOT NULL,
    SoLuongSP INT NOT NULL CHECK (SoLuongSP > 0),
    DonGia DECIMAL(18,2) NOT NULL,
    ThanhTien AS (SoLuongSP * DonGia) PERSISTED,
    PRIMARY KEY (MaHD, MaSP),
    FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
 /*
1	Khách chỉ đan 1 vợt : Chỉ có 1 phiếu đan vợt + thành tiền
2	Khách mua sản phẩm + đan vợt hoặc đan 2 vợt trở lên: Có 2 phần: 1 hóa đơn sản phẩm +  phiếu đan vợt cho từng vợt (nhưng phiếu đan không có thành tiền, tiền gộp chung vào hóa đơn mua hàng từng loại sp)
3	Khách chỉ mua sản phẩm: Chỉ có hóa đơn sản phẩm
*/

-- Bảng HOA_DON_DICH_VU (cho đan lưới)
CREATE TABLE HoaDonDichVu (
    MaHDDV INT PRIMARY KEY identity(1,1),
    NgayGioTao DATETIME NOT NULL,
    MaKH INT,
    SoDienThoai VARCHAR(15),
    MaNV INT NOT NULL,
    TenVot NVARCHAR(100) NOT NULL,
    LoaiDay NVARCHAR(100) NOT NULL,  -- Có thể tham chiếu đến sản phẩm nếu muốn
    NgayGioLayVot DATETIME,
    SoKG INT NOT NULL,
    ThanhTien DECIMAL(18,2) NULL,  -- Chỉ có giá trị nếu LoaiPhieu = 'DV'
    LoaiPhieu VARCHAR(10) NOT NULL CHECK (LoaiPhieu IN ('DV','NOTE')),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);


-- Bảng HOA_DON_LUONG
CREATE TABLE HoaDonLuong (
    MaHDLuong INT PRIMARY KEY identity(1,1),
    MaNV INT,
    SoGioLam INT,
    NgayXuat DATE,
    TongTien DECIMAL(18,2),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);

CREATE TABLE PhieuNhapHang (
    MaPhieuNhap INT PRIMARY KEY identity(1,1),
    NgayTao DATE,
	TinhTrangPhieuNhap nvarchar(50) NULL, --New
);

-- Bảng CHI_TIET_PHIEU_NHAP
CREATE TABLE ChiTietPhieuNhapHang (
    MaPhieuNhap INT,
    MaSP INT,
	TenSP nvarchar(max) null,
    SoLuongNhap INT NOT NULL,
    PRIMARY KEY (MaPhieuNhap, MaSP),
    FOREIGN KEY (MaPhieuNhap) REFERENCES PhieuNhapHang(MaPhieuNhap),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

CREATE TABLE PhieuNhan (
    MaPhieuNhan INT PRIMARY KEY identity(1,1),
    NgayTao DATE,
);

-- Bảng CHI_TIET_PHIEU_NHAN
CREATE TABLE ChiTietPhieuNhan (
    MaPhieuNhan INT,
    MaSP INT,
	TenSP nvarchar(max) NULL,
	LoaiSP  nvarchar(50) NULL,
    SoLuongNhap INT NOT NULL,
	DonGiaNhap DECIMAL(18,2) NULL,
	ThuongHieu nvarchar(100) NULL,
	ThoiGianBaoHanh INT null,
	MoTa nvarchar(max) NULL,
	TongTien DECIMAL(18,2) NULL,
	NgayNhan Date NULL,
    PRIMARY KEY (MaPhieuNhan, MaSP),
    FOREIGN KEY (MaPhieuNhan) REFERENCES PhieuNhan(MaPhieuNhan),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);






ALTER TABLE HoaDon
DROP CONSTRAINT PK_HoaDon;

-- Tạo cột tạm
ALTER TABLE HoaDon ADD MaHD_temp VARCHAR(20);

-- Copy dữ liệu từ MaHD sang
UPDATE HoaDon SET MaHD_temp = CAST(MaHD AS VARCHAR(20));

-- Xoá cột cũ
ALTER TABLE HoaDon DROP COLUMN MaHD;

-- Đổi tên cột tạm
EXEC sp_rename 'HoaDon.MaHD_temp', 'MaHD', 'COLUMN';

ALTER TABLE HoaDon
ALTER COLUMN MaHD VARCHAR(20) NOT NULL;

ALTER TABLE HoaDon
ADD CONSTRAINT PK_HoaDon PRIMARY KEY (MaHD);
--- XÓA CÁC KHÓA CHÍNH BẢNG THAM CHIẾU TRƯỚC
DROP TABLE ChiTietHD_SanPham;

CREATE TABLE ChiTietHD_SanPham (
    MaHD VARCHAR(20) NOT NULL,
    MaSP INT NOT NULL,
    SoLuongSP INT NOT NULL CHECK (SoLuongSP > 0),
    DonGia DECIMAL(18,2) NOT NULL,
    ThanhTien AS (SoLuongSP * DonGia) PERSISTED,
    PRIMARY KEY (MaHD, MaSP),
    FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

CREATE TABLE ChiTiet_HoaDonDichVu (
    MaCTHDDV INT PRIMARY KEY IDENTITY(1,1),
    MaHDDV INT NOT NULL,
    TenVot NVARCHAR(100),
    LoaiDay NVARCHAR(100),
    SoKG INT,
    ThanhTien DECIMAL(18, 2),
    FOREIGN KEY (MaHDDV) REFERENCES HoaDonDichVu(MaHDDV)
);
ALTER TABLE [ShopBadminton].[dbo].[HoaDonDichVu]
DROP COLUMN [TenVot], [LoaiDay], [SoKG];