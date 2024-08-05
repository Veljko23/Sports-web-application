package diplomski.main.dao;

import java.util.List;

import diplomski.main.entity.Contact;

public interface ContactDAO {
	
	public List<Contact> getListContact();
	
	public void saveContact(Contact contact);
	
	public Contact getContact(int id);
	
	public void deleteContact(int id);
		
	public long getUnreadMessageCount();
	
	public void makeMessageSeen(int id);

}
