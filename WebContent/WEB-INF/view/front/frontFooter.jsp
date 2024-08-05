<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="logo">
				<h6 class="text-white">Blog</h6>
			</div>
			<div class="contact-details">
				<p>15317, Donja Borina</p>
				<p>Phone: (015) 123 456 789</p>
				<p>
					Email: <a href="mailto:info@company.com">Info@Company.com</a>
				</p>
				<ul class="social-menu">
					<li class="list-inline-item"><a href="#"><i
							class="fa fa-facebook"></i></a></li>
					<li class="list-inline-item"><a href="#"><i
							class="fa fa-twitter"></i></a></li>
					<li class="list-inline-item"><a href="#"><i
							class="fa fa-instagram"></i></a></li>
					<li class="list-inline-item"><a href="#"><i
							class="fa fa-behance"></i></a></li>
					<li class="list-inline-item"><a href="#"><i
							class="fa fa-pinterest"></i></a></li>
				</ul>
			</div>
		</div>
		<div class="col-md-4">
			<div class="menus d-flex">
				<ul class="list-unstyled">
					<li><a href="index-page">Početna</a></li>
					<li><a href="blog-page">Blog</a></li>
					<li><a href="contact-page">Kontakt</a></li>
				</ul>
				<ul class="list-unstyled">
					<c:forEach var="category" items="${priorityCategories.subList(0,4) }">
						<li><a
							href="blog-category-page?id=${category.id }&name=${category.name}">${category.name }
						</a></li>

					</c:forEach>
				</ul>
				<ul class="list-unstyled">
					<c:forEach var="category" items="${priorityCategories.subList(4, priorityCategories.size())}">
						<li><a
							href="blog-category-page?id=${category.id}&name=${category.name}">
								${category.name} </a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<div class="col-md-4">
			<c:forEach var="lastPost" items="${lastThreePost }">
				<div class="latest-posts">
					<a href="blog-post-page?id=${lastPost.id }&title=${lastPost.title}">

						<div class="post d-flex align-items-center">
							<div class="image">
								<img src="${pageContext.request.contextPath}${lastPost.image }"
									alt="..." class="last-three-post-img">
							</div>
							<div class="title">
								<strong>${lastPost.title }</strong><span class="date last-meta">${lastPost.date }</span>
							</div>
						</div>

					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<div class="copyrights">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<p>&copy; 2024. All rights reserved.</p>
			</div>
		</div>
	</div>
</div>