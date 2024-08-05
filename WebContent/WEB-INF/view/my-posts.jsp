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
										<a href="post-form" class="btn btn-success"> <i
											class="fas fa-plus-square"></i> Add new Post
										</a>
									</div>
								</div>
								<div class="row mb-3">
									<div class="col-md-6">
										<form class="form-inline" role="form" action="post-order-author">
											<div class="form-group center-block text-center">
												<ul class="nav navbar-nav list-inline text-center clearfix">
													<li><select class="form-control" id="sel1"
														name="orderBy">
															<option value="5">--Choose option--</option>
															<option value="0">By date created</option>
															<option value="1">By title</option>
															<option value="2">By author name</option>
															<option value="3">By enabled post</option>
															<option value="4">By disabled post</option>
															<option value="6">Most viewed</option>
															<option value="7">Most commented</option>
													</select></li>

												</ul>
											</div>
											<button type="submit" class="btn btn-primary ml-2">Sort</button>
											<a href="<c:url value='/administration/post-list'/>"
												class="btn btn-info ml-2">Back to post list</a>
										</form>
									</div>
									<div class="col-md-6">
										<!-- Search Form -->
										<form class="form-inline float-right" action="post-search">
											<div class="form-group">
												<input type="search" name="search" id="search"
													class="form-control" placeholder="Search...">
												<button type="submit" class="btn btn-primary ml-2">Search</button>
											</div>
										</form>
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

														<td class="text-center"><strong>${post.title }</strong>
														</td>
														<td class="text-center">${post.numComments }</td>
														<td class="text-center">${post.numViews }</td>
														<td>${post.author != null ? post.author.username : 'Unnamed author'}</td>
														<td class="text-center"><img
															src="${pageContext.request.contextPath}${post.image }"
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
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
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
