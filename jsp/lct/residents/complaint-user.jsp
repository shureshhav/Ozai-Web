<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description" content="Tikaana Admin Dashboard " />
<meta name="robots" content="noindex,nofollow" />
<title>Ozai Admin Dashboard</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- This page plugin CSS -->
<link
	href="<%=request.getContextPath()%>/new/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.mb-3 {
	
}
</style>
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<jsp:include page="/common/preloader.jsp"></jsp:include>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<jsp:include page="/common/lctheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<jsp:include page="/common/lctsidebar.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 align-self-center">
						<h4 class="page-title">Resident Details</h4>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- -------------------------------------------------------------- -->
				<!-- Start Page Content -->
				<!-- -------------------------------------------------------------- -->
				<div class="row">
					<div class="col-12">
						<div class="row">
							<div class="col-md-9">								
								<div class="card">
									<div class="card-body">
										<div class="card-header" style="border-radius: 30px;">
		                  					<h4 class="card-title text-center" style="font-weight: 900;">Complaint</h4>
		                  				</div>
		                    	
										<div class="row">
											<form id="complaint-form" method="post" role="form">
												<div class="row">
													<div class="card-body">
														<div class="col-md-6 mb-3">
										                  	<div class="form-check form-check-inline">
											                    <input class="form-check-input" type="radio" name="category" required id="inlineRadio1" value="Good">
											                    <label class="form-check-label" for="inlineRadio1"><i class="fas fa-thumbs-up text-success"></i></label>
											              	</div>
										                  	<div class="form-check form-check-inline">
										                    	<input class="form-check-input" type="radio" required name="category" id="inlineRadio2" value="Bad">
										                    	<label class="form-check-label" for="inlineRadio2"><i class="fas fa-thumbs-down text-warning"></i></label>
										                  	</div>
										            	</div>
									                  <div class="form-group">
									                  	<label class="form-check-label" for="inlineRadio1">Complaint</label>
									                  	<textarea rows="" class="form-control" name="complaint" required></textarea>
									                  </div>
									                </div>
													<input type="hidden" name="user_id" id="user_id" value="${details.id }" />
													<input type="hidden" name="client_code" id="client_code" value="${ClientUser.client_code }" />												
												</div>
												<input type="submit" id="send" value="SAVE" />
											</form>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header bg-success">
										<h4 class="card-title text-white">Reports on Resident</h4>
									</div>
									<div class="card-body">
										<c:forEach items="${reports }" var="report">
											<c:if test="${report.category eq 'Good' }">
												<div class="card col-6 text-center">
									                <div class="border-bottom title-part-padding">
									                 	<h4 class="card-title mb-0"><fmt:formatDate value="${report.report_date }" pattern="MMMM dd, yyyy"/></h4>
									                </div>
									                <div class="card-body">
									                  	<p>${report.complaint }</p>
									                  	<div id="read-only-stars" title="regular">
										                  	<i class="fas fa-2x fa-thumbs-up text-success fa-bounce"></i>	
										                </div>
									                </div>
								              </div>
											</c:if>
											<c:if test="${report.category eq 'Bad' }">
												<div class="card col-6">
									                <div class="border-bottom title-part-padding">
									                 	<h4 class="card-title mb-0"><fmt:formatDate value="${report.report_date }" pattern="MMMM dd, yyyy"/></h4>
									                </div>
									                <div class="card-body">
									                  	<p>${report.complaint }</p>
									                  	<div id="read-only-stars" title="regular">
										                  	<i class="fas fa-2x fa-thumbs-down text-danger"></i>	
										                </div>
									                </div>
								              </div>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					<button type="button"
						class="btn btn-light-success
			        	text-success font-weight-medium
			            btn-lg px-4 fs-4 font-weight-medium"
						data-bs-toggle="modal" id="onSuccess" style="display: none;"
						data-bs-target="#al-success-alert">Success Alert</button>
					<div class="modal fade" id="al-success-alert" tabindex="-1"
						aria-labelledby="vertical-center-modal" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div
								class="modal-content modal-filled
				                  bg-light-success
				                  text-success">
								<div class="modal-body p-4">
									<div class="text-center text-success">
										<i data-feather="check-circle" class="fill-white feather-lg"></i>
										<h4 class="mt-2 text-success">Thank You!</h4>
										<p class="mt-3 text-success-50">Details have been
											submitted.</p>
										<button type="button" class="btn btn-light my-2"
											data-bs-dismiss="modal">Close
										</button>
									</div>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
					</div>

					<button type="button"
						class="btn btn-light-warning
		                text-warning font-weight-medium
		                btn-lg px-4 fs-4 font-weight-medium"
						id="errorMsg" data-bs-toggle="modal" style="display: none;"
						data-bs-target="#al-warning-alert">Warning
						Alert</button>

					<!-- Vertically centered modal -->
					<div class="modal fade" id="al-warning-alert" tabindex="-1"
						aria-labelledby="vertical-center-modal" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content modal-filled bg-light-warning">
								<div class="modal-body p-4">
									<div class="text-center text-warning">
										<i data-feather="alert-octagon" class="fill-white feather-lg"></i>
										<h4 class="mt-2">Soory</h4>
										<p class="mt-3">Submission failed, Please try again later.
										</p>
										<button type="button" class="btn btn-light my-2"
											data-bs-dismiss="modal">
											Close</button>
									</div>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
					</div>

					<button type="button"
						class="btn btn-light-danger
                		text-danger font-weight-medium
		                btn-lg px-4 fs-4
		                font-weight-medium"
						style="display: none;" data-bs-toggle="modal" id="emptyMsg"
						data-bs-target="#al-danger-alert">Danger
						Alert</button>

					<!-- Vertically centered modal -->
					<div class="modal fade" id="al-danger-alert" tabindex="-1"
						aria-labelledby="vertical-center-modal" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content modal-filled bg-light-danger">
								<div class="modal-body p-4">
									<div class="text-center text-danger">
										<i data-feather="x-octagon" class="fill-white feather-lg"></i>
										<h4 class="mt-2">Oh snap!</h4>
										<p class="mt-3">Please fill in all the fields to submit.</p>
										<button type="button" class="btn btn-light my-2"
											data-bs-dismiss="modal">
											Close</button>
									</div>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
					</div>
					<!-- ============================================================== -->

					<button type="button"
						class="btn btn-light-danger
                		text-danger font-weight-medium
		                btn-lg
		                px-4
		                fs-4
		                font-weight-medium"
						style="display: none;" data-bs-toggle="modal" id="alreadyMsg"
						data-bs-target="#al-danger-alert1">Danger
						Alert</button>

					<!-- Vertically centered modal -->
					<div class="modal fade" id="al-danger-alert1" tabindex="-1"
						aria-labelledby="vertical-center-modal" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content modal-filled bg-light-danger">
								<div class="modal-body p-4">
									<div class="text-center text-danger">
										<i data-feather="x-octagon" class="fill-white feather-lg"></i>
										<h4 class="mt-2">Oh snap!</h4>
										<p class="mt-3">This payment details are already been
											updated.</p>
										<button type="button" class="btn btn-light my-2"
											data-bs-dismiss="modal">
											Close</button>
									</div>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- End Container fluid  -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- footer -->
					<!-- ============================================================== -->
					<footer class="footer">All right reserved by Ozai.</footer>
					<!-- ============================================================== -->
					<!-- End footer -->
					<!-- ============================================================== -->
				</div>
				<!-- ============================================================== -->
				<!-- End Page wrapper  -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Wrapper -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- customizer Panel -->
			<!-- ============================================================== -->
		</div>
		<div class="chat-windows"></div>
	</div>
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- apps -->
	<script src="<%=request.getContextPath()%>/new/dist/js/app.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/app.init.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/app-style-switcher.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
	<!--Wave Effects -->
	<script src="<%=request.getContextPath()%>/new/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="<%=request.getContextPath()%>/new/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="<%=request.getContextPath()%>/new/dist/js/feather.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/custom.min.js"></script>
	<c:if test="${added eq 'true' }">
		<script>
			$('document').ready(function() {
				$('#onSuccess').click();
			});
		</script>
	</c:if>
	<c:if test="${added eq false }">
		<script>
			$('document').ready(function() {
				$('#errorMsg').click();
			});
		</script>
	</c:if>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document').ready(function() {
			$("#complaint-form").submit(function(event) {
				event.preventDefault();
				complaintTenant();
			});
			$("#report-form").submit(function(event) {
				event.preventDefault();
				reportTenant();
			});
		});
	</script>
	<script>
		$('document').ready(function() {

			$('.sidebartoggler').toggle();
		});

		$(function() {
			"use strict";
			$("#main-wrapper").AdminSettings({
				Theme : true, // this can be true or false ( true means dark and false means light ),
				Layout : "horizontal",
				LogoBg : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				NavbarBg : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarType : "overlay", // You can change it full / mini-sidebar / iconbar / overlay
				SidebarColor : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				HeaderPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				BoxedLayout : false, // it can be true / false ( true means Boxed and false means Fluid )
			});
		});
	</script>
	<script>
		function complaintTenant() {
			var formData = $("#complaint-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/lct/complaintUser",
				data : formData,
				//contentType: "text/json; charset=utf-8",
				//dataType: "json",
				timeout : 100000,
				beforeSend : function() {
					$(".loading").show();
				},
				success : function(data) {
	
					console.log("SUCCESS: ", data);
	
					if (data == 'success') {
						$('#onSuccess').click();
						window.location.reload;
					} else if (data == 'failed') {
						$('#errorMsg').click();
					}
					$("#send").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
					alert(e);
					$("#send").button('reset');
				},
				done : function(e) {
					console.log("DONE");
					$("#send").button('reset');
	
				}
			});
		}
		function reportTenant() {
			var formData = $("#report-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/lct/reportUser",
				data : formData,
				//contentType: "text/json; charset=utf-8",
				//dataType: "json",
				timeout : 100000,
				beforeSend : function() {
					$(".loading").show();
				},
				success : function(data) {

					console.log("SUCCESS: ", data);

					if (data == 'success') {
						$('#onSuccess').click();
						window.location.reload;
					} else if (data == 'failed') {
						$('#errorMsg').click();
					}
					$("#save").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
					alert(e);
					$("#save").button('reset');
				},
				done : function(e) {
					console.log("DONE");
					$("#save").button('reset');

				}
			});
		}
	</script>
</body>
</html>