<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


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
							<h1>Posts</h1>
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
									<h3 class="card-title">All Posts</h3>
									<div class="card-tools">
										<a href="post-list" class="btn btn-success"> <i
											class="fas fa-plus-square"></i> Back on post list
										</a>
									</div>
								</div>

								<!-- /.card-header -->
								<div class="card-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th class="text-center">ID</th>
												<th class="text-center">Title</th>
												<th class="text-center">Number of Comments</th>
												<th class="text-center">Number of Views</th>
												<th class="text-center">Author</th>
												<th class="text-center">Image</th>
												<th class="text-center">Date created</th>
												<th class="text-center">Actions</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="post" items="${postList }">

												<tr>
													<td>${post.id }</td>

													<td><strong>${post.title }</strong></td>
													<td>${post.numComments }</td>
													<td>${post.numViews }</td>
													<td>${post.author.name }</td>
													<td class="text-center"><img src="${pageContext.request.contextPath }${post.image }"
														style="max-width: 80px;"></td>
													<td>${post.date }</td>
													<td class="text-center">
														<div class="btn-group">
<c:if
																	test="${loggedAuthor.authorities.authority == 'ROLE_admin' }">

																	<a href="form-post-enable?id=${post.id }"
																		class="btn btn-info"> <c:if
																			test="${post.isEnabled }">
																			<i class="fas fa-eye" style="color: #b6fc03"></i>
																		</c:if> <c:if test="${!post.isEnabled }">
																			<i class="fas fa-eye-slash"></i>
																		</c:if>

																	</a>
																	<a href="form-post-important?id=${post.id }"
																		class="btn btn-info"> <c:if
																			test="${!post.isImportant }">
																			<i class="fas fa-star"></i>
																		</c:if> <c:if test="${post.isImportant }">
																			<i class="far fa-star" style="color: #b6fc03"></i>
																		</c:if>
																</c:if>

																</a>
																<c:if
																	test="${(loggedAuthor.authorities.authority == 'ROLE_admin') || loggedAuthor.authorities.authority == 'ROLE_employee' && post.author.username == loggedAuthor.username}">
																	<a href="form-post-update?id=${post.id }"
																		class="btn btn-info"> <i class="fas fa-edit"></i>
																	</a>
																	<button type="button" class="btn btn-info"
																		data-toggle="modal"
																		data-target="#delete-modal-${post.id }">
																		<i class="fas fa-trash"></i>
																	</button>
																</c:if>
																<c:if
																	test="${loggedAuthor.authorities.authority != 'ROLE_admin' && (loggedAuthor.authorities.authority != 'ROLE_employee' || post.author.username != loggedAuthor.username)}">
																	<p>No access to this post</p>
																</c:if>
														</div>
													</td>
												</tr>



												<div class="modal fade" id="delete-modal-${post.id }">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title">Delete Post</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<p>Are you sure you want to delete post?</p>
																<strong></strong>
															</div>
															<div class="modal-footer justify-content-between">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Cancel</button>
																<a href="form-post-delete?id=${post.id }"
																	class="btn btn-danger">Delete</a>
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
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
