package io.firesoft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue
	@Column(name="user_id")
	private int id;
	private String fullName;
	private String email;
	private String password;
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	private boolean isAdmin;
	
	
	
	public User(String email, String password, String fullname) {
        this.email = email;
        this.password = password;
        this.fullName = fullname;
    }
	
	public User(){
	
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

}
