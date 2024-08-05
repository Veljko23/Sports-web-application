package diplomski.main.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import diplomski.main.entity.Reply;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	@Override
	public List<Reply> getReplies(int id) {
		
		Session session = sessionFactory.getCurrentSession();
		
		Query<Reply> query = session.createQuery("select r from Reply r where r.comment.id=:id");
		query.setParameter("id", id);
		List<Reply> list = query.getResultList();
		
		return list;
		
	}

	@Transactional
	@Override
	public void saveReply(Reply reply) {
		
		Session session = sessionFactory.getCurrentSession();
		
		session.save(reply);
		
	}
	
	
	
}
