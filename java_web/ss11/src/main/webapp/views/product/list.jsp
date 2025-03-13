<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2 class="text-center">Danh sách sản phẩm</h2>
<div class="mb-3">
    <a href="products?action=create" class="btn btn-primary">Thêm sản phẩm mới</a>
</div>

<table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Mô tả</th>
        <th>Hãng sản xuất</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.producer}</td>
            <td>
                <a href="products?action=view&id=${product.id}" class="btn btn-info btn-sm">Xem</a>
                <a href="products?action=edit&id=${product.id}" class="btn btn-warning btn-sm">Sửa</a>
                <a href="products?action=delete&id=${product.id}"
                   class="btn btn-danger btn-sm"
                   onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="text-center mt-3">
    <a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">Quay lại trang chủ</a>
</div>
</body>
</html>