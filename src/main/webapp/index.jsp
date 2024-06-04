
<%@page import="java.util.*"%>
<%@page import="ts.shoping_cart.dao.productDao"%>
<%@page import="ts.shoping_cart.connection.DbCon"%>
<%@page import="ts.shoping_cart.model.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
user auth = (user) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

productDao pd = new productDao(DbCon.getConnection());
List<product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wel-Come To Shopping cart</title>

<%@include file="includes/head.jsp"%>
<link rel="stylesheet" href="includes/style.css">
<link rel="stylesheet" href="includes/indexStyle.css">

<!-- BOOTSTRAP CDN FOR PRODUCT SECTION -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style type="text/css">
#section1 {
	background-color: #463333;
	height: 92vh;
	background: url(img/main4.jpg);
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;	
}

</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<section id="section1" class="section">
		  <div class="home-heading">
            <h1>The Grocery U <span>Love</span></h1>
            <p>
              Welcome and Discover our grocery shop: fresh produce, pantry essentials, and more, all conveniently
              available for your everyday needs.</p>

            <!-- <div class="flex-div search">
              <h6>Find the Product</h6>
             
              <div class="input-icon">
                <input type="search" name="search" placeholder="Search Product">
                <i class="fa fa-google" aria-hidden="true"></i>
              </div>
            </div> -->

            <div class="shopNow_container">
              <div id="banner_content">
                <h2>We sell healthy grocery</h2>
                <p>Flat 40% OFF on healthy grocery </p>
                <!-- <br /> -->
                <a href="products.jsp" class="hero-btn">Shop Now</a>
              </div>
            </div>
          </div>

	</section>
	
<!-- 	*****************************************CATEGORY********************************************
 -->	
 <section id="section2" class="section">
		<div class="item-container" id="item-container">
    <div class="catogory">
      <h2>Category</h2>
    </div>


    <div class="row text-center" id="item_list">
      <div class="col-sm-4">
        <a href="product.html#Pantry-Staples">
          <div class="thumbnail">
            <img src="img/Pantry Staples2.avif" alt="">
            <div class="feature-caption">
              <h3>Pantry Staples</h3>
              <p>Essential ingredients for your well-stocked kitchen pantry.</p>
            </div>
          </div>
        </a>
      </div>

      <div class="col-sm-4">
        <a href="product.html#Fruits&Vegetables">
          <div class="thumbnail">
            <img src="img/Fruits&vegitable1.avif" alt="">
            <div class="feature-caption">
              <h3>Fruits&Vegetables</h3>
              <p>OExplore our fresh selection of Fruits & Vegetables.</p>
            </div>
          </div>
        </a>
      </div>

      <div class="col-sm-4">
        <a href="product.html#Snacks&Beverages">
          <div class="thumbnail">
            <img src="img/Snacks4.avif" alt="">
            <div class="feature-caption">
              <h3>Snacks&Beverages</h3>
              <p>Discover a tempting array of delicious snacks.</p>
            </div>
          </div>
        </a>
      </div>
    </div>
  </div>
	</section>
		<!-- ---------------------------------------------Product section START----------------------------------------->
	<section id="section3" class="section">

  <section class="pt-5 pb-5" id="product">
    <div class="all-flex">
      <h2>Our Product</h2>
    </div>
    <div class="container" id="product-container">
      <div class="row">
        <div class="col-6">
          <h3 class="mb-3"id="mb-3"
            style="color: darkblue; font-size: 45px; font-weight: 900; border-bottom: 1px solid #ff9c15; width:50%; ">
            Product Slide </h3>
        </div>
        <div class="col-6 text-right">
          <a class="btn btn-primary mb-3 mr-1" href="#carouselExampleIndicators2" role="button" data-slide="prev">
            <i class="fa fa-arrow-left"></i>
          </a>
          <a class="btn btn-primary mb-3 " href="#carouselExampleIndicators2" role="button" data-slide="next">
            <i class="fa fa-arrow-right"></i>
          </a>
        </div>
        <div class="col-12">
          <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">

            <div class="carousel-inner">
              <div class="carousel-item active">
                <div class="row">

                  <div class="col-md-4 mb-3">
                    <div class="card" style=" box-shadow: 0 0 6px rgba(0, 0,0 , 0.8);">
                      <img class="img-fluid" alt="100%x280" src="img/atta.jpg">
                      <div class="feature-caption">
                        <h3 class="card-title">Special title treatment</h3>
                        <p class="card-text">With supporting text below .</p>

                      </div>

                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <div class="card" style=" box-shadow: 0 0 6px rgba(0, 0,0 , 0.8);">
                      <img class="img-fluid" alt="100%x280" src="img/freOil.jpeg">
                      <div class="feature-caption">
                        <h3 class="card-title">Special title treatment</h3>
                        <p class="card-text">With supporting text below .</p>

                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <div class="card" style=" box-shadow: 0 0 6px rgba(0, 0,0 , 0.8);">
                      <img class="img-fluid" alt="100%x280" src="img/riceIN.jpeg">
                      <div class="feature-caption">
                        <h3 class="card-title">Special title treatment</h3>
                        <p class="card-text">With supporting text below .</p>

                      </div>
                    </div>
                  </div>

                </div>
              </div>
              <div class="carousel-item">
                <div class="row">

                  <div class="col-md-4 mb-3">
                    <div class="card" style=" box-shadow: 0 0 6px rgba(0, 0,0 , 0.8);">
                      <img class="img-fluid" alt="100%x280" src="img/onion.jpg">
                      <div class="feature-caption">
                        <h3 class="card-title">Special title treatment</h3>
                        <p class="card-text">With supporting text below .</p>

                      </div>

                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <div class="card" style=" box-shadow: 0 0 6px rgba(0, 0,0 , 0.8);">
                      <img class="img-fluid" alt="100%x280" src="img/garlic.png">
                      <div class="feature-caption">
                        <h3 class="card-title">Special title treatment</h3>
                        <p class="card-text">With supporting text below .</p>

                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <div class="card" style=" box-shadow: 0 0 6px rgba(0, 0,0 , 0.8);">
                      <img class="img-fluid" alt="100%x280" src="img/patato.png">
                      <div class="feature-caption">
                        <h3 class="card-title">Special title treatment</h3>
                        <p class="card-text">With supporting text below .</p>

                      </div>
                    </div>
                  </div>

                </div>
              </div>
              <div class="carousel-item">
                <div class="row">

                  <div class="col-md-4 mb-3">
                    <div class="card" style=" box-shadow: 0 0 6px rgba(0, 0,0 , 0.8);">
                      <img class="img-fluid" alt="100%x280" src="img/maggi.jpg">
                      <div class="feature-caption">
                        <h3 class="card-title">Special title treatment</h3>
                        <p class="card-text">With supporting text below .</p>

                      </div>

                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <div class="card" style=" box-shadow: 0 0 6px rgba(0, 0,0 , 0.8);">
                      <img class="img-fluid" alt="100%x280" src="img/lays.jpeg">
                      <div class="feature-caption">
                        <h3 class="card-title">Special title treatment</h3>
                        <p class="card-text">With supporting text below .</p>

                      </div>
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <div class="card" style=" box-shadow: 0 0 6px rgba(0, 0,0 , 0.8);">
                      <img class="img-fluid" alt="100%x280" src="img/col2.jpeg">
                      <div class="feature-caption">
                        <h3 class="card-title">Special title treatment</h3>
                        <p class="card-text">With supporting text below .</p>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- ---------------------------------------------Product section END----------------------------------------->
	</section>
	
	<%@include file="includes/page-footer.jsp"%>

	<%@include file="includes/footer.jsp"%>
</body>
</html>