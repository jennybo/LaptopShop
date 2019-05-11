
<%@page import="adapter.Constants"%>
<%@page import="get.BrandGet"%>
<%@page import="model.Brand"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="get.ProductGet"%>
<%@page import="model.Category"%>
<%@page import="get.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật sản phẩm</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link href="${root}/css/mos-style.css" rel='stylesheet' type='text/css' />

    </head>
    <body>
    <%
           
             CategoryGet categoryget = new CategoryGet();
        BrandGet brandget = new BrandGet();
            String productID = "";
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
            Product product = new ProductGet().getProduct(Long.parseLong(request.getParameter("product_id")));
           
        %>

        <jsp:include page="header.jsp"></jsp:include>

            <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>

                <div id="rightContent">
                    <h3>Cập nhật sản phẩm</h3>
                    <form action="<%=Constants.LINK_ROOT%>/ManagerProductServlet" method="post">
                    <table width="95%">
                         <tr><td width="125px"><b>Mã sản phẩm</b></td>
                             <td><input type="text" class="sedang" name="maSanPham" value="<%=product.getProductID()%>"><%=error%></td>
                    </tr>
                         <tr><td width="125px"><b>Tên sản phẩm</b></td>
                             <td><input type="text" class="sedang" name="tenSanPham" value="<%=product.getProductName()%>"><%=error%></td>
                    </tr>
                        <tr><td><b>Tên danh mục</b></td><td>
                                <div>
                                <span></span>
                                <select name="maloai">
                                   <%
           for (Category c : categoryget.getListCategory()) {
            %>
                                    <option value="<%=c.getCategoryID()%>"><%=c.getCategoryName()%></option>
                                    <% } %>
                                        
                                </select>
				</div>
                                <input type="hidden" class="sedang" name=""><%=error%></td></tr>
                        
                        
                        <tr><td><b>Tên thương hiệu</b></td><td>
                                <div>
                                <span></span>
                                <select name="mathuonghieu">
                                   <%
           for (Brand b : brandget.getListBrand()) {
            %>
                                    <option value="<%=b.getBrandID()%>"><%=b.getBrandName()%></option>
                                    <% } %>
                                        
                                </select>
				</div>
                                <input type="hidden" class="sedang" name=""><%=error%></td></tr>
                        <tr><td><b>Hình đại diện</b></td><td><input type="file" placeholder="images/tênhình.jpg" class="sedang" name="daidien"><%=error%></td><</tr>
                        <tr><td><b>Hình mặt trước</b></td><td><input type="file" placeholder="images/tênhình.jpg" class="sedang" name="mattruoc"><%=error%></td></tr>
                        <tr><td><b>Hình mặt sau</b></td><td><input type="file" placeholder="images/tênhình.jpg" class="sedang" name="matsau"><%=error%></td></tr>
                        <tr><td><b>Giá sản phẩm</b></td><td><input type="text" class="sedang" name="gia" value="<%=product.getProductPrice()%>"><%=error%><b> VNĐ</b></td></tr>
                          
                        
                        <tr><td><b>Mô tả chi tiết</b></td><td><input type="text" class="textarea" name="mota" value="<%=product.getProductDescription()%>"><%=error%></td></tr>
                        
                        
                       
                        <tr><td></td><td>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="product_id" value="<%=request.getParameter("product_id")%>">
                                <input type="submit" class="button" value="Lưu dữ liệu">
                            </td>
                        </tr>
                       
                    </table>
                    </form>
                </div>
                <div class="clear"></div>

            <jsp:include page="footer.jsp"></jsp:include>

        </div>


    </body>
</html>
