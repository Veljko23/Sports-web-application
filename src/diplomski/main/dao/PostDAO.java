package diplomski.main.dao;

import java.util.List;

import diplomski.main.entity.Post;

public interface PostDAO {
	
	List<Post> getListPost();
	
	public void savePost(Post post);
	
	public Post getPost(int id);
	
	public void deletePost(int id);
	
	public void enablePost(int id);
	
	public void makeImportantPost(int id);
	
	public List<Post> getPostsList(int orderBy);
	
	public List<Post> getPostByAuthorOrderList(int orderBy, String username);
	
	public List<Post> getLastThreePost();
	
	public List<Post> getLastThreePostWithoutCurrent(int currentPostId);
	
	public List<Post> getLatestPost();
	
	public List<Post> getRelatedPost(int currentPostId);
	
	public List<Post> getSixImportantPostForMainPage();
	
	public List<Post> getPostListByCategory(int id);
	
	public List<Post> getPostListBySubCategory(int id);
	
	public Post getPostWithTag(int id);
	
	public List<Post> getPreviousPost(int id);
	
	public List<Post> getPostListByTag(int id);
	
	public List<Post> getPostListByAuthor(String username);
	
	public List<Post> getSearchPost(String txt);
	
	public List<Post> getPostsListForBlogPage(int orderBy, int page, int pageSize);
	
	public int getTotalNumberOfPosts();
	
	public List<Post> getPostsListForBlogPage(int orderBy);
	
	public List<Post> getThreeRandomPostsNearbyCurrent(int id);
	
	public List<Post> getMostReadPosts();
	
	public List<Post> getMostCommentedPosts();

}
