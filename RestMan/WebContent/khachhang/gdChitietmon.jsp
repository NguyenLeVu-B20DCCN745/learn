<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*, model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Chi tiết món ăn</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%
        Thanhvien745 tv = (Thanhvien745) session.getAttribute("khach");
        if (tv == null) {
            response.sendRedirect("../gdDangNhap745.jsp?err=timeout");
        } else {
    %>
    <%
        String monAnId = request.getParameter("id");
        if (monAnId != null) {
            MonanDAO745 dao = new MonanDAO745();
            Monan745 monAn = dao.getMonan(Integer.parseInt(monAnId));
    %>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Xin chào, <%=tv.getHt().getHodem() + " " + tv.getHt().getTen()%></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="../logout.jsp">Đăng xuất</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="jumbotron mt-4">
            <h2 class="mt-4">Chi tiết món ăn: <%=monAn.getTen() %></h2>
            <p class="lead">Tên món ăn: <%=monAn.getTen()%></p>
            <p class="lead">Mô tả: <%=monAn.getMota()%></p>
            <p class="lead">Giá: <%=monAn.getGia()%></p>
        </div>
    </div>
    <%
        }
       }
    %>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
