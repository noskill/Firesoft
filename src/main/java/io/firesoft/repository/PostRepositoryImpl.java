package io.firesoft.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

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

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Post> loadAll() {
		Query query = em.createQuery("Select g from Post g");
		
		List posts = query.getResultList();
		return posts;
	}

}
