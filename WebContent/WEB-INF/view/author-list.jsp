<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
							<h1>Authors</h1>
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
									<h3 class="card-title">All Authors</h3>
									<sec:authorize access="hasRole('admin')">
										<div class="card-tools">
											<a href="author-form" class="btn btn-success"> <i
												class="fas fa-plus-square"></i> Add new Author
											</a>
										</div>
									</sec:authorize>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th class="text-center">Username</th>
												<th class="text-center">Name</th>
												<th class="text-center">Surname</th>
												<th class="text-center">Image</th>
												<sec:authorize access="hasRole('admin')">
													<th class="text-center">Actions</th>
												</sec:authorize>
											</tr>
										</thead>
										<tbody>

											<c:forEach var="author" items="${authorList }">

												<tr class="text-center">
													<td><strong>${author.username }</strong></td>

													<td>${author.name }</td>
													<td>${author.surname }</td>
													<td class="text-center"><img
														src="${pageContext.request.contextPath}${author.image }"
														class="categoryImage"></td>
													<sec:authorize access="hasRole('admin')">
														<td class="text-center">
															<div class="btn-group">
																<a
																	href="form-author-enable?username=${author.username }"
																	class="btn btn-info"> <c:if
																		test="${author.enabled }">
																		<i class="fas fa-eye"></i>
																	</c:if> <c:if test="${!author.enabled }">
																		<i class="fas fa-eye-slash" style="color: #b6fc03"></i>
																	</c:if>

																</a>


																<button type="button" class="btn btn-info"
																	data-toggle="modal"
																	data-target="#delete-modal-${author.username }">
																	<i class="fas fa-trash"></i>
																</button>

															</div>
														</td>
													</sec:authorize>
												</tr>



												<div class="modal fade"
													id="delete-modal-${author.username }">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title">Delete Author</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<p>Are you sure you want to delete user?</p>
																<strong></strong>
															</div>
															<div class="modal-footer justify-content-between">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Cancel</button>
																<a
																	href="form-author-delete?username=${author.username }"
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
