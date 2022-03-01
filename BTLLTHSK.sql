create database BTL_LTHSK
go
use BTL_LTHSK
--1 Tạo bảng tblNhomHang
create table tblNhomHang
(
	PK_MaNhomHang char(10) primary key,
	sTenNhomHang nvarchar(50)
)
--2 Tạo bảng tblHangHoa
create table tblHangHoa
(
	PK_MaHang char(10) primary key,
	sTenHang nvarchar(50),
	sMauSac nvarchar(50),
	iSoLuong int,
	fGiaBan float,
	sHangSX nvarchar(100),
	sMaNhomHang char(10)
)
--3 Tạo bảng tblHangBan
create table tblHangBan
(
	PK_MaHoaDon char(10) primary key,
	sMaHang char(10),
	iSoLuong int,
	fGiaBan float,
	dTGMua date,
	dTGBaoHanh date 
)
--4 Tạo bảng tblThietBiCanBaoHanh
create table tblThietBiCanBaoHanh
(
	PK_MaThietBi char(10) primary key,
	sTenThietBi nvarchar(50),
	sTinhTrang nvarchar(500),
	sNguyenNhan nvarchar (500)
)
--5 Tạo bảng tblNhatKiSuaChua
create table tblNhatKiSuaChua
(
	PK_MaHang char(10) primary key,
	sNguyenNhan nvarchar(500),
	sGiaiQuyet nvarchar(500),
	sMaNVSua char(10),
	sTGSua date,
	sTGTra date
)
--6 Tạo bảng tblPhieuNhan
create table tblPhieuNhan
(
	PK_MaPhieu char(10) primary key,
	sMaKH char(10),
	sTenKH nvarchar(50),
	sDiaChi nvarchar(50),
	sMaNVNhanSua char(10),
	dNgayNhanSua date,
	dTGTra date
)

--7 Tạo bảng tblNhanVien
create table tblNhanVien
(
	PK_MaNV char(10) primary key,
	sTenNV nvarchar(50),
	sGioiTinh nvarchar(10),
	sDiaChi nvarchar(50),
	fHSL float,
	sTenDangNhap char(50),
	sMatKhau char(50),
)
--8 Tạo bảng tblKhachHang
create table tblKhachHang
(
	PK_MaKH char(10) primary key,
	sTenKH nvarchar(50),
	sGioiTinh nvarchar(10),
	sDiaChi nvarchar(50),
	sSDT char(10)
)
--9 Tạo bảng tblHoaDonBanHang
create table tblHoaDonBanHang
(
	PK_MaHoaDon char(10) primary key,
	sMaNVLap char(10),
	sMaKH char(10),
	dTGLap date,
	fTongTien float,
	sTTThuTien nvarchar(20)
)

-- TẠO KHÓA NGOẠI CHO CÁC BẢNG
alter table tblHangHoa
add constraint fk_NhomHang foreign key (sMaNhomHang) references tblNhomHang(PK_MaNhomHang)

alter table tblThietBiCanBaoHanh
add constraint fk_TBBH foreign key (PK_MaThietBi) references tblHangHoa (PK_MaHang)

alter table tblNhatKiSuaChua
add constraint fk_nksc foreign key (PK_MaHang) references tblHangHoa(PK_MaHang)

alter table tblHangBan
add constraint fk_hhb foreign key (PK_MaHoaDon) references tblHoaDonBanHang(PK_MaHoaDon),
	constraint fk_maHangban foreign key (sMaHang) references tblHangHoa(PK_MaHang)

alter table tblHoaDonBanHang
add constraint fk_nvbh foreign key (sMaNVLap) references tblNhanVien(PK_MaNV),
	constraint fk_khmh foreign key (sMaKH) references tblKhachHang(PK_MaKH)

alter table tblPhieuNhan
add constraint fk_nvnh foreign key (sMaNVNhanSua) references tblNhanVien(PK_MaNV),
	constraint fk_khsh foreign key (sMaKH) references tblKhachHang(PK_MaKH)
---Thêm dữ liệu vào bảng nhóm hàng
Insert into tblNhomHang
values ('NH1',N'Gaming'),
('NH2',N'Macbook'),
('NH3',N'Học tập'),
('NH4',N'Văn phòng'),
('NH5',N'Đồ họa'),
('NH6',N'Phần mềm'),
('NH7',N'Linh kiện');
select*from tblNhomHang

------Thêm dữ liệu vào bảng hàng hóa
PK_MaHang char(10) primary key,
	sTenHang nvarchar(50),
	sMauSac nvarchar(50),
	iSoLuong int,
	fGiaBan float,
	sHangSX nvarchar(100),
	sMaNhomHang char(10)

Insert into tblHangHoa
values ('HH1',N' Lenovo Gaming Legion 5 15ITH6 i7 11800H (82JK00FNVN)'),
('HH2',N'Macbook'),
('NH3',N'Học tập'),
('NH4',N'Văn phòng'),
('NH5',N'Đồ họa'),
('NH6',N'Phần mềm'),
('NH7',N'Linh kiện');