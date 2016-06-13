package io.firesoft.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import io.firesoft.model.User;
import io.firesoft.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
    @PersistenceContext(unitName="punit")
    private EntityManager em;

	
	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}
	
	public User findUserByUsername(String username) {
	    CriteriaBuilder builder = em.getCriteriaBuilder();
	    CriteriaQuery<User> query = builder.createQuery(User.class);
	    Root<User> root = query.from(User.class);
 

        query.select(root).where(builder.equal(root.get("username").as(String.class), username));
        TypedQuery<User> pQuery= em.createQuery(query);
        
        User result = null;
        try{
            result = pQuery.getSingleResult();
        } catch (NoResultException e) {
            return result;
        }
        return result;
	}
	

}
