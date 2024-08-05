package diplomski.main.dao;

import java.util.List;

import diplomski.main.entity.Category;

public interface CategoryDAO {
	
	public List<Category> getCategoryList();
	
	public void saveCategory (Category category);
	
	public Category getCategory(int id);
	
	public void deleteCategory(int id);
	
	public List<Category> getCategoriesById (List<Integer> ids);
	
	public List<Category> getCategoriesForFilter();
	
	public List<Category> getCategoryById(int id);
	
	public List<Category> getPriorityCategories();
	
	public List<Category> getCategoryListWithSubcategories();

}
