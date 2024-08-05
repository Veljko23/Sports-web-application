package diplomski.main.entity;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@NotNull
	@NotEmpty(message = "Required!")
    @Column(unique = true)
	private String name;
	@NotNull
	@NotEmpty(message = "Required!")
	@Column
	private String description;
	
	@Column
	private String image;
	
	@Transient
	private long count;
	
	@Column
	private int counter;
	
	@Transient
	private MultipartFile imageFile;
	
	@OneToMany(mappedBy = "category")
	private List<Subcategory> subCategories;
	
	public Category() {}

	public Category(String name) {
		super();
		this.name = name;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}
	
	public List<Subcategory> getSubCategories() {
		return subCategories;
	}

	public void setSubCategories(List<Subcategory> subCategories) {
		this.subCategories = subCategories;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	@Override
	public String toString() {
		return name;
	}
	
}
