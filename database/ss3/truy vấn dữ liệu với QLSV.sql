-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h'
select * from Student where StudentName like 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from Class where Month(StartDate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from Subject where Credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update Student 
set ClassID = 2 
where StudentName = 'Hung' and StudentID = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi 
-- (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

select s.StudentName, sub.SubName, m.Mark
from Mark m
join Student s on m.StudentId = s.StudentId
join Subject sub on m.SubId = sub.SubId
order by m.Mark desc, 
    s.StudentName asc;