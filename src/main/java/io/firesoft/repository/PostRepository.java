package io.firesoft.repository;

import java.util.List;

import io.firesoft.model.Post;

public interface PostRepository {

	Post save(Post post);

	List<Post> loadAll(); 
}
