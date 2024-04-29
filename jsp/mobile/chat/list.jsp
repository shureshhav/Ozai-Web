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
<meta name="description"
	content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design" />
<meta name="robots" content="noindex,nofollow" />
<title>Chat List | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/assets/images/favicon.png" />
<!-- This page css -->
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

    <!-- loader section -->
    <jsp:include page="/common/preloader.jsp"></jsp:include>
    <!-- loader section ends -->

    <!-- Begin page -->
    <div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<jsp:include page="/common/mobileheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<div class=" row card ps-1" style="z-index: 100;
		    top: 63px; position: fixed; width: -webkit-fill-available !important;
			border-radius: unset; box-shadow: none; background: none; 
			background: linear-gradient(45deg,teal,teal); width: 100%; height: 200px;
			 --mask:
    		radial-gradient(57.63px at 50% calc(100% - 81.00px),#000 99%,#0000 101%) calc(50% - 90px) 0/180px 100%,
    		radial-gradient(57.63px at 50% calc(100% + 36.00px),#0000 99%,#000 101%) 50% calc(100% - 45px)/180px 100% repeat-x;
  			-webkit-mask: var(--mask);
          	mask: var(--mask);">
			<a href="#" onclick="history.back()">
				 <i class="bi bi-arrow-left fa-2x text-white" style="vertical-align: bottom;">&nbsp;</i></a>
			<form>
               <div class="searchbar">
                 <input onkeyup="searchFunction()" id="searchInput"
                   class="form-control" type="text"
                   placeholder="Search Contact" />
               </div>
             </form>
		</div>
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="margin-top: 220px;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<div class="scrollable position-relative" style="height: 100%">
              		<!-- <div class="p-3 border-bottom">
                		<h5 class="card-title">Search Contact</h5>
		                <form>
		                  <div class="searchbar">
		                    <input onkeyup="searchFunction()" id="searchInput"
		                      class="form-control" type="text"
		                      placeholder="Search Contact" />
		                  </div>
		                </form>
              		</div> -->
              		<ul class="mailbox list-style-none app-chat">
                		<li>
                  			<div class="message-center chat-scroll chat-users" id="messagesList">
                  				<c:choose>
                    				<c:when test="${not empty messages }">
										<c:forEach items="${messages }" var="message">
											<c:choose>
                                  				<c:when test="${message.sender_id eq User.id }">
					                    			<a href="<%=request.getContextPath() %>/mobile/user/chat/message/${message.receiver_id }"
					                    				class="chat-user message-item align-items-center
					                    				border-bottom px-3 ps-2" id="chat_user_1"
					                      				data-user-id="1">
					                      				<span class="user-img position-relative d-inline-block">
					                        				<img src="https://www.ozailiving.com/profile-user/image/${message.receiver_id }"
																onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
					                          					alt="user" class="rounded-circle w-100" style="width: 40px; height: 40px;" />
					                        				<span class="profile-status online rounded-circle
					                            				pull-right"></span>
					                      				</span>
					                      				<div class="mail-contnet w-75 d-inline-block v-middle ps-3">
									                        <h5
									                          class="message-title mb-0 mt-1 fs-3 fw-bold"
									                          data-username="${message.receiver.name }">
									                          ${message.receiver.name }
									                        </h5>
									                        <div id="message-div${user.user_id}">
										                        <span class="fs-2 text-nowrap d-block time text-truncate 
										                        	fw-normal text-muted mt-1" id="">
										                        	No messages to show.</span>
										                        <span class="fs-2 text-nowrap d-block 
										                        	subtext text-muted"></span>
									                        </div>
					                      			</div>
					                    		</a>
					                    	</c:when>
					                    	<c:otherwise>
					                    		<a href="<%=request.getContextPath() %>/mobile/user/chat/message/${message.sender_id }"
					                    				class="chat-user message-item align-items-center
					                    				border-bottom px-3 ps-2" id="chat_user_1"
					                      				data-user-id="1">
					                      				<span class="user-img position-relative d-inline-block">
					                        				<img src="https://www.ozailiving.com/profile-user/image/${message.sender_id }"
																onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
					                          					alt="user" class="rounded-circle w-100" style="width: 40px; height: 40px;" />
					                        				<span class="profile-status online rounded-circle
					                            				pull-right"></span>
					                      				</span>
					                      				<div class="mail-contnet w-75 d-inline-block v-middle ps-3">
									                        <h5
									                          class="message-title mb-0 mt-1 fs-3 fw-bold"
									                          data-username="Pavan kumar">
									                          ${message.sender.name }
									                        </h5>
									                        <div id="message-div${user.user_id}">
										                        <span class="fs-2 text-nowrap d-block time text-truncate 
										                        	fw-normal text-muted mt-1" id="">
										                        	No messages to show.</span>
										                        <span class="fs-2 text-nowrap d-block 
										                        	subtext text-muted"></span>
									                        </div>
					                      			</div>
					                    		</a>
					                    	</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach items="${users }" var="user">
		                    			<c:if test="${User.id ne user.user_id}">
		                    				<a href="<%=request.getContextPath() %>/mobile/user/chat/message/${user.user_id }"
			                    				class="chat-user message-item align-items-center
			                    				border-bottom px-3 ps-2" id="chat_user_1"
			                      				data-user-id="1">
			                      				<span class="user-img position-relative d-inline-block">
			                        				<img src="https://www.ozailiving.com/profile-user/image/${user.user_id }"
														onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
			                          					alt="user" class="rounded-circle w-100" style="width: 40px; height: 40px;" />
			                        				<span class="profile-status online rounded-circle
			                            				pull-right"></span>
			                      				</span>
			                      				<div class="mail-contnet w-75 d-inline-block v-middle ps-3">
							                        <h5
							                          class="message-title mb-0 mt-1 fs-3 fw-bold"
							                          data-username="Pavan kumar">
							                          ${user.user.name }
							                        </h5>
							                        <div id="message-div${user.user_id}">
								                        <span class="fs-2 text-nowrap d-block time text-truncate 
								                        	fw-normal text-muted mt-1" id="">
								                        	No messages to show.</span>
								                        <span class="fs-2 text-nowrap d-block 
								                        	subtext text-muted"></span>
							                        </div>
			                      			</div>
			                    		</a>
		                    			</c:if>
		                    		</c:forEach>
		                    	</c:otherwise>
		                    </c:choose>
                    		<!-- Message -->
                  		</div>
                	</li>
              	</ul>
        	</div>
				
				
				
				
					<%-- <div class="col-md-4 col-xl-3 chat">
						<div class="card mb-sm-3 mb-md-0 contacts_card" style="min-height: 90vh">
							<div class="card-header">
								<div class="input-group">
									<input type="text" placeholder="Search..." 
										onkeyup="searchFunction()" id="searchInput" class="form-control search">
									<div class="input-group-prepend">
										<span class="input-group-text search_btn"><i class="fas fa-search fa-2x"></i></span>
									</div>
								</div>
							</div>
							
							<div class="card-body contacts_body">
								<ul class="contacts" id="messagesList">
									<c:choose>
                    					<c:when test="${not empty messages }">
											<c:forEach items="${messages }" var="message">
												<c:choose>
                                  					<c:when test="${message.sender_id eq User.id }">
														<li class="border-bottom">
															<a href="<%=request.getContextPath() %>/mobile/user/chat/message/${message.receiver_id }">
																<div class="d-flex bd-highlight">
																	<div class="img_cont">
																		<img src="http://www.ozailiving.com/profile-user/image/${message.receiver_id }"
																			 onerror="this.onerror=null; this.src='http://www.ozailiving.com/assets/images/default-user.png'"
																			style="width: 100%;" class="rounded-circle user_img">
																		<span class="online_icon"></span>
																	</div>
																	<div class="user_info">
																		<span>${message.receiver.name }</span>
																		<p id="message-div${user.user_id}"> No messages to show.</p>
																	</div>
																</div>
															</a>
														</li>
													</c:when>
													<c:otherwise>
														<li class="border-bottom">
															<a href="<%=request.getContextPath() %>/mobile/user/chat/message/${message.sender_id }">
																<div class="d-flex bd-highlight">
																	<div class="img_cont">
																		<img src="http://www.ozailiving.com/profile-user/image/${message.sender_id }"
																			 onerror="this.onerror=null; this.src='http://www.ozailiving.com/assets/images/default-user.png'"
																			style="width: 100%;" class="rounded-circle user_img">
																		<span class="online_icon"></span>
																	</div>
																	<div class="user_info">
																		<span>${message.sender.name }</span>
																		<p id="message-div${user.user_id}"> No messages to show.</p>
																	</div>
																</div>
															</a>
														</li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach items="${users }" var="user">
		                    					<c:if test="${User.id ne user.user_id}">
		                    						<li class="border-bottom">
														<a href="<%=request.getContextPath() %>/mobile/user/chat/message/${user.user_id }">
			                    							<div class="d-flex bd-highlight">
																<div class="img_cont">
																	<img src="http://www.ozailiving.com/profile-user/image/${user.user_id }"
																		 onerror="this.onerror=null; this.src='http://www.ozailiving.com/assets/images/default-user.png'"
																		style="width: 100%;" class="rounded-circle user_img">
																	<span class="online_icon"></span>
																</div>
																<div class="user_info">
																	<span>${user.user.name }</span>
																	<p id="message-div${user.user_id}"> No messages to show.</p>
																</div>
															</div>
														</a>
													</li>
	                    						</c:if>
	                    					</c:forEach>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<div class="card-footer"></div>
						</div>
					</div> --%>
				
                    <%-- <c:choose>
                    	<c:when test="${not empty messages }">
                    		<div class="list-group list-group-flush rounded-0 bg-none">
                    			<c:forEach items="${messages }" var="message">
                    				<c:choose>
                                   		<c:when test="${message.sender_id eq User.id }">
                                   			<a href="<%=request.getContextPath() %>/mobile/user/chat/message/${message.receiver_id }" class="list-group-item">
					                            <div class="row">
					                                <div class="col-3">
					                                    <div class="avatar avatar-50 rounded-15 p-1 shadow-sm bg-white">
					                                    	<img src="http://www.ozailiving.com/profile-user/image/${message.receiver_id }" 
					                                    		onerror="this.onerror=null; this.src='http://www.ozailiving.com/assets/images/default-user.png'"
																style="width: 100%;" alt="" class="rounded-12">
					                                    </div>
					                                </div>
					                                <div class="col-9 align-self-center">
					                                	<p class="mb-0">${message.receiver.name } <span class="float-end size-12 text-muted">${message.message_time }</span></p>
					                                    <p class="text-secondary"><i class="bi bi-check-all text-primary"></i> ${message.message }</p>
					                                </div>
					                            </div>
					                        </a>
                                   		</c:when>
                                   		<c:otherwise>
                                   			<a href="<%=request.getContextPath() %>/mobile/user/chat/message/${message.sender_id }" class="list-group-item">
					                            <div class="row">
					                                <div class="col-3">
					                                    <div class="avatar avatar-50 rounded-15 p-1 shadow-sm bg-white">
					                                    	<img src="http://www.ozailiving.com/profile-user/image/${message.sender_id }" 
					                                    		onerror="this.onerror=null; this.src='http://www.ozailiving.com/assets/images/default-user.png'"
																style="width: 100%;" alt="" class="rounded-12">
					                                    </div>
					                                </div>
					                                <div class="col-9 align-self-center">
					                                	<p class="mb-0">${message.sender.name } <span class="float-end size-12 text-muted">${message.message_time }</span></p>
					                                    <p class="text-secondary"><i class="bi bi-check-all text-primary"></i> ${message.message }</p>
					                                </div>
					                            </div>
					                        </a>
                                   		</c:otherwise>
                                   	</c:choose>
                    			</c:forEach>
                    		</div>
                    	</c:when>
                    	<c:otherwise>
                    		<div class="list-group list-group-flush rounded-0 bg-none">
	                    		<c:forEach items="${users }" var="user">
		                    		<c:if test="${User.id ne user.user_id}">
		                    			<a href="<%=request.getContextPath() %>/mobile/user/chat/message/${user.user_id }" class="list-group-item">
				                            <div class="row">
				                                <div class="col-3">
				                                    <div class="avatar avatar-50 rounded-15 p-1 shadow-sm bg-white">
				                                        <img src="http://www.ozailiving.com/profile-user/image/${user.user_id }" 
				                                        	onerror="this.onerror=null; this.src='http://www.ozailiving.com/assets/images/default-user.png'"
															style="width: 100%;" alt="" class="rounded-12">
				                                    </div>
				                                </div>
				                                <div class="col-9 align-self-center">
				                                    <p class="mb-0">${user.user.name } <span class="float-end size-12 text-muted"></span>
				                                    </p>
				                                    <p class="text-secondary" id="message-div${user.user_id}"> No messages to show.</p>
				                               	</div>
				                            </div>
				                        </a>
				                	</c:if>
			                	</c:forEach>
			                </div>
                    	</c:otherwise>
                    </c:choose> --%>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<footer class="footer text-center"> All Rights Reserved by
				Ozai. </footer>
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
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/taskboard/js/jquery-ui.min.js"></script>
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
	<!--This page JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/notes/notes.js"></script>
    <script src="<%=request.getContextPath()%>/new/dist/js/pages/chat/chat.js"></script>
    <script>
    	$('document').ready(function(){
    		$('#hideBack').hide();
    	});
   		function searchFunction() {
   		    var input, filter, ul, li, a, i, txtValue;
   		    input = document.getElementById("searchInput");
   		    filter = input.value.toUpperCase();
   		    ul = document.getElementById("messagesList");
   		    li = ul.getElementsByTagName("li");
   		    for (i = 0; i < li.length; i++) {
   		        a = li[i].getElementsByTagName("a")[0];
   		        txtValue = a.textContent || a.innerText;
   		        if (txtValue.toUpperCase().indexOf(filter) > -1) {
   		            li[i].style.display = "";
   		        } else {
   		            li[i].style.display = "none";
   		        }
   		    }
   		}
    </script>
	<c:forEach items="${users }" var="user">
		<script>
			$('document').ready(function() {
				//$('#message-div${user.user_id }').html("<div class=\"text-center\"><i class=\"fa fa-spinner w3-spin\" style=\"color: #f73563; \"></i></div>");
			});
			$('document').ready(function() {
				//setInterval(function () {
					getLatestMessage${user.user_id}();
				//}, 1000);
	 		});
		 	function getLatestMessage${user.user_id}(){
		 		
	       		$.ajax({
	   				type : "GET",
	   				url : "${pageContext.request.contextPath}/mobile/user/chat/getLatestMessage/${user.user_id}",
	   				timeout : 100000,
	   				beforeSend:function(){
	   					//$('#message-div${user.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
	   				},
	   				success : function(data) {
	   					console.log("SUCCESS: ", data);
	    				$('#message-div${user.user_id }').html(data);										    					
	   				},
	   				error : function(e) {
	   					//$('#message-div${user.user_id }').empty();
	   					console.log("ERROR: ", e);	
	   				},
	   				done : function(e) {
	   					console.log("DONE");
	   					$('#loading').remove();										    					
	   				}
	   			});
		 	}
		</script>
	</c:forEach>
</body>

</html>