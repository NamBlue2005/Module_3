-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.

SELECT * FROM
Subject WHERE Credit = (SELECT MAX(Credit)
FROM Subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

SELECT s.SubId, s.SubName, s.Credit, s.Status, m.Mark
FROM Subject s
JOIN Mark m ON s.SubId = m.SubId
WHERE m.Mark = (SELECT MAX(Mark) FROM Mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

SELECT s.*, AVG(m.Mark) AS average_score
FROM Student s 
LEFT JOIN Mark m ON s.StudentId = m.StudentId
GROUP BY s.StudentId
ORDER BY average_score DESC;

