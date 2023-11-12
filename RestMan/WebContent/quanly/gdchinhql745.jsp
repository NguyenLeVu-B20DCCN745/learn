<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Trang chủ quản lý</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 56px; /* Adjust the body padding to account for the fixed navbar */
        }

        .container {
            margin-top: 20px;
        }

        .btn-container {
            text-align: center;
        }

        .btn-custom {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%
        Thanhvien745 tv = (Thanhvien745) session.getAttribute("quanly");
        if (tv == null) {
            response.sendRedirect("../gdDangNhap745.jsp?err=timeout");
        } else {
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="#">Xin chào, <%=tv.getHt().getHodem()+" "+tv.getHt().getTen()%></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <!-- You can add additional navigation links here if needed -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="../logout.jsp">Đăng xuất</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h2 class="mt-4">Trang chủ quản lý</h2>
        <div class="btn-container">
            <button class="btn btn-primary btn-custom" onclick="openPage('gdQlCombo745.jsp')">Quản lý combo</button>
        </div>
    </div>
    <%
        }
    %>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function openPage(page) {
            window.location.href = page;
        }
    </script>
</body>
</html>
