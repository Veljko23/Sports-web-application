package diplomski.main;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import diplomski.main.dao.AuthorDAO;
import diplomski.main.dao.CategoryDAO;
import diplomski.main.dao.CommentDAO;
import diplomski.main.dao.ContactDAO;
import diplomski.main.dao.PostDAO;
import diplomski.main.dao.ReplyDAO;
import diplomski.main.dao.SliderDAO;
import diplomski.main.dao.SubCategoryDAO;
import diplomski.main.dao.TagDAO;
import diplomski.main.entity.Comment;
import diplomski.main.entity.Contact;
import diplomski.main.entity.Post;
import diplomski.main.entity.Reply;

@Controller
public class FrontController {

	@Autowired
	ContactDAO contactDAO;
	
	@Autowired
	SliderDAO sliderDAO;
	
	@Autowired
	PostDAO postDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	SubCategoryDAO subCategoryDAO;
	
	@Autowired
	TagDAO tagDAO;
	
	@Autowired
	CommentDAO commentDAO;
	
	@Autowired
	AuthorDAO authorDAO;
	
	@Autowired
	ReplyDAO replyDAO;
	
	@RequestMapping({"/", "/index-page"})
	public String getIndexPage(Model model) {
		
		model.addAttribute("sliderMainPage", sliderDAO.getSlidesForMainPage());
		
		model.addAttribute("lastSixImportantPost", postDAO.getSixImportantPostForMainPage());
		
		model.addAttribute("latestPost", postDAO.getLatestPost());
		model.addAttribute("lastThreePost", postDAO.getLastThreePost());
		model.addAttribute("categoryList", categoryDAO.getCategoryListWithSubcategories());		
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());
		model.addAttribute("mostReadPost", postDAO.getMostReadPosts());
		model.addAttribute("mostCommentedPost", postDAO.getMostCommentedPosts());

		return "front/index-page";
	}
	
	@RequestMapping("/contact-page")
	public String getContactPage(Model model) {
		
		model.addAttribute("contact", new Contact());
		model.addAttribute("lastThreePost", postDAO.getLastThreePost());
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());
		

		return "front/contact-page";
	}
	
	@RequestMapping("/blog-page")
	public String getBlogPage(@RequestParam(defaultValue = "0") int orderBy, @RequestParam(defaultValue = "1") int page, Model model) {
		
		int pageSize = 10; //broj postova po stranici
		int totalPosts = postDAO.getTotalNumberOfPosts(); // broj postova
	    int totalPages = (int) Math.ceil((double) totalPosts / pageSize); //koliko ce stranica biti

		model.addAttribute("postList", postDAO.getPostsListForBlogPage(orderBy, page, pageSize));
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("tagList", tagDAO.getTagListByPost());
		model.addAttribute("lastThreePost", postDAO.getLastThreePost());
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		
		return "front/blog-page";
	}
	
	@RequestMapping("/blog-post-page")
	public String getBlogPostPage(@RequestParam int id,Model model) {
		
		Post post = postDAO.getPostWithTag(id);
		
		
		List<Post> list = postDAO.getPreviousPost(id);
		
//		for(Post p: list) {
//			if(p.getAuthor() == null && p.getCategory() == null && p.getText() == null)
//				list.remove(p);
//		}
		System.out.println(list.toString());
		
		model.addAttribute("post", post);
				
		model.addAttribute("postList", postDAO.getListPost());
		model.addAttribute("prevNext", list);
		
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("tagList", tagDAO.getTagListByPost());
		model.addAttribute("lastThreePost", postDAO.getLastThreePostWithoutCurrent(id));
		model.addAttribute("threeRandomPost", postDAO.getThreeRandomPostsNearbyCurrent(post.getId()));
		model.addAttribute("relatedPosts", postDAO.getRelatedPost(id));
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());

		model.addAttribute("comment", new Comment());
		
		model.addAttribute("commentList", commentDAO.getCommentsForPost(id));
		model.addAttribute("reply", new Reply());
		
		model.addAttribute("commentCount", commentDAO.getCommentsCounter(id));
		post.setNumComments((int) commentDAO.getCommentsCounter(id));
		post.setNumViews(post.getNumViews()+1);
		
		postDAO.savePost(post);
		
		return "front/blog-post-page";
	}
	
	@RequestMapping("/post-comment")
	public String getPostComment(@RequestParam(name = "idPost") int id, @ModelAttribute Comment comment, Model model) {
		
		Post post = postDAO.getPostWithTag(id);
		
		comment.setPost(post);
		model.addAttribute("id", id);
		model.addAttribute("post", post);
		model.addAttribute("id", post.getId());
		model.addAttribute("title", post.getTitle());
		SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy. HH:mm");  
	    Date date = new Date();  
	    comment.setDate(formatter.format(date));
	    comment.setIsEnabled(true);
	    postDAO.savePost(post);
		commentDAO.saveComment(comment);
		return "redirect:blog-post-page?id={id}&title={title}#post-comments";
	}
	
	@RequestMapping("/comment-reply")
	public String getReplyComment(@RequestParam(name = "idComm") int commentId, @ModelAttribute Reply reply, Model model) {

	    Comment comment = commentDAO.getComment(commentId);

	    if (comment != null) {
	    	
	        Post post = comment.getPost();

	        reply.setComment(comment);
	        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy. HH:mm");  
		    Date date = new Date();  
		    reply.setDate(formatter.format(date));
		    post.setNumComments(post.getNumComments()+1);
	        
	        model.addAttribute("id", post.getId());
	        model.addAttribute("title", post.getTitle());

	        commentDAO.saveComment(comment);
	        replyDAO.saveReply(reply);
	    }

	    return "redirect:blog-post-page?id={id}&title={title}#post-comments";
	}

	@RequestMapping("/message-save")
	public String getSaveMessage(@Valid @ModelAttribute Contact contact, BindingResult results, Model model) {
		
		if(results.hasErrors()) {
			model.addAttribute("lastThreePost", postDAO.getLastThreePost());
			model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());
			
			return "front/contact-page";
		}
		contact.setIsSeen(false);
		contactDAO.saveContact(contact);
		model.addAttribute("lastThreePost", postDAO.getLastThreePost());
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());
		
		return "redirect:index-page";
	}
	
	//==================================================================
	
	@RequestMapping("/blog-category-page")
	public String getBlogCategoryP(@RequestParam int id, Model model) {
		
		model.addAttribute("postList", postDAO.getPostListByCategory(id));
		model.addAttribute("category", categoryDAO.getCategoryById(id));
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("tagList", tagDAO.getTagListByPost());
		model.addAttribute("lastThreePost", postDAO.getLastThreePost());
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());

		return "front/blog-category-page";
	}
	
	@RequestMapping("/blog-subcategory-page")
	public String getBlogSubCategoryP(@RequestParam int id, Model model) {
		
		model.addAttribute("postList", postDAO.getPostListBySubCategory(id));
		model.addAttribute("category", categoryDAO.getCategoryById(id));
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("subcategory", subCategoryDAO.getSubcategoryById(id));
		model.addAttribute("tagList", tagDAO.getTagListByPost());
		model.addAttribute("lastThreePost", postDAO.getLastThreePost());
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());

		return "front/blog-subcategory-page";
	}
	
	@RequestMapping("/blog-tag-page")
	public String getBlogTagP(@RequestParam int id, Model model) {
		
		model.addAttribute("postList", postDAO.getPostListByTag(id));
		model.addAttribute("category", categoryDAO.getCategoryById(id));
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("tag", tagDAO.getTagById(id));
		model.addAttribute("tagList", tagDAO.getTagListByPost());
		model.addAttribute("lastThreePost", postDAO.getLastThreePost());
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());

		return "front/blog-tag-page";
	}
	
	@RequestMapping("/blog-author-page")
	public String getBlogAuthorP(@RequestParam String username,Model model) {
		
		model.addAttribute("author", authorDAO.getAuthorByUsername(username));
		model.addAttribute("postList", postDAO.getPostListByAuthor(username)); //PROBA!!!
		//model.addAttribute("category", categoryDAO.getCategoryById(id));
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("tagList", tagDAO.getTagListByPost());
		model.addAttribute("lastThreePost", postDAO.getLastThreePost());
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());

		return "front/blog-author-page";
	}
	
	@RequestMapping("/blog-search-page")
	public String getBlogSearchP(Model model, @RequestParam String search) {
		
		model.addAttribute("search", search);
		model.addAttribute("postList", postDAO.getSearchPost(search));
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("tagList", tagDAO.getTagListByPost());
		model.addAttribute("lastThreePost", postDAO.getLastThreePost());
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());

		return "front/blog-search-page";
	}
	
	@RequestMapping("/post-order")
	public String getPostOrderList(@RequestParam int orderBy, @RequestParam(name = "page", defaultValue = "1") int page, Model model) {
		int pageSize = 10;
		
		System.out.println("sortirano");
		model.addAttribute("postList", postDAO.getPostsListForBlogPage(orderBy, page, pageSize));
		
		model.addAttribute("categoryList", categoryDAO.getCategoriesForFilter());
		model.addAttribute("tagList", tagDAO.getTagListByPost());
		model.addAttribute("lastThreePost", postDAO.getLastThreePost());
		model.addAttribute("priorityCategories", categoryDAO.getPriorityCategories());
		
		int totalPosts = postDAO.getTotalNumberOfPosts();
	    int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("currentPage", page);
	    //System.out.println("Broj postova: " + totalPosts +  " broj stranica: " + totalPages);
	    model.addAttribute("orderBy", orderBy);
		
		return "front/blog-page";
	}
	
}
