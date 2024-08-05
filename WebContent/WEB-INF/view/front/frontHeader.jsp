<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="header">
	<!-- Main Navbar-->
	<nav class="navbar navbar-expand-lg">
		<div class="search-area">
			<div
				class="search-area-inner d-flex align-items-center justify-content-center">
				<div class="close-btn">
					<i class="icon-close"></i>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col-md-8">
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
				</div>
			</div>
		</div>
		<div class="container">
			<!-- Navbar Brand -->
			<div
				class="navbar-header d-flex align-items-center justify-content-between">
				<!-- Navbar Brand -->
				<a href="index-page" class="navbar-brand"><img src="${pageContext.request.contextPath }/img/favicon.ico" alt="Blog"></a>
				<!-- Toggle Button-->
				<button type="button" data-toggle="collapse"
					data-target="#navbarcollapse" aria-controls="navbarcollapse"
					aria-expanded="false" aria-label="Toggle navigation"
					class="navbar-toggler">
					<span></span><span></span><span></span>
				</button>
			</div>
			<!-- Navbar Menu -->
			<div id="navbarcollapse" class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="index-page" class="nav-link">Početna</a>
					</li>
					<li class="nav-item"><a href="blog-page"
						class="nav-link active">Vesti</a></li>
					<li class="nav-item"><a href="contact-page" class="nav-link">Kontakt</a>
					</li>
				</ul>
				<div class="navbar-text">
					<a href="#" class="search-btn"><i class="icon-search-1"></i></a>
				</div>
			</div>
		</div>
	</nav>
</header>
