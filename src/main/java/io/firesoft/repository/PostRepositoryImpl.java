package io.firesoft.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import io.firesoft.model.Post;

@Repository("postRepository")
public class PostRepositoryImpl implements PostRepository {
	
	@PersistenceContext
	private EntityManager em;

	public Post save(Post post) {
		
		
		em.persist(post);
		em.flush();
		return post;
	}

}
