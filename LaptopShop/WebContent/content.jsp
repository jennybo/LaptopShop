<%@page import="java.util.List"%>
<%@page import="model.Brand"%>
<%@page import="model.Category"%>
<%@page import="get.CategoryGet"%>
<%@page import="get.BrandGet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="get.ProductGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <%@page import="adapter.Constants"%>
        <title><%=Constants.NAME_WEBSITE%></title>
    </head>
    <body>
        <% 
            DecimalFormat formatter = new DecimalFormat("###,###,###");
        ProductGet productGet = new ProductGet();    
        BrandGet brandget = new BrandGet();
    String category_id = "";
    String brand_id = "";
    if(request.getParameter("category")!=null){
    category_id = request.getParameter("category");
    }
    if(request.getParameter("brand")!=null){
    brand_id = request.getParameter("brand");
    }
    CategoryGet categoryget = new CategoryGet();
    String category_id_1 = "1";
            %>
        
        		<div class="product">
			<div class="container">
						<div class="col-md-3 product-bottom">
			<!--categories-->
			<div class="categories animated wow fadeInUp animated" data-wow-delay=".5s" >
					<h3>Loại Sản Phẩm</h3>
					<ul class="cate">
                                            <%
                       for (Category c : categoryget.getListCategory()) {
                                              %>
						<li><i class="glyphicon glyphicon-menu-right" ></i><a href="products.jsp?category=<%=c.getCategoryID()%>"><%=c.getCategoryName()%></a></li>	
					 <% } %>
                                        </ul>
				</div>
                                         <div class="categories animated wow fadeInUp animated" data-wow-delay=".5s" >
					<h3>Thương Hiệu</h3>
                                        
					<ul class="cate">
                                            <%
                       for (Brand b : brandget.getListBrand()) {
                                              %>
						<li><i class="glyphicon glyphicon-menu-right" ></i><a href="productbrand.jsp?brand=<%=b.getBrandID()%>"><%=b.getBrandName()%></a></li>	
					 <% } %>
                                        </ul>
                                       
				</div>
		<!--//menu-->
 	</div>
                    
                            
			<div class="col-md-9 animated wow fadeInRight" data-wow-delay=".5s">  

			<div class="mid-popular">
                            
                             <%
                                 String s = (String) session.getAttribute("txtsearch");
                                 List<Product> list = productGet.getListProduct();
                                 if(s==null){
                                  int numberPage=0;
                                  if(request.getParameter("numberpage")!= null)
                                  numberPage = Integer.parseInt(request.getParameter("numberpage"));
                                 
                                  int first = numberPage*15;
                                  int last = first+15;
                                  if(last>list.size()) last = list.size();
                                for (Product p : productGet.getListProductByPages(first, last)) {
                                %>
				<div class="col-sm-4 item-grid item-gr  simpleCart_shelfItem">
                                    
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.jsp?productID=<%=p.getProductID()%>">
											<div class="grid-img">
												<img  src="<%=p.getProductImageBack()%>" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="<%=p.getProductImageForward()%>" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="" alt=""></a>
									<h6><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h6>
                                                                        <p ><em class="item_price"><%=formatter.format(p.getProductPrice())%> VNĐ</em></p>
								
                                                                        <a href="CartServlet?command=plus&productID=<%=p.getProductID()%>" data-text="Thêm vào giỏ" class="but-hover1 item_add">Thêm vào giỏ</a>
								</div>
							</div>
						</div>
<%
                                    }
                                    if(last+15<=list.size())
                                    {%>
                                    <h3><a href="/index.jsp?numberpage=<%=numberPage+1%>"></a></h3>
                             <%}
                                 }%><%
                                 else
                                     if(productGet.getListProductSearch(s).size()!=0)
                                for (Product p : productGet.getListProductSearch(s)) {
                                %>
				<div class="col-sm-4 item-grid item-gr  simpleCart_shelfItem">
                                    
							<div class="grid-pro">
								<div  class=" grid-product " >
									<figure>		
										<a href="single.jsp?productID=<%=p.getProductID()%>">
											<div class="grid-img">
												<img  src="<%=p.getProductImageBack()%>" class="img-responsive" alt="">
											</div>
											<div class="grid-img">
												<img  src="<%=p.getProductImageForward()%>" class="img-responsive"  alt="">
											</div>			
										</a>		
									</figure>	
								</div>
								<div class="women">
									<a href="#"><img src="" alt=""></a>
									<h6><a href="single.jsp?productID=<%=p.getProductID()%>"><%=p.getProductName()%></a></h6>
                                                                        <p ><em class="item_price"><%=formatter.format(p.getProductPrice())%> VNĐ</em></p>
								
                                                                        <a href="<%=Constants.LINK_ROOT%>/CartServlet?command=plus&productID=<%=p.getProductID()%>" data-text="Thêm vào giỏ" class="but-hover1 item_add">Thêm vào giỏ</a>
								</div>
							</div>
						</div>
<%
                                    }
                                     else 
                                     {%>
                                     <h4>Không tìm thấy kết quả trả về!</h4>
                                   <%}
                                    session.setAttribute("txtsearch", null);
                                    %>

					<div class="clearfix"> </div>
				</div>
			</div>
                                
		
		<div class="clearfix"> </div>
    </body>
</html>
