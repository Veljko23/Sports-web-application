<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="header.jsp"%>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<%@ include file="navbarAsideMenu.jsp"%>

		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>SubCategory Form</h1>
						</div>
					</div>
				</div>
			</section>

			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">SubCategory Form</h3>
								</div>

								<form:form role="form" action="subcategory-save"
									modelAttribute="subcategory" method="POST">
									<form:hidden path="id" />

									<div class="card-body">
										<div class="form-group">
											<label>Name</label>
											<form:input path="name" type="text" class="form-control"
												placeholder="Enter name" />
											<form:errors path="name" />
											<c:if test="${not empty subCategoryErrorMessage}">
												<div class="text-danger">${subCategoryErrorMessage}</div>
											</c:if>
										</div>

										<div class="form-group">
											<label>Category</label>
											<form:select path="category.id" class="form-control">
												<form:options items="${categories}" itemValue="id"
													itemLabel="name" />
											</form:select>
										</div>
									</div>

									<div class="card-footer">
										<button type="submit" class="btn btn-primary">Save</button>
										<a href="<c:url value='/administration/subcategory-list'/>"
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

	<script
		src="${pageContext.request.contextPath }/plugins/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/dist/js/adminlte.min.js"></script>
</body>
</html>
