package diplomski.main.dao;

import java.util.List;

import diplomski.main.entity.Subcategory;

public interface SubCategoryDAO {

	public List<Subcategory> getSubCategoryList();
	
	public void saveSubCategory (Subcategory subCategory);
	
	public Subcategory getSubCategory(int id);
	
	public void deleteSubCategory(int id);
	
	public List<Subcategory> getSubcategoriesByCategory(int id);
	
	public List<Subcategory> getSubcategoryById(int id);
}
