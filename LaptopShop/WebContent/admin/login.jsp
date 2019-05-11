

<%@page import="adapter.Constants"%>
<%@page import="adapter.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Nhập - <%=Constants.NAME_WEBSITE%></title>

    <c:set var="root" value="${pageContext.request.contextPath}"/>
    <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

</head>
<body>
    <%%>

    <div id="loginForm">
        <div class="headLoginForm">
            Đăng nhập Admin
        </div>
        <div class="fieldLogin">
            <form action="<%=Constants.LINK_ROOT%>/AdminUserServlet" method="post">
                <%if(session.getAttribute("error")!=null){%>
                    <div>
                        <p style="color:red;"><%String error = (String)session.getAttribute("error");
                            out.print(error);%></p>
                    </div>
                        <% } %>
                <label>Tài khoản</label><br>
                <input type="text" class="login" name="emailadmin"><br>
                <label>Mật khẩu</label><br>
                <input type="password" class="login" name="passadmin"><br>
                <input type="hidden" value="login" name="commandadmin">
                <input type="submit" class="button" value="Đăng Nhập">
            </form>
        </div>
    </div>

</body>
</html>
