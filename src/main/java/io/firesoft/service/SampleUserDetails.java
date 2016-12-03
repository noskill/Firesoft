package io.firesoft.service;



import io.firesoft.model.User;
import org.springframework.security.core.authority.AuthorityUtils;



public class SampleUserDetails extends  org.springframework.security.core.userdetails.User{
	private static final long serialVersionUID = 1L;
	
	
	private User user;	

	
	public SampleUserDetails(User user) {
		super(user.getUsername(), user.getPassword(), AuthorityUtils
                .createAuthorityList(user.getNameRoles())); // 
		this.user = user;
	}
	
	public User getUser() {
		return user;
	}

	
	
}
