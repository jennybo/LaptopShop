<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="adapter.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>content</title>
        
    </head>
    <body>

        <div id="rightContent">
            <h3>Trang Quản Lý</h3>
            
            <div class="shortcutHome">
                <a href="<%=Constants.LINK_ROOT%>/admin/trangchu.jsp"><img src="mos-css/Home.png"><br>Trang Chủ</a>
            </div>
            <div class="shortcutHome">
                <a href="<%=Constants.LINK_ROOT%>/admin/manager_category.jsp"><img src="mos-css/Tag.png"><br>Danh Mục</a>
            </div>
            <div class="shortcutHome">
                <a href="<%=Constants.LINK_ROOT%>/admin/manager_brand.jsp"><img src="mos-css/T-Shirt.png"><br>Nhãn Hiệu</a>
            </div>
           
            <div class="shortcutHome">
                <a href="<%=Constants.LINK_ROOT%>/admin/manager_product.jsp"><img src="mos-css/Database.png"><br>Sản Phẩm</a>
            </div>
            <div class="shortcutHome">
                <a href="<%=Constants.LINK_ROOT%>/admin/manager_bill.jsp"><img src="mos-css/Shopping.png"><br>Hóa Đơn</a>
            </div>
            <div class="shortcutHome">
                <a href="<%=Constants.LINK_ROOT%>/admin/manager_user.jsp"><img src="mos-css/User.png"><br>Người Dùng</a>
            </div>
            <div class="shortcutHome">
                <a href="<%=Constants.LINK_ROOT%>/admin/manager_contact.jsp"><img src="mos-css/Mail3.png"><br>Liên Hệ</a>
            </div>
            <div class="shortcutHome">
                <a href="<%=Constants.LINK_ROOT%>/admin/manager_chart.jsp"><img src="mos-css/Chart.png"><br>Thống Kê</a>
            </div>

            <div class="clear"></div>

          
          
        </div>
        <div class="clear"></div>

    </body>
</html>
