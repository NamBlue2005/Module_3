package com.example.demo1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/discount-servlet")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String description = request.getParameter("description");
            double listPrice = Double.parseDouble(request.getParameter("listPrice"));
            double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));

            double discountAmount = listPrice * discountPercent * 0.01;
            double discountPrice = listPrice - discountAmount;

            request.setAttribute("description", description);
            request.setAttribute("listPrice", listPrice);
            request.setAttribute("discountPercent", discountPercent);
            request.setAttribute("discountAmount", discountAmount);
            request.setAttribute("discountPrice", discountPrice);

            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.getWriter().println("<h3 style='color:red;'>Lỗi: Dữ liệu nhập không hợp lệ!</h3>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}