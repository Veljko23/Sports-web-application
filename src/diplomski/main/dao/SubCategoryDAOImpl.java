package diplomski.main.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import diplomski.main.entity.Subcategory;
@Repository
public class SubCategoryDAOImpl implements SubCategoryDAO{
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	@Override
	public List<Subcategory> getSubCategoryList() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Subcategory> query = session.createQuery("select s from Subcategory s order by s.category.name asc", Subcategory.class);
		
		List<Subcategory> subCategories = query.getResultList();
		
		return subCategories;
	}

	@Transactional
	@Override
	public void saveSubCategory(Subcategory subCategory) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(subCategory);
		
	}
	@Transactional
	@Override
	public Subcategory getSubCategory(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Subcategory subCategory = session.get(Subcategory.class, id);
		
		return subCategory;
	}

	@Transactional
	@Override
	public void deleteSubCategory(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("delete from Subcategory where id=:id");

		query.setParameter("id", id);
		
		query.executeUpdate();
	}

	@Transactional
	@Override
	public List<Subcategory> getSubcategoriesByCategory(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Subcategory> query = session.createQuery("from Subcategory s where s.category.id=:id");
		
		query.setParameter("id", id);
		
		List<Subcategory> list = query.getResultList();
		
		return list;
	}

	@Transactional
	@Override
	public List<Subcategory> getSubcategoryById(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Subcategory> query = session.createQuery("select s from Subcategory s where s.id=:id");
		
		query.setParameter("id", id);
		
		List<Subcategory> list = query.getResultList();
		
		return list;
	}

}
