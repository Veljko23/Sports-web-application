<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
								<form:form role="form" action="author-change-password-action"
									modelAttribute="changePassword">

									<div class="card-body">
										<div class="row">
											<div class="col-md-6">


												<div class="form-group">
													<label>Old password</label>
													<form:input type="password" path="oldPassword"
														class="form-control" placeholder="Enter old password" />
													<form:errors path="oldPassword" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<label>New password</label>
													<form:input type="password" path="newPassword"
														class="form-control" placeholder="Enter news password" />
													<form:errors path="newPassword" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<label>Confirm password</label>
													<form:input type="password" path="confirmPassword"
														class="form-control" placeholder="Confirm password" />
													<form:errors path="confirmPassword" cssClass="text-danger" />
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
									<!-- Add this section for error messages -->
									<c:if test="${not empty errorMessage}">
										<div class="text-danger">${errorMessage}</div>
									</c:if>
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
