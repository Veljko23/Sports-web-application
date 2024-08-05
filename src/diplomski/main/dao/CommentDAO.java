package diplomski.main.dao;

import java.util.List;

import diplomski.main.entity.Comment;

public interface CommentDAO {
	
	public List<Comment> getListComment();
	
	public void saveComment(Comment comment);
	
	public Comment getComment(int id);
	
	public void deleteComment(int id);
	
	public void enableComment(int id);
	
	public long getNumComment();
	
	public List<Comment> getEnabledComments();

	public List<Comment> getCommentsForPost(int id);
	
	public long getCommentsCounter(int id);
	
}
