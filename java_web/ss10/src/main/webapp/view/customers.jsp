<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách khách hàng</title>
    <style>
        body {
            font-family: "Helvetica, sans-serif";
            text-align: center;
            background-color: #e3f2fd;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
        }

        th {
            background-color: #90caf9;
            font-weight: bold;
        }

        tr:hover {
            background-color: #bbdefb;
            transition: 0.3s;
        }

        img {
            width: 70px;
            height: 70px;
            border-radius: 5px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<h2>Danh sách khách hàng</h2>

<table>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customers}">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.dob}</td>
            <td>${customer.address}</td>
            <td><img src="${pageContext.request.contextPath}/${customer.image}" alt="Ảnh ${customer.name}"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>