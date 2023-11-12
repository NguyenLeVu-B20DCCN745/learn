<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>

<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.login-container {
    max-width: 400px;
    padding: 20px;
    border: 2px solid #007bff;
    border-radius: 10px;
    box-shadow: 0px 0px 10px #007bff;
}

.login-container h2 {
    color: #007bff;
}
</style>
</head>
<body>
    <div class="login-container">
        <%
            if (request.getParameter("err") != null && request.getParameter("err").equalsIgnoreCase("timeout")) {
        %>
        <h4>Hết phiên làm việc. Làm ơn đăng nhập lại!</h4>
        <%
            } else if (request.getParameter("err") != null && request.getParameter("err").equalsIgnoreCase("fail")) {
        %>
        <h4 style="color: red;">Sai tên đăng nhập/mật khẩu!</h4>
        <%
            }
        %>
        <h2>Đăng nhập</h2>
        <form name="dangnhap" action="doDangnhap.jsp" method="post">
            <table border="0">
                <tr>
                    <td>Tên đăng nhập:</td>
                    <td><input type="text" name="username" id="username"
                        class="form-control" required /></td>
                </tr>
                <tr>
                    <td>Mật khẩu:</td>
                    <td><input type="password" name="password" id="password"
                        class="form-control" required /></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Đăng nhập"
                        class="btn btn-primary" /></td>
                </tr>
            </table>
        </form>
    </div>

    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
