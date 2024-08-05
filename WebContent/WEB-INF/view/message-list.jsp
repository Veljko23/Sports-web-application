<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<%@ include file="header.jsp"%>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<%@ include file="navbarAsideMenu.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Messages</h1>
						</div>

					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">All Messages</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th class="text-center" style="width: 10%">#</th>
												<th class="text-center" style="width: 30%;">Name</th>
												<th class="text-center" style="width: 30%;">Mail</th>
												<th class="text-center">Description</th>
												<th class="text-center">ACTION</th>
											</tr>
										</thead>
										<tbody id="sort-list" td class="text-center">
											<c:forEach var="message" items="${messageList }">
												<tr>
													<td>${message.id }</td>
													<td><strong>${message.name }</strong></td>
													<td>${message.email }</td>
													<td class="message-description" data-toggle="modal" data-target="#messageModal-${message.id }">
													${fn:substring(message.message,0,25)}...
													</td>


													<td class="text-center"><a
														href="message-seen?id=${message.id }" class="btn btn-info" title="${message.isSeen ? 'Mark as unread' : 'Mark as read'}">
															<c:if test="${message.isSeen}">
																<i class="fas fa-envelope-open"></i>
															</c:if> <c:if test="${!message.isSeen}">
																<i class="fas fa-envelope"></i>
															</c:if>
													</a>
														<div class="btn-group">
															<button type="button" class="btn btn-info"
																data-toggle="modal"
																data-target="#delete-modal-${message.id }">
																<i class="fas fa-trash"></i>
															</button>
														</div></td>
												</tr>
												<div class="modal fade" id="delete-modal-${message.id }">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title">Delete Message</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<p>Are you sure you want to delete message?</p>
																<strong></strong>
															</div>
															<div class="modal-footer justify-content-between">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Cancel</button>
																<a href="form-message-delete?id=${message.id }"
																	class="btn btn-danger">Delete</a>

															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div>
												<div class="modal fade" id="messageModal-${message.id }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog small-popup" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Message Content</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>${message.message}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.card-body -->
								<div class="card-footer clearfix"></div>
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->


			<!-- /.modal -->
		</div>
		<!-- /.content-wrapper -->



		<!-- Main Footer -->
		<footer class="main-footer"> </footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath }/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath }/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath }/dist/js/adminlte.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/plugins/jquery-ui/jquery-ui.min.js"></script>
</body>
</html>
