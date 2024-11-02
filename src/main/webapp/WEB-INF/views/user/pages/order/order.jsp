<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>주문 결제</title>
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
	
	<script type="text/javascript">
		$(document).ready(function() {
			
		 	// 값 출력을 위한 js
			
			let totalPrices = 0;
			let totalOriginalPrices = 0;
			let totalCount = $("div.product-list").length;
			let totalPoints = 0;
			let totalProductDcPrice = 0;
			let totalEarnedPoint = 0;
			
			$(".productPrice").each(function() {
				let productPriceText = parseInt($.trim($(this).text().replace(" 원", "").replace(/,/g, "")));
				totalPrices += productPriceText;
			});
			
			$(".originalPrice").each(function() {
				let originalPriceText = parseInt($.trim($(this).text().replace(" 원", "").replace(/,/g, "")));
				totalOriginalPrices += originalPriceText;
			});

			$(".dcPrice").each(function() {
				let productDcPriceText = parseInt($.trim($(this).text().replace(" 원", "").replace(/,/g, "")));
				totalProductDcPrice += productDcPriceText;
			});
			
			$(".earnedPoint").each(function() {
				let earnedPointText = parseInt($.trim($(this).text().replace(" P", "").replace(/,/g, "")));
				totalEarnedPoint += earnedPointText;
			});
			
			
			$("#totalProductCount").text(totalCount + " 개");
			$("#totalProductPrice").text(totalPrices.toLocaleString('ko-KR') + " 원");
			
			$("#totalEarnedPoints").text(totalEarnedPoint.toLocaleString('ko-KR') + " 원");
			$("#totalDCPrices").text(totalProductDcPrice.toLocaleString('ko-KR') + " 원");
			$("#totalOriginalPrices").text(totalOriginalPrices.toLocaleString('ko-KR') + " 원");
			$(".totalProductCount").text(totalCount + " 개");
			$(".totalPrice").text((totalPrices + 2500).toLocaleString('ko-KR') + " 원");
			
			// css 및 input 태그 값 수정 js
			
			$('.deliveryOption').change(function() {
		        if ($(this).val() == 'userInput') {
		            $('.deliveryRequest').show();
		        } else {
		            $('.deliveryRequest').hide();
		        }
		    });
			
			$('#saveDeliveryCheck').change(function() {
	            if ($(this).is(':checked')) {
	                $('.deliveryNameForm').show();
	                $('#delivery_name').val($('.deliveryNameForm').val());
	                $("#saveDeliveryType").val("saveDelivery");
	            } else {
	                $('.deliveryNameForm').hide();
	                $('#delivery_name').val("");
	                $("#saveDeliveryType").val("none");
	            }
	        });
			
			$('#saveAddressCheck').change(function() {
	            if ($(this).is(':checked')) {
	                $("#saveDeliveryType").val("saveAddress");
	            } else {
	                $("#saveDeliveryType").val("none");
	            }
	        });
			
			$('.deliveryOption').css('color', '#888888');
		    $('.deliveryOption').change(function() {
		        if ($(this).val() === 'default') {

		            $('.deliveryOption option').css('color', '#888888');
		            $('.deliveryOption').css('color', '#888888');
		        } else {

		            $('.deliveryOption option').css('color', 'black');
		            $('.deliveryOption').css('color', 'black');
		        }
		    });
		    
			$('input[name="phoneNumber"]').on('keyup', function() {

			    let inputVal = $(this).val().replace(/[^0-9]/g, '');

			    if (inputVal.length > 11) {
			        inputVal = inputVal.slice(0, 11);
			    }

			    if (inputVal.length > 3 && inputVal.length <= 7) {
			        inputVal = inputVal.replace(/(\d{3})(\d{1,4})/, '$1-$2');
			    } else if (inputVal.length > 7) {
			        inputVal = inputVal.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
			    }
			    
			    $(this).val(inputVal);
			});
			
			$('input[name="point"]').on('keyup', function() {

			    let inputVal = $(this).val().replace(/[^0-9]/g, '');
			    
			    console.log(inputVal);
			    
			    let totalPrice = parseInt($.trim($(".totalPrice").eq(0).text().replace(" 원", "").replace(/,/g, ""))) - 2500;
			    console.log(totalPrice);
			    
			    let memberPoint = Number($("#memberPoint").text());

			    if (memberPoint != null && Number(inputVal) > memberPoint) {
			        inputVal = memberPoint;
			    }

			    if (Number(inputVal) > totalPrice) {
			        alert('포인트는 총 상품 금액을 초과할 수 없습니다.');
			        inputVal = totalPrice;
			    }
			    
			    $(this).val(inputVal);
			});
			
			$('#allPointsUse').change(function() {
				let memberPoint =parseInt($.trim($("#memberPoint").text().replace(" ", "").replace(/,/g, "")));
				let totalPrice = parseInt($.trim($(".totalPrice").eq(0).text().replace(" 원", "").replace(/,/g, ""))) - 2500;
				
	            if ($(this).is(':checked')) {
	            	if (Number(memberPoint) > totalPrice) {
				    	$('input[name="point"]').val(totalPrice);
				    }
	            	
	            } else {
	            	$('input[name="point"]').val(0);
	            }
	        });

			$('#deliveryName').on('keyup', function() {
				
			    let inputVal = $(this).val();

			    $('input[name="deliveryName"]').val(inputVal);
			});
			
		})
		
		function pointUse() {
			let totalProductDcPrice = 0;
			let totalOriginalProductPrice = parseInt($.trim($("#totalOriginalPrices").text().replace(" 원", "").replace(/,/g, "")));
			
			$(".dcPrice").each(function() {
				let productDcPriceText = parseInt($.trim($(this).text().replace(/,/g, "")));
				totalProductDcPrice += productDcPriceText;
			});
			
			let usePoint = Number($('input[name="point"]').val());
			$("#pointDC").text(usePoint.toLocaleString('ko-KR'));
			$("#usePoint").val(usePoint);
			
			$("#totalDCPrices").text((totalProductDcPrice + usePoint).toLocaleString('ko-KR') + " 원");
			
			$(".totalPrice").text((totalOriginalProductPrice - (totalProductDcPrice + usePoint) + 2500).toLocaleString('ko-KR') + " 원");
		}
		
		function handleDeliveryOptionChange() {
		    const select = document.querySelector(".deliveryOption");
		    const input = document.querySelector(".deliveryRequest");
		    const selectedValue = select.value;
		    const selectedText = select.options[select.selectedIndex].text;

		    // 기본 옵션이나 직접 입력이 아닌 경우에만 input에 텍스트 저장
		    if (selectedValue !== "default" && selectedValue !== "userInput") {
		        input.value = selectedText; // 선택된 텍스트 저장
		        input.readOnly = true; // 사용자가 수정할 수 없도록 설정
		        input.style.display = "block"; // 입력 필드 보이기
		    } else if (selectedValue === "userInput") {
		        input.style.display = "block"; // 직접 입력 시 입력 필드 보이기
		        input.value = ""; // 직접 입력 시 빈 값으로 초기화
		        input.readOnly = false; // 사용자가 입력할 수 있도록 설정
		        input.focus();
		    } else {
		        input.style.display = "none"; // 기본 옵션 선택 시 값 초기화
		        input.value = ""; // 입력 필드 초기화
		    }
		    
		    console.log(input);
		}
		
		
		
	</script>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode(type) {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';
                
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                }

                if (type === 'List') {
                    document.getElementById('postcodeList').value = data.zonecode;
                    document.getElementById('addressList').value = addr + extraAddr;
                    document.getElementById('detailAddressList').removeAttribute("readonly");
                    document.getElementById('detailAddressList').focus();
                    document.getElementById('detailAddressList').value = "";
                    
                    // Set hidden input value
                    document.getElementById('deliveryAddressHidden').value = 
                        document.getElementById('postcodeList').value + '/' + 
                        document.getElementById('addressList').value + '/' + 
                        document.getElementById('detailAddressList').value;
                } else if (type === 'New') {
                    document.getElementById('postcodeNew').value = data.zonecode;
                    document.getElementById('addressNew').value = addr + extraAddr;
                    document.getElementById('detailAddressNew').removeAttribute("readonly");
                    document.getElementById('detailAddressNew').focus();
                    document.getElementById('detailAddressNew').value = "";
                    
                    // Set hidden input value
                    document.getElementById('deliveryAddressHidden').value = 
                        document.getElementById('postcodeNew').value + '/' + 
                        document.getElementById('addressNew').value + '/' + 
                        document.getElementById('detailAddressNew').value;
                }
            }
        }).open();
    }
</script>
	
	<style>
    #overlay {
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5);
	    z-index: 99999999; 
	    display: none;
	}
	
	.ordererHeader {
		font-size: 15px;
		color: black !important;
	}
	
	.product-name {
		font-size: 15px !important;
		color: black !important;
	}
	
	.product-list-title div p{
		color: black !important;
	}
	.product-list-title {
		margin-top: 35px !important;
		margin-bottom: 35px !important;
		height: 50px !important;
		padding: 15px !important;
		border-bottom: 1px solid #E6E6E6;
	}
	.product-list div{
		margin-bottom: 35px !important;
		height: 50px !important;
	}
	.product-list {
		margin-bottom: 35px !important;
		padding-bottom: 20px !important;
		border-bottom: 1px solid #E6E6E6;
	}
	
	.productImage {
	    width: 80px;
	    height: 80px;
	}
	
	.right {
		text-align: right;
		font-size: 12px;
	}
	
	.right span{
		padding-right: 10px;
		padding-left: 10px;
		color: #888888;
	}
	
	.left {
		text-align: left;
	}
	
	.orderGuide {
		margin: 80px 0 120px 25px;
	}
	
	.orderGuide li{
		margin: 15px;
	}
	
	#accordionExample li {
   		margin: 0 0 40px 0 !important;
	}
	
	#nav-tab {
		margin: 40px 0 40px 0;
		border-color: #A8A691;
	}
	
	#nav-tab button {
		width: 200px;
	}
	
	.nav-link.active {
		font-size: 16px;
		color: #A8A691 !important;
		font-weight:bold;
		border-color: #A8A691 !important;
		border-bottom: none !important;
	}
	.nav-link:not(.active) {
		font-size: 14px;
		color: #888888;
		border-color: #e6e6e6 !important;
		border-bottom: none !important;
	}
	
	.addressSearchArea {
		display: flex;
		flex-direction: row;
	}
	
	.addressForm input {
		margin: 10px 0 10px 0;
	}
	
	.deliveryRequest {
		margin: 10px 0 10px 0;
	}
	
	.deliveryOption {
		border-color: #e6e6e6 !important;
		height: 46px;
	}
	
	
	.deliveryOption:focus {
		border-color: #e6e6e6 !important;
		box-shadow: none !important; 
	}
	
	.form-check-input:focus {
		border-color: #a8a691 !important;
	}
	
	.form-check {
		margin: 10px 0 20px 0;
	}
	
	.deliveryNameForm {
		margin: 20px 0 40px 0;
	}
	
	.single-payment-option label {
		border: 1px solid #e6e6e6 !important;
	}
	
	input[name="paymentMethod"]:hover + label {
		background-color: #d1cfc0 !important;
	}
	
	input[name="paymentMethod"]:checked + label {
	    background-color: #A8A691 !important;
	}
	
	input[name="paymentMethod"]:checked + label p {
	    color: #FFFFFF !important;
	}
	
	
    </style>
    
</head>

<script type="text/javascript">
	

</script>

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

	<jsp:include page="../header.jsp"></jsp:include>

    <!-- Start Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">주문 결제</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="../"><i class="lni lni-home"></i> Home</a></li>
                        <li><a href="../">Shop</a></li>
                        <li>checkout</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->

    <!--====== Checkout Form Steps Part Start ======-->
	<section class="checkout-wrapper section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
				<!--====== 주문 정보 ======-->
					<div class="checkout-steps-form-style-1">
						<ul id="accordionExample">
						<!--====== 주문 상품 정보 ======-->
							<li>
								<h5 class="title collapsed" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									<div class="row">
										<div class="left col-lg-6 col-md-6 col-12">
											<span>주문 상품</span>
										</div>
										<div class="right col-lg-6 col-md-6 col-12">
											<span class="totalProductCount"></span>
											<span id="totalProductPrice"></span>
										</div>
									</div>
								</h5>
								
								<section class="checkout-steps-form-content collapse" id="collapseThree" aria-labelledby="headingThree">
									<div class="row align-items-center product-list-title">
										<div class="col-lg-1 col-md-1 col-12">
											<p></p>
										</div>
										<div class="col-lg-5 col-md-5 col-12">
											<p>상품 / 수량 정보</p>
										</div>
										<div class="col-lg-2 col-md-2 col-12">
											<p>할인 금액</p>
										</div>
										<div class="col-lg-2 col-md-2 col-12">
											<p>적립예정포인트</p>
										</div>
										<div class="col-lg-2 col-md-2 col-12">
											<p>결제금액</p>
										</div>
									</div>
                                    
								<c:forEach var="orderProduct" items="${orderProductList }">
								
									<div class="row align-items-center product-list">
										<div class="col-lg-1 col-md-1 col-12">
											<a href="/product/productDetail?productNo=${orderProduct.product_no }">
												<img class="productImage" src="${orderProduct.image_main_url }" alt="productImage">
											</a>
										</div>
										<div class="col-lg-5 col-md-5 col-12">
											<h6 class="product-name">
												<a href="/product/productDetail?productNo=${orderProduct.product_no }">${orderProduct.product_name }</a>
											</h6>
											<p>
												<span>수량: <span class="product_quantity" id="${orderProduct.product_no }_quantity">${orderProduct.quantity }</span> 개</span>
											</p>
										</div>
										<div class="col-lg-2 col-md-2 col-12">
											<p><span class="dcPrice">
												<fmt:formatNumber value="${orderProduct.product_price * orderProduct.quantity * orderProduct.dc_rate }" type="number" pattern="#,###" /> 원
											</span></p>
										</div>
										<div class="col-lg-2 col-md-2 col-12">
										
									<c:choose>
									
										<c:when test="${not empty orderMember }">
											<p><span class="earnedPoint">
												<fmt:formatNumber value="${Math.floor(orderProduct.product_price * orderProduct.quantity * orderMember.level_point / 10) * 10}" type="number" pattern="#,###" /> P
											</span></p>
										</c:when>
										
										<c:otherwise>
												<p><span class="earnedPoint">0 P</span></p>
										</c:otherwise>
										
									</c:choose>
									
										</div>
										<div class="col-lg-2 col-md-2 col-12">
										
									<c:choose>
									
										<c:when test="${orderProduct.dc_rate != 0 }">
											<p><span class="originalPrice"><em><del style="color: #b7b7b7;">
												<fmt:formatNumber value="${orderProduct.product_price * orderProduct.quantity }" type="number" pattern="#,###" /> 원
											</del></em></span></p>
										</c:when>
										
										<c:otherwise>
											<p style="display: none;"><span class="originalPrice"><em><del style="color: #b7b7b7;">
												<fmt:formatNumber value="${orderProduct.product_price * orderProduct.quantity }" type="number" pattern="#,###" /> 원
											</del></em></span></p>
										</c:otherwise>
										
									</c:choose>
											<p><span class="productPrice">
												<fmt:formatNumber value="${orderProduct.product_price * orderProduct.quantity * (1 - orderProduct.dc_rate) }" type="number" pattern="#,###" /> 원
											</span></p>
										</div>
									</div>
									
								</c:forEach>
									<input type="hidden" name="productsInfo" id="productsInfo">
                                </section>
                            </li>
                            <!--====== 주문 상품 정보 끝 ======-->
					<c:choose>
						<c:when test="${not empty orderMember }">
						<!--====== 주문자 정보 (회원) ======-->
						
							<li>
								<h5 class="title collapsed" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
									<div class="row">
										<div class="left col-lg-6 col-md-6 col-12">
											<span>주문자 정보</span>
											<input type="hidden" name="ordererId" value="${orderMember.member_id }">
										</div>
										<div class="right col-lg-6 col-md-6 col-12">
											<span>${orderMember.member_name }</span>
											<span>${orderMember.phone_number }</span>
										</div>
									</div>
								</h5>
								
								<section class="checkout-steps-form-content collapse" id="collapseFour" aria-labelledby="headingFour">
								<!--====== 주문자 이름 (회원) ======-->
									<div class="col-md-6">
										<div class="single-form form-default">
											<div class="row form-input form align-items-center">
												<div class="col-lg-4 col-md-4 col-12">
													<h5 class="ordererHeader">이름</h5>
												</div>
												<div class="col-lg-8 col-md-8 col-12">
													<input type="text" placeholder="Name" name="ordererName" value="${orderMember.member_name }" readonly>
												</div>
											</div>
										</div>
									</div>
								<!--====== 주문자 이름 끝 (회원) ======-->
								
								<!--====== 주문자 휴대폰 번호 (회원) ======-->	
									<div class="col-md-6">
										<div class="single-form form-default">
											<div class="row form-input form align-items-center">
												<div class="col-lg-4 col-md-4 col-12">
													<h5 class="ordererHeader">휴대폰 번호</h5>
												</div>
												<div class="col-lg-8 col-md-8 col-12">
													<input type="text" placeholder="Phone Number" name="phoneNumber" value="${orderMember.phone_number }" readonly>
												</div>
											</div>
										</div>
									</div>
								<!--====== 주문자 휴대폰 번호 끝 (회원) ======-->
								
								<!--====== 주문자 이메일 (회원) ======-->
									<div class="col-md-6">
										<div class="single-form form-default">
											<div class="row form-input form align-items-center">
												<div class="col-lg-4 col-md-4 col-12">
													<h5 class="ordererHeader">이메일</h5>
												</div>
												<div class="col-lg-8 col-md-8 col-12">
													<input type="text" placeholder="Email Address" name="email" value="${orderMember.email }" readonly>
												</div>
											</div>
										</div>
									</div>
								<!--====== 주문자 이메일 끝 (회원) ======-->
									
								</section>
							</li>
							
							
						<!--====== 배송지 정보 (회원) ======-->
							<li>
								<h5 class="title collapsed" data-bs-toggle="collapse" data-bs-target="#collapsefive" aria-expanded="false" aria-controls="collapsefive">배송지 정보</h5>
								
								<section class="checkout-steps-form-content collapse" id="collapsefive" aria-labelledby="headingfive">
								<!--====== 배송지 정보 헤더 (회원) ======-->
									<nav>
										<div class="nav nav-tabs" id="nav-tab" role="tablist">
											<button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">배송지 목록</button>
											<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">신규입력</button>
										</div>
									</nav>
								<!--====== 배송지 정보 헤더 끝 (회원) ======-->
								
									<div class="col-md-6">
									
										<div class="tab-content" id="nav-tabContent">
										    <!--====== 배송지 목록 (회원) ======-->
										    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
										        <div class="single-form form-default">
										            <div class="form-input form addressForm">
										                <h5 class="ordererHeader">주소</h5>
										                <div class="addressSearchArea">
										                    <input class="postNumber" type="text" id="postcodeList" placeholder="우편번호" readonly value="${orderMember.address.split('/')[0] }">
										                    <input class="searchPost" type="button" onclick="sample6_execDaumPostcode('List')" value="검색"><br>
										                </div>
										                <input type="text" id="addressList" placeholder="주소" value="${orderMember.address.split('/')[1] }" readonly><br>
										                <input type="text" id="detailAddressList" placeholder="상세주소" value="${orderMember.address.split('/')[2] }" readonly>
										            </div>
										        </div>
										    </div>
										    <!--====== 배송지 목록 끝 (회원) ======-->
										    
										    <!--====== 배송지 신규입력 (회원) ======-->
										    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
										        <div class="single-form form-default">
										            <div class="form-input form addressForm">
										                <h5 class="ordererHeader">주소</h5>
										                <div class="addressSearchArea">
										                    <input class="postNumber" type="text" id="postcodeNew" placeholder="우편번호">
										                    <input class="searchPost" type="button" onclick="sample6_execDaumPostcode('New')" value="검색"><br>
										                </div>
										                <input type="text" id="addressNew" placeholder="주소"><br>
										                <input type="text" id="detailAddressNew" placeholder="상세주소">
										            </div>
										            <div class="form-check">
										                <div id="saveDeliveryDiv">
										                    <input type="checkbox" class="form-check-input" id="saveDeliveryCheck">
										                    <label for="saveDeliveryCheck">기본배송지로 저장</label>
										                </div>
										                <div id="saveAddressDiv">
										                    <input type="checkbox" class="form-check-input" id="saveAddressCheck">
										                    <label for="saveAddressCheck">회원정보 주소로 저장</label>
										                </div>
										            </div>
										        </div>
										        <div class="single-form form-default deliveryNameForm" style="display: none;">
										            <div class="form-input form">
										                <h5 class="ordererHeader">배송지명</h5>
										                <input type="text" id="deliveryName" value="${orderMember.member_name }님 배송지">
										            </div>
										        </div>
										    </div>
										    <!--====== 배송지 신규입력 끝 (회원) ======-->
											<input type="hidden" name="saveDeliveryType" id="saveDeliveryType" value="none">
										    <input type="hidden" name="delivery_address" id="deliveryAddressHidden" value="${orderMember.address }">
										</div>
										
										<!--====== 배송 요청사항 (회원) ======-->
										<div class="single-form form-default">
											<div class="form-input form">
												<h5 class="ordererHeader">배송 요청사항</h5>
												<select class="form-select deliveryOption" onchange="handleDeliveryOptionChange()">
													<option value="default" selected>선택해주세요</option>
													<option value="dr1">출발전에 전화 부탁드립니다.</option>
													<option value="dr2">부재시 경비실에 맡겨주세요.</option>
													<option value="dr3">부재시 문앞에 놓아주세요.</option>
													<option value="dr4">부재시 휴대폰으로 연락주세요.</option>
													<option value="dr5">부재시 문앞에 놓아주세요.</option>
													<option value="userInput">직접입력</option>
												</select>
												<input class="deliveryRequest" type="text" name="deliveryRequest" style="display: none;">
											</div>
										</div>
										<!--====== 배송 요청사항 끝 (회원) ======-->
									</div>
								<!--====== 배송지 정보 끝 (회원) ======-->
									
								</section>
							</li>
							
						<!--====== 포인트 정보 (회원) ======-->
							<li>
								<h5 class="title collapsed" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">포인트 정보</h5>
								
								<section class="checkout-steps-form-content collapse" id="collapseSix" aria-labelledby="headingSix">
									<div class="col-md-6">
										<div class="single-form form-default">
											<div class="row form-input form align-items-center">
												<div class="col-lg-2 col-md-2 col-12">
													<h5 class="ordererHeader">포인트</h5>
												</div>
												<div class="col-lg-6 col-md-6 col-12">
													<input type="text" placeholder="point" name="point" value="0">
												</div>
												<div class="button col-lg-4 col-md-4 col-12">
														<button class="btn" onclick="pointUse();">사용</button>
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="single-form form-default">
											<div class="form-check row">
												<div id="allPointsUseDiv" class="col-lg-4 col-md-4 col-12">
													<input type="checkbox" class="form-check-input" id="allPointsUse">
													<label for="allPointsUse">포인트 모두 사용</label>
												</div>
												<div class="form-input form col-lg-4 col-md-4 col-12">
													<label>(<span id="memberPoint"><fmt:formatNumber value="${orderMember.member_point }" type="number" pattern="#,###" /></span>P 보유)</label>
												</div>
											</div>
										</div>
										<div class="single-form form-default">
											<div class="form-input form">
												<label>할인 합계 : -<span id="pointDC">0</span>원</label>
											</div>
										</div>
									</div>
									
								</section>
							</li>
							
						<!--====== 포인트 정보 끝 (회원) ======-->
						</c:when>
						
						<c:otherwise>
						<!--====== 주문자 정보 (비회원) ======-->
							<li>
								<h5 class="title" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
									<div class="row">
										<div class="left col-lg-2 col-md-2 col-12">
											<span>주문자 정보</span>
											<input type="hidden" name="ordererId" value="non_member">
										</div>
										<div class="right col-lg-6 col-md-8 col-12">
											<span>주문자 정보에 입력하신 정보로 비회원 주문조회 하실 수 있습니다.</span>
										</div>
										<div class="right col-lg-4 col-md-2 col-12">
											<p></p>
										</div>
									</div>
								</h5>
								
								<section class="checkout-steps-form-content collapse show" id="collapseFour" aria-labelledby="headingFour">
								<!--====== 주문자 이름 (비회원) ======-->
									<div class="col-md-6">
										<div class="single-form form-default">
											<div class="row form-input form align-items-center">
												<div class="col-lg-4 col-md-4 col-12">
													<h5 class="ordererHeader">이름</h5>
												</div>
												<div class="col-lg-8 col-md-8 col-12">
													<input type="text" placeholder="이름을 입력해주세요" name="ordererName">
												</div>
											</div>
										</div>
									</div>
								<!--====== 주문자 이름 끝 (비회원) ======-->
								
								<!--====== 주문자 휴대폰 번호 (비회원) ======-->
									<div class="col-md-6">
										<div class="single-form form-default">
											<div class="row form-input form align-items-center">
												<div class="col-lg-4 col-md-4 col-12">
													<h5 class="ordererHeader">휴대폰 번호</h5>
												</div>
												<div class="col-lg-8 col-md-8 col-12">
													<input type="text" placeholder="휴대폰 번호를 입력해주세요" name="phoneNumber">
												</div>
											</div>
										</div>
									</div>
								<!--====== 주문자 휴대폰 번호 끝 (비회원) ======-->
								
								<!--====== 주문자 이메일 끝 (비회원) ======-->
									<div class="col-md-6">
										<div class="single-form form-default">
											<div class="row form-input form align-items-center">
												<div class="col-lg-4 col-md-4 col-12">
													<h5 class="ordererHeader">이메일</h5>
												</div>
												<div class="col-lg-8 col-md-8 col-12">
													<input type="text" placeholder="이메일을 입력해주세요" name="email">
												</div>
											</div>
										</div>
									</div>
								<!--====== 주문자 이메일 끝 (비회원) ======-->
									<div class="form-input form" style="display: none;">
										<label>할인 합계 : -<span id="pointDC">0</span>원</label>
									</div>
								</section>
							</li>
						<!--====== 주문자 정보 끝 (비회원) ======-->
						
						<!--====== 배송지 정보 (비회원) ======-->
							<li>
								<h5 class="title" data-bs-toggle="collapse" data-bs-target="#collapsefive" aria-expanded="true" aria-controls="collapsefive">배송지 정보</h5>
								
								<section class="checkout-steps-form-content collapse show" id="collapsefive" aria-labelledby="headingfive">
								<!--====== 배송지 정보 헤더 (비회원) ======-->
									<nav>
										<div class="nav nav-tabs" id="nav-tab" role="tablist">
											<button class="nav-link active" id="nav-addressInput-tab" data-bs-toggle="tab" data-bs-target="#nav-addressInput" type="button" role="tab" aria-controls="nav-addressInput" aria-selected="false" disabled>신규입력</button>
										</div>
									</nav>
								<!--====== 배송지 정보 헤더 끝 (비회원) ======-->
								
								<!--====== 배송지 정보 (비회원) ======-->
									<div class="col-md-6">
									<!--====== 배송지 주소 입력 (비회원) ======-->
										<div class="tab-content" id="nav-tabContent">
											<div class="tab-pane fade show active" id="nav-addressInput" role="tabpanel" aria-labelledby="nav-addressInput-tab" tabindex="0">
												<div class="single-form form-default">
													<div class="form-input form addressForm">
										                <h5 class="ordererHeader">주소</h5>
										                <div class="addressSearchArea">
										                    <input class="postNumber" type="text" id="postcodeNew" placeholder="우편번호">
										                    <input class="searchPost" type="button" onclick="sample6_execDaumPostcode('New')" value="검색"><br>
										                </div>
										                <input type="text" id="addressNew" placeholder="주소"><br>
										                <input type="text" id="detailAddressNew" placeholder="상세주소">
										            </div>
												</div>
											</div>
										</div>
									<!--====== 배송지 주소 입력 끝 (비회원) ======-->
									
									<!--====== 배송요청사항 입력 (비회원) ======-->
										<div class="single-form form-default">
											<div class="form-input form">
												<label>배송 요청사항</label>
												<select class="form-select deliveryOption" onchange="handleDeliveryOptionChange()">
													<option value="default" selected>선택해주세요</option>
													<option value="dr1">출발전에 전화 부탁드립니다.</option>
													<option value="dr2">부재시 경비실에 맡겨주세요.</option>
													<option value="dr3">부재시 문앞에 놓아주세요.</option>
													<option value="dr4">부재시 휴대폰으로 연락주세요.</option>
													<option value="dr5">부재시 문앞에 놓아주세요.</option>
													<option value="userInput">직접입력</option>
												</select>
												<input class="deliveryRequest" type="text" name="deliveryRequest" style="display: none;">
											</div>
										</div>
									<!--====== 배송요청사항 입력 끝(비회원) ======-->
									<input type="hidden" id="deliveryName" value="none">
									<input type="hidden" name="saveDeliveryType" id="saveDeliveryType" value="none">
									<input type="hidden" name="delivery_address" id="deliveryAddressHidden">
									</div>
								<!--====== 배송지 정보 끝(비회원) ======-->
									
								</section>
							</li>
							
						</c:otherwise>
					</c:choose>
                            
							<li>
								<h6 class="title" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="true" aria-controls="collapseFour">결제 수단</h6>
								<section class="checkout-steps-form-content collapse show" id="collapseSeven" aria-labelledby="headingSeven">
									<div class="row">
										<div class="col-md-12">
											<div class="checkout-payment-option">
												<h6 class="heading-6 font-weight-400 payment-title">결제 수단을 선택해주세요.</h6>
												<div class="payment-option-wrapper">
													<div class="single-payment-option">
														<input type="radio" name="paymentMethod" id="paymentMethod-1" onclick="selectPaymentMethod('CARD')" checked>
														<label for="paymentMethod-1">
															<p>카드 결제</p>
														</label>
													</div>
													<div class="single-payment-option">
														<input type="radio" name="paymentMethod" id="paymentMethod-2" onclick="selectPaymentMethod('VIRTUAL_ACCOUNT')">
														<label for="paymentMethod-2">
															<p>무통장 입금</p>
														</label>
													</div>
													<div class="single-payment-option">
														<input type="radio" name="paymentMethod" id="paymentMethod-3" onclick="selectPaymentMethod('TRANSFER')">
														<label for="paymentMethod-3">
															<p>계좌 이체</p>
														</label>
													</div>
													<div class="single-payment-option">
														<input type="radio" name="paymentMethod" id="paymentMethod-4" onclick="selectPaymentMethod('NAVER_PAY')">
														<label for="paymentMethod-4">
															<p>네이버 페이</p><!--TODO : 네이버 페이 로고로 바꾸기-->
														</label>
													</div>
													<div class="single-payment-option">
														<input type="radio" name="paymentMethod" id="paymentMethod-5" onclick="selectPaymentMethod('KAKAO_PAY')">
														<label for="paymentMethod-5">
															<p>카카오 페이</p><!--TODO : 카카오 페이 로고로 바꾸기-->
														</label>
													</div>                        
												</div>
											</div>
										</div>
									</div>
						
									<input type="hidden" name="payment_type" id="payment_type" value="CARD">
								</section>
							</li>
						</ul>
					</div>
					
					<div class="orderGuide">
						<ul>
							<li><h6>주문/결제 이용안내</h6></li>
							<li><span>상품 구매후 교환 및 환불은 수령 후 7일이내 가능합니다.</span></li>
							<li><span>주문 취소는 배송시작 전 단계에서만 가능합니다. 이후에는 반품으로 진행되며, 반품배송비가 추가발생 할 수 있습니다.</span></li>
							<li><span>23시 이후에는 은행 별 이용 가능 시간을 확인하시고 결제를 진행해 주시기 바랍니다.</span></li>
							<li><span>구매 적립 포인트는 구매확정 시 적립됩니다.</span></li>
						</ul>
					</div>
				</div>
				
				<div class="col-lg-4">
    				<div class="checkout-sidebar">
    				
				<c:choose>
					<c:when test="${not empty orderMember }">
						<div class="checkout-sidebar-coupon">
							<p>쿠폰 입력</p>
							<form action="#">
								<div class="single-form form-default">
									<div class="form-input form">
										<input type="text" placeholder="쿠폰 번호를 입력하세요" name="couponUse" id="couponUse">
									</div>
									<div class="button">
										<button class="btn">쿠폰 적용</button>
									</div>
								</div>
							</form>
						</div>
						<div class="checkout-sidebar-price-table mt-30">
							<div class="sub-total-price" style="color: black;">
								<div class="total-price">
									<p class="value">총 상품금액</p>
									<p class="price" id="totalOriginalPrices">0 원</p>
								</div>
								<div class="total-price discount">
									<p class="value">총 할인금액</p>
									<p class="price">- <span id="totalDCPrices">0 원</span></p>
								</div>
								<div class="total-price shipping">
									<p class="value">총 배송비</p>
									<p class="price">2500 원</p>
								</div>
							</div>

							<div class="total-payable">
								<div class="payable-price">
									<h6 class="value bold" style="color: black;">총 결제금액</h6>
									<h6 class="price totalPrice" style="color: red;">0 원</h6>
								</div>
								<div class="sub-total-price">
									<div class="total-price point mb-30">
										<p class="value">총 적립예정 포인트</p>
										<p class="price" id="totalEarnedPoints">0 P</p>
									</div>
								</div>
							</div>
							<div class="price-table-btn button">
								<a href="javascript:void(0)" class="btn" onclick="requestPayment()">(총 <span class="totalProductCount"></span>) <span class="price totalPrice">0 원</span> 결제하기</a>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="checkout-sidebar-coupon" style="display: none;">
							<div class="single-form form-default">
								<div class="form-input form">
									<input type="text" placeholder="쿠폰 번호를 입력하세요" name="couponUse" id="couponUse">
								</div>
								<div class="button">
									<button class="btn">쿠폰 적용</button>
								</div>
							</div>
						</div>
						<div class="checkout-sidebar-price-table">
							<div class="sub-total-price" style="color: black;">
								<div class="total-price">
									<p class="value">총 상품금액</p>
									<p class="price" id="totalOriginalPrices">0 원</p>
								</div>
								<div class="total-price discount">
									<p class="value">총 할인금액</p>
									<p class="price">- <span id="totalDCPrices">0 원</span></p>
								</div>
								<div class="total-price shipping">
									<p class="value">총 배송비</p>
									<p class="price">2500 원</p>
								</div>
							</div>

							<div class="total-payable">
								<div class="payable-price">
									<h6 class="value bold" style="color: black;">총 결제금액</h6>
									<h6 class="price totalPrice" style="color: red;">0 원</h6>
								</div>
								<div class="sub-total-price">
									<div class="total-price point mb-30">
										<p class="value">총 적립예정 포인트</p>
										<p class="price">0 P</p>
									</div>
								</div>
							</div>
							<div class="price-table-btn button">
								<a href="javascript:void(0)" class="btn" onclick="requestPayment()">(총 <span class="totalProductCount"></span>) <span class="price totalPrice">0 원</span> 결제하기</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--====== Checkout Form Steps Part Ends ======-->

    <jsp:include page="../footer.jsp"></jsp:include>

    <!-- ========================= scroll-top ========================= -->
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>

    <!-- ========================= JS here ========================= -->
    <script src="/resources/assets/user/js/bootstrap.min.js"></script>
    <script src="/resources/assets/user/js/tiny-slider.js"></script>
    <script src="/resources/assets/user/js/glightbox.min.js"></script>
    <script src="/resources/assets/user/js/main.js"></script>
    
        <!--toss 결제 API-->
    <script src="https://js.tosspayments.com/v2/standard"></script>

    <!-- 결제 처리(toss) -->
    <script>
        // ------  SDK 초기화 ------
        // @docs https://docs.tosspayments.com/sdk/v2/js#토스페이먼츠-초기화
        const clientKey = "test_ck_6BYq7GWPVv2PGpoD9mdaVNE5vbo1"; // TODO : 내 클라이언트 키, 나중에 서버에 저장해야 함
        const customerKey = "whygari4321"; // 구매자의 고유 아이디
        const tossPayments = TossPayments(clientKey);
        // 결제창 초기화
        const payment = tossPayments.payment({ customerKey });
        // TODO : 현재 페이지에서 총 결제금액 읽어서 갱신하기, 지금은 100원 결제
        const amount = {
            currency: "KRW",
            value: 100,
        };
    </script>

    <!-- 네이버페이 결제 API -->
    <script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>    

    <!-- 결제 처리(네이버페이) -->
    <script>
        var oPay = Naver.Pay.create({
             "mode" : "development", // development or production
             "clientId": "HN3GGCMDdTgGUfl0kFCo", // clientId
             "chainId": "S2VnY2NSaHlhb3V", // chainId
             // "openType" : "popup",
        });
    </script>
    
    <!-- 결제 처리(카카오페이) -->
    <script>
	var kakaopay = {
        ref: null,
    };
	
	function showKakaopayPaymentWindow(url) {
		kakaopay.ref = window.open('', 'paypopup', 'width=426,height=510,toolbar=no');
		const overlay = document.getElementById("overlay");
		
	    if (kakaopay.ref) {
	        // 팝업 창이 열렸을 때, 배경을 반투명 검은색으로 변경하고 입력을 막는다.
			overlay.style.display = "block"; 
	        // NOTE : 왠지는 모르겠는데 이걸로 입력 차단 안됨
        	// overlay.style.pointerEvents = 'none';
	        $(".container").css("pointerEvents", "none")
	        
	        setTimeout(function(){
	            kakaopay.ref.location.href=url
	        }, 0);
	    } else {
	    	throw new Error("popup을 열 수 없습니다!(cannot open popup)");
	    }
	    // TODO : 창이 띄워진 동안에는 배경 반투명 검은색으로 가리고 입력 막아야 할 것 같음
	}
	
	function releaseInputBlock() {
		const overlay = document.getElementById("overlay");
		overlay.style.display = "none"
		$(".container").css("pointerEvents", "auto")
	}
	</script>
    
    <!-- 결제 이벤트 핸들러(toss, 네이버페이, 카카오페이) -->
	<script>
        let selectedPaymentMethod = null;

        function selectPaymentMethod(method) {
            selectedPaymentMethod = method;
            console.log(method + "방법 선택")
            
            // form태그 밸류 설정
            $("#payment_type").val(method);
        }

        function requestPayment() {
        	
        	let productsInfo = [];
			let productNo = 0;
			let quantity = 0;
		    
		    for (let i = 0; i < $('.product_quantity').length; i++) {
		    	
		    	productNo = parseInt($('.product_quantity')[i].id);
	            quantity = parseInt($("#"+productNo + "_quantity").text());
	            
	            productsInfo.push({ productNo: parseInt(productNo), quantity: quantity });
	            console.log(productsInfo);
		    }

            const paymentType = document.querySelector("#payment_type").value;
            const saveDeliveryType = document.querySelector("#saveDeliveryType").value;
            const deliveryName = document.querySelector("#deliveryName").value;
            const pointDCText = document.querySelector("#pointDC").textContent;
            const pointDC = parseInt(pointDCText.replace(/,/g, ''), 10);
            const couponUse = document.querySelector("#couponUse").value;
            const deliveryAddress = document.querySelector("#deliveryAddressHidden").value + document.querySelector("#detailAddressNew").value;
            const deliveryRequest = document.querySelector("input[name='deliveryRequest']").value;
            const ordererId = document.querySelector("input[name='ordererId']").value;
            const ordererName = document.querySelector("input[name='ordererName']").value;
            const phoneNumber = document.querySelector("input[name='phoneNumber']").value;
            const email = document.querySelector("input[name='email']").value;

            const paymentData = {
                productsInfo,
                paymentType,
                saveDeliveryType,
                deliveryName,
                deliveryAddress,
                deliveryRequest,
                ordererId,
                ordererName,
                phoneNumber,
                email,
                pointDC,
                couponUse
            };

            console.log(paymentData);
           
            $.ajax({
                url: '/orderProducts',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(paymentData), // 전체 paymentData를 JSON으로 변환하여 전송
                success: function(data) {
                    console.log('Success:', data);
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        }
	</script>

</body>

</html>