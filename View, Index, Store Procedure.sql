-- Câu 1: Hiển thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp
SELECT c.id, c.name, COUNT(s.id) AS student_count
FROM class c
LEFT JOIN student s ON c.id = s.class_id
GROUP BY c.id, c.name;
-- Câu 2: Tính điểm lớn nhất của mỗi lớp
SELECT c.id, c.name, MAX(s.point) AS max_point
FROM class c
JOIN student s ON c.id = s.class_id
GROUP BY c.id, c.name;
-- Câu 3: Tính điểm trung bình của từng lớp
SELECT c.id, c.name, AVG(s.point) AS avg_point
FROM class c
JOIN student s ON c.id = s.class_id
GROUP BY c.id, c.name;
-- Câu 4: Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym
SELECT name, birthday FROM instructor
UNION ALL
SELECT name, birthday FROM student;
-- Câu 5: Lấy ra top 3 học viên có điểm cao nhất của trung tâm
SELECT * FROM student
ORDER BY point DESC
LIMIT 3;
-- Câu 6: Lấy ra các học viên có điểm số là cao nhất của trung tâm
SELECT * FROM student
WHERE point = (SELECT MAX(point) FROM student);
-- Câu 7: Lấy ra tất cả các giảng viên chưa từng tham gia giảng dạy
SELECT * FROM instructor i
WHERE i.id NOT IN (SELECT DISTINCT instructor_id FROM instructor_class);