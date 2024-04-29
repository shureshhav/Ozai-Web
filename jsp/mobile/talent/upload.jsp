<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, "
    />
    <meta
      name="description"
      content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Showcase Talent | Ozai</title>
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
          <!-- basic table -->
        	 <div class="col-lg-4 col-xlg-3 col-md-5">
              <div class="card">
                <div class="card-body">
					<form action="<%=request.getContextPath()%>/mobile/user/submit-talent"
						id="talent-form" method="post" modelAttribute="talent" enctype="multipart/form-data">
						<div class="row">
							<div class="col-md-12 mb-3">
								<div class="form-group">
									<input type="text" name="name" id="name" required
										class="form-control form-control-lg form-control-a"
										placeholder="Enter Name/नाम" data-rule="minlen:4"
										data-msg="Please enter your least 4 chars">
									<div class="validate"></div>
								</div>
							</div>
							
							<input type="hidden" name="user_id" id="user_id" value="${User.id }" />
							
							<div class="col-md-12 mb-3">
								<div class="form-group">
									<input type="text" name="mobile" id="mobile" required
										class="form-control form-control-lg form-control-a"
										placeholder="Enter Mobile Number/मोबाइल नंबर" data-rule="minlen:10"
										data-msg="Please enter valid mobile number">
									<div class="validate"></div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<textarea name="summary" class="form-control" id="summary"
										cols="45" rows="8"
										data-msg="Please write something(Optional)"
										placeholder="Summary"></textarea>
									<div class="validate"></div>
								</div>
							</div>
							<div class="col-md-6 mb-3">
								<div class="form-group">
									<div class="position-relative form-group">
										<label for="exampleFile" class="">Select Your Video Attachment</label>
										<input name="talent_file" id="talent_file" type="file" accept="video/*" class="form-control-file" onchange="readURL(this)" />
                                        <!-- <small class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small> -->
                                    </div>
                           		</div>
                              </div>

							<div class="col-md-12 text-center">
								<button type="submit" class="btn btn-info" id="send">Submit</button>
							</div>
						</div>
					</form>
				</div>
              </div>
              <a href="<%=request.getContextPath() %>/mobile/talent/entries" style="width: 100%;"
              	class="btn btn-lg btn-wide btn-block btn-warning"><i class="fa fa-eye"></i>&nbsp;&nbsp;ENTRIES</a><br><br><br>
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
	<script type="text/javascript">
		
		function readURL(input) {

			var image=input;
			var image_obj = $('#talent_file');
			
			if((image.files[0].size / 1024).toFixed(0) > 50*1024) {
				
				alert("Attachment must be less or equal to 50MB");
				image_obj.replaceWith(image_obj.val('').clone(true));
				return;
			}
		}
		
		$('document').ready(function() {
			
			$('textarea[class*=autosize]').autosize({
				append : "\n"
			});

			$('textarea.limited').inputlimiter({
				remText : '%n character%s remaining...',
				limitText : 'max allowed : %n.'
			});

			jQuery.validator.addMethod("checkForInvalidData", function(value, element) {
				value = value.replace(/\s+/g,"_");
				return !/(\S)(\1{2,})/g.test(value);
			}, "Invalid summary");
			
			$('#summary').val($.trim($('#summary').val()));
			
			$('#talent-form').validate({
				errorElement : 'div',
				errorClass : 'error-msg',
				focusInvalid : true,
				rules : {
					summary :{
						checkForInvalidData:true
					},
					talent_file :{
						required:true,
						accept:"video/*"
					} 
				},
				messages : {
					talent_file : {
						required:"Please choose your file.",
						accept:"Please select a valid file"
					}
				},
				submitHandler : function(form) {
					$('#submitProcess').show();
					$('#talent-form button[type=submit]').prop("disabled", "disabled");		
					form.submit();
				}
			});
		});
	</script>
</body>

</html>