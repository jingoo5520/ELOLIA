<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Header</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="/resources/assets/user/images/logo/white-logo.svg" />

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="/resources/assets/user/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/user/css/LineIcons.3.0.css" />
<link rel="stylesheet" href="/resources/assets/user/css/tiny-slider.css" />
<link rel="stylesheet" href="/resources/assets/user/css/glightbox.min.css" />
<link rel="stylesheet" href="/resources/assets/user/css/main.css" />

<style type="text/css">
.user-login li a:hover {
	color: red;
}
</style>
</head>
<body>
	<!-- Start Header Area -->
	<header class="header navbar-area">
		<!-- Start Topbar -->
		<div class="topbar">
			<div class="container" id="test">
				<div class="row align-items-center">
					<div class="col-lg-4 col-md-4 col-12">
						<div class="top-left"></div>
					</div>
					<div class="col-lg-4 col-md-4 col-12">
						<div class="top-middle"></div>
					</div>
					<div class="col-lg-4 col-md-4 col-12">
						<div class="top-end">
							<!-- 로그인 안됬을 때 -->
							<c:if test="${empty sessionScope.loginMember }">
								<div class="user">
									<i class="lni lni-user"></i> 로그인하세요.

								</div>
								<ul class="user-login">
									<li><a href="${pageContext.request.contextPath}/member/viewLogin">로그인</a></li>
									<li><a href="${pageContext.request.contextPath}/member/viewSignUp">회원가입</a></li>
								</ul>
							</c:if>
							<!-- 로그인 됬을 때 -->
							<c:if test="${not empty sessionScope.loginMember }">
								<div class="user">
									<i class="lni lni-user"></i> ${sessionScope.loginMember.member_name } 님
								</div>
								<ul class="user-login">
									<li><a href="${pageContext.request.contextPath}/member/myPage/modiInfo">내 정보</a></li>
									<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
								</ul>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Topbar -->
		<!-- Start Header Middle -->
		<div class="header-middle">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-3 col-md-3 col-7">
						<!-- Start Header Logo -->
						<a class="navbar-brand" href="${pageContext.request.contextPath}/"> <img src="/resources/assets/user/images/logo/logo.svg" alt="Logo">
						</a>
						<!-- End Header Logo -->
					</div>
					<div class="col-lg-5 col-md-7 d-xs-none">
						<!-- Start Main Menu Search -->
						<div class="main-menu-search">
							<!-- navbar search start -->
							<div class="navbar-search search-style-5">
								<div class="search-select">
									<div class="select-position">
										<select id="select1">
											<option selected>All</option>
											<option value="1">option 01</option>
											<option value="2">option 02</option>
											<option value="3">option 03</option>
											<option value="4">option 04</option>
											<option value="5">option 05</option>
										</select>
									</div>
								</div>
								<div class="search-input">
									<input type="text" placeholder="Search">
								</div>
								<div class="search-btn">
									<button>
										<i class="lni lni-search-alt"></i>
									</button>
								</div>
							</div>
							<!-- navbar search Ends -->
						</div>
						<!-- End Main Menu Search -->
					</div>
					<div class="col-lg-4 col-md-2 col-5">
						<div class="middle-right-area" style="flex-direction: row; justify-content: flex-end;">
							
							<div class="navbar-cart">
								<div class="wishlist">
									<a href="javascript:void(0)"> <i class="lni lni-heart"></i> <span class="total-items">0</span>
									</a>
								</div>
								<div class="cart-items">
									<a href="javascript:void(0)" class="main-btn"> <i class="lni lni-cart"></i> <span class="total-items">2</span>
									</a>
									<!-- Shopping Item -->
									<div class="shopping-item">
										<div class="dropdown-cart-header">
											<span>2 Items</span>
											<a href="/cart">View Cart</a>
										</div>
										<ul class="shopping-list">
											<li><a href="javascript:void(0)" class="remove" title="Remove this item"><i class="lni lni-close"></i></a>
												<div class="cart-img-head">
													<a class="cart-img" href="product-details.html"><img src="/resources/assets/user/images/header/cart-items/item1.jpg" alt="#"></a>
												</div>

												<div class="content">
													<h4>
														<a href="product-details.html"> Apple Watch Series 6</a>
													</h4>
													<p class="quantity">
														1x -
														<span class="amount">$99.00</span>
													</p>
												</div></li>
											<li><a href="javascript:void(0)" class="remove" title="Remove this item"><i class="lni lni-close"></i></a>
												<div class="cart-img-head">
													<a class="cart-img" href="product-details.html"><img src="/resources/assets/user/images/header/cart-items/item2.jpg" alt="#"></a>
												</div>
												<div class="content">
													<h4>
														<a href="product-details.html">Wi-Fi Smart Camera</a>
													</h4>
													<p class="quantity">
														1x -
														<span class="amount">$35.00</span>
													</p>
												</div></li>
										</ul>
										<div class="bottom">
											<div class="total">
												<span>Total</span>
												<span class="total-amount">$134.00</span>
											</div>
											<div class="button">
												<a href="checkout.html" class="btn animate">Checkout</a>
											</div>
										</div>
									</div>
									<!--/ End Shopping Item -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Header Middle -->
		<!-- Start Header Bottom -->
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-10 col-md-6 col-6">
					<div class="nav-inner">
						<!-- Start Mega Category Menu -->
						<span class="cat-button"> </span>

						<!-- End Mega Category Menu -->
						<!-- Start Navbar -->
						<nav class="navbar navbar-expand-lg">
							<button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
								<span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">
									<li class="nav-item"><a href="index.html" class="active" aria-label="Toggle navigation">earring</a></li>
									<li class="nav-item"><a href="index.html" class="" aria-label="Toggle navigation">nacklace</a></li>
									<li class="nav-item"><a href="index.html" class="" aria-label="Toggle navigation">bangle</a></li>
									<li class="nav-item"><a href="index.html" class="" aria-label="Toggle navigation">ring</a></li>
									<li class="nav-item"><a href="index.html" class="" aria-label="Toggle navigation">coupling</a></li>
									<li class="nav-item"><a href="contact.html" aria-label="Toggle navigation">anklet</a></li>
									<li class="nav-item"><a href="contact.html" aria-label="Toggle navigation">pendant</a></li>
									<li class="nav-item"><a href="contact.html" aria-label="Toggle navigation">piercing</a></li>
									<li class="nav-item"><a href="contact.html" aria-label="Toggle navigation">etc</a></li>
								</ul>

							</div>
							<!-- navbar collapse -->
						</nav>
						<!-- End Navbar -->
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-6" style=" margin-block-end: 0em;">
					<ul id="nav" class="navbar-nav ms-auto" style="flex-direction: row; justify-content: flex-end;">
						<li class="nav-item"><a href="contact.html" aria-label="Toggle navigation" style="color: #B4B5B4">이벤트</a></li>
						<li class="nav-item"><a href="contact.html" aria-label="Toggle navigation" style="color: #B4B5B4">공지사항</a></li>
					</ul>
				</div>

			</div>
		</div>
		<!-- End Header Bottom -->
	</header>
	<!-- End Header Area -->
</body>
</html>