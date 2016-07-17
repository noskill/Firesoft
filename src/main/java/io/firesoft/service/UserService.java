package io.firesoft.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import io.firesoft.model.Post;
import io.firesoft.model.Role;
import io.firesoft.model.User;
import io.firesoft.repository.PostRepository;
import io.firesoft.repository.RoleRepository;
import io.firesoft.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private PostRepository postRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User findOne(int id) {
		
		return userRepository.findOne(id);
	}

	@Transactional
	public User findOneWithPosts(int id) {
		User user = findOne(id);
		List<Post> posts = postRepository.findByUser(user, new PageRequest(0, 10, Direction.DESC, "title"));
		user.setPosts(posts);
	    return user;
	}

	public void save(User user) {
		user.setEnabled(true);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
		
		
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleRepository.findByName("ROLE_USER"));
	    user.setRoles(roles);	
		userRepository.save(user);
	}
}
