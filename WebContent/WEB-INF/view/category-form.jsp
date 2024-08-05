<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
							<h1>Categories Form</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">Categories Form</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form:form role="form" action="category-save"
									modelAttribute="category" enctype="multipart/form-data"
									method="POST">
									<form:hidden path="id" />
									<div class="card-body">
										<div class="form-group">
											<label>Name</label>
											<form:input path="name" type="text" class="form-control"
												placeholder="Enter name" />
											<form:errors path="name" />
											<c:if test="${not empty categoryExistsError}">
												<div class="text-danger">${categoryExistsError}</div>
											</c:if>
										</div>
										<div class="form-group">
											<label>Description</label>
											<form:textarea path="description" class="form-control"
												placeholder="Enter description" />
										</div>
										<div class="form-group">
											<c:if test="${not empty category.image}">
												<label for="existingPhoto">Current Photo</label>
												<br>
												<img
													src="${pageContext.request.contextPath}${category.image}"
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
									<!-- /.card-body -->

									<div class="card-footer">
										<button type="submit" class="btn btn-primary">Save</button>
										<a href="<c:url value='/administration/category-list'/>"
											class="btn btn-secondary">Back</a>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<footer class="main-footer"> </footer>
	</div>

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
