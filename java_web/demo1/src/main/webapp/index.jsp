<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h2>Product Discount Calculator</h2>

<form action="discount-servlet" method="post">
    <label>Product Description:</label>
    <input type="text" name="description" required><br><br>

    <label>List Price:</label>
    <input type="number" name="listPrice" step="0.01" required><br><br>

    <label>Discount Percent:</label>
    <input type="number" name="discountPercent" step="0.01" required><br><br>

    <button type="submit">Calculate Discount</button>
</form>

</body>
</html>