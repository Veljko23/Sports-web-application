package diplomski.main.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import diplomski.main.entity.Contact;

@Repository
public class ContactDAOImpl implements ContactDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	@Override
	public List<Contact> getListContact() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Contact> query = session.createQuery("select c from Contact c order by c.id desc");
		
		List<Contact> list = query.getResultList();
		
		return list;
	}

	@Transactional
	@Override
	public void saveContact(Contact contact) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(contact);
		
	}

	@Transactional
	@Override
	public Contact getContact(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Contact contact = session.get(Contact.class, id);
		
		return contact;
	}


	@Transactional
	@Override
	public long getUnreadMessageCount() {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("select count (*) from Contact c where c.isSeen=0");
		
		return (long) query.uniqueResult();
	}

	@Transactional
	@Override
	public void deleteContact(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query query = session.createQuery("delete from Contact where id=:id");
		query.setParameter("id", id);
		
		query.executeUpdate();
		
	}

	@Transactional
	@Override
	public void makeMessageSeen(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Contact contact = session.get(Contact.class, id);
		
		contact.setIsSeen(!contact.getIsSeen());
		
		session.saveOrUpdate(contact);
	}
	
	

}
