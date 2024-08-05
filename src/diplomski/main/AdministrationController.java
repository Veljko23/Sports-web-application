package diplomski.main;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import diplomski.main.dao.AuthorDAO;
import diplomski.main.dao.CategoryDAO;
import diplomski.main.dao.CommentDAO;
import diplomski.main.dao.ContactDAO;
import diplomski.main.dao.PostDAO;
import diplomski.main.dao.SliderDAO;
import diplomski.main.dao.SubCategoryDAO;
import diplomski.main.dao.TagDAO;
import diplomski.main.entity.Author;
import diplomski.main.entity.Category;
import diplomski.main.entity.ChangePassword;
import diplomski.main.entity.Comment;
import diplomski.main.entity.Contact;
import diplomski.main.entity.Post;
import diplomski.main.entity.Role;
import diplomski.main.entity.Slider;
import diplomski.main.entity.Subcategory;
import diplomski.main.entity.Tag;

@Controller
@RequestMapping("/administration")
public class AdministrationController {
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	SubCategoryDAO subCategoryDAO;
	
	@Autowired
	ContactDAO contactDAO;
	
	@Autowired
	AuthorDAO authorDAO;
	
	@Autowired
	TagDAO tagDAO;
	
	@Autowired
	CommentDAO commentDAO;
	
	@Autowired
	PostDAO postDAO;
	
	@Autowired
	SliderDAO sliderDAO;
	
	//======================== CATEGORY ============================

	@RequestMapping({"/category-list", ""})
	public String getCategoryListPage(Model model) {
		
		List<Category> list = categoryDAO.getCategoryList();
		
		model.addAttribute("categoryList", list);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

		
		return "category-list";
	}
	
	@RequestMapping("/category-form")
	public String getCategoryForm(Model model) {
		
		Category category = new Category();
		category.setCounter(0);
		model.addAttribute("category", category);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

		return "category-form";
	}
	
	@RequestMapping("/category-form-update")
	public String getCategoryUpdateForm(@RequestParam int id ,Model model) {
	
		Category category = categoryDAO.getCategory(id);
		
		model.addAttribute("category", category);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

		return "category-form";
	}
	
	@RequestMapping("/category-save")
	public String getSaveCategory(@Valid @ModelAttribute Category category, BindingResult result, Model model, @RequestParam ("file") MultipartFile file) throws IOException {
		System.out.println("ulaz u metodu");
		//String imageName = uploadFile(file);
		System.out.println("Ulaz u metodu!");
		if(result.hasErrors()) {
			System.out.println("Ima greska!");
			return "category-form";
		}
    	Category existingCategory = categoryDAO.getCategory(category.getId());

		List<Category> existsCategory = categoryDAO.getCategoryList();
		for(Category cat: existsCategory) {
			if (cat.getId() == (category.getId())) {
	            continue;
	        }
			if(cat.getName().equals(category.getName())) {
				model.addAttribute("categoryExistsError", "Category with the same name already exists");
	            return "category-form";
			}
		}
		
		if (!file.isEmpty()) {
		    // Aplosutna putanja WebContent foldera
		    String webContentPath = request.getServletContext().getRealPath("/");

		    // Postavi image za folder u koji ce se postavljati slike
		    String uploadDir = Paths.get(webContentPath, "image").toString();

		    String fileName = file.getOriginalFilename();
		    String filePath = Paths.get(uploadDir, fileName).toString();

		    System.out.println("File Path: " + filePath);

		    File imageFolder = new File(uploadDir);
		    if (!imageFolder.exists()) {
		        imageFolder.mkdirs();
		    }

		    try {
		        file.transferTo(new File(filePath));
		        System.out.println("File transferred successfully.");
		    } catch (IOException e) {
		        System.out.println("Error transferring file: " + e.getMessage());
		    }

		    // relativna putanja slike
		    
		    category.setImage("/image/" + fileName);
		}else if(existingCategory != null){
	        category.setImage(existingCategory.getImage());
	    }else {
	    	category.setImage("/image/no-image.jpg");
	    }
		
		
		categoryDAO.saveCategory(category);
		return "redirect:/administration/category-list";
	}
	
	@RequestMapping("/category-form-delete")
	public String getDeleteCategory(@RequestParam int id, Model model) {
		
		categoryDAO.deleteCategory(id);
		return "redirect:/administration/category-list";
	}
	
	//======================== SUBCATEGORY =================================
	
	@RequestMapping("/subcategory-list")
	public String getSubCategoryListPage(Model model) {
		
		List<Subcategory> list = subCategoryDAO.getSubCategoryList();
		
		model.addAttribute("subcategoryList", list);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

		return "subcategory-list";
	}
	
	@RequestMapping("/subcategory-form")
	public String getSubCategoryForm(Model model) {
		
		Subcategory subCategory = new Subcategory();
		model.addAttribute("subcategory", subCategory);
		model.addAttribute("categories", categoryDAO.getCategoryList());
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		return "subcategory-form";
	}
	
	@RequestMapping("/subcategory-form-update")
	public String getSubCategoryUpdateForm(@RequestParam int id ,Model model) {
	
		Subcategory subCategory = subCategoryDAO.getSubCategory(id);
		
		model.addAttribute("subcategory", subCategory);
		model.addAttribute("categories", categoryDAO.getCategoryList());
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

		return "subcategory-form";
	}
	
	@RequestMapping("/subcategory-save")
	public String getSaveSubCategory(@Valid @ModelAttribute Subcategory subcategory, BindingResult result, Model model){
		if(result.hasErrors()) {
			List<Category> categories = categoryDAO.getCategoryList();
	        model.addAttribute("categories", categories);
			return "subcategory-form";
		}
	    //Subcategory existingSubcategory = subCategoryDAO.getSubCategory(subcategory.getId());
		
			List<Subcategory> existsSubCategory = subCategoryDAO.getSubCategoryList();
			for (Subcategory cat : existsSubCategory) {
				if(cat.getId() == subcategory.getId()) {
					continue;
				}
				if (cat.getName().equals(subcategory.getName())) {
					model.addAttribute("subCategoryErrorMessage", "Subcategory with the same name already exists!");
					model.addAttribute("categories", categoryDAO.getCategoryList());
					return "subcategory-form";
				}
			}
		
		Category category = categoryDAO.getCategory(subcategory.getCategory().getId());
		subcategory.setCategory(category);
		
		subCategoryDAO.saveSubCategory(subcategory);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		return "redirect:/administration/subcategory-list";
	}
	
	@RequestMapping("/subcategory-form-delete")
	public String getDeleteSubCategory(@RequestParam int id, Model model) {
		
		subCategoryDAO.deleteSubCategory(id);
		return "redirect:/administration/subcategory-list";
	}
	
	//======================== MESSAGE =================================
	
	@RequestMapping("/message-list")
	public String getMessageList(Model model) {
		
		List<Contact> list = contactDAO.getListContact();
		
		model.addAttribute("messageList", list);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
		return "message-list";
	}
	
	@RequestMapping("/message-seen")
	public String getMarkMessageSeen(@RequestParam int id) {
		
		contactDAO.makeMessageSeen(id);
		
		
		return "redirect:/administration/message-list";
	}
	
	@RequestMapping("/form-message-delete")
	public String deleteMessage(@RequestParam int id) {
		
		contactDAO.deleteContact(id);
		
		return "redirect:/administration/message-list";
	}
	
	//======================== TAG ===================================
	
	
	@RequestMapping("/tag-list")
	public String getTagList(Model model) {
		
		List<Tag> list = tagDAO.getTagList();
		
		model.addAttribute("tagList", list);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
		return "tag-list";
	}
	
	@RequestMapping("/tag-form")
	public String getTagForm(Model model) {
		
		Tag tag = new Tag();
		
		model.addAttribute("tag", tag);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
		return "tag-form";
	}
	
	
	@RequestMapping("/form-tag-update")
	public String getTagUpdateForm(@RequestParam int id, Model model) {
		
		Tag tag = tagDAO.getTag(id);
		
		model.addAttribute("tag", tag);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
		return "tag-form";
	}
	
	@RequestMapping("/save-tag")
	public String saveTag(@Valid @ModelAttribute Tag tag, BindingResult result, Model model) {
		
		if(result.hasErrors())
			return "tag-form";
		
		List<Tag> tags = tagDAO.getTagList();
		for(Tag t: tags) {
			if(t.getName().equals(tag.getName())) {
				model.addAttribute("tagExistsError", "Tag with same name already exists!");
				return "tag-form";
			}
		}
		
		tagDAO.saveTag(tag);
		
		return "redirect:/administration/tag-list";
	}
	
	@RequestMapping("/form-tag-delete")
	public String getDeleteTag(@RequestParam int id) {
		
		tagDAO.deleteTag(id);
		
		return "redirect:/administration/tag-list";
	}
	
	//dodavanje taga prilikom kreiranja posta
	@RequestMapping("/create-tag")
	public ResponseEntity<Object> createTag(@RequestParam String tagName) {
	    List<Tag> existingTags = tagDAO.getTagList();
	    for (Tag existingTag : existingTags) {
	        if (existingTag.getName().equals(tagName)) {
	            return ResponseEntity.status(HttpStatus.CONFLICT).body("Tag with the same name already exists!");
	        }
	    }

	    Tag newTag = new Tag();
	    newTag.setName(tagName);
	    tagDAO.saveTag(newTag);

	    return ResponseEntity.ok(newTag.getId());
	}

	
	//========================= AUTHOR ==================================
	
	@RequestMapping("/author-list")
	public String getAuthorList(Model model) {
		
		List<Author> list = authorDAO.getListAuthor();
		
		model.addAttribute("authorList", list);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
		return "author-list";
	}
	
	@RequestMapping("/author-form")
	@PreAuthorize("hasRole('admin')")
	public String getAuthorForm(Model model, Principal principal) {
		Author loggedAuthor = authorDAO.getAuthorByUsername(principal.getName());
		if(loggedAuthor.getAuthorities().getAuthority().equals("ROLE_employee")) {
			return "forbidden";
		}
		Author author = new Author();
		
		model.addAttribute("author", author);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
		return "author-form";
	}
	
	@RequestMapping("/form-author-enable")
	public String getEnableAuthor(@RequestParam String username) {
		
		authorDAO.enableAuthor(username);
		
		return "redirect:/administration/author-list";
	}
	
	@RequestMapping("/save-author")
	public String saveAuthor(@Valid @ModelAttribute Author author, BindingResult result, Model model, @RequestParam ("file") MultipartFile file) throws IOException {
		
		if(result.hasErrors()) {
			return "author-form";
		}
	    Author existingAuthor = authorDAO.getAuthorByUsername(author.getUsername());
	    
	    List<Author> authors = authorDAO.getListAuthor();
	    for(Author aut: authors) {
	    	if(aut.getUsername() != null) {
	    		continue;
	    	}
	    	if(aut.getUsername().equals(author.getUsername())) {
				model.addAttribute("authorExistsError", "Author with the same username already exists");
				return "author-form";
	    	}
	    }

		List<Role> list = authorDAO.getRoleList();
		//boolean isExistingAuthor = (author.getUsername() != null);
		
		if(existingAuthor != null) {
			// ako postoji setuj njegove vrednosti
	        author.setPassword(existingAuthor.getPassword());
	        author.setAuthorities(existingAuthor.getAuthorities());
	        author.setImage(existingAuthor.getImage());
		}else {
			// nov autor
			String passwordEncoder = new BCryptPasswordEncoder().encode(author.getPassword());
			author.setPassword("{bcrypt}" + passwordEncoder);
			author.setAuthorities(list.get(1));
		}
		
		if (!file.isEmpty()) {
			// Aplosutna putanja WebContent foldera
		    String webContentPath = request.getServletContext().getRealPath("/");

		    // Postavi image za folder u koji ce se postavljati slike
		    String uploadDir = Paths.get(webContentPath, "image").toString();

		    String fileName = file.getOriginalFilename();
		    String filePath = Paths.get(uploadDir, fileName).toString();

		    System.out.println("File Path: " + filePath);

		    File imageFolder = new File(uploadDir);
		    if (!imageFolder.exists()) {
		        imageFolder.mkdirs();
		    }

		    try {
		        file.transferTo(new File(filePath));
		        System.out.println("File transferred successfully.");
		    } catch (IOException e) {
		        System.out.println("Error transferring file: " + e.getMessage());
		    }

		    // relativna putanja
		    author.setImage("/image/" + fileName);
		}else {
	    	if(author.getImage() == null) {
	    		author.setImage("/image/no-image.jpg");
	    	}
	    }
		
		author.setEnabled(true);
		//author.setPassword("{bcrypt}" + passwordEncoder);
				
		authorDAO.saveAuthor(author);
		
		return "redirect:/administration/author-list";
	}
	
	@RequestMapping("/form-author-delete")
	public String getDeleteAuthor(@RequestParam String username) {
		
		List<Post> authorPosts = postDAO.getPostListByAuthor(username);
		
		Author unnamedAuthor = authorDAO.getAuthorByUsername("Anonymous author");
		
		for(Post post: authorPosts) {
			post.setAuthor(unnamedAuthor);
			postDAO.savePost(post);
		}
		
		authorDAO.deleteAuthor(username);
		
		return "redirect:/administration/author-list";
	}
	
	@RequestMapping("/author-edit-profile")
	public String getAuthorEditPage(Principal principal, Model model) {
		
		Author author = authorDAO.getAuthorByUsername(principal.getName());
		author.setPassword(author.getPassword());
		model.addAttribute("author", author);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
		return "author-form-edit";
	}
	
	@RequestMapping("/author-change-password")
	public String getAuthorChangePassword(Principal principal, Model model) {
		
		model.addAttribute("changePassword", new ChangePassword()); 
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
		return "author-change-password";
	}
	
	@RequestMapping("/author-change-password-action")
	public String getAuthorChangePasswordAction(@ModelAttribute ChangePassword changePassword, Principal principal, Model model) {

	  if (changePassword.getNewPassword().equalsIgnoreCase(changePassword.getConfirmPassword())) {
	    Author author = authorDAO.getAuthorByUsername(principal.getName());

	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	    if (encoder.matches(changePassword.getOldPassword(), author.getPassword().replace("{bcrypt}", ""))) {
	      author.setPassword("{bcrypt}" + encoder.encode(changePassword.getNewPassword()));

	      authorDAO.saveAuthor(author);
	      return "redirect:/administration/author-list";
	    } else {
	      // stari password nije unet
	      model.addAttribute("errorMessage", "Incorrect old password.");
	    }
	  } else {
	    // novi passwordi nisu isti
	    model.addAttribute("errorMessage", "New passwords do not match.");
	  }

	  return "author-change-password";
	}

	
	//============================ COMMENT =========================================
	
	
	@RequestMapping("/comment-list")
	public String getCommentList(Model model) {
		
		List<Comment> list = commentDAO.getListComment();
		
		model.addAttribute("commentList", list);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
		return "comment-list";
	}
	
	@RequestMapping("/form-comment-delete")
	public String getDeleteComment(@RequestParam int id) {
		
		commentDAO.deleteComment(id);
		
		return "redirect:/administration/comment-list";
	}
	
	
	@RequestMapping("/form-comment-enable")
	public String getEnableComment(@RequestParam int id) {
		
		commentDAO.enableComment(id);
		
		return "redirect:/administration/comment-list";
	}
	
	
	//============================ POST =========================================
	
	@RequestMapping("/post-list")
	public String getPostList(Model model, Principal principal) {
		
		List<Post> list = postDAO.getListPost();
		Author loggedAuthor = authorDAO.getAuthorByUsername(principal.getName());
		
		model.addAttribute("postList", list);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("loggedAuthor", loggedAuthor);
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
		return "post-list";
	}
	
	@RequestMapping("/post-form")
	public String getPostForm(@RequestParam(name = "categoryId", required = false) Integer categoryId, Model model) {
	    Post post = new Post();

	    List<Author> authorList = authorDAO.getListAuthor();
	    List<Category> categoryList = categoryDAO.getCategoryList();
	    List<Tag> tagList = tagDAO.getTagList();

	    model.addAttribute("authorList", authorList);
	    model.addAttribute("categoryList", categoryList);
	    model.addAttribute("tagList", tagList);

	    model.addAttribute("post", post);

	    if (categoryId != null) {
	        List<Subcategory> subcategories = subCategoryDAO.getSubcategoriesByCategory(categoryId);
	        model.addAttribute("subcategories", subcategories);
	        System.out.println("Podkategorije su: " + subcategories);
	    }
	    model.addAttribute("selectedSubcategoryId", 0); // Null kad se udje prvi put u formu

	    

	    model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
	    model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

	    return "post-form";
	}
	
	@ResponseBody
	@RequestMapping("/getSubcategories")
	public ResponseEntity<List<Map<String, Object>>> getSubcategories(@RequestParam(name = "categoryId") int categoryId) {
	    // Sve podkategorije za kategoriju tog id-a
	    List<Subcategory> subcategories = subCategoryDAO.getSubcategoriesByCategory(categoryId);
	    
	    // Iz liste u mapu
	    List<Map<String, Object>> subcategoryList = new ArrayList<>();

	    for (Subcategory subcategory : subcategories) {
	        Map<String, Object> subcategoryMap = new HashMap<>();
	        subcategoryMap.put("id", subcategory.getId());
	        subcategoryMap.put("name", subcategory.getName());
	        subcategoryList.add(subcategoryMap);
	    }
	    //posalji na server u json formatu
	    HttpHeaders headers = new HttpHeaders();
	    headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");

	    return new ResponseEntity<>(subcategoryList, headers, HttpStatus.OK);
	}
	
	@RequestMapping("/form-post-update")
	public String getUpdatePostForm( @RequestParam int id,  @RequestParam(required = false) Integer categoryId, Model model, Principal principal) {
	    Post post = postDAO.getPost(id);
	    categoryId = post.getCategory().getId();
	    List<Author> authorList = authorDAO.getListAuthor();
	    List<Category> categoryList = categoryDAO.getCategoryList();
	    List<Tag> tagList = tagDAO.getTagList();

	    model.addAttribute("authorList", authorList);
	    model.addAttribute("categoryList", categoryList);
	    model.addAttribute("tagList", tagList);

	    model.addAttribute("post", post);

	    if (post.getCategory() != null) {
	        List<Subcategory> subcategories = subCategoryDAO.getSubcategoriesByCategory(post.getCategory().getId());
	        model.addAttribute("subcategories", subcategories);

	        // Ako nije null, daj selektovanu podkategoriju
	        if (post.getSubcategory() != null) {
	            model.addAttribute("selectedSubcategoryId", post.getSubcategory().getId());
	        } else {
	            // Ili setuj null
	            model.addAttribute("selectedSubcategoryId", 0);
	        }
	        List<Integer> selectedTagIds = new ArrayList<>();
	        for (Tag tag : post.getTags()) {
	            selectedTagIds.add(tag.getId());
	        }

	        model.addAttribute("selectedTags", selectedTagIds);
	    }
	    
	    model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());
	    return "post-form";
	}
	
	@RequestMapping("/form-post-delete")
	public String getDeletePost(@RequestParam int id) {
		
		postDAO.deletePost(id);
		
		return "redirect:/administration/post-list";
	}
	
	
	@RequestMapping("/post-save")
	public String getSavePost(@Valid @ModelAttribute Post post, BindingResult result, Model model, Principal principal, @RequestParam("subcategory.id") Integer subcategoryId, @RequestParam ("file") MultipartFile file) throws IOException {
	    System.out.println("Ulaz u save");
	    if (subcategoryId == null || subcategoryId == 0) {
	        model.addAttribute("subcategoryError", "You must choose a subcategory");
	    }
	    if(result.hasErrors()) {
	        
	        List<Category> categoryList = categoryDAO.getCategoryList();
	        List<Tag> tagList = tagDAO.getTagList();
	        List<Author> authorList = authorDAO.getListAuthor();
	        model.addAttribute("categoryList", categoryList);
	        model.addAttribute("tagList", tagList);
	        model.addAttribute("authorList", authorList);
	        model.addAttribute("selectedSubcategoryId", 0);
	        
	        return "post-form";
	    }
	    System.out.println("prolazi za sad");
	    Author author = authorDAO.getAuthorByUsername(principal.getName());
	    Category newCategory = categoryDAO.getCategory(post.getCategory().getId());
        Post oldPost = postDAO.getPost(post.getId());

	    List<Integer> ids = new ArrayList<Integer>();
	    if(post.getTags() == null)
	    	post.setTags(null);
	    else {
	    for(Tag tag: post.getTags()) {
	        ids.add(Integer.parseInt(tag.getName()));
	    }
	    List<Tag> tags = tagDAO.getTagsById(ids);
	    post.setTags(tags);
	    }

	    SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy. HH:mm");  
	    Date date = new Date();  
	    
//	    if(oldPost != null) {
//	    	post.setAuthor(oldPost.getAuthor());
//	    }else
//	    	post.setAuthor(author);
	    
	    System.out.println("kategorije setovane");

	    // Provera da li je kategorija promenjena, da se odradi update brojaca u bazi
	    if (post.getId() != 0) {
	        Category oldCategory = oldPost.getCategory();
	        System.out.println("Old Category ID: " + oldCategory.getId());
	        System.out.println("New Category ID: " + newCategory.getId());
	        if (oldCategory.getId() != newCategory.getId()) {
	            
	        	
	            oldCategory.setCounter(oldCategory.getCounter() - 1);
	            categoryDAO.saveCategory(oldCategory);
	            
	            
	            newCategory.setCounter(newCategory.getCounter() + 1);
	            categoryDAO.saveCategory(newCategory);
	        }
	    }
	    
	    if (!file.isEmpty()) {
		    // Aplosutna putanja WebContent foldera
		    String webContentPath = request.getServletContext().getRealPath("/");

		    // Postavi image za folder u koji ce se postavljati slike
		    String uploadDir = Paths.get(webContentPath, "image").toString();

		    String fileName = file.getOriginalFilename();
		    String filePath = Paths.get(uploadDir, fileName).toString();

		    System.out.println("File Path: " + filePath);

		    File imageFolder = new File(uploadDir);
		    if (!imageFolder.exists()) {
		        imageFolder.mkdirs();
		    }

		    try {
		        file.transferTo(new File(filePath));
		        System.out.println("File transferred successfully.");
		    } catch (IOException e) {
		        System.out.println("Error transferring file: " + e.getMessage());
		    }

		    // relativna putanja slike
		    
		    post.setImage("/image/" + fileName);
		}else if(oldPost != null) {
			post.setImage(oldPost.getImage());
		}
	    else {
			post.setImage("/image/no-image.jpg");
	    }
	    

	    post.setCategory(newCategory);
	    post.setSubcategory(subCategoryDAO.getSubCategory(subcategoryId));
	    //post.setTags(tags);
	    if(oldPost != null) {
	    	post.setAuthor(oldPost.getAuthor());
	    	post.setIsEnabled(oldPost.getIsEnabled());
	    	post.setIsImportant(oldPost.getIsImportant());
		    post.setNumViews(oldPost.getNumViews());
		    post.setDate(oldPost.getDate());
	    } else {
	    	post.setAuthor(author);
	    	post.setIsEnabled(false);
	    	post.setIsImportant(false);
	    	post.setNumViews(post.getNumViews());
	    	post.setDate(formatter.format(date));
	    }

	    postDAO.savePost(post);

	    return "redirect: post-list";
	}

	@RequestMapping("/myPosts")
	public String showMyPosts(Model model, Principal principal) {
		
		Author loggedAuthor = authorDAO.getAuthorByUsername(principal.getName());
		
		model.addAttribute("loggedAuthor", loggedAuthor);
		
		List<Post> postList = postDAO.getPostListByAuthor(principal.getName());
		
		model.addAttribute("postList", postList);
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

		return "my-posts";
	}
	
	@RequestMapping("/form-post-enable")
	public String getEnablePost(@RequestParam int id) {
		
		postDAO.enablePost(id);
		
		return "redirect:/administration/post-list";
	}
	
	@RequestMapping("/form-post-important")
	public String getMakeImportantPost(@RequestParam int id) {
		
		postDAO.makeImportantPost(id);
		
		return "redirect:/administration/post-list";
	}
	
	@RequestMapping("/post-order") //sortiranje svih objava
	public String getPostOrderList(@RequestParam int orderBy, Model model, Principal principal) {
		
		Author loggedAuthor = authorDAO.getAuthorByUsername(principal.getName());
		
		model.addAttribute("loggedAuthor", loggedAuthor);
		
		System.out.println("sortirano");
		model.addAttribute("postList", postDAO.getPostsList(orderBy));
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

		
		return "post-list";
	}
	
	
	@RequestMapping("/post-order-author") //sortiranje objava odredjenog autora
	public String getPostByAuthorOrderList(@RequestParam int orderBy, Model model, Principal principal) {
		
		Author loggedAuthor = authorDAO.getAuthorByUsername(principal.getName());
		
		model.addAttribute("loggedAuthor", loggedAuthor);
		
		System.out.println("sortirano");
		model.addAttribute("postList", postDAO.getPostByAuthorOrderList(orderBy, principal.getName()));
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());


		return "my-posts";
	}
	
	@RequestMapping("/post-search")
	public String searchPost(@RequestParam String search, Model model, Principal principal) {
		
		Author loggedAuthor = authorDAO.getAuthorByUsername(principal.getName());
		
		model.addAttribute("loggedAuthor", loggedAuthor);
		
		model.addAttribute("search", search);
		
		model.addAttribute("postList", postDAO.getSearchPost(search));
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

		
		
		return "post-search";
	}
	
	//========================= SLIDER ============================================
	
	@RequestMapping("/slider-list")
	public String getSliderList(Model model) {
		
		List<Slider> list = sliderDAO.getSliderList();
		
		model.addAttribute("sliderList", list);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

		return "slider-list";
	}
	
	@RequestMapping("/slider-form")
	public String getSliderForm(Model model) {
		
		Slider slider = new Slider();

		model.addAttribute("slider", slider);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		model.addAttribute("currentAuthor", authorDAO.getAuthorImage());

		return "slider-form";
	}
	
	@RequestMapping("/slider-form-update")
	public String getUpdateSLiderForm(@RequestParam int id, Model model) {
		
		Slider slider = sliderDAO.getSlider(id);
		
		model.addAttribute("slider", slider);
		model.addAttribute("messageCount", contactDAO.getUnreadMessageCount());
		
		return "slider-form";
	}
	
	@RequestMapping("/save-slider")
	public String saveSlider(@Valid @ModelAttribute Slider slider, BindingResult result, Model model, @RequestParam ("file") MultipartFile file) {
	
		if(result.hasErrors()) {
			System.out.println("Ima greska u slajderu!");
			return "slider-form";
		}
		
		if (!file.isEmpty()) {
		    String webContentPath = request.getServletContext().getRealPath("/");

		    String uploadDir = Paths.get(webContentPath, "image").toString();

		    String fileName = file.getOriginalFilename();
		    String filePath = Paths.get(uploadDir, fileName).toString();

		    System.out.println("File Path: " + filePath);

		    File imageFolder = new File(uploadDir);
		    if (!imageFolder.exists()) {
		        imageFolder.mkdirs();
		    }

		    try {
		        file.transferTo(new File(filePath));
		        System.out.println("File transferred successfully.");
		    } catch (IOException e) {
		        System.out.println("Error transferring file: " + e.getMessage());
		    }

		    slider.setImage("/image/" + fileName);
		}else {
	    	Slider existingCategory = sliderDAO.getSlider(slider.getId());
	        slider.setImage(existingCategory.getImage());
	    }
		
		if(slider.getLink().contains("http://") || slider.getLink().contains("https://")) {
			slider.setLink("" + slider.getLink());
		}
		else {
			slider.setLink("http://" + slider.getLink());
		}
		
		
		
		slider.setIsEnabled(true);
		sliderDAO.saveSlider(slider);
		
		return "redirect:/administration/slider-list";
	}
	
	@RequestMapping("/slider-form-delete")
	public String deleteSlider(@RequestParam int id) {
		
		sliderDAO.deleteSlider(id);
		
		return "redirect:/administration/slider-list";
	}
	
	
	@RequestMapping("slider-form-enable")
	public String getEnableSlider(@RequestParam int id) {
		
		sliderDAO.setSliderEnabled(id);
		
		return "redirect:/administration/slider-list";
	}
	
	
}
