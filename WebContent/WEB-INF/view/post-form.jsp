<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
<%@ include file="header.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>


<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
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
							<h1>Post Form</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">Post Form</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<form:form role="form" action="post-save" modelAttribute="post"
									enctype="multipart/form-data" method="POST">
									<form:hidden path="id" />
									<div class="card-body">
										<div class="row">
											<div class="col-lg-8">
												<div class="form-group">
													<label>Title</label>
													<form:input path="title" type="text" class="form-control"
														placeholder="Enter title" />
													<form:errors path="title" cssClass="text-danger" />
												</div>
												<hr class="line">
												<div class="form-group">
													<c:if test="${not empty post.image}">
														<label for="existingPhoto">Current post image</label>
														<br>
														<img src="${pageContext.request.contextPath}${post.image}"
															alt="Current Photo" class="existing-photo">
														<br>
													</c:if>
													<div class="newImage">
														<label for="image">Choose new photo</label> <input
															path="image" name="file" type="file" class="form-control"
															id="image" onchange="readURL(this);" /> <img
															id="imagePreview" src="#" alt="Preview"
															class="existing-photo" style="display: none;">

													</div>
												</div>
												<hr class="line">
												<div class="form-group">
													<label>Header</label>
													<form:textarea path="header" class="form-control"></form:textarea>
													<form:errors path="header" cssClass="text-danger"></form:errors>
												</div>

												<div class="form-group">
													<label>Text</label>
													<form:textarea id="text" path="text" class="form-control"></form:textarea>
													<form:errors path="text" cssClass="text-danger" />
												</div>

												<div class="form-group">
													<div class="form-group">
														<label>Category</label>
														<form:select id="categoryDropdown" path="category.id"
															class="form-control" items="${categoryList}"
															itemLabel="name" itemValue="id">
															<!-- Add a default option if needed -->
															<form:option value="" label="-- Select Category --" />
														</form:select>
													</div>

													<div class="form-group">
														<label>Subcategory</label> <select
															id="subcategoryDropdown" name="subcategory.id"
															class="form-control">
															<!-- Subcategory options will be dynamically loaded here -->
															<c:forEach var="subcategory" items="${subcategories}">
																<option value="${subcategory.id}"
																	<c:if test="${subcategory.id eq selectedSubcategoryId}">selected</c:if>>${subcategory.name}</option>
															</c:forEach>
														</select>
														<c:if test="${not empty subcategoryError}">
															<div class="text-danger">${subcategoryError}</div>
														</c:if>
													</div>

													<div class="form-group">
														<label>Tags</label>
														<div class="tag-container"
															style="height: 100px; overflow-y: auto;">
															<c:forEach var="tag" items="${tagList}">
																<div class="checkbox">
																	<label> <input type="checkbox" name="tags"
																		value="${tag.id}"
																		<c:if test="${selectedTags.contains(tag.id)}">checked</c:if> />
																		${tag.name}
																	</label>

																</div>
															</c:forEach>
														</div>
														<c:if test="${not empty tagWarning}">
															<div class="text-danger">${tagWarning}</div>
														</c:if>
													</div>
													<button type="button" class="btn btn-success"
														id="addNewTagBtn">Add New Tag</button>
													
													<div class="modal fade" id="addNewTagModal" tabindex="-1"
														role="dialog" aria-labelledby="addNewTagModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="addNewTagModalLabel">Add
																		New Tag</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form id="newTagForm">
																		<div class="form-group">
																			<label for="newTagName">Tag Name:</label> <input
																				type="text" class="form-control" id="newTagName"
																				name="newTagName">
																		</div>
            															<div id="tagExistsWarning" class="text-danger">${tagExistsWarning}</div>
																		<button type="button" class="btn btn-primary"
																			onclick="addNewTag()">Save</button>
																	</form>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- /.card-body -->

										<div class="card-footer">
											<button type="submit" class="btn btn-primary">Save</button>
											<a href="<c:url value='/administration/post-list'/>"
												class="btn btn-secondary">Back</a>
										</div>
									</div>
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

	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath }/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath }/dist/js/adminlte.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/markitup/jquery.markitup.js"></script>

	<script>
    // dobavljanje podkategorija u formu
    $(document).ready(function() {
        // ucitaj podkategorije kad udje na stranicu
        loadSubcategories();

        // svaki put kad se promeni kategorija, ucitaj podkategorije
        $("#categoryDropdown").change(function() {
            loadSubcategories();
        });

        function loadSubcategories() {
            var categoryId = $("#categoryDropdown").val();
            
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/administration/getSubcategories", //pogodi metodu iz kontrolera
                data: { categoryId: categoryId },
                success: function(response) {
                    console.log("Ajax success:", response);

                    var subcategoryDropdown = $("#subcategoryDropdown");
                    subcategoryDropdown.empty(); // prazno

                    subcategoryDropdown.append('<option value="" selected>-- Select Subcategory --</option>');

                    // lista podkategorija
                    $.each(response, function(index, subcategory) {
                    	var option = $('<option value="' + subcategory.id + '">' + subcategory.name + '</option>');
                        subcategoryDropdown.append(option);

                        // selektuj ako se poklapa
                        if (subcategory.id == ${selectedSubcategoryId}) {
                            option.prop('selected', true);
                        }
                    });
                },
                error: function(xhr, status, error) {
                    console.error("Ajax error:", xhr.responseText);
                    console.error("Status:", status);
                    console.error("Error:", error);
                }
            });
        }
    });
    
    //============================= SUMMERNOTE EDITOR ======================================
    $(document).ready(function() {
        $('#text').summernote({
            disableResizeImage: false,
            height: 400,
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'italic', 'underline', 'clear']],
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['insert', ['link', 'picture', 'video', 'table', 'hr']],
                ['view', ['fullscreen', 'codeview']],
                ['help', ['help']],
                ['undo', ['undo']],
                ['redo', ['redo']]
            ],
            lineHeight: '3pt',
            callbacks: {
                onInit: function() {
                    $('#text').summernote('fontName', 'Arial'); //default font-family
                    $('#text').summernote('fontSize', '18'); // default font-size
                },
                onImageUpload: function(files) {
                    uploadImage(files[0]);
                }
            }
        });
    });

    //metoda vezana za sliku koja se ubacuje u sam tekst-editor
    function uploadImage(file) {
        var reader = new FileReader();
        
        reader.onload = function(e) {

        	var img = document.createElement('img');
            img.src = e.target.result;

            img.style.width = '90%';
            img.style.border = '1 px solid black';

            $('#text').summernote('insertNode', img);
        };

        reader.readAsDataURL(file);
    }
    
    //prikaz slike na formi kad se ucita
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                $('#imagePreview').attr('src', e.target.result).show();
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
    
    //===================================================================================
    
    /* AJAX za dodavanje taga prilikom kreiranja posta */
    $(document).ready(function() {

        $("#addNewTagBtn").click(function() {
            $("#addNewTagModal").modal("show");
        });

        window.addNewTag = function() {
            var newTagName = $("#newTagName").val();

            if (newTagName.trim() !== "") {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/administration/create-tag", //pogodi metodu iz kontrolera
                    data: { tagName: newTagName },
                    success: function(response) {
                        if (response.error) {
                            
                            $("#tagExistsWarning").text(response);
                        } else {
                            
                            var newTagCheckbox = $("<div class='checkbox'><label><input type='checkbox' name='tags' value='" + response.tagId + "' checked />" + newTagName + "</label></div>");

                            if ($(".tag-container input[name='tags'][value='" + newTagName + "']").length === 0) {
                                $(".tag-container").append(newTagCheckbox);
                                $("#addNewTagModal").modal("hide");
                                $("#newTagName").val("");
                                $("#tagExistsWarning").text("");
                            }
                        }
                    },


                    error: function(xhr, status, error) {
                    	if(xhr.status == 409){
                            $("#tagExistsWarning").text("Tag with the same name already exists!");
                    	}
                        //console.error("Ajax error:", xhr.responseText);
                        //$("#tagExistsWarning").text(xhr.responseText);
                        //console.error("Status:", status);
                        //console.error("Error:", error);
                    }
                });
            }
        };
    });
    
</script>



</body>
</html>
