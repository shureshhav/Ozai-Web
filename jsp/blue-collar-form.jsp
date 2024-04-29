<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Blue Collar Housing | Tikaana</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="<%=request.getContextPath()%>/assets/img/favicon.jpeg"
	rel="icon">
<link
	href="<%=request.getContextPath()%>/assets/img/favicon.jpeg"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/vendor/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: EstateAgency - v2.1.0
  * Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Property Search Section ======= -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<!-- End Header/Navbar -->

	<main id="main"> <!-- ======= Intro Single ======= -->
	<section class="intro-single" style="padding: 8rem 0 3rem !important;">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">BLUE COLLAR HOUSING</h1>
						<!-- <span class="color-text-a">Aut voluptas consequatur unde
							sed omnis ex placeat quis eos. Aut natus officia corrupti qui
							autem fugit consectetur quo. Et ipsum eveniet laboriosam voluptas
							beatae possimus qui ducimus. Et voluptatem deleniti. Voluptatum
							voluptatibus amet. Et esse sed omnis inventore hic culpa.</span> -->
					</div>
				</div>
				<%-- <div class="col-md-12 col-lg-4">
					<nav aria-label="breadcrumb"
						class="breadcrumb-box d-flex justify-content-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">
								Contact</li>
						</ol>
					</nav>
				</div> --%>
			</div>
		</div>
	</section>
	<!-- End Intro Single--> <!-- ======= Contact Single ======= -->
	<section class="contact">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 text-justify">
					<form action="#" method="post" role="form"
						id="beds-form" class="php-email-form">
	                  <div>
	                    <div class="card-body">
	                      <h4 class="card-title">Requirement Info</h4>
	                      <div class="row pt-3">
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label class="control-label">Location</label>
	                            <input
	                              type="text"
	                              id="location" name="location"
	                              class="form-control"
	                              placeholder="Enter Location"
	                             required />
	                            <!-- <small class="form-control-feedback">
	                              This is inline help
	                            </small> -->
	                          </div>
	                        </div>
	                        <!--/span-->
	                        <div class="col-md-6">
	                          <div class="mb-3 has-danger">
	                            <label class="control-label">Beds Needed</label>
	                            <input
	                              type="text"
	                              id="beds_needed" name="beds_needed"
	                              class="form-control"
	                              placeholder="No of beds"
	                             required />
	                            <!-- <small class="form-control-feedback">
	                              This field has error.
	                            </small> -->
	                          </div>
	                        </div>
	                        <!--/span-->
	                      </div>
	                      <!--/row-->
	                      <div class="row">
	                        <div class="col-md-6">
	                          <div class="mb-3 has-success">
	                            <label class="control-label">Gender</label>
	                            <select class="form-control custom-select"
	                            	name="gender" id="gender" required>
	                              <option value="Male">Male</option>
	                              <option value="Female">Female</option>
	                            </select>
	                            <small class="form-control-feedback">
	                              Select gender
	                            </small>
	                          </div>
	                        </div>
	                        <!--/span-->
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label class="control-label">Date of Joining</label>
	                            <input type="date" name="joining_date" id="joining_date" class="form-control" required />
	                          </div>
	                        </div>
	                        <!--/span-->
	                      </div>
	                      <!--/row-->
	                      <div class="row">
	                        
	                        <!--/span-->
	                        <div class="col-md-6">
	                          <div class="mb-3 has-success">
	                            <label class="control-label">Food</label>
	                            <select class="form-control custom-select"
	                            	name="food" id="food" required>
	                              <option value="Yes">Yes</option>
	                              <option value="No">No</option>
	                            </select>
	                            <small class="form-control-feedback">
	                              Select food option
	                            </small>
	                          </div>
	                        </div>
	                        <!--/span-->
	                      </div>
	                    </div>
	                    <hr />
	                    <div class="card-body">
	                      <!--/row-->
	                      <h4 class="card-title mb-4">Contact Info</h4>
	                      
	                      <div class="row">
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label>Name</label>
	                            <input type="text" name="contact_name" id="contact_name" class="form-control" required />
	                          </div>
	                        </div>
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label>Company</label>
	                            <input type="text" name="company" id="company" class="form-control" required />
	                          </div>
	                        </div>
	                        <!--/span-->
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label>Mobile</label>
	                            <input type="text" name="contact_phone" id="contact_phone" class="form-control" required />
	                          </div>
	                        </div>
	                        <!--/span-->
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label>Email</label>
	                            <input type="text" name="contact_email" id="contact_email" class="form-control" required />
	                          </div>
	                        </div>
	                      </div>
	                      <!--/row-->
	                      
	                    </div>
	                    <div class="form-actions">
	                      <div class="card-body border-top">
	                        <button
	                          type="submit" id="send"
	                          class="btn btn-success rounded-pill px-4">
	                          <div class="d-flex align-items-center">
	                            <i data-feather="save"
	                              class="feather-sm me-1 fill-icon"
	                            ></i>
	                            Save
	                          </div>
	                        </button>
	                        <button type="button" class="btn btn-danger rounded-pill
	                            px-4 ms-2 text-white ">
	                          Cancel
	                        </button>
	                      </div>
	                    </div>
	                  </div>
	                </form>
	                <div class="col-md-12 mb-3">
						<div class="mb-3">
							<div class="loading" style="display: none;">Loading</div>
							<div class="sent-message" style="display: none;">Your message has been sent.
								Thank you!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Contact Single--> </main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<!-- ======= Footer ======= -->
	<jsp:include page="/common/footer.jsp"></jsp:include>
	<!-- End  Footer -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script
		src="<%=request.getContextPath()%>/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/vendor/php-email-form/validate.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/vendor/scrollreveal/scrollreveal.min.js"></script>

	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document').ready(function(){
			$("#beds-form").submit(function(event) {
				event.preventDefault();
				addBeds();
			});
		});	
		function addBeds(){
			var formData=$("#beds-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/add-beds",
				data : formData,
				//contentType: "text/json; charset=utf-8",
	            //dataType: "json",
				timeout : 100000,
				beforeSend:function(){
					$(".loading").show();
				},
				success : function(data) {
					
					console.log("SUCCESS: ", data);
					
					if(data=='success'){
						$(".loading").hide();
						$('.sent-message').show();
					}else
					if(data=='error'){
						$('.error-message').html('Please try again later!');
					} else if(data=='empty'){
						$('.error-message').html('Please fill all the fields');
					} 
					$("#send").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
					bootbox.alert(e);
					$("#send").button('reset');
				},
				done : function(e) {
					console.log("DONE");
					$("#send").button('reset');
					
				}
			});
		}
	</script>
</body>

</html>