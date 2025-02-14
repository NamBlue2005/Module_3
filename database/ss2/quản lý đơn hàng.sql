CREATE DATABASE quan_ly_don_hang;
USE quan_ly_don_hang;

CREATE TABLE phieu_xuat (
    so_px INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat DATE NOT NULL
);

CREATE TABLE vat_tu (
    ma_vtu INT PRIMARY KEY AUTO_INCREMENT,
    ten_vtu VARCHAR(100) NOT NULL
);

CREATE TABLE phieu_nhap (
    so_pn INT PRIMARY KEY AUTO_INCREMENT,
    ngay_nhap DATE NOT NULL
);

CREATE TABLE nha_cc (
    ma_ncc INT PRIMARY KEY AUTO_INCREMENT,
    ten_ncc VARCHAR(50) NOT NULL,
    dia_chi VARCHAR(1000),
    sdt VARCHAR(10)
);

CREATE TABLE don_dh (
    so_dh INT PRIMARY KEY AUTO_INCREMENT,
    ngay_dh DATE NOT NULL,
    ma_ncc INT,
    FOREIGN KEY (ma_ncc)
        REFERENCES nha_cc (ma_ncc)
);

CREATE TABLE chi_tiet_phieu_xuat (
    so_px INT NOT NULL,
    ma_vtu INT NOT NULL,
    dg_xuat INT NOT NULL,
    sl_xuat INT NOT NULL,
    PRIMARY KEY (so_px , ma_vtu),
    FOREIGN KEY (so_px)
        REFERENCES phieu_xuat (so_px),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu)
);

CREATE TABLE chi_tiet_phieu_nhap (
    so_pn INT NOT NULL,
    ma_vtu INT NOT NULL,
    dg_nhap INT NOT NULL,
    sl_nhap INT NOT NULL,
    PRIMARY KEY (so_pn , ma_vtu),
    FOREIGN KEY (so_pn)
        REFERENCES phieu_nhap (so_pn),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu)
);

CREATE TABLE chi_tiet_dat_hang (
    so_dh INT NOT NULL,
    ma_vtu INT NOT NULL,
    dg_dat_hang INT NOT NULL,
    sl_dat_hang INT NOT NULL,
    PRIMARY KEY (so_dh , ma_vtu),
    FOREIGN KEY (so_dh)
        REFERENCES don_dh (so_dh),
    FOREIGN KEY (ma_vtu)
        REFERENCES vat_tu (ma_vtu)
);