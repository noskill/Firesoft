package io.firesoft.service;


import io.firesoft.model.Post;
import io.firesoft.model.Role;
import io.firesoft.model.User;
import io.firesoft.repository.PostRepository;
import io.firesoft.repository.RoleRepository;
import io.firesoft.repository.UserRepository;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Transactional
@Service
public class InitDbService {
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	
	@Autowired
	private PostRepository postRepository;
	
	
	

	@PostConstruct
	public void init() {
		
		Role roleUser = new Role();
		roleUser.setName("ROLE_USER");
		roleRepository.save(roleUser);
		
		Role roleAdmin = new Role();
		roleAdmin.setName("ROLE_ADMIN");
		roleRepository.save(roleAdmin);
		
        Properties prop = new Properties();
        String propFileName = "auth.properties";
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);

        if (inputStream != null) {
            try {
                prop.load(inputStream);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        } else {
            return;
            //throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
        }
		
		User userAdmin=new User();
		userAdmin.setEnabled(true);
		userAdmin.setUsername(prop.getProperty("admin.username"));
		userAdmin.setFullName("admin");
		userAdmin.setEmail(prop.getProperty("admin.username"));
		BCryptPasswordEncoder encoderadmin = new BCryptPasswordEncoder();
		
		User Justuser=new User();
		Justuser.setEnabled(true);
		Justuser.setUsername("user");
		Justuser.setFullName("user");		
		BCryptPasswordEncoder encoderuser = new BCryptPasswordEncoder();
		userAdmin.setPassword(encoderadmin.encode("admin"));

		Justuser.setPassword(encoderuser.encode("user"));
		
		List<Role> rolesAdmin = new ArrayList<Role>();
		List<Role> rolesUser = new ArrayList<Role>();
		rolesAdmin.add(roleAdmin);
		rolesAdmin.add(roleUser);
		rolesUser.add(roleUser);
		userAdmin.setRoles(rolesAdmin);	
		Justuser.setRoles(rolesUser);
		
		userRepository.save(userAdmin);
		userRepository.save(Justuser);
		
		
		Post postAdmin = new Post();
		postAdmin.setTitle("Programmer");
		postAdmin.setThemes("Madina");
		postAdmin.setContent("MMMMMM");
		postAdmin.setUser(userAdmin);
		postRepository.save(postAdmin);
		
		
	    Post postUser = new Post();
		postUser.setTitle("Fashion");
		postUser.setThemes("Tolunya");
		postUser.setContent("FFFFFF");
		postUser.setUser(Justuser);
		postRepository.save(postUser);
			
	}

}
