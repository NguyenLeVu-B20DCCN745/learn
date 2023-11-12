<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*, model.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Combo</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
		<h2 class="mt-4">Thêm Combo</h2>

		<form action="xulyChonmon.jsp" method="post">
			<!-- Your Combo details input fields go here -->
			<div class="form-group">
				<label for="comboName">Tên Combo:</label> <input type="text"
					class="form-control" id="comboName" name="comboName" required>
			</div>

			<!-- Display the selected food items -->
			<h3 class="mt-3">Các món đã chọn:</h3>
			<ul>
				<%
                    String[] selectedMonanIds = request.getParameterValues("selectedMonanIds");
                    if (selectedMonanIds != null) {
                        MonanDAO745 monanDAO = new MonanDAO745();
                        for (String monanId : selectedMonanIds) {
                            int id = Integer.parseInt(monanId);
                            Monan745 monan = monanDAO.getMonan(id);
                %>
				<li><%= monan.getTen() %> - <%= monan.getGia() %> VNĐ</li>
				<input type="hidden" name="selectedMonanIds"
					value="<%= monan.getId() %>">
				<%
                        }
                    }
                %>
			</ul>

			<button type="submit" class="btn btn-success">Lưu Combo</button>
		</form>
	</div>
	<%} %>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
