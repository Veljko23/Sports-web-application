package diplomski.main.dao;

import java.util.List;

import diplomski.main.entity.Tag;

public interface TagDAO {
	
	public List<Tag> getTagList();
	
	public void saveTag(Tag tag);
	
	public Tag getTag(int id);
	
	public void deleteTag(int id);
	
	public List<Tag> getTagsById(List<Integer> ids);
	
	public List<Tag> getTagListByPost();
	
	public List<Tag> getTagById(int id);

}
