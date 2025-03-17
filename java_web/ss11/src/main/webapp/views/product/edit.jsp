<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chỉnh sửa sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2 class="text-center">Chỉnh sửa sản phẩm</h2>

<!-- Hiển thị thông báo nếu có -->
<c:if test="${not empty message}">
    <div class="alert alert-success text-center">${message}</div>
</c:if>
<c:if test="${not empty error}">
    <div class="alert alert-danger text-center">${error}</div>
</c:if>

<form action="products" method="post" class="mx-auto w-50 border p-4 shadow rounded">
    <input type="hidden" name="action" value="edit">
    <input type="hidden" name="id" value="${product.id}">

    <div class="mb-3">
        <label for="name" class="form-label">Tên sản phẩm:</label>
        <input type="text" id="name" name="name" class="form-control" value="${product.name}" required>
    </div>

    <div class="mb-3">
        <label for="price" class="form-label">Giá:</label>
        <input type="number" id="price" name="price" class="form-control" value="${product.price}" required>
    </div>

    <div class="mb-3">
        <label for="description" class="form-label">Mô tả:</label>
        <textarea id="description" name="description" class="form-control">${product.description}</textarea>
    </div>

    <div class="mb-3">
        <label for="producer" class="form-label">Hãng sản xuất:</label>
        <input type="text" id="producer" name="producer" class="form-control" value="${product.producer}" required>
    </div>

    <button type="submit" class="btn btn-success w-100">Cập nhật</button>
</form>

<div class="text-center mt-3">
    <a href="products" class="btn btn-secondary">Quay lại danh sách</a>
</div>
</body>
</html>