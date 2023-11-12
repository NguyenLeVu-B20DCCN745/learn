<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.*, model.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Tìm kiếm thông tin món ăn</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 56px; /* Adjust the body padding to account for the fixed navbar */
        }
    </style>
    <script>
        function validateForm() {
            var keyword = document.getElementById("keyword").value.trim();
            if (keyword === "") {
                alert("Vui lòng nhập từ khóa trước khi tìm kiếm.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <%
        Thanhvien745 tv = (Thanhvien745) session.getAttribute("khach");
        if (tv == null) {
            response.sendRedirect("../gdDangNhap745.jsp?err=timeout");
        } else {
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
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

    <div class="container mt-5">
        <h2 class="mb-4">Tìm kiếm thông tin món ăn</h2>
        <form action="gdTimkiem.jsp" method="post" accept-charset="UTF-8" onsubmit="return validateForm()">
            <div class="input-group mb-3">
                <input type="text" id="keyword" name="keyword" class="form-control"
                    placeholder="Nhập từ khóa" aria-label="Nhập từ khóa" aria-describedby="searchButton">
                <div class="input-group-append">
                    <button class="btn btn-primary" type="submit" id="searchButton">Tìm</button>
                </div>
            </div>
        </form>

        <%
            String keyword = request.getParameter("keyword");
            System.out.println("Keyword: " + keyword);

            if (keyword != null) {
                MonanDAO745 dao = new MonanDAO745();
                ArrayList<Monan745> danhSachMonAn = dao.getList(keyword);
        %>
        <h3 class="mt-3">Kết quả tìm kiếm cho từ khóa: <%=keyword%></h3>
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>STT</th>
                    <th>Tên món</th>
                    <th>Giá</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int stt = 1;
                        for (Monan745 monAn : danhSachMonAn) {
                %>
                <tr>
                    <td><%=stt%></td>
                    <td><a href="gdChitietmon.jsp?id=<%=monAn.getId()%>"><%=monAn.getTen()%></a></td>
                    <td><%=monAn.getGia()%></td>
                </tr>
                <%
                    stt++;
                        }
                %>
            </tbody>
        </table>
        <%
            }
        %>
    </div>
    <%} %>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
