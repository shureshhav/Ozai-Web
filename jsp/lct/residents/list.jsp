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
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, "
    />
    <meta
      name="description"
      content="Tikaana admin dashboard for finacne module"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Residents-List | ${ClientUser.client} @ Ozai</title>
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
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
    <!-- This page plugin CSS -->
    <link
      href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
      rel="stylesheet"/>
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
 <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
.btn-pill {
	border-radius: 50px;
	float: right;
}
.img-circle {
	width: 100% !important;
}

.rating {
  float:left;
}

/* :not(:checked) is a filter, so that browsers that don’t support :checked don’t 
  follow these rules. Every browser that supports :checked also supports :not(), so
  it doesn’t make the test unnecessarily selective */
.rating:not(:checked) > input {
    position:absolute;
    top:-9999px;
    clip:rect(0,0,0,0);
}

.rating:not(:checked) > label {
    float:right;
    width:1em;
    /* padding:0 .1em; */
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:200%;
    /* line-height:1.2; */
    color:#ddd;
}

.rating:not(:checked) > label:before {
    content: '★ ';
}

.rating > input:checked ~ label {
    color: dodgerblue;
    
}

.rating:not(:checked) > label:hover,
.rating:not(:checked) > label:hover ~ label {
    color: dodgerblue;
    
}

.rating > input:checked + label:hover,
.rating > input:checked + label:hover ~ label,
.rating > input:checked ~ label:hover,
.rating > input:checked ~ label:hover ~ label,
.rating > label:hover ~ input:checked ~ label {
    color: dodgerblue;
    
}

.rating > label:active {
    position:relative;
    top:2px;
    left:2px;
}
</style>
</head>

<body>

                

											  </script>
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
	  <div class="d-block d-sm-none row card ps-2" style="z-index: 100;
		    top: 63px; position: fixed; width: -webkit-fill-available !important;
			border-radius: unset; box-shadow: none; background: none; 
			background: linear-gradient(360deg,#3c536a,#233242); width: 100%; height: 200px;
			 --mask:
    		radial-gradient(57.63px at 50% calc(100% - 81.00px),#000 99%,#0000 101%) calc(50% - 90px) 0/180px 100%,
    		radial-gradient(57.63px at 50% calc(100% + 36.00px),#0000 99%,#000 101%) 50% calc(100% - 45px)/180px 100% repeat-x;
  			-webkit-mask: var(--mask);
          	mask: var(--mask);">
			<a href="<%=request.getContextPath() %>/lct">
				 <i class="bi bi-arrow-left fa-2x text-white" style="vertical-align: bottom;">&nbsp;</i></a>
			<form id="month-form"
				action="<%=request.getContextPath()%>/lct/residents/by-property"
				role="form" method="post">
				<div class="input-group">
					<label class="col-sm-12 col-12 text-white">Select property</label>
					<select name="property_id" id="property_id"
						class="form-control form-select mt-2" required>
						<option value="">Choose</option>
						<c:forEach items="${properties }" var="property">
							<option value="${property.id }">${property.name }</option>
						</c:forEach>
					</select>&nbsp;
					<input
						class="btn btn-light font-medium btn-rounded"
						type="submit" id="submitThis2" value="Go!" />
				</div>
			</form>
			<br>
		</div>
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
      <div class="page-wrapper" style="margin-top: 180px; background: #fff;">
       
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
          <!-- -------------------------------------------------------------- -->
          <!-- Start Page Content -->
          <!-- -------------------------------------------------------------- -->
          
          <!-- Row selection (multiple rows) -->
          <div class="row">
            <div class="col-md-12 col-12">
              <!-- ---------------------
                            start Row selection (multiple rows)
                        ---------------- -->
              <div class="">
              	<form id="type-form"
					action="#" method="post">
					<div class="input-group mb-3 row">
						<label class="col-8 text-end"></label>
						<select name="type" id="type"
							class="col-4 form-select form-control" required>
							<option value="All">All</option>
							<option value="B2B">B2B</option>
							<option value="B2C">B2C</option>
						</select>
					</div>
				</form>
                
                <table id="tenants" 
                	class="table d-none d-sm-block">
			        <thead>
			          <tr>
			          	<th>#</th>
			            <th>Name</th>
			            <th>Property</th>
			            <th>Room</th>
			            <th>Employ Id</th>
			            <th>Join date</th>
			            <th>Worksite</th>
			          </tr>
			        </thead>
			
			        <tfoot>
			          <tr>
			          	<th>#</th>
			            <th>Name</th>
			            <th>Property</th>
			            <th>Room</th>
			            <th>Employ Id</th>
			            <th>Join date</th>
			            <th>Worksite</th>
			          </tr>
			        </tfoot>
			
			        <tbody>
			        <c:forEach items="${tenants}" var="tenant" varStatus="sno">
			          <tr>
			          	<td>${sno.index+1 }</td>
			            <td>${tenant.user.name }</td>
			            <td>${tenant.property.name }</td>
			            <td>${tenant.room.room_no }</td>
			            <td>${tenant.employ_id }</td>
			            <td>${tenant.joining_date }</td>
			            <td>${tenant.work_site }</td>
			          </tr>
			         </c:forEach>
			        </tbody>
			      </table>
                
               
                <div class="d-block d-sm-none card-body"> 
              
                  <c:if test="${not empty tenants }">
                  	<div id="b2b_data">
	                    <c:forEach items="${tenants}" var="tenant" varStatus="sno">
							<div class="row user-row card-body" style="
								border-radius: 10px; background: #f4eaf3bf;">
								<div class="col-sm-3 col-3 col-md-3 col-lg-3">
									<img class="img-circle" style="border-radius: 50%;"
										onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
										src="https://www.ozailiving.com/profile-user/image/${tenant.user_id }"
										alt="User Pic">
								</div>
								<div class="col-sm-7 col-7 col-md-7 col-lg-7">
									<strong style="color: #000;">${tenant.user.name }</strong><br> <span style="color: #021740;">User
										status: Active</span>
								</div>
								<div
									class="col-sm-2 col-2 col-md-2 col-lg-2 dropdown-user" style="margin: 0;"
									data-for=".${tenant.user_id }">
									<i class="fas fa-plus-circle fa-2x text-dark"></i>
								</div>
								<div style="float: right;">
							    	<label
										class="btn align-items-center btn-light-secondary
		                     			 				text-secondary font-weight-medium"
										style="float: right;"><span style="color: #021740;">
											Rental Credit Score :</span> <span
										class="badge ms-auto bg-secondary"
										id="${tenant.user_id }rating">300</span></label>
						    	</div>
						      	
								<script>
						        	$('document').ready(function() {
						        		$.ajax({
						    				type : "GET",
						    				url : "${pageContext.request.contextPath}/lct/getUserRating/${tenant.user_id}",
						    				timeout : 100000,
						    				beforeSend:function(){
						    					//$('#rent-due-${tenant.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
						    				},
						    				success : function(data) {
						    					console.log("SUCCESS: ", data);
						    					if(data!=0) {
						    						$('#${tenant.user_id }rating').html(data);
						    					} else {
						    						$('#${tenant.user_id }rating').html(data);
						    					}
						    					
						    				},
						    				error : function(e) {
						    					console.log("ERROR: ", e);
						    					
						    				},
						    				done : function(e) {
						    					console.log("DONE");
						    					//$('#loading').remove();
						    					
						    				}
						    			});
						        	});
								</script>
							</div>
							<div class="row user-infos ${tenant.user_id }">
								<div
									class="col-12">
									<div class="panel">
										<div class="panel-body" style="padding: 0px;">
											<%-- <div class="row">
												<div class="col-2">
													<img class="img-circle"
														onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
														src="<%=request.getContextPath() %>/profile-user/image/${tenant.user_id }"
														alt="User Pic" style="border-radius: 50%;">
												</div>
												<div class="col-10">
													<span class="text-dark">${tenant.user.name }</span>																	
												</div>
											</div> --%>
											<div class="row">
												<div class="col-6">
													<small class="text-muted mb-0">PROPERTY</small>
													<p class="text-dark">${tenant.property.name }</p>
													<small class="text-muted mb-0">ROOM</small>
													<p class="text-dark">${tenant.room.room_no }</p>
													<small class="text-muted mb-0">BED</small>
													<p class="text-dark">${tenant.bed.bed_no }</p>
												</div>
												<div class="col-6">
													<small class="text-muted mb-0">EMPLOY ID</small>
													<p class="text-dark">${tenant.employ_id }</p>
													<small class="text-muted mb-0">WORK SITE</small>
													<p class="text-dark">${tenant.work_site }</p>
													<small class="text-muted mb-0">JOIN DATE</small>
													<p class="text-dark">${tenant.joining_date }</p>
												</div>
											</div>
										</div>
										
										<div class="panel-footer">
											<a class="btn btn-danger"
												href="<%=request.getContextPath() %>/lct/residents/report-user/${tenant.user.id }"
												data-toggle="tooltip"
												data-original-title="Feedback">
												Monthly Review
											</a>
											
											<button type="button" class="btn btn-primary" 
											    data-toggle="modal" 
											    data-target="#myBadgeModal-${tenant.user.id}"
											    
												>
												Assign Badge ${tenant.user.id }
												
											</button>
											
											
									        
											<span style="float: right;">
												<%-- <a class="btn btn-warning"
													href="<%=request.getContextPath() %>/admin/residents/generate-rent/${tenant.user.id }"
													data-toggle="tooltip"
													data-original-title="Move out this user">
													Generate Rent
												</a> --%>
												<a class="btn btn-warning"
													href="<%=request.getContextPath() %>/lct/residents/edit/${tenant.user.id }"
													data-toggle="tooltip"
													data-original-title="Edit details">
													<i class="fas fa-edit"></i>
												</a>
											</span>
											
										</div>
										
									</div>
									
								</div>
							</div>
							 
							 <!-- Modal -->
											  <div class="modal fade" id="myBadgeModal-${tenant.user.id}" role="dialog">
											    <div class="modal-dialog modal-lg">
											      <div class="modal-content">
											        <div class="modal-header">
											          <button type="button" class="close" data-dismiss="modal">&times;</button>
											          <h4 class="modal-title">Assign Badge</h4>
											        </div>
											        <div class="modal-body">
											          <p>Please select the badge you want to assign userid: ${tenant.user.id}</p>
											         <div class="row">
											          <c:forEach items="${badgesList}" var="badge" varStatus="badgeCount">
													    <div class="col-xs-4 col-md-4 col-sm-4">
													      <div class="thumbnail">
													      
													        <a id="badgeLink" href="<%=request.getContextPath() %>/lct/residents/assignBadge/${tenant.user.id}__${badge.id}">
													          <img src="<%=request.getContextPath() %>/${badge.name}" alt="Lights" style="width:100%">
													          <div style="text-align:center">
													            <p>${badge.title}</p>
													          </div> 
													        </a>
													        
													      </div>
													    </div>
													    </c:forEach>
													  </div>
											        </div>
											        <div class="modal-footer">	
											          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											        </div>
											      </div>
											    </div>
											  </div>
											  <!--  end Modal -->
											 
						</c:forEach>
					</div>
                 </c:if>
                 <c:if test="${not empty residents }">
                 	<div id="b2c_data">
						<c:forEach items="${residents}" var="tenant" varStatus="sno">
							<div class="row user-row card-body"
								style="border-radius: 10px; background: #f4eaf3bf;">
								<div class="col-sm-3 col-3 col-md-3 col-lg-3">
									<img class="img-circle" style="border-radius: 50%;"
										onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
										src="http://www.ozailiving.com/profile-user/image/${tenant.user_id }"
										alt="User Pic">
								</div>
								<div class="col-sm-7 col-7 col-md-7 col-lg-7">
									<strong style="color: #000;">${tenant.user.name }</strong><br> <span
										style="color: #021740;">User status: Active</span>
								</div>
								<div class="col-sm-2 col-2 col-md-2 col-lg-2 dropdown-user"
									style="margin: 0;" data-for=".${tenant.user_id }">
									<i class="fas fa-plus-circle fa-2x text-dark"></i>
								</div>
								<div style="float: right;">
									<label
										class="btn align-items-center btn-light-secondary
		                     			 				text-secondary font-weight-medium"
										style="float: right;"><span style="color: #021740;">
											Rental Credit Score :</span> <span
										class="badge ms-auto bg-secondary"
										id="${tenant.user_id }rating">300</span></label>
								</div>
		
								<script>
									$('document').ready(function() {
										$.ajax({
						    				type : "GET",
						    				url : "${pageContext.request.contextPath}/lct/getUserRating/${tenant.user_id}",
						    				timeout : 100000,
						    				beforeSend:function(){
						    					//$('#rent-due-${tenant.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
						    				},
						    				success : function(data) {
						    					console.log("SUCCESS: ", data);
						    					if(data!=0) {
						    						$('#${tenant.user_id }rating').html(data);
						    					} else {
						    						$('#${tenant.user_id }rating').html(data);
						    					}
						    					
						    				},
						    				error : function(e) {
						    					console.log("ERROR: ", e);
						    					
						    				},
						    				done : function(e) {
						    					console.log("DONE");
						    					//$('#loading').remove();
						    					
						    				}
						    			});
									});
								</script>
							</div>
							<div class="row user-infos ${tenant.user_id }">
								<div class="col-12">
									<div class="panel">
										
										<div class="panel-body">
											<%-- <div class="row">
												<div class="col-sm-3 col-3">
													<img class="img-circle"
														onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
														src="<%=request.getContextPath() %>/profile-user/image/${tenant.user_id }"
														alt="User Pic">
												</div>
												<div class="col-md-9 col-sm-9 col-9">
													<strong>${tenant.user.name }</strong>
												</div>
											</div> --%>
											<div class="row">
												<div class="col-6">
													<small class="text-muted mb-0">PROPERTY</small>
													<p class="text-dark">${tenant.property.name }</p>
													<small class="text-muted mb-0">ROOM</small>
													<p class="text-dark">${tenant.room.room_no }</p>
													<small class="text-muted mb-0">BED</small>
													<p class="text-dark">${tenant.bed.bed_no }</p>
												</div>
												<div class="col-6">
													<small class="text-muted mb-0">RENT</small>
													<p class="text-dark">${tenant.rent }</p>
													<small class="text-muted mb-0">SHARING</small>
													<p class="text-dark">${tenant.sharing }</p>
													<small class="text-muted mb-0">JOIN DATE</small>
													<p class="text-dark">${tenant.joining_date }</p>
												</div>
											</div>
										</div>
										<div class="panel-footer">
											<a class="btn btn-danger"
												href="<%=request.getContextPath() %>/lct/residents/report-user/${tenant.user.id }"
												data-toggle="tooltip"
												data-original-title="Feedback">
												<i class="fas fa-ban"></i> Feedback
											</a> <span style="float: right;"> <a
												class="btn btn-info"
												href="<%=request.getContextPath() %>/lct/residents/generate-rent/${tenant.user.id }"
												data-toggle="tooltip"
												data-original-title="Move out this user"> Generate
													Rent </a> <a class="btn btn-warning"
												href="<%=request.getContextPath() %>/lct/residents/edit/${tenant.user.id }"
												data-toggle="tooltip" data-original-title="Edit details">
													<i class="fas fa-edit"></i>
											</a>
											</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
                 <c:if test="${empty tenants && empty residents }">
                 	<h5>No residents added yet.</h5>
                 </c:if>
                </div>
              </div>
              
              
              
              
              <!-- ---------------------
                end Row selection (multiple rows)
               ---------------- -->
            </div>
          </div>
          <!-- Form inputs -->
          
          <!-- row selection & deletion -->
          
          <!-- -------------------------------------------------------------- -->
          <!-- End PAge Content -->
          <!-- -------------------------------------------------------------- -->
          <!-- -------------------------------------------------------------- -->
          <!-- Right sidebar -->
          <!-- -------------------------------------------------------------- -->
          <!-- .right-sidebar -->
          <!-- -------------------------------------------------------------- -->
          <!-- End Right sidebar -->
          <!-- -------------------------------------------------------------- -->
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
    
    <div class="chat-windows"></div>
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/jquery/dist/jquery.min.js"></script>
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
    <!--This page plugins -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <!-- start - This is for export functionality only -->
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
    
    
    <script>
		$('document').ready(function() {
		    var panels = $('.user-infos');
		    var panelsButton = $('.dropdown-user');
		    panels.hide();

		    //Click dropdown
		    panelsButton.click(function() {
		        //get data-for attribute
		        var dataFor = $(this).attr('data-for');
		        var idFor = $(dataFor);

		        //current button
		        var currentButton = $(this);
		        idFor.slideToggle(400, function() {
		            //Completed slidetoggle
		            if(idFor.is(':visible'))
		            {
		                currentButton.html('<i class="fas fa-window-close fa-2x text-muted"></i>');
		            }
		            else
		            {
		                currentButton.html('<i class="fas fa-plus-circle fa-2x text-dark"></i>');
		            }
		        })
		    });

		    $('[data-toggle="tooltip"]').tooltip();
		});
	</script>
    <script>
	    $(function () {
	        "use strict";
	        $("#main-wrapper").AdminSettings({
	          Theme: true, // this can be true or false ( true means dark and false means light ),
	          Layout: "horizontal",
	          LogoBg: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
	          NavbarBg: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
	          SidebarType: "overlay", // You can change it full / mini-sidebar / iconbar / overlay
	          SidebarColor: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
	          SidebarPosition: false, // it can be true / false ( true means Fixed and false means absolute )
	          HeaderPosition: false, // it can be true / false ( true means Fixed and false means absolute )
	          BoxedLayout: false, // it can be true / false ( true means Boxed and false means Fluid )
	        });
	    });
		$('document').ready(function(){
			
			$('#tenants_wrapper').addClass("text-center");
			
			$('#type').change(function(){
				if($('#type').val() == "All") {
					$('#b2b_data').show();
					$('#b2c_data').show();
				} else if($('#type').val() == "B2C") {
					$('#b2b_data').hide();
					$('#b2c_data').show();					
				} else if($('#type').val() == "B2B") {
					$('#b2b_data').show();
					$('#b2c_data').hide();					
				}
			});
			
			
			$('#hideBack').hide();
    		$('.sidebartoggler').toggle();
    		$('#tenants').DataTable({
 		       "paging":   true,
 				dom: "B",
 				buttons: ["copy", "csv", "excel", "pdf", "print"],
 				initComplete: function() {
  		      		$('table.dataTable').hide();
  		    	}
 			});
 			$(".buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel"
 			).addClass("btn btn-warning btn-sm mr-1");
    		
    	});
    </script>
  </body>
</html>