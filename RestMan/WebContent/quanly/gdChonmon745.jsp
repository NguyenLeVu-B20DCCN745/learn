<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*, model.*, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tìm kiếm và chọn món ăn</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	padding-top: 56px;
	/* Adjust the body padding to account for the fixed navbar */
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
		<a class="navbar-brand" href="#">Xin chào, <%=tv.getHt().getHodem() + " " + tv.getHt().getTen()%></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<!-- You can add additional navigation links here if needed -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="../logout.jsp">Đăng
						xuất</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<h2 class="mt-4">Tìm kiếm và chọn món ăn</h2>
		<form id="searchForm" action="gdChonmon745.jsp" method="post">
			<div class="form-group">
				<input type="text" name="keyword" class="form-control"
					placeholder="Nhập từ khóa" />
			</div>
			<button type="submit" class="btn btn-primary">Tìm</button>
		</form>

		<%
			String keyword = request.getParameter("keyword");
				if (keyword != null) {
					MonanDAO745 dao = new MonanDAO745();
					ArrayList<Monan745> danhSachMonAn = dao.getList(keyword);
		%>

		<h3 class="mt-3">Kết quả tìm kiếm:</h3>
		<form id="selectForm" action="gdThemCombo745.jsp" method="post">
			<table class="table table-bordered">
				<thead class="thead-dark">
					<tr>
						<th>Chọn</th>
						<th>Tên món</th>
						<th>Giá</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Monan745 monAn : danhSachMonAn) {
					%>
					<tr>
						<td><input type="checkbox" name="selectedMonanIds"
							value="<%=monAn.getId()%>" onchange="this.form.submit()">
						</td>
						<td><a href="gdChitietmon.jsp?id=<%=monAn.getId()%>"><%=monAn.getTen()%></a></td>
						<td><%=monAn.getGia()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</form>

		<%
			}
		%>
	</div>
	<%
		}
	%>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
