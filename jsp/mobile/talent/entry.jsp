<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${talent.name }'s Entry for Talent Showcase | Ozai</title>
<meta
	content="${talent.summary }"
	name="description">
<meta
	content="Tikaana, Hostel, PG, coliving, app, make friends, coliving space"
	name="keywords">

<link
      rel="canonical"
      href="https://www.wrappixel.com/templates/niceadmin/"
    />
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="<%=request.getContextPath() %>/new/assets/images/favicon.png"
    />
    <!-- This page css -->
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    

.height-100 {
    height: 50vh
}

.height-10 {
    height: 20vh
}

.card {
    width: 100%;
    border: none;
    border-radius: 0px
}

.content span {
    color: green;
    font-weight: 500
}

.content p {
    font-size: 13px
}

.angle i {
    font-size: 19px;
    cursor: pointer
}

.angle i:nth-child(1) {
    margin-right: 10px
}

.about span:nth-child(1) {
    margin-right: 10px;
    color: green
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
      
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper" style="display: block;">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
          <div class="row">
            <div class=" align-self-center">
              <h4 class="page-title">Showcase your talent</h4>
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
				<!-- Row -->
			<div class="row">
				<div class="col-12">
					<div class="row">
						<div class="card">
					    	 <div class="card-body">
								<div class="card-box-c foo">
									<div class="card-header-c d-flex">
										<div class="">
											<span class="fa fa-user-circle fa-2x"></span>
										</div>
										<h5 class="content-c" style="color: #393939;">&nbsp;&nbsp;${talent.name }</h5>
										<div class="card-title-c align-self-center">
											<h2 class="title-c"></h2>
										</div>
									</div>
									<div class="card-body-c">
										<p class="content-c">${talent.summary }</p>
									</div>
									<div class="card-footer-c pull-right">
										<video style="height: 300px !important; width: 100%;" preload="auto" 
						                	poster="<%=request.getContextPath() %>/assets/img/logo.png" controls 
						                	class="embed-responsive-item">
											<source
												src="http://ozai.com/uploaded_files/DOC/TALENT/${talent.submission_file_name}"
												type="video/mp4">
											<source
												src="http://ozai.com/uploaded_files/DOC/TALENT/${talent.submission_file_name}"
												type="video/ogg">
											<p>Your browser does not support HTML5 video.</p>
										</video>
									</div>
									<div class="row text-center">
										<h4>Share :</h4>
										<div class="col-md-3 col-3">
											<img src="<%=request.getContextPath() %>/assets/img/social/facebook.png" 
								 				class="fb-icon" style="width: 45px;" alt="facebook icon" />
							 			</div>
							 			<div class="col-md-3 col-3">
								 			<img src="<%=request.getContextPath() %>/assets/img/social/twitter.png" 
										 		class="tw-icon" style="width: 45px;" alt="twitter icon" />
							 			</div>
							 			<div class="col-md-3 col-3">
								 			<a href="https://api.whatsapp.com/send?text=https://mysuperbrain.com/school/view/mst_competition/${entry.id}"
								 				target="_blank">
								 				<img src="<%=request.getContextPath() %>/assets/img/social/whatsapp.png" 
										 			style="width: 45px;" alt="whatsapp icon" /></a>
									 	</div>
									 	<div class="col-md-3 col-3">
										 	<img src="<%=request.getContextPath() %>/assets/img/social/copy.png" 
										 		onclick="copyToClipboard('#copy-link')" style="width: 45px;" alt="Copy icon"/>
										 </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		    </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        
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
    
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/taskboard/js/jquery-ui.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- apps -->
    <script src="<%=request.getContextPath() %>/new/dist/js/app.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/app.init.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/app-style-switcher.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!--Wave Effects -->
    <script src="<%=request.getContextPath() %>/new/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="<%=request.getContextPath() %>/new/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="<%=request.getContextPath() %>/new/dist/js/feather.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/notes/notes.js"></script>
	<script>
		$('document').ready( function() {
			//$('#about').addClass("active");
			$('.fb-icon').click(function() {

				window.open(
					'http://www.facebook.com/sharer.php?u=http://tikaana.com/blogs/article/${article.article_id}',
					'Tikaana Blog Article',
					'width=626,height=436');
				return false;
			});
			$('.tw-icon').click(function() {
				window.open(
					'https://twitter.com/share?url=http://tikaana.com/blogs/article/${article.article_id}',
					'Tikaana Blog Article',
					'width=626,height=436');
				return false;

			});
		});
	</script>
</body>
</html>