package diplomski.main.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


@Entity
@Table
public class Post {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	@NotEmpty(message = "required!")
	private String title;
	@Column
	@NotEmpty(message = "required!")
	private String header;
	@Column
	@NotNull
	@NotEmpty(message = "required!")
	private String text;
	@ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name = "categoryId")
	private Category category;
	@Column
	private boolean enabled;
	@Column
	private boolean important;
	@Column
	private int numComments;
	@Column
	private int numViews;
	@Column
	private String image;
	
	@ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name = "authorName")
	private Author author;
	
	@ManyToMany(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH}, fetch = FetchType.EAGER)
	@JoinTable(name = "Post_Tag", joinColumns = @JoinColumn(name="id_post"), inverseJoinColumns = @JoinColumn(name="id_tag"))
	private List<Tag> tags;
	
	@Column
	private String date;
	
	@OneToMany(mappedBy = "post", orphanRemoval = true)
	private List<Comment> comments;
	
	@Transient
	private String search;
	
	@Transient
	private Integer selectedSubcategoryId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "subcategoryId")
    private Subcategory subcategory;
	
	public Post() {}

	public Post(String title, Category category, boolean enabled, boolean important, int numComments,
			int numViews, Author author, List<Tag> tags, String date, String text) {
		super();
		this.title = title;
		this.category = category;
		this.enabled = enabled;
		this.important = important;
		this.numComments = numComments;
		this.numViews = numViews;
		this.author = author;
		this.tags = tags;
		this.date = date;
		this.text = text;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public String getHeader() {
		return header;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setHeader(String header) {
		this.header = header;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public boolean getIsEnabled() {
		return enabled;
	}

	public void setIsEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean getIsImportant() {
		return important;
	}

	public void setIsImportant(boolean important) {
		this.important = important;
	}

	public int getNumComments() {
		return numComments;
	}

	public void setNumComments(int numComments) {
		this.numComments = numComments;
	}

	public int getNumViews() {
		return numViews;
	}

	public void setNumViews(int numViews) {
		this.numViews = numViews;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public Integer getSelectedSubcategoryId() {
		return selectedSubcategoryId;
	}

	public void setSelectedSubcategoryId(Integer selectedSubcategoryId) {
		this.selectedSubcategoryId = selectedSubcategoryId;
	}

	public Subcategory getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(Subcategory subcategory) {
		this.subcategory = subcategory;
	}

	@Override
	public String toString() {
		return title;
	}

}
