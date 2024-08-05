<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
							<h1>Comments</h1>
						</div>
						<div class="col-sm-6"></div>
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
									<h3 class="card-title">All Comments</h3>
									<div class="card-tools"></div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th class="text-center" style="width: 10px">#</th>
												<th class="text-center" style="width: 40%;">Name</th>
												<th class="text-center">Description</th>
												<th class="text-center">Date</th>
												<th class="text-center">Post id</th>
												<th class="text-center">Actions</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="comment" items="${commentList }">
												<tr class="text-center">
													<td>${comment.id }</td>
													<td><strong>${comment.name }</strong></td>
													<td class="comment-description" data-toggle="modal"
														data-target="#commentModal-${comment.id }">
														${fn:substring(comment.description,0,25)}...</td>
													<td class="text-center">${comment.date }</td>
													<td class="text-center">${comment.post.id }</td>
													<td class="text-center">
														<div class="btn-group">
															<c:if test="${comment.isEnabled }">
																<a href="form-comment-enable?id=${comment.id }"
																	class="btn btn-info"> <i class="fas fa-eye"
																	style="color: #b6fc03"></i>
																</a>
															</c:if>
															<c:if test="${!comment.isEnabled }">
																<a href="form-comment-enable?id=${comment.id }"
																	class="btn btn-info"> <i class="fas fa-eye-slash"></i>
																</a>
															</c:if>
															<button type="button" class="btn btn-info"
																data-toggle="modal"
																data-target="#delete-modal-${comment.id }">
																<i class="fas fa-trash"></i>
															</button>
														</div>
													</td>
												</tr>
												<div class="modal fade" id="delete-modal-${comment.id }">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title">Delete Comment</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<p>Are you sure you want to delete comment?</p>
																<strong></strong>
															</div>
															<div class="modal-footer justify-content-between">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Cancel</button>
																<a href="form-comment-delete?id=${comment.id }"
																	class="btn btn-danger">Delete</a>
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div>
												<div class="modal fade" id="commentModal-${comment.id }"
													tabindex="-1" role="dialog"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog small-popup" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">Comment</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<p>${comment.description}</p>
																<c:if test="${not empty comment.replies}">
																	<h6>Replies:</h6>
																	<c:forEach var="reply" items="${comment.replies}">
																		<div class="reply-comment">
																			<div class="comment-image">
																				${fn:substring(reply.name, 0, 1)}</div>
																			<p>${reply.description}</p>
																		</div>
																	</c:forEach>
																</c:if>
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
</body>
</html>
