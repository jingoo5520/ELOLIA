<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>ELOLIA</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="/resources/assets/user/images/logo/white-logo.svg" />

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="/resources/assets/user/css/bootstrap.min.css" />
<link rel="stylesheet" href="/resources/assets/user/css/LineIcons.3.0.css" />
<link rel="stylesheet" href="/resources/assets/user/css/tiny-slider.css" />
<link rel="stylesheet" href="/resources/assets/user/css/glightbox.min.css" />
<link rel="stylesheet" href="/resources/assets/user/css/main.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>

<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->

	<jsp:include page="pages/header.jsp"></jsp:include>

	<!-- Start Hero Area -->
	<section class="hero-area">
		<div class="container">
			<div class="row">
				<div class="col-12 custom-padding-right">
					<div class="slider-head">
						<!-- Start Hero Slider -->
						<div class="hero-slider">
							<!-- Start Single Slider -->
							<div class="single-slider" style="border: 3px solid #000;">
								<div class="content" >
									<h2>1번 메인 배너</h2>
								</div>
							</div>
							<!-- End Single Slider -->
							<!-- Start Single Slider -->
							<div class="single-slider" style="border: 3px solid #000;">
								<div class="content">
									<h2>2번 메인 배너</h2>

								</div>
							</div>
							<!-- End Single Slider -->
						</div>
						<!-- End Hero Slider -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero Area -->

	<!-- Start Featured Categories Area -->
	<section class="featured-categories section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>서브 배너</h2>
						<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-12">
					<!-- Start Single Category -->
					<div class="single-category">
						<h3 class="heading">1번 서브배너</h3>
						
					</div>
					<!-- End Single Category -->
				</div>
				<div class="col-md-6 col-12">
					<!-- Start Single Category -->
					<div class="single-category">
						<h3 class="heading">2번 서브배너</h3>
						
					</div>
					<!-- End Single Category -->
				</div>
				<div class="col-md-6 col-12">
					<!-- Start Single Category -->
					<div class="single-category">
						<h3 class="heading">3번 서브배너</h3>
						
					</div>
					<!-- End Single Category -->
				</div>
				<div class="col-md-6 col-12">
					<!-- Start Single Category -->
					<div class="single-category">
						<h3 class="heading">4번 서브배너</h3>
						
					</div>
					<!-- End Single Category -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Features Area -->

	<!-- Start Trending Product Area -->
	<section class="trending-product section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>추천 아이템(신상품)</h2>
						<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Product -->
					<div class="single-product">
						<div class="product-image">
							<img src="/335x335" alt="#">
							<div class="button">
								<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
							</div>
						</div>
						<div class="product-info">
							<span class="category">Watches</span>
							<h4 class="title">
								<a href="product-grids.html">아이템1</a>
							</h4>
							<ul class="review">
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star"></i></li>
								<li><span>4.0 Review(s)</span></li>
							</ul>
							<div class="price">
								<span>$199.00</span>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Product -->
					<div class="single-product">
						<div class="product-image">
							<img src="/335x335" alt="#"> <span class="sale-tag">-25%</span>
							<div class="button">
								<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
							</div>
						</div>
						<div class="product-info">
							<span class="category">Speaker</span>
							<h4 class="title">
								<a href="product-grids.html">아이템 2</a>
							</h4>
							<ul class="review">
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><span>5.0 Review(s)</span></li>
							</ul>
							<div class="price">
								<span>$275.00</span> <span class="discount-price">$300.00</span>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Product -->
					<div class="single-product">
						<div class="product-image">
							<img src="/335x335" alt="#">
							<div class="button">
								<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
							</div>
						</div>
						<div class="product-info">
							<span class="category">Camera</span>
							<h4 class="title">
								<a href="product-grids.html">아이템 3</a>
							</h4>
							<ul class="review">
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><span>5.0 Review(s)</span></li>
							</ul>
							<div class="price">
								<span>$399.00</span>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Product -->
					<div class="single-product">
						<div class="product-image">
							<img src="/335x335" alt="#"> <span class="new-tag">New</span>
							<div class="button">
								<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
							</div>
						</div>
						<div class="product-info">
							<span class="category">Phones</span>
							<h4 class="title">
								<a href="product-grids.html">iphone 6x plus</a>
							</h4>
							<ul class="review">
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><span>5.0 Review(s)</span></li>
							</ul>
							<div class="price">
								<span>$400.00</span>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Product -->
					<div class="single-product">
						<div class="product-image">
							<img src="/335x335" alt="#">
							<div class="button">
								<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
							</div>
						</div>
						<div class="product-info">
							<span class="category">Headphones</span>
							<h4 class="title">
								<a href="product-grids.html">Wireless Headphones</a>
							</h4>
							<ul class="review">
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><span>5.0 Review(s)</span></li>
							</ul>
							<div class="price">
								<span>$350.00</span>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Product -->
					<div class="single-product">
						<div class="product-image">
							<img src="/335x335" alt="#">
							<div class="button">
								<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
							</div>
						</div>
						<div class="product-info">
							<span class="category">Speaker</span>
							<h4 class="title">
								<a href="product-grids.html">Mini Bluetooth Speaker</a>
							</h4>
							<ul class="review">
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star"></i></li>
								<li><span>4.0 Review(s)</span></li>
							</ul>
							<div class="price">
								<span>$70.00</span>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Product -->
					<div class="single-product">
						<div class="product-image">
							<img src="/335x335" alt="#"> <span class="sale-tag">-50%</span>
							<div class="button">
								<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
							</div>
						</div>
						<div class="product-info">
							<span class="category">Headphones</span>
							<h4 class="title">
								<a href="product-grids.html">PX7 Wireless Headphones</a>
							</h4>
							<ul class="review">
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star"></i></li>
								<li><span>4.0 Review(s)</span></li>
							</ul>
							<div class="price">
								<span>$100.00</span> <span class="discount-price">$200.00</span>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Product -->
					<div class="single-product">
						<div class="product-image">
							<img src="/335x335" alt="#">
							<div class="button">
								<a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
							</div>
						</div>
						<div class="product-info">
							<span class="category">Laptop</span>
							<h4 class="title">
								<a href="product-grids.html">Apple MacBook Air</a>
							</h4>
							<ul class="review">
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><i class="lni lni-star-filled"></i></li>
								<li><span>5.0 Review(s)</span></li>
							</ul>
							<div class="price">
								<span>$899.00</span>
							</div>
						</div>
					</div>
					<!-- End Single Product -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Trending Product Area -->

	<!-- Start Shipping Info -->
	<section class="shipping-info">
		<div class="container">
			<ul>
				<!-- Free Shipping -->
				<li>
					<div class="media-icon">
						<i class="lni lni-delivery"></i>
					</div>
					<div class="media-body">
						<h5>Free Shipping</h5>
						<span>On order over $99</span>
					</div>
				</li>
				<!-- Money Return -->
				<li>
					<div class="media-icon">
						<i class="lni lni-support"></i>
					</div>
					<div class="media-body">
						<h5>24/7 Support.</h5>
						<span>Live Chat Or Call.</span>
					</div>
				</li>
				<!-- Support 24/7 -->
				<li>
					<div class="media-icon">
						<i class="lni lni-credit-cards"></i>
					</div>
					<div class="media-body">
						<h5>Online Payment.</h5>
						<span>Secure Payment Services.</span>
					</div>
				</li>
				<!-- Safe Payment -->
				<li>
					<div class="media-icon">
						<i class="lni lni-reload"></i>
					</div>
					<div class="media-body">
						<h5>Easy Return.</h5>
						<span>Hassle Free Shopping.</span>
					</div>
				</li>
			</ul>
		</div>
	</section>
	<!-- End Shipping Info -->

	<jsp:include page="pages/footer.jsp"></jsp:include>

	<!-- ========================= scroll-top ========================= -->
	<a href="#" class="scroll-top"> <i class="lni lni-chevron-up"></i>
	</a>

	<!-- ========================= JS here ========================= -->
	<script src="/resources/assets/user/js/bootstrap.min.js"></script>
	<script src="/resources/assets/user/js/tiny-slider.js"></script>
	<script src="/resources/assets/user/js/glightbox.min.js"></script>
	<script src="/resources/assets/user/js/main.js"></script>
	<script type="text/javascript">
        //========= Hero Slider 
        tns({
            container: '.hero-slider',
            slideBy: 'page',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 0,
            items: 1,
            nav: false,
            controls: true,
            controlsText: ['<i class="lni lni-chevron-left"></i>', '<i class="lni lni-chevron-right"></i>'],
        });

        //======== Brand Slider
        tns({
            container: '.brands-logo-carousel',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 15,
            nav: false,
            controls: false,
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 3,
                },
                768: {
                    items: 5,
                },
                992: {
                    items: 6,
                }
            }
        });

    </script>
	<script>
        const finaleDate = new Date("February 15, 2023 00:00:00").getTime();

        const timer = () => {
            const now = new Date().getTime();
            let diff = finaleDate - now;
            if (diff < 0) {
                document.querySelector('.alert').style.display = 'block';
               // index에서 topbar가 display none되지 않도록 처리
               // document.querySelector('.container').style.display = 'none';
            }

            let days = Math.floor(diff / (1000 * 60 * 60 * 24));
            let hours = Math.floor(diff % (1000 * 60 * 60 * 24) / (1000 * 60 * 60));
            let minutes = Math.floor(diff % (1000 * 60 * 60) / (1000 * 60));
            let seconds = Math.floor(diff % (1000 * 60) / 1000);

            days <= 99 ? days = `0${days}` : days;
            days <= 9 ? days = `00${days}` : days;
            hours <= 9 ? hours = `0${hours}` : hours;
            minutes <= 9 ? minutes = `0${minutes}` : minutes;
            seconds <= 9 ? seconds = `0${seconds}` : seconds;

            document.querySelector('#days').textContent = days;
            document.querySelector('#hours').textContent = hours;
            document.querySelector('#minutes').textContent = minutes;
            document.querySelector('#seconds').textContent = seconds;

        }
        timer();
        setInterval(timer, 1000);
        
        // index에서 topbar가 display none되지 않도록 처리
        $("#test").css("display", "block");
    </script>
</body>

</html>