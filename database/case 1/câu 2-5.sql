-- câu 2:
SELECT * FROM nhan_vien 
WHERE (ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%') AND LENGTH(ho_ten) <= 15;

-- câu 3:
SELECT * FROM khach_hang
WHERE YEAR(CURDATE()) - YEAR(ngay_sinh) BETWEEN 18 AND 50 AND (dia_chi LIKE '%Đà Nẵng%' OR dia_chi LIKE '%Quảng Trị%');

-- câu 4:
SELECT kh.ma_khach_hang, kh.ho_ten, COUNT(hd.ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang, kh.ho_ten
ORDER BY so_lan_dat_phong ASC;

-- câu 5: 

SELECT 
    k.ma_khach_hang, 
    k.ho_ten, 
    lk.ten_loai_khach, 
    hd.ma_hop_dong, 
    dv.ten_dich_vu, 
    hd.ngay_lam_hop_dong, 
    hd.ngay_ket_thuc,
    COALESCE(SUM(hdct.so_luong * dvdk.gia), 0) + COALESCE(SUM(dv.chi_phi_thue), 0) AS tong_tien
FROM khach_hang k
LEFT JOIN loai_khach lk ON k.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong hd ON k.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
GROUP BY 
    k.ma_khach_hang, 
    k.ho_ten, 
    lk.ten_loai_khach, 
    hd.ma_hop_dong, 
    dv.ten_dich_vu, 
    hd.ngay_lam_hop_dong, 
    hd.ngay_ket_thuc
ORDER BY k.ma_khach_hang, hd.ma_hop_dong;
