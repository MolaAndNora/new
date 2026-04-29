-- 1. Bảng Sinh Viên

CREATE TABLE SinhVien (

    MaSV VARCHAR(10) PRIMARY KEY,

    HoTen NVARCHAR(100),

    NgaySinh DATE,

    GioiTinh NVARCHAR(10),

    DiaChi NVARCHAR(255),

    Email VARCHAR(100),

    SDT VARCHAR(15),

    NganhHoc NVARCHAR(50),

    NamNhapHoc INT,

    TrangThai NVARCHAR(50)

);



-- 2. Bảng Giảng Viên

CREATE TABLE GiangVien (

    MaGV VARCHAR(10) PRIMARY KEY,

    HoTen NVARCHAR(100),

    ChuyenNganh NVARCHAR(100),

    Email VARCHAR(100),

    SDT VARCHAR(15),

    BoMon NVARCHAR(100)

);



-- 3. Bảng Khóa Học

CREATE TABLE KhoaHoc (

    MaKH VARCHAR(10) PRIMARY KEY,

    TenKH NVARCHAR(100),

    MoTa TEXT,

    SoTinChi INT

);



-- 4. Bảng Lớp Học Phần

CREATE TABLE LopHocPhan (

    MaLop VARCHAR(10) PRIMARY KEY,

    MaKH VARCHAR(10),

    MaGV VARCHAR(10),

    ThoiGian NVARCHAR(50),

    DiaDiem NVARCHAR(100),

    FOREIGN KEY (MaKH) REFERENCES KhoaHoc(MaKH),

    FOREIGN KEY (MaGV) REFERENCES GiangVien(MaGV)

);



-- 5. Bảng Kết Quả (Mối quan hệ n-n giữa SV và Lớp)

CREATE TABLE KetQua (

    MaSV VARCHAR(10),

    MaLop VARCHAR(10),

    DiemSo DECIMAL(4,2),

    XepLoai NVARCHAR(20),

    PRIMARY KEY (MaSV, MaLop),

    FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),

    FOREIGN KEY (MaLop) REFERENCES LopHocPhan(MaLop)

);



-- 6. Bảng Phân Công (Mối quan hệ n-n giữa GV và Khóa học)

CREATE TABLE PhanCong_GiangDay (

    MaGV VARCHAR(10),

    MaKH VARCHAR(10),

    PRIMARY KEY (MaGV, MaKH),

    FOREIGN KEY (MaGV) REFERENCES GiangVien(MaGV),

    FOREIGN KEY (MaKH) REFERENCES KhoaHoc(MaKH)

);