package diplomski.main.dao;

import java.util.List;

import diplomski.main.entity.Reply;

public interface ReplyDAO {
	
	public List<Reply> getReplies(int id);
	
	public void saveReply(Reply reply);

}
