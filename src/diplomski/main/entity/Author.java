package diplomski.main.entity;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.web.multipart.MultipartFile;

@Entity(name = "users")
@Table
public class Author {

	@Id
	@Column
	@NotNull
	@NotEmpty(message = "required!")
	@Size(min = 3, max = 20, message = "min 3, max 20 characters!")
	private String username;
	@Column
	private String password;
	@Column
	@NotNull
	@NotEmpty(message = "required!")
	private String name;
	@Column
	@NotNull
	@NotEmpty(message = "required!")
	private String surname;
	@Column
	private boolean enabled;
	
	@Column
	private String image;
	
	@ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH}, fetch = FetchType.EAGER)
	@JoinTable(name = "authorities", joinColumns = @JoinColumn(name="username"), inverseJoinColumns = @JoinColumn(name="authority"))
	private Role authorities;
	
	@Transient
	private MultipartFile imageFile;
	
	public Author() {}
	
	public Author(String username, String password, String name, String surname, boolean enabled, String image) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.surname = surname;
		this.enabled = enabled;
		this.image = image;
	}

	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getSurname() {
		return surname;
	}


	public void setSurname(String surname) {
		this.surname = surname;
	}


	public boolean getEnabled() {
		return enabled;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Role getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Role authorities) {
		this.authorities = authorities;
	}
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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
