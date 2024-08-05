<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="frontHead.jsp"%>

<body>

	<%@ include file="frontHeader.jsp"%>

	<div class="container">
		<div class="col-md-3 offset-md-0 sorting">
			<form class="center-block" role="form" action="post-order">
				<div class="form-group center-block text-center">
					<div class="d-flex justify-content-between">
						<div class="mr-2">
							<select class="form-control" id="sel1" name="orderBy">
								<option value="0">Po datumu</option>
								<option value="1">Najviše pregleda</option>
								<option value="2">Najviše komentara</option>
							</select>
						</div>
						<div>
							<input type="submit" value="Sortiraj" class="btn btn-primary">
						</div>
					</div>
				</div>
			</form>
		</div>

		<div class="row">
			<!-- Latest Posts -->
			<main class="posts-listing col-lg-8">
				<div class="container">
					<div class="row">
						<!-- post -->
						<c:if test="${postList.size() > 0 }">
							<c:forEach var="i" begin="0" end="${postList.size()-1 }">
								<div class="post col-xl-6">
									<div class="post-thumbnail">
										<a
											href="blog-post-page?id=${postList[i].id }&title=${postList[i].title}">
											<img
											src="${pageContext.request.contextPath}${postList[i].image }"
											alt="..." class="post-image">
										</a>
									</div>
									<div class="post-details">
										<div class="post-meta d-flex justify-content-between">
											<div class="date meta-last">${postList[i].date }</div>
												<div class="category">
													<a
														href="blog-category-page?id=${postList[i].category.id }&name=${postList[i].category.name}">
														${postList[i].category.name } </a> | <a
														href="blog-subcategory-page?id=${postList[i].subcategory.id }&name=${postList[i].subcategory.name}">
														${postList[i].subcategory.name } </a>
												</div>
										</div>
										<a
											href="blog-post-page?id=${postList[i].id }&name=${postList[i].title}">
											<h3 class="h4">${postList[i].title }</h3>
										</a>
										<p class="text-muted">${fn:substring(postList[i].header,0,200)}...</p>
										<footer class="post-footer d-flex align-items-center">
											<c:if test="${postList[i].author.username != null}">
												<a
													href="blog-author-page?username=${postList[i].author.username }"
													class="author d-flex align-items-center flex-wrap">
													<div class="avatar">
														<img
															src="${pageContext.request.contextPath}${postList[i].author.image }"
															alt="..." class="img-fluid">
													</div>
													<div class="title">
														<span>${postList[i].author.name }</span>
													</div>
												</a>
											</c:if>
											<c:if test="${postList[i].author.username == null}">
												<div class="title">
													<span>X</span>
												</div>
											</c:if>
											<div class="date">
												<i class="icon-clock"></i> ${postList[i].date }
											</div>
											<div class="comments meta-last">
												<a href="blog-post-page?id=${postList[i].id }&title=${postList[i].title}#post-comments">
													<i class="icon-comment"></i>${postList[i].numComments }
												</a>
											</div>
										</footer>
									</div>
								</div>
							</c:forEach>
						</c:if>

<%-- 						<c:if test="${postList.size() == 0 }"> --%>
<!-- 							Handle case where no posts are available -->
<!-- 							<h2 class="mb-3">No posts available</h2> -->
<%-- 						</c:if> --%>
					</div>

					<!-- Pagination -->
					<c:if test="${totalPages > 1 }">
						<nav aria-label="Pagination">
							<ul
								class="pagination pagination-template d-flex justify-content-center">
								<li
									class="page-item <c:if test="${currentPage == 1 }">disabled</c:if>">
									<a href="blog-page?orderBy=${orderBy}&page=${currentPage - 1}"
									class="page-link" aria-label="Previous"> <span
										aria-hidden="true">&laquo;</span>
								</a>
								</li>
								<c:forEach begin="1" end="${totalPages}" var="page">
									<li
										class="page-item <c:if test="${currentPage == page }">active</c:if>">
										<a href="blog-page?orderBy=${orderBy}&page=${page}"
										class="page-link">${page}</a>
									</li>
								</c:forEach>
								<li
									class="page-item <c:if test="${currentPage == totalPages }">disabled</c:if>">
									<a href="blog-page?orderBy=${orderBy}&page=${currentPage + 1}"
									class="page-link" aria-label="Next"> <span
										aria-hidden="true">&raquo;</span>
								</a>
								</li>
							</ul>
						</nav>

					</c:if>
				</div>
			</main>

			<aside class="col-lg-4">
				<!-- Widget [Search Bar Widget]-->
				<div class="widget search">
					<header>
						<h3 class="h6">Pretražite sajt:</h3>
					</header>
					<form action="blog-search-page">
						<div class="form-group">
							<input type="search" name="search" id="search"
								placeholder="Unesite pojam za pretragu">
							<button type="submit" class="submit">
								<i class="icon-search-1"></i>
							</button>
						</div>
					</form>
				</div>
				<!-- Widget [Latest Posts Widget]        -->
				<div class="widget latest-posts">
					<header>
						<h3 class="h6">Poslednje vesti</h3>
					</header>
					<c:forEach var="lastPost" items="${lastThreePost }">
						<div class="blog-posts">
							<a
								href="blog-post-page?id=${lastPost.id }&title=${lastPost.title}">
								<div class="item d-flex align-items-center">
									<div class="image">
										<img
											src="${pageContext.request.contextPath}${lastPost.image }"
											alt="..." class="img-fluid">
									</div>
									<div class="title">
										<strong>${lastPost.title }</strong>
										<div class="d-flex align-items-center">
											<div class="views">
												<i class="icon-eye"></i> ${lastPost.numViews }
											</div>
											<div class="comments">
												<i class="icon-comment"></i>${lastPost.numComments }</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
				<!-- Widget [Categories Widget]-->
				<div class="widget categories">
					<header>
						<h3 class="h6">Kategorije</h3>
					</header>
					<div>
						<c:forEach var="category" items="${categoryList }">
								<div class="item d-flex justify-content-between">
									<a
										href="blog-category-page?id=${category.id }&name=${category.name}">${category.name }</a><span>${category.count }</span>
								</div>
						</c:forEach>
					</div>
				</div>
				<!-- Widget [Tags Cloud Widget]-->
<!-- 				<div class="widget tags"> -->
<!-- 					<header> -->
<!-- 						<h3 class="h6">Tags</h3> -->
<!-- 					</header> -->
<!-- 					<div> -->
<%-- 						<c:forEach var="tag" items="${tagList }"> --%>
<!-- 							<div class="item d-flex justify-content-between"> -->
<%-- 								<a href="blog-tag-page?id=${tag.id }&name=${tag.name}">${tag.name }</a><span>${tag.posts.size() }</span> --%>
<!-- 							</div> -->
<%-- 						</c:forEach> --%>
<!-- 					</div> -->
<!-- 				</div> -->
			</aside>
		</div>
	</div>
	<!-- Page Footer-->
	<footer class="main-footer">
		<%@ include file="frontFooter.jsp"%>
	</footer>
	<!-- JavaScript files-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
	<script src="js/front.js"></script>
</body>
</html>