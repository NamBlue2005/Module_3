-- câu 6:
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE
    dv.ma_dich_vu NOT IN (SELECT DISTINCT
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021
                AND MONTH(hd.ngay_lam_hop_dong) IN (1 , 2, 3));

-- câu 7:
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE
    dv.ma_dich_vu IN (SELECT DISTINCT
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2020)
        AND dv.ma_dich_vu NOT IN (SELECT DISTINCT
            hd.ma_dich_vu
        FROM
            hop_dong hd
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021);

-- câu 8: 

-- cách 1:
SELECT DISTINCT ho_ten
FROM khach_hang;

-- cách 2:
SELECT ho_ten
FROM khach_hang
GROUP BY ho_ten;

-- cách 3:
SELECT ho_ten FROM khach_hang
UNION
SELECT ho_ten FROM khach_hang;


-- câu 9:
SELECT MONTH(ngay_lam_hop_dong) AS thang, 
       COUNT(DISTINCT ma_khach_hang) AS so_luong_khach_hang
FROM hop_dong
WHERE YEAR(ngay_lam_hop_dong) = 2021
GROUP BY MONTH(ngay_lam_hop_dong)
ORDER BY thang;

-- Câu 10 --
SELECT 
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    hd.tien_dat_coc,
    SUM(hdc.so_luong) AS so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet hdc ON hd.ma_hop_dong = hdc.ma_hop_dong
GROUP BY hd.ma_hop_dong , hd.ngay_lam_hop_dong , hd.ngay_ket_thuc , hd.tien_dat_coc;
