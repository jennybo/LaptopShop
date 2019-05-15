

<%@page import="java.text.DecimalFormat"%>
<%@page import="get.BrandGet"%>
<%@page import="model.Brand"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Cart"%>
<%@page import="model.User"%>
<%@page import="model.Category"%>
<%@page import="get.CategoryGet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@page import="adapter.Constants"%>
<title><%=Constants.NAME_WEBSITE%></title>

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="<%=Constants.LINK_ROOT%>/frontendplus/css/bootstrap.min.css" />

<!-- Slick -->
<link type="text/css" rel="stylesheet"
	href="<%=Constants.LINK_ROOT%>/frontendplus/css/slick.css" />
<link type="text/css" rel="stylesheet"
	href="<%=Constants.LINK_ROOT%>/frontendplus/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet"
	href="<%=Constants.LINK_ROOT%>/frontendplus/css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet"
	href="<%=Constants.LINK_ROOT%>/frontendplus/css/font-awesome.min.css">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="<%=Constants.LINK_ROOT%>/frontendplus/css/style.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>
<body>

	<% 
            
        CategoryGet categoryget = new CategoryGet();
        BrandGet brandget = new BrandGet();
        User user = null;
        if(session.getAttribute("user") != null){
            user = (User) session.getAttribute("user");
        }
        
        Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            DecimalFormat formatter = new DecimalFormat("###,###,###");
            %>

	<div id="top-header">
		<div class="container">
			<ul class="header-links pull-left">
				<li><a href="#"><i class="fa fa-phone"></i>0377944515</a></li>
				<li><a href="#"><i class="fa fa-envelope-o"></i>
						jennybo@gmail.com</a></li>
				<li><a href="#"><i class="fa fa-map-marker"></i> 1734
						Stonecoal Road</a></li>
			</ul>
			<ul class="header-links pull-right">
				<li><a href="#"><i class="fa fa-dollar"><%=formatter.format(cart.totalCart())%></i>VND</a></li>
				<%if(user!=null){ %>

				<li><a href="navigate.jsp"><i class="fa fa-user-o"></i>Chào
						<%=user.getUserName()%></a></li>
				<% } %>
				<%if(user==null){ %>

				<li><a href="navigate.jsp"><i class="fa fa-user-o"></i>My
						Account</a></li>
				<% } %>
			</ul>
		</div>
	</div>
	<!-- /TOP HEADER -->

	<!-- MAIN HEADER -->
	<div id="header">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- LOGO -->
				<div class="col-md-3">
					<div class="header-logo">
						<a href="#" class="logo">
							<div class="navbar-brand logo-nav-left ">
								<h1 class="animated wow pulse" data-wow-delay=".5s">
									<a href="index.jsp"><%=Constants.NAME_WEBSITE%>shop</a>
								</h1>
							</div>
						</a>
					</div>
				</div>
				<!-- /LOGO -->

				<!-- SEARCH BAR -->
				<div class="col-md-6">
					<div class="header-search">
						<form method="post"
							action="SearchServlet?command=searchProductHome">
							<input class="input" placeholder="Search here" name="txtsearch">
							<button class="search-btn">Search</button>
						</form>
					</div>
				</div>
				<!-- /SEARCH BAR -->

				<!-- ACCOUNT -->
				<div class="col-md-3 clearfix">
					<div class="header-ctn">

						<!-- Cart -->
						<div class="dropdown" style="cursor: pointer;">
							<a class="dropdown-toggle" data-toggle="dropdown"
								aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Your
									Cart</span>
								<div class="qty"><%=cart.getCartItems().entrySet().size()%></div>
							</a>
							<div class="cart-dropdown">
								<div class="cart-list">
									<%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
									<div class="product-widget">
										<div class="product-img">
											<img
												src="<%=list.getValue().getProduct().getProductImage()%>"
												alt="">
										</div>
										<div class="product-body">
											<h3 class="product-name">
												<a
													href="<%=Constants.LINK_ROOT%>/single.jsp?productID=<%=list.getValue().getProduct().getProductID()%>"><%=list.getValue().getProduct().getProductName()%></a>
											</h3>
											<h4 class="product-price"><%=formatter.format(list.getValue().getProduct().getProductPrice())%>VNĐ
											</h4>
										</div>
										<a
											href="<%=Constants.LINK_ROOT%>/CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>"><button
												class="delete" value="Delete">
												<i class="fa fa-close"></i>
											</button></a>
									</div>


									<% } %>
								</div>
								<div class="cart-summary">
									<small><%=cart.getCartItems().entrySet().size()%>
										Item(s) selected</small>
									<h5>
										SUBTOTAL:
										<%=cart.totalCart()%></h5>
								</div>
								<div class="cart-btns">
									<a href="checkout.jsp">View Cart</a> <a href="checkoutstep.jsp">Checkout
										<i class="fa fa-arrow-circle-right"></i>
									</a>
								</div>
							</div>
						</div>
						<!-- /Cart -->

						<!-- Menu Toogle -->
						<div class="menu-toggle">
							<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
							</a>
						</div>
						<!-- /Menu Toogle -->
					</div>
				</div>
				<!-- /ACCOUNT -->
			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</div>
	<!-- /MAIN HEADER -->
	</header>
	<div class="header"></div>
	</div>
	<div class="container">
		<div class="logo-nav" id="menu_nav">

			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
					<ul class="nav navbar-nav" style="float: left;">
						<li class="active"><a href="index.jsp" class="act">Trang
								Chủ</a></li>
						<!-- Mega Menu -->
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Sản Phẩm<b class="caret"></b></a>
							<ul class="dropdown-menu multi">
								<div class="row">
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<h4><%=Constants.NAME_WEBSITE%></h4>

											<%
                                                                                                    for (Category c : categoryget.getListCategory()) {
                                                                                                    %>
											<li><a
												href="products.jsp?category=<%=c.getCategoryID()%>"><%=c.getCategoryName()%></a></li>


											<%
                                                                                                    }
                                                                                                 %>


										</ul>
									</div>

									<div class="clearfix"></div>
								</div>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Thương Hiệu <b class="caret"></b></a>
							<ul class="dropdown-menu multi">
								<div class="row">
									<div class="col-sm-4">
										<ul class="multi-column-dropdown">
											<h4>THƯƠNG HIỆU</h4>

											<%
                                                                                                    for (Brand b : brandget.getListBrand()) {
                                                                                                    %>
											<li><a href="productbrand.jsp?brand=<%=b.getBrandID()%>"><%=b.getBrandName()%></a></li>


											<%
                                                                                                    }
                                                                                                 %>


										</ul>
									</div>

									<div class="clearfix"></div>
								</div>
								<div class="row-top">
									<div class="col-sm-6 row1">
										<a href="productbrand.jsp?brand=1"><img
											src="images/me.jpg" alt="" class="img-responsive"></a>
									</div>
									<div class=" col-sm-6 row2">
										<a href="productbrand.jsp?brand=8"><img
											src="images/me1.jpg" alt="" class="img-responsive"></a>
									</div>
									<div class="clearfix"></div>
								</div>
							</ul></li>

						<li><a href="navigate.jsp">Tài Khoản</a></li>
						<li><a href="contact.jsp">Liên Hệ</a></li>

					</ul>
				</div>
			</nav>
		</div>

	</div>
</body>
</html>
