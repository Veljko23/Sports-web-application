<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
			href="#" role="button"><i class="fas fa-bars"></i></a></li>
	</ul>


	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
	<li class="nav-item dropdown" title="Go to site"><a class="nav-link"
			href="${pageContext.request.contextPath }/"> <i class="fa fa-arrow-up"></i> <span
				class="badge badge-danger navbar-badge"></span>
		</a></li>
		<li class="nav-item dropdown" title="Messages"><a class="nav-link"
			href="message-list"> <i class="far fa-envelope"></i> <span
				class="badge badge-danger navbar-badge">${messageCount }</span>
		</a></li>
		<!-- Messages Dropdown Menu -->
		<li class="nav-item dropdown" title="Profile"><a class="nav-link"
			data-toggle="dropdown" href="#"> <i class="far fa-user"></i>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<a href="author-edit-profile" class="dropdown-item"> <!-- Message Start -->
					<div class="media align-items-center">
						<img src="${pageContext.request.contextPath}${currentAuthor}"
							alt="User Avatar"
							class="img-circle img-thumbnail rounded-circle centered-alt-text"
							style="width: 160px; height: 140px;">

						<div class="media-body" style="margin-left: 20px">
							<h3 class="dropdown-item-title">
								<sec:authentication property="principal.username" />
							</h3>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="author-change-password" class="dropdown-item"> <i
					class="fas fa-user"></i> Change password
				</a>
				<div class="dropdown-divider"></div>
				<a href="login.html" class="dropdown-item"> <form:form
						action="${pageContext.request.contextPath }/logout">
						<input type="submit" value="Sign out">
					</form:form>

				</a>
			</div></li>
	</ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Product Logo -->
	<a href="post-list" class="brand-link"> <img
		src="${pageContext.request.contextPath }/img/favicon.ico"
		alt="" class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">Blog</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon far fa-plus-square"></i>
						<p>
							Posts <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="post-list" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Posts list</p>
						</a></li>
						<li class="nav-item"><a href="post-form" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Add Post</p>
						</a></li>
					</ul></li>
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon far fa-plus-square"></i>
						<p>
							Categories <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="category-list" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Categories list</p>
						</a></li>
						<li class="nav-item"><a href="category-form" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Add Category</p>
						</a></li>
					</ul>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="subcategory-list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>SubCategories list</p>
						</a></li>
						<li class="nav-item"><a href="subcategory-form"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Add SubCategory</p>
						</a></li>
					</ul></li>
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon far fa-plus-square"></i>
						<p>
							Tags <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="tag-list" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Tags list</p>
						</a></li>
						<li class="nav-item"><a href="tag-form" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Add Tag</p>
						</a></li>
					</ul></li>
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon far fa-plus-square"></i>
						<p>
							Contacts <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="message-list" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Messages List</p>
						</a></li>
					</ul></li>
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon far fa-plus-square"></i>
						<p>
							Authors <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="author-list" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Author list</p>
						</a></li>
						<sec:authorize access="hasRole('admin')">
							<li class="nav-item"><a href="author-form" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>Add Author</p>
							</a></li>
						</sec:authorize>
					</ul></li>
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon far fa-plus-square"></i>
						<p>
							Comments <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="comment-list" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Comment list</p>
						</a></li>
					</ul></li>
				<li class="nav-item has-treeview"><a href="#" class="nav-link">
						<i class="nav-icon far fa-plus-square"></i>
						<p>
							Slides <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="slider-list" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Slides list</p>
						</a></li>
						<li class="nav-item"><a href="slider-form" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Add Slide</p>
						</a></li>
					</ul></li>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>