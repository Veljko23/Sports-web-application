<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="frontHead.jsp"%>

<body>
	<%@ include file="frontHeader.jsp"%>
	<c:if test="${sliderMainPage.size() > 0}">
		<div class="blinking-text">PROMO</div>
		<div id="index-slider" class="owl-carousel">
			<c:forEach var="slider" items="${sliderMainPage}">
				<section class="hero">
					<div class="container">
						<div class="row">
							<div class="slider-content">
<%-- 								<div class="sliderText">${slider.text}</div> --%>
								<div>
									<a href="${slider.link}" target="_blank" class="hero-link">Pročitaj
										više</a>
								</div>
							</div>
						</div>
					</div>
					<div class="background-image">
						<img src="${pageContext.request.contextPath}${slider.image}"
							alt="Slider Image">
					</div>
				</section>
			</c:forEach>
		</div>
	</c:if>

	<div id="postSlider">
		<div class="post-title-container">
			<c:forEach var="i" begin="0" end="${latestPost.size()-1}">
				<div class="post-title" data-post-id="${latestPost[i].id}">
					<a
						href="blog-post-page?id=${latestPost[i].id}&title=${latestPost[i].title}"
						class="post-title" data-post-id="${latestPost[i].id}">
						${latestPost[i].title} </a> |
				</div>
			</c:forEach>
		</div>
	</div>

	<div id="category-menu" class="scroll-down-visible">
		<c:forEach var="category" items="${categoryList}">
			<div class="category-menu">
				<a
					href="blog-category-page?id=${category.id}&title=${category.name}"
					class="category-link"> <span class="category-name">${category.name.toUpperCase()}</span>
				</a>
				<div class="subcategories">
					<c:forEach var="subcategory" items="${category.subCategories}">
						<a
							href="blog-subcategory-page?id=${subcategory.id }&name=${subcategory.name}"
							class="subcategory">${subcategory.name}</a>
					</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>


	<section class="featured-posts no-padding-top">
		<div class="container">
			<!-- Post-->
			<c:forEach var="i" begin="0" end="${lastSixImportantPost.size()-1}">
				<c:if test="${i%2 == 0 }">
					<div class="row d-flex align-items-stretch">
						<div class="text col-lg-7">
							<div class="text-inner d-flex align-items-center">
								<div class="content">
									<header class="post-header">
										<div class="category">
											<a
												href="blog-category-page?id=${lastSixImportantPost[i].category.id}&title=${lastSixImportantPost[i].category.name}">
												${lastSixImportantPost[i].category.name }</a> | <a
												href="blog-subcategory-page?id=${lastSixImportantPost[i].subcategory.id}&title=${lastSixImportantPost[i].subcategory.name}">
												${lastSixImportantPost[i].subcategory.name }</a>
										</div>
										<a
											href="blog-post-page?id=${lastSixImportantPost[i].id}&title=${lastSixImportantPost[i].title}">
											<h2 class="h4">${lastSixImportantPost[i].title}</h2>
										</a>
									</header>
									<p>${fn:substring(lastSixImportantPost[i].header,0,200)}</p>
									<footer class="post-footer d-flex align-items-center">
										<a
											href="blog-author-page?username=${lastSixImportantPost[i].author.username}"
											class="author d-flex align-items-center flex-wrap">
											<div class="avatar">
												<img
													src="${pageContext.request.contextPath}${lastSixImportantPost[i].author.image }"
													alt="..." class="img-fluid">
											</div>
											<div class="title">
												<span>${lastSixImportantPost[i].author.name }</span>
											</div>
										</a>
										<div class="date">
											<i class="icon-clock"></i>${lastSixImportantPost[i].date }</div>
										<div class="comments">
											<a
												href="blog-post-page?id=${lastSixImportantPost[i].id }&title=${lastSixImportantPost[i].title}#post-comments">
												<i class="icon-comment"></i>${lastSixImportantPost[i].numComments }
											</a>
										</div>
									</footer>
								</div>
							</div>
						</div>
						<div class="image col-lg-5">
							<a
								href="blog-post-page?id=${lastSixImportantPost[i].id}&title=${lastSixImportantPost[i].title}">
								<img
								src="${pageContext.request.contextPath}${lastSixImportantPost[i].image}"
								alt="...">
							</a>
						</div>
					</div>
				</c:if>
				<!-- Post        -->
				<c:if test="${i%2 == 1 }">
					<div class="row d-flex align-items-stretch">
						<div class="image col-lg-5">
							<a
								href="blog-post-page?id=${lastSixImportantPost[i].id}&title=${lastSixImportantPost[i].title}">
								<img
								src="${pageContext.request.contextPath}${lastSixImportantPost[i].image}"
								alt="...">
							</a>
						</div>
						<div class="text col-lg-7">
							<div class="text-inner d-flex align-items-center">
								<div class="content">
									<header class="post-header">
										<div class="category">
											<a
												href="blog-category-page?id=${lastSixImportantPost[i].category.id}&title=${lastSixImportantPost[i].category.name}">
												${lastSixImportantPost[i].category.name }</a> | <a
												href="blog-subcategory-page?id=${lastSixImportantPost[i].subcategory.id}&title=${lastSixImportantPost[i].subcategory.name}">
												${lastSixImportantPost[i].subcategory.name }</a>
										</div>
										<a
											href="blog-post-page?id=${lastSixImportantPost[i].id}&title=${lastSixImportantPost[i].title}">
											<h2 class="h4">${lastSixImportantPost[i].title}</h2>
										</a>
									</header>
									<p>${fn:substring(lastSixImportantPost[i].header,0,200)}</p>
									<footer class="post-footer d-flex align-items-center">
										<a
											href="blog-author-page?username=${lastSixImportantPost[i].author.username}"
											class="author d-flex align-items-center flex-wrap">
											<div class="avatar">
												<img
													src="${pageContext.request.contextPath}${lastSixImportantPost[i].author.image }"
													alt="..." class="img-fluid">
											</div>
											<div class="title">
												<span>${lastSixImportantPost[i].author.name }</span>
											</div>
										</a>
										<div class="date">
											<i class="icon-clock"></i> ${lastSixImportantPost[i].date }
										</div>
										<div class="comments">
											<a
												href="blog-post-page?id=${lastSixImportantPost[i].id }&title=${lastSixImportantPost[i].title}#post-comments">
												<i class="icon-comment"></i>${lastSixImportantPost[i].numComments }
											</a>
										</div>
									</footer>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>

	<!-- Latest Posts -->
	<section class="latest-posts">
		<div class="container">
			<header id="more">
				<h2>Čitajte još:</h2>
			</header>

			<div class="row">
				<c:forEach var="i" begin="0" end="${latestPost.size()-1}"
					varStatus="loop">
					<div class="col-md-3 latest-post-container">
						<div class="latestPostSlider">
							<div class="post">
								<a
									href="blog-post-page?id=${latestPost[i].id}&title?=${latestPost[i].title}">
									<div class="latest-post-content">
										<img
											src="${pageContext.request.contextPath}${latestPost[i].image}"
											alt="..." class="img-fluid">
										<div class="post-thumbnail"></div>
										<div class="post-details">
											<div class="date">${latestPost[i].date}</div>
											<div class="categoryName">
												<a
													href="blog-category-page?id=${latestPost[i].category.id}&title=${latestPost[i].category.name}">
													${latestPost[i].category.name} </a>
											</div>
											<h5 class="latest-post-title">
												<a
													href="blog-post-page?id=${latestPost[i].id}&title?=${latestPost[i].title}">
													<c:choose>
														<c:when test="${fn:length(latestPost[i].title) > 20}">
                                                            ${fn:substring(latestPost[i].title, 0, 15)}...
                                                        </c:when>
														<c:otherwise>
                                                            ${latestPost[i].title}
                                                        </c:otherwise>
													</c:choose>
												</a>
											</h5>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>

					<%-- Start a new row after every 4 posts --%>
					<c:if test="${loop.index % 4 == 3}">
			</div>
			<div class="row">
				</c:if>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- Most Read Posts -->
	<section class="latest-posts">
		<div class="container">
			<header id="more">
				<h2>Najviše pregleda:</h2>
			</header>

			<div class="row">
				<c:forEach var="i" begin="0" end="${mostReadPost.size()-1}"
					varStatus="loop">
					<div class="col-md-3 latest-post-container">
						<div class="latestPostSlider">
							<div class="post">
								<a
									href="blog-post-page?id=${mostReadPost[i].id}&title?=${mostReadPost[i].title}">
									<div class="latest-post-content">
										<img
											src="${pageContext.request.contextPath}${mostReadPost[i].image}"
											alt="..." class="img-fluid">
										<div class="post-thumbnail"></div>
										<div class="post-details">
											<div class="date">${mostReadPost[i].date}</div>
											<div class="categoryName">
												<a
													href="blog-category-page?id=${mostReadPost[i].category.id}&title=${mostReadPost[i].category.name}">
													${mostReadPost[i].category.name} </a>
											</div>
											<h5 class="latest-post-title">
												<a
													href="blog-post-page?id=${mostReadPost[i].id}&title?=${mostReadPost[i].title}">
													<c:choose>
														<c:when test="${fn:length(mostReadPost[i].title) > 20}">
                                                            ${fn:substring(mostReadPost[i].title, 0, 15)}...
                                                        </c:when>
														<c:otherwise>
                                                            ${mostReadPost[i].title}
                                                        </c:otherwise>
													</c:choose>
												</a>
											</h5>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>

					<%-- Start a new row after every 4 posts --%>
					<c:if test="${loop.index % 4 == 3}">
			</div>
			<div class="row">
				</c:if>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- Most Commented Posts -->
	<section class="latest-posts">
		<div class="container">
			<header id="more">
				<h2>Najviše komentara:</h2>
			</header>

			<div class="row">
				<c:forEach var="i" begin="0" end="${mostCommentedPost.size()-1}"
					varStatus="loop">
					<div class="col-md-3 latest-post-container">
						<div class="latestPostSlider">
							<div class="post">
								<a
									href="blog-post-page?id=${mostCommentedPost[i].id}&title?=${mostCommentedPost[i].title}">
									<div class="latest-post-content">
										<img
											src="${pageContext.request.contextPath}${mostCommentedPost[i].image}"
											alt="..." class="img-fluid">
										<div class="comment-count">
										<a
													href="blog-post-page?id=${mostCommentedPost[i].id }&title=${mostCommentedPost[i].title}#post-comments">
													<span class="comments-number">${mostCommentedPost[i].numComments }</span>
												</a>
										</div>
										<div class="post-thumbnail"></div>
										<div class="post-details">
											<div class="date">${mostCommentedPost[i].date}</div>
											<div class="categoryName">
												<a
													href="blog-category-page?id=${mostCommentedPost[i].category.id}&title=${mostCommentedPost[i].category.name}">
													${mostCommentedPost[i].category.name} </a> 
											</div>
											<h5 class="latest-post-title">
												<a
													href="blog-post-page?id=${mostCommentedPost[i].id}&title?=${mostCommentedPost[i].title}">
													<c:choose>
														<c:when
															test="${fn:length(mostCommentedPost[i].title) > 20}">
                                                            ${fn:substring(mostCommentedPost[i].title, 0, 15)}...
                                                        </c:when>
														<c:otherwise>
                                                            ${mostCommentedPost[i].title}
                                                        </c:otherwise>
													</c:choose>
												</a>
											</h5>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>

					<%-- Start a new row after every 4 posts --%>
					<c:if test="${loop.index % 4 == 3}">
			</div>
			<div class="row">
				</c:if>
				</c:forEach>
			</div>
		</div>
	</section>

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
		//slajder na vrhu
		$("#index-slider").owlCarousel({
			"items" : 2,
			"loop" : true,
			"autoplay" : true,
			"autoplayHoverPause" : true
		});
		
		//slajder na dnu
		$("#latest-posts-slider").owlCarousel({
			"items" : 4,
			"loop" : true,
			"autoplay" : true,
			"autoplayHoverPause" : true
		});
		
		//podkategorije u prikazu kada se predje kursorom preko neke kategorije
		$(document).ready(function () {
	        $('.category').hover(
	            function () {
	                $(this).find('.subcategories').slideDown('fast');
	            },
	            function () {
	                $(this).find('.subcategories').slideUp('fast');
	            }
	        );
	    });
		
		//prikaz prilikom skrolovanja na dole
		document.addEventListener("DOMContentLoaded", function() {
	        var menu = document.getElementById("category-menu");
	        var offset = menu.offsetTop;
	        var scrollThreshold = 30; 

	        window.onscroll = function() {
	            if (window.pageYOffset >= offset - scrollThreshold) {
	                menu.classList.add("sticky");
	            } else {
	                menu.classList.remove("sticky");
	            }
	        };
	    });
	</script>

</body>
</html>