<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*"%>
<%
	String username = (String) request.getParameter("username");
	String password = (String) request.getParameter("password");
	Thanhvien745 tv = new Thanhvien745();
	tv.setUsername(username);
	tv.setPassword(password);
	ThanhvienDAO745 dao = new ThanhvienDAO745();
	boolean kq = dao.kiemtraDN(tv);
	if (kq && (tv.getVaitro().equalsIgnoreCase("khach"))) {
		session.setAttribute("khach", tv);
		response.sendRedirect("khachhang\\gdchinhkh.jsp");
	} else if (kq && (tv.getVaitro().equalsIgnoreCase("quanly"))) {
		session.setAttribute("quanly", tv);
		response.sendRedirect("quanly\\gdchinhql745.jsp");
	} else {
		response.sendRedirect("gdDangNhap745.jsp?err=fail");
	}
%>