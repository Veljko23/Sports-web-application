<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
							<h1>Author Form</h1>
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
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">Author Form</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form:form role="form" action="save-author"
									enctype="multipart/form-data" modelAttribute="author"
									method="POST">
									<div class="card-body">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Username</label>
													<form:input path="username" type="text"
														class="form-control" placeholder="Enter username" />
													<form:errors path="username" cssClass="text-danger" />
													<c:if test="${not empty authorExistsError}">
														<div class="text-danger">${authorExistsError}</div>
													</c:if>
												</div>
												<div class="form-group">
													<label>Name</label>
													<form:input path="name" class="form-control"
														placeholder="Enter name" />
													<form:errors path="name" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<label>Surname</label>
													<form:input path="surname" class="form-control"
														placeholder="Enter surname" />
													<form:errors path="surname" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<label>Password</label>
													<form:input path="password" type="password"
														class="form-control" placeholder="Enter password" />
													<form:errors path="password" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<c:if test="${not empty author.image}">
														<label for="existingPhoto">Current Photo</label>
														<br>
														<img
															src="${pageContext.request.contextPath}${author.image}"
															alt="Current Photo" class="existing-photo">
														<br>
													</c:if>
													<div class="newImage">
														<label for="image">Choose New Photo</label> <input
															path="image" name="file" type="file" class="form-control"
															id="image" />
													</div>
												</div>


											</div>

										</div>

									</div>
									<!-- /.card-body -->

									<div class="card-footer">
										<button type="submit" class="btn btn-primary">Save</button>
										<a href="<c:url value='/administration/author-list'/>"
											class="btn btn-secondary">Back</a>
									</div>
								</form:form>
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
