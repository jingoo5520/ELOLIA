<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="/resources/assets/admin/" data-template="vertical-menu-template-free">
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="/resources/assets/admin/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="/resources/assets/admin/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="/resources/assets/admin/vendor/css/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="/resources/assets/admin/vendor/css/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="/resources/assets/admin/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="/resources/assets/admin/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet" href="/resources/assets/admin/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="/resources/assets/admin/vendor/js/helpers.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="/resources/assets/admin/js/config.js"></script>
<script>
	let pageNo = 1;
	let pagingSize = 5;
	let pageCntPerBlock = 10;

	//문의 리스트 출력
	function showInquiryList(pageNo) {
		
		$.ajax({
			url : '/admin/inquiry/getInquiries',
			type : 'GET',
			dataType : 'json',
			data : {
				"pageNo" : pageNo,
				"pagingSize" : pagingSize,
				"pageCntPerBlock" : pageCntPerBlock
			},
			success : function(data) {
				console.log(data);
	
				let listOutput = '';
				let paginationOutput = '';
	
				$.each(data.list, function(index, inquiry) {
					let timestamp = inquiry.inquiry_reg_date;
					let date = new Date(timestamp);
					
					let year = date.getFullYear();
					let month = String(date.getMonth() + 1).padStart(2, '0'); 
					let day = String(date.getDate()).padStart(2, '0'); 

				    date = `\${year}-\${month}-\${day}`; // YYYY-MM-DD 형식으로 반환
					
					listOutput += `<tr onclick="location.href='/admin/inquiry/adminInquiryDetail?inquiryNo=\${inquiry.inquiry_no}'">` 
						+ `<td>\${inquiry.inquiry_no}</td>`
						+ `<td>\${inquiry.inquiry_title}</td>`
						+ `<td>\${inquiry.member_id}</td>`
						+ `<td>\${date}</td>`
						+ `<td>\${inquiry.inquiry_type}</td>`
						+ `<td>\${inquiry.inquiry_status}</td>`
						+ '</tr>';
				});
	
				$('#inquiryTableBody').html(listOutput);
				
				if(data.pi.pageNo == 1){
					paginationOutput += `<li class="page-item prev disabled"><a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a></li>`;	
				} else {
					paginationOutput += `<li class="page-item prev"><a class="page-link" href="javascript:void(0);" onclick="showInquiryList(\${data.pi.pageNo} - 1)"><i class="tf-icon bx bx-chevrons-left"></i></a></li>`;
				}
				
				
				for(let i = data.pi.startPageNoCurBloack; i < data.pi.endPageNoCurBlock + 1; i++){
					if(i == data.pi.pageNo) {
						paginationOutput += `<li class="page-item active"><a class="page-link" href="javascript:void(0);" onclick="showInquiryList(\${i})">\${i}</a></li>`;
					} else {
						paginationOutput += `<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="showInquiryList(\${i})">\${i}</a></li>`;	
					}
				}
				
				
				if(data.pi.pageNo == data.pi.totalPageCnt){
					paginationOutput +=	`<li class="page-item next disabled"><a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a></li>`;
				} else {
					paginationOutput +=	`<li class="page-item next"><a class="page-link" href="javascript:void(0);" onclick="showInquiryList(\${data.pi.pageNo} + 1)"><i class="tf-icon bx bx-chevrons-right"></i></a></li>`;
				}
				
				$('.pagination').html(paginationOutput);
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

</script>
</head>

<style>
table tr:hover {
	background-color: rgba(0, 123, 255, 0.1);
	transition: background-color 0.3s ease;
	cursor: pointer;
}
</style>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->
			<jsp:include page="/WEB-INF/views/admin/components/sideBar.jsp">

				<jsp:param name="pageName" value="adminInquiries" />

			</jsp:include>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->
				<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
					<div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)"> <i class="bx bx-menu bx-sm"></i>
						</a>
					</div>
				</nav>
				<!-- / Navbar -->

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- Content -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<!-- body  -->
						<div class="card">
							<h5 class="card-header">문의 목록</h5>
							<div class="table-responsive text-nowrap">
								<table class="table">
									<thead class="table-light">
										<tr>
											<th>번호</th>
											<th>문의 제목</th>
											<th>문의 회원</th>
											<th>작성 시간</th>
											<th>문의 타입</th>
											<th>문의 상태</th>
										</tr>
									</thead>
									<tbody id="inquiryTableBody" class="table-border-bottom-0">

										<c:forEach var="inquiry" items="${inquiryData.list}">
											<tr onclick="location.href='/admin/inquiry/adminInquiryDetail?inquiryNo=${inquiry.inquiry_no}'">
												<td class="">${inquiry.inquiry_no}</td>
												<td class="">${inquiry.inquiry_title}</td>
												<td class="">${inquiry.member_id}</td>
												<td>
													<fmt:formatDate value="${inquiry.inquiry_reg_date}" pattern="yyyy-MM-dd" />
												</td>
												<td class="">${inquiry.inquiry_type}</td>
												<td class="">${inquiry.inquiry_status}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>

							<!-- 페이지 네이션 -->
							<div class="mt-4">
								<nav aria-label="Page navigation">
									<ul class="pagination justify-content-center">
										<c:choose>
											<c:when test="${inquiryData.pi.pageNo == 1}">
												<li class="page-item prev disabled"><a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item prev"><a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-left"></i></a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach var="i" begin="${inquiryData.pi.startPageNoCurBloack}" end="${inquiryData.pi.endPageNoCurBlock}">
											<c:choose>
												<c:when test="${inquiryData.pi.pageNo == i}">
													<li class="page-item active"><a class="page-link" href="javascript:void(0);" onclick="showInquiryList(${i})">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="showInquiryList(${i})">${i}</a></li>
												</c:otherwise>
											</c:choose>

										</c:forEach>

										<c:choose>
											<c:when test="${inquiryData.pi.pageNo == inquiryData.pi.totalPageCnt}">
												<li class="page-item disabled"><a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item next"><a class="page-link" href="javascript:void(0);"><i class="tf-icon bx bx-chevrons-right"></i></a></li>
											</c:otherwise>
										</c:choose>

									</ul>
								</nav>
							</div>
							<!-- / 페이지 네이션 -->

						</div>
						

					</div>
				</div>
				<!-- / Content -->

				<!-- Footer -->
				<footer class="content-footer footer bg-footer-theme">
					<div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
						<div class="mb-2 mb-md-0">
							©
							<script>
								document.write(new Date().getFullYear());
							</script>
							, made with ❤️ by <a href="https://themeselection.com" target="_blank" class="footer-link fw-bolder">ThemeSelection</a>
						</div>
						<div>
							<a href="https://themeselection.com/license/" class="footer-link me-4" target="_blank">License</a> <a href="https://themeselection.com/" target="_blank" class="footer-link me-4">More Themes</a> <a href="https://themeselection.com/demo/sneat-bootstrap-html-admin-template/documentation/" target="_blank" class="footer-link me-4">Documentation</a> <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank" class="footer-link me-4">Support</a>
						</div>
					</div>
				</footer>
				<!-- / Footer -->

				<div class="content-backdrop fade"></div>
			</div>
			<!-- Content wrapper -->

		</div>
		<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>

	<!-- / Layout wrapper -->



	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="/resources/assets/admin/vendor/libs/jquery/jquery.js"></script>
	<script src="/resources/assets/admin/vendor/libs/popper/popper.js"></script>
	<script src="/resources/assets/admin/vendor/js/bootstrap.js"></script>
	<script src="/resources/assets/admin/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="/resources/assets/admin/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->
	<script src="/resources/assets/admin/vendor/libs/apex-charts/apexcharts.js"></script>

	<!-- Main JS -->
	<script src="/resources/assets/admin/js/main.js"></script>

	<!-- Page JS -->
	<script src="/resources/assets/admin/js/dashboards-analytics.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>

</html>
