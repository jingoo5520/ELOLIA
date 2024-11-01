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
<script>
	// 첨부 이미지 미리보기
	
	// 문의 삭제
	function deleteInquiry(){
		$.ajax({
			url : '/serviceCenter/deleteInquiry',
			type : 'POST',
			dataType: 'text',
			data : {
				"inquiryNo" : ${inquiryDetail.inquiry_no},
			},
			success : function(data) {
				console.log(data);
				location.href = "/serviceCenter/inquiries";
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	// 문의 삭제 모달창 닫기
	function deleteInquiryModalClose(){
		$('#deleteInquiryModal').modal('hide');
	}
	
</script>
</head>

<style>
#btnArea {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
}

.checkout-steps-form-style-1 .checkout-steps-form-content {
	border: 1px solid rgb(230, 230, 230) !important;
}

.cart-list-title {
	padding: 0px !important;
	padding-top: 20px !important;
	border: none !important;
}

.remove-item {
	color: #fff;
	background-color: #f44336;
	font-size: 8px;
	height: 18px;
	width: 18px;
	line-height: 18px;
	border-radius: 50%;
	text-align: center;
	margin-left: 5px;
	font-size: 8px;
	height: 18px;
	width: 18px;
	line-height: 18px;
	border-radius: 50%;
	text-align: center;
	height: 18px;
	width: 18px;
	line-height: 18px;
	border-radius: 50%;
	text-align: center;
}

.list li {
	display: flex;
	flex-direction: row;
	align-items: center;
}

textarea {
	font-family:
}
</style>

<body>
	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span>
				<span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->

	<jsp:include page="/WEB-INF/views/user/pages/header.jsp"></jsp:include>

	<!-- Start Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">Shop Grid</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
						<li><a href="javascript:void(0)">Shop</a></li>
						<li>Shop Grid</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<section class="product-grids section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-12">
					<!-- Start Product Sidebar -->
					<div class="product-sidebar">
						<!-- Start Single Widget -->
						<div class="single-widget">
							<h3>고객센터</h3>
							<ul class="list">
								<li><a href="product-grids.html">공지사항 </a></li>
								<li><a href="product-grids.html">이벤트 </a></li>
								<li><a href="product-grids.html">문의</a></li>
								<li><a href="product-grids.html">멤버십 혜택</a></li>
							</ul>
						</div>
						<!-- End Single Widget -->

					</div>
					<!-- End Product Sidebar -->
				</div>
				<div class="col-lg-9 col-12">
					<!-- Shopping Cart -->
					<div class="checkout-steps-form-style-1">
						<section class="checkout-steps-form-content collapse show" id="collapseThree" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
							<div class="cart-list-title">
								<h5>문의</h5>
								<hr class="mt-4" style="border: 1px solid black;">
							</div>
							<div class="row">
								<c:choose>
									<c:when test="${inquiryDetail.inquiry_status == 'C'}">
										<div class="single-form form-default">
											<label>답변 내용</label>
											<div class="form-input form">
												<textarea id="replyContent" rows="15" style="resize: none; padding: 10px 20px; height: 100%;" readOnly>${inquiryReply.reply_content }</textarea>
											</div>
										</div>

										<hr class="mt-4" style="border: 1px solid black;">
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose>

								<div class="col-md-12">
									<div class="single-form form-default">
										<label>문의 번호</label>
										<div class="form-input form">
											<input id="inquiryTitle" value="${inquiryDetail.inquiry_no}" type="text" placeholder="문의 제목을 입력하세요." readOnly>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="single-form form-default">
										<label>문의 제목</label>
										<div class="form-input form">
											<input id="inquiryTitle" value="${inquiryDetail.inquiry_title}" type="text" placeholder="문의 제목을 입력하세요." readOnly>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="single-form form-default">
										<label>문의 타입</label>
										<div class="select-items">
											<div class="form-input form">
												<input id="" value="${inquiryDetail.inquiry_type}" type="text" placeholder="문의 제목을 입력하세요." readOnly>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-12">
									<div class="single-form form-default">
										<label>주문 상품</label>
										<div class="select-items">
											<div class="form-input form">
												<input id="" value="${inquiryDetail.product_name}" type="text" placeholder="문의 제목을 입력하세요." readOnly>
											</div>
										</div>
									</div>
								</div>

								<div class="single-form form-default">
									<label>문의 내용</label>
									<div class="form-input form">
										<textarea id="inquiryContent" rows="15" style="resize: none; padding: 10px 20px; height: 100%;" readOnly>${inquiryDetail.inquiry_content }</textarea>
									</div>
								</div>

								<div class="col-md-12">
									<div class="single-form form-default">
										<label>첨부된 이미지</label>
										<div class="row">
											<c:forEach var="img" items="${inquiryImgList}">
												<div class="col-lg-6 col-md-6 col-sm-12" style="padding: 5px;">
													<img src="${img.inquiry_image_uri}" class="img-fluid">
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>

						</section>

					</div>
					<!--/ End Shopping Cart -->

					<div id="btnArea" class="button mt-2">
						<button class="btn" onclick="location.href='/serviceCenter/inquiries'">
							목록으로 돌아가기
							<span class="dir-part"></span>
						</button>
						<c:choose>
							<c:when test="${inquiryDetail.inquiry_status == 'W'}">
								<button class="btn" onclick="location.href='/serviceCenter/modifyInquiry?inquiryNo=${inquiryDetail.inquiry_no}'">
									수정하기
									<span class="dir-part"></span>
								</button>
								<button type="button" class="btn review-btn" data-bs-toggle="modal" data-bs-target="#deleteInquiryModal">삭제하기</button>
							</c:when>
							<c:otherwise>
								<button class="btn" onclick="">
									추가 문의
									<span class="dir-part"></span>
								</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Product Grids -->

	<div class="modal fade review-modal" id="deleteInquiryModal" tabindex="-1" aria-labelledby="deleteInquiryModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">문의 삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="">
							<div class="form-group">문의를 삭제하시겠습니까?</div>
						</div>
					</div>
				</div>
				<div class="modal-footer button">
					<button type="button" class="btn" onclick="deleteInquiryModalClose()">Close</button>
					<button type="button" class="btn" onclick="deleteInquiry()">Delete</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End Review Modal -->

	<jsp:include page="/WEB-INF/views/user/pages/footer.jsp"></jsp:include>

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