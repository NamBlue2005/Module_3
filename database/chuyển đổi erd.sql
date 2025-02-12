CREATE DATABASE quan_ly_don_hang;
USE quan_ly_don_hang;

CREATE TABLE phieu_xuat (
    ma_phieu_xuat INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATE NOT NULL
);

CREATE TABLE vat_tu (
    ma_vat_tu INT PRIMARY KEY AUTO_INCREMENT,
    ten_vat_tu VARCHAR(255) NOT NULL
);

CREATE TABLE chi_tiet_phieu_xuat (
    ma_phieu_xuat INT,
    ma_vat_tu INT,
    don_gia_xuat DECIMAL(10 , 2 ) NOT NULL,
    so_luong_xuat INT NOT NULL,
    PRIMARY KEY (ma_phieu_xuat , ma_vat_tu),
    FOREIGN KEY (ma_phieu_xuat)
        REFERENCES phieu_xuat (ma_phieu_xuat),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE phieu_nhap (
    ma_phieu_nhap INT PRIMARY KEY AUTO_INCREMENT,
    ngay_nhap DATE NOT NULL
);

CREATE TABLE chi_tiet_phieu_nhap (
    ma_phieu_nhap INT,
    ma_vat_tu INT,
    don_gia_nhap DECIMAL(10 , 2 ) NOT NULL,
    so_luong_nhap INT NOT NULL,
    PRIMARY KEY (ma_phieu_nhap , ma_vat_tu),
    FOREIGN KEY (ma_phieu_nhap)
        REFERENCES phieu_nhap (ma_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE don_dat_hang (
    ma_don_hang INT PRIMARY KEY AUTO_INCREMENT,
    ngay_dat_hang DATE NOT NULL
);

CREATE TABLE chi_tiet_don_dat_hang (
    ma_vat_tu INT,
    ma_don_hang INT,
    PRIMARY KEY (ma_vat_tu , ma_don_hang),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (ma_don_hang)
        REFERENCES don_dat_hang (ma_don_hang)
);

CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap INT PRIMARY KEY AUTO_INCREMENT,
    ten_nha_cung_cap VARCHAR(255) NOT NULL,
    dia_chi VARCHAR(255) NOT NULL
);

CREATE TABLE so_dien_thoai_nha_cung_cap (
    so_dien_thoai VARCHAR(15) PRIMARY KEY,
    ma_nha_cung_cap INT,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);

CREATE TABLE cung_cap_don_hang (
    ma_don_hang INT,
    ma_nha_cung_cap INT,
    PRIMARY KEY (ma_don_hang , ma_nha_cung_cap),
    FOREIGN KEY (ma_don_hang)
        REFERENCES don_dat_hang (ma_don_hang),
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);