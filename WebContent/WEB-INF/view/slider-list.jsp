<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
							<h1>Slides</h1>
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
									<h3 class="card-title">All Slides</h3>
									<div class="card-tools">

										<a href="slider-form" class="btn btn-success"> <i
											class="fas fa-plus-square"></i> Add new Slide
										</a>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table class="table table-bordered">
										<thead>
											<tr>
												<th style="width: 10%">#</th>
												<th style="width: 30%;">Image</th>
												<th style="width: 30%;">Text</th>
												<th class="text-center">Link</th>
												<th class="text-center">Actions</th>
											</tr>
										</thead>
										<tbody id="sort-list">
											<c:forEach var="slider" items="${sliderList }">
												<tr>
													<td>${slider.id }</td>
													<td><img
														src="${pageContext.request.contextPath}${slider.image }"
														style="max-width: 80px;"></td>
													<td>${slider.text }</td>
													<td>${slider.link }</td>
													<td class="text-center">
														<div class="btn-group">

															<a href="slider-form-enable?id=${slider.id }"
																class="btn btn-info"> <c:if
																	test="${slider.isEnabled }">
																	<i class="fas fa-eye"></i>
																</c:if> <c:if test="${!slider.isEnabled }">
																	<i class="fas fa-eye-slash" style="color: #b6fc03"></i>
																</c:if>

															</a> <a href="slider-form-update?id=${slider.id }"
																class="btn btn-info"> <i class="fas fa-edit"></i>
															</a>
															<button type="button" class="btn btn-info"
																data-toggle="modal"
																data-target="#delete-modal-${slider.id }">
																<i class="fas fa-trash"></i>
															</button>
														</div>
													</td>
												</tr>

												<div class="modal fade" id="delete-modal-${slider.id }">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h4 class="modal-title">Delete Slider</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<p>Are you sure you want to delete slider?</p>
																<strong></strong>
															</div>
															<div class="modal-footer justify-content-between">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Cancel</button>
																<a href="slider-form-delete?id=${slider.id }"
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
	<script
		src="${pageContext.request.contextPath }/plugins/jquery-ui/jquery-ui.min.js"></script>
</body>
</html>
