package diplomski.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table
public class Slider {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	private String image;
	@Column
	@NotNull
	@NotEmpty(message = "required!")
	private String text;
	@Column
	@NotNull
	@NotEmpty(message = "required!")
	private String link;
	@Column
	private boolean enabled;
	@Transient
	private MultipartFile imageFile;
	
	public Slider() {}

	public Slider(String image, String text, String link, boolean enabled) {
		super();
		this.image = image;
		this.link = link;
		this.enabled = enabled;
		this.text = text;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public boolean getIsEnabled() {
		return enabled;
	}

	public void setIsEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	@Override
	public String toString() {
		return text;
	}

}
