<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu</title>
        <%@page import="adapter.Constants"%>
    </head>
    <body>

        <div id="leftBar">
            <ul>
                <li><a href="<%=Constants.LINK_ROOT%>/admin/index.jsp">Trang chủ</a></li>
                <li><a href="<%=Constants.LINK_ROOT%>/admin/manager_category.jsp">Danh mục</a></li>
                <li><a href="<%=Constants.LINK_ROOT%>/admin/manager_brand.jsp">Nhãn hiệu</a></li>
                <li><a href="<%=Constants.LINK_ROOT%>/admin/manager_product.jsp">Sản phẩm</a></li>
                <li><a href="<%=Constants.LINK_ROOT%>/admin/manager_bill.jsp">Hóa đơn</a></li>
                <li><a href="<%=Constants.LINK_ROOT%>/admin/manager_user.jsp">Người dùng</a></li>
                <li><a href="<%=Constants.LINK_ROOT%>/admin/manager_contact.jsp">Liên hệ</a></li>
                <li><a href="<%=Constants.LINK_ROOT%>/admin/manager_newsletter.jsp">Newsletter</a></li>
                <li><a href="<%=Constants.LINK_ROOT%>/ChartServlet">Thống kê</a></li>
            </ul>
        </div>

    </body>
</html>
