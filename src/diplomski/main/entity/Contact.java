package diplomski.main.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
@Table
public class Contact {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int id;
	@Column
	@NotNull
	@NotEmpty(message = "Polje je obavezno!")
	private String name;
	@Column
	@NotNull
	@NotEmpty(message = "Polje je obavezno!")
	private String email;
	@Column
	@NotNull
	@NotEmpty(message = "Polje je obavezno!")
	private String message;
	
	@Column
	private boolean isSeen;
	
	public Contact() {}

	public Contact(String email, String message, String name) {
		super();
		this.email = email;
		this.message = message;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean getIsSeen() {
		return isSeen;
	}

	public void setIsSeen(boolean isSeen) {
		this.isSeen = isSeen;
	}

	@Override
	public String toString() {
		return email + message;
	}

}
