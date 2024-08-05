<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="frontHead.jsp"%>

<body>

	<%@ include file="frontHeader.jsp"%>

	<div class="container">
		<div class="row">
			<!-- Latest Posts -->
			<main class="post blog-post col-lg-8">
				<div class="container">
					<div class="post-single">
						<div class="post-thumbnail">
							<img src="${pageContext.request.contextPath}${post.image }"
								alt="..." class="post-thumbnail-image">
						</div>
						<div class="post-details">
							<div class="post-meta d-flex justify-content-between">
									<div class="category">
										<a
											href="blog-category-page?id=${post.category.id }&title=${post.category.name}">
											${post.category.name }</a>|<a
											href="blog-subcategory-page?id=${post.subcategory.id }&name=${post.subcategory.name}">
											${post.subcategory.name } </a>
									</div>
							</div>
							<h1>${post.title.toUpperCase() }</h1>
							<div
								class="post-footer d-flex align-items-center flex-column flex-sm-row">
								<a href="blog-author-page?username=${post.author.username }"
									class="author d-flex align-items-center flex-wrap">
									<div class="avatar">
										<img
											src="${pageContext.request.contextPath}${post.author.image }"
											alt="..." class="img-fluid">
									</div>
									<div class="title">
										<span>${post.author.name }</span>
									</div>
								</a>
								<div class="d-flex align-items-center flex-wrap">
									<div class="date">
										<i class="icon-clock"></i> ${post.date }
									</div>
									<div class="views">
										<i class="icon-eye"></i> ${post.numViews }
									</div>
									<div class="comments meta-last">
										<a href="#post-comments"><i class="icon-comment"></i>${commentCount }</a>
									</div>
								</div>
							</div>
							<div class="post-header">${post.header }</div>
							<div class="post-body">${post.text }</div>
							<div class="post-tags">
								<c:forEach var="tag" items="${post.tags }">
									<ul id="menuItems">
										<li id="menuItems"><a
											href="blog-tag-page?id=${tag.id }&name=${tag.name}"
											class="tag">#${tag.name }</a></li>
									</ul>
								</c:forEach>
							</div>

							<c:if test="${post.id == 1 }">
								<div
									class="posts-nav d-flex justify-content-between align-items-stretch flex-column flex-md-row">
									<a class="prev-post text-left d-flex align-items-center">
										<div class="icon prev">
											<i class="fa fa-angle-left"></i>
										</div>
										<div class="text">
											<strong class="text-primary"></strong>
											<h6></h6>
										</div>
									</a><a
										href="blog-post-page?id=${prevNext[0].id}&title=${prevNext[0].title}"
										class="next-post text-right d-flex align-items-center justify-content-end">
										<div class="text">
											<strong class="text-primary">Sledeća vest </strong>
											<h6>${prevNext[0].title}</h6>
										</div>
										<div class="icon next">
											<i class="fa fa-angle-right"> </i>
										</div>
									</a>
								</div>
							</c:if>

							<c:if test="${post.id != 1 && prevNext.size() == 2}">
								<div
									class="posts-nav d-flex justify-content-between align-items-stretch flex-column flex-md-row">
									<a
										href="blog-post-page?id=${prevNext[0].id}&title=${prevNext[0].title}"
										class="prev-post text-left d-flex align-items-center">
										<div class="icon prev">
											<i class="fa fa-angle-left"></i>
										</div>
										<div class="text">
											<strong class="text-primary">Prethodna vest </strong>
											<h6>${fn:substring(prevNext[0].title, 0, 30)}...</h6>
										</div>
									</a><a
										href="blog-post-page?id=${prevNext[1].id}&title=${prevNext[1].title}"
										class="next-post text-right d-flex align-items-center justify-content-end">
										<div class="text">
											<strong class="text-primary">Sledeća vest </strong>
											<h6>${fn:substring(prevNext[1].title, 0, 30)}...</h6>
										</div>
										<div class="icon next">
											<i class="fa fa-angle-right"> </i>
										</div>
									</a>
								</div>
							</c:if>


							<c:if test="${post.id!=1 && prevNext.size() == 1}">
								<div
									class="posts-nav d-flex justify-content-between align-items-stretch flex-column flex-md-row">
									<a
										href="blog-post-page?id=${prevNext[0].id}&title=${prevNext[0].title}"
										class="prev-post text-left d-flex align-items-center">
										<div class="icon prev">
											<i class="fa fa-angle-left"></i>
										</div>
										<div class="text">
											<strong class="text-primary">Prethodna vest </strong>
											<h6>${fn:substring(prevNext[0].title, 0, 30)}...</h6>
										</div>
									</a><a
										class="next-post text-right d-flex align-items-center justify-content-end">
										<div class="text">
											<strong class="text-primary"> </strong>
											<h6></h6>
										</div>
										<div class="icon next">
											<i class="fa fa-angle-right"> </i>
										</div>
									</a>
								</div>
							</c:if>

							<!-- Related Posts -->
							<c:if test="${relatedPosts.size() > 0 }">
							<section class="col-lg-12">
								<div class="container">
									<header>
										<h2>Povezane vesti:</h2>
									</header>

									<div class="owl-carousel" id="related-posts-slider">
										<c:forEach var="i" begin="0" end="${relatedPosts.size()-1 }">
											<div class="latestPostSlider">

												<div class="post col-md-3">
														<a
															href="blog-post-page?id=${relatedPosts[i].id}&title?=${relatedPosts[i].title}">
															<div>
																<img
																	src="${pageContext.request.contextPath}${relatedPosts[i].image}"
																	alt="..." class="img-fluid">
																<div class="post-thumbnail"></div>
																<div class="post-details">
																	<div class="date">${relatedPosts[i].date}</div>
																	<div class="categoryName">
																		<a
																			href="blog-category-page?id=${relatedPosts[i].category.id}&title=${relatedPosts[i].category.name}">
																			${relatedPosts[i].category.name} </a>
																	</div>
																	<h3 class="h4">
																		<a
																			href="blog-post-page?id=${relatedPosts[i].id}&title?=${relatedPosts[i].title}">
																			${fn:substring(relatedPosts[i].title, 0, 20)}... </a>
																	</h3>
																</div>
															</div>
														</a>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</section>
						</c:if>
						<c:if test="${relatedPosts.size() < 0 }"></c:if>

							<div class="post-comments" id="post-comments">
								<header>
									<h3 class="h6">
										Komentari<span class="no-of-comments">(${commentCount })</span>
									</h3>
								</header>
								<div class="add-comment">
								<header>
									<h3 class="h6">Ostavi komentar</h3>
								</header>
								<form:form action="post-comment " modelAttribute="comment"
									class="commenting-form" multiple="true">
									<form:hidden path="id" />
									<div class="row">
										<div class="form-group col-md-6">
											<form:input type="text" path="name" id="username"
												placeholder="Ime" class="form-control" />
										</div>
										<div class="form-group col-md-6">
											<form:input type="email" path="email" id="useremail"
												placeholder="Vaš email (opciono)"
												class="form-control" />
										</div>
										<div class="form-group col-md-12">
											<form:textarea path="description" id="usercomment"
												placeholder="Komentar..." class="form-control" />
										</div>
										<div class="form-group col-md-12">
											<button type="submit" name="idPost" value="${post.id }"
												class="btn btn-secondary">Pošalji komentar</button>
										</div>
									</div>
								</form:form>
							</div>
								<c:forEach var="comment" items="${commentList }">
									<div class="comment">
										<div class="comment-header d-flex justify-content-between">
											<div class="user d-flex align-items-center">
												<div class="image">
													<img src="img/user.svg" alt="..."
														class="img-fluid rounded-circle">
												</div>
												<div class="title">
													<strong>${comment.name }</strong><span class="date">${comment.date }</span>
												</div>
											</div>
											<button class="btn btn-link"
												onclick="toggleReplyForm('${comment.id}')">Odgovori</button>

										</div>
										<div class="comment-body">
											<p>${comment.description }</p>

											<div id="replyForm-${comment.id}" style="display: none;">
												<div class="add-comment">
													<header>
														<h3 class="h6">Odgovori</h3>
													</header>
													<form:form action="comment-reply" modelAttribute="reply"
														class="commenting-form" method="post">
														<!-- Include the comment.id as a hidden input field -->
														<form:hidden path="comment.id" value="${comment.id}" />

														<div class="row">
															<div class="form-group col-md-6">
																<form:input type="text" path="name"
																	placeholder="Ime" class="form-control" />
															</div>
															<div class="form-group col-md-6">
																<form:input type="email" path="email"
																	placeholder="Vaš email (opciono)" class="form-control" />
															</div>
															<div class="form-group col-md-12">
																<form:textarea path="description"
																	placeholder="Odgovor..." class="form-control" />
															</div>
															<div class="form-group col-md-12">
																<button type="submit" class="btn btn-secondary"
																	name="idComm" value="${comment.id} ">Pošalji odgovor</button>
															</div>
														</div>
													</form:form>
												</div>
											</div>


											<!-- Reply -->
											<c:forEach var="reply" items="${comment.replies}">
												<div class="reply-comment">
													<div class="user d-flex align-items-center">
														<div class="comment-image">
															${fn:substring(reply.name, 0, 1)}</div>
														<div class="title">
															<strong>${reply.name }</strong><span class="date">${reply.date }</span>
														</div>
													</div>
													<p>${reply.description}</p>
												</div>
											</c:forEach>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
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
						<h3 class="h6">Izabrane vesti:</h3>
					</header>
					<c:forEach var="lastPost" items="${threeRandomPost}">
						<div class="blog-posts">
							<a
								href="blog-post-page?id=${lastPost.id}&title=${lastPost.title}">
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
	<script
		src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script
		src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script
		src="${pageContext.request.contextPath }/vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/front.js"></script>
	<script src="plugins/owl-carousel2/owl.carousel.min.js"></script>
	<script>
		function toggleReplyForm(id) {
			console.log(id);
			var replyForm = document.getElementById('replyForm-' + id);
			if (replyForm.style.display === 'none') {
				replyForm.style.display = 'block';
			} else {
				replyForm.style.display = 'none';
			}
		}
	</script>
	<script>
		$("#related-posts-slider").owlCarousel({
			"items" : 3,
			"loop" : true,
			"autoplay" : true,
			"autoplayHoverPause" : true
		});
	</script>
	<!-- JavaScript files-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper.js/umd/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
	<script src="js/front.js"></script>
	<script>
		
	</script>
</body>
</html>