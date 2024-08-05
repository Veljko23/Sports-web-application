<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="frontHead.jsp"%>

<body>

	<%@ include file="frontHeader.jsp"%>

	<!-- Hero Section -->
	<section
		style="background: url(img/contact.jpg); background-size: cover; background-position: center"
		class="hero-contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>Ako imate primedbe ili sugestije kako da unapredimo sajt, pošaljite nam poruku!</h1>
				</div>
			</div>
		</div>
	</section>
	<div class="container">
		<div class="row">
			<!-- Latest Posts -->
			<main class="col-lg-8">
				<div class="container">
					<form:form action="message-save" class="commenting-form"
						modelAttribute="contact" role="form" method="post">
						<div class="row">
							<div class="form-group col-md-6">
								<form:input type="text" path="name" placeholder="Vaše ime"
									class="form-control" />
								<form:errors path="name" cssClass="text-danger"/>
							</div>
							<div class="form-group col-md-6">
								<form:input type="email" path="email"
									placeholder="Email adresa (neće biti prikazana)"
									class="form-control" />
								<form:errors path="email" cssClass="text-danger"/>
							</div>
							<div class="form-group col-md-12">
								<form:textarea path="message" placeholder="Vaša poruka"
									class="form-control" rows="20" />
								<form:errors path="message" cssClass="text-danger"/>
							</div>
							<div class="form-group col-md-12">
								<button type="submit" class="btn btn-secondary">Pošaljite poruku</button>
							</div>
						</div>
					</form:form>
				</div>
			</main>
			<aside class="col-lg-4">
				<!-- Widget [Contact Widget]-->
				<div class="widget categories">
					<header>
						<h3 class="h6">Kontakt</h3>
						<div class="item d-flex justify-content-between">
							<span>15317, Donja Borina</span> <span><i
								class="fa fa-map-marker"></i></span>
						</div>
						<div class="item d-flex justify-content-between">
							<span>(015) 123 456 789</span> <span><i
								class="fa fa-phone"></i></span>
						</div>
						<div class="item d-flex justify-content-between">
							<span>info@company.com</span> <span><i
								class="fa fa-envelope"></i></span>
						</div>
					</header>

				</div>
				<div class="widget latest-posts">
					<header>
						<h3 class="h6">Latest Posts</h3>
					</header>
					<c:forEach var="lastPost" items="${lastThreePost }">
						<div class="blog-posts">
							<a
								href="blog-post-page?id=${lastPost.id}&title=${lastPost.title}">
								<div class="item d-flex align-items-center">
									<div class="image">
										<img src="${pageContext.request.contextPath}${lastPost.image }" alt="..." class="img-fluid">
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
		</div>
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
		src="${pageContext.request.contextPath }/vendor/popper.js/umd/popper.min.js"> </script>
	<script
		src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/vendor/jquery.cookie/jquery.cookie.js"> </script>
	<script
		src="${pageContext.request.contextPath }/vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/front.js"></script>
</body>
</html>