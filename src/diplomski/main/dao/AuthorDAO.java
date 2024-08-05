package diplomski.main.dao;

import java.util.List;

import diplomski.main.entity.Author;
import diplomski.main.entity.Role;

public interface AuthorDAO {
	
	public List<Author> getListAuthor();
	
	public void saveAuthor(Author author);
	
	public Author getAuthorByUsername(String username);
	
	public Author getAuthor(int id);
	
	public void deleteAuthor(String username);
	
	public void enableAuthor(String username);
	
	public List<Role> getRoleList();
	
	public String getAuthorImage();

}
