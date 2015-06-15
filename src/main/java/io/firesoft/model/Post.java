package io.firesoft.model;

import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="posts")
public class Post {
	
	@Id
	@GeneratedValue
	@Column(name="POST_IP")
	private Long id;

	@NotNull
	@NotEmpty
	@Column(name="TITLE")
	private String title;

	@NotNull
	@NotEmpty
	
	@Column(name="CONTENT")
	@Lob
	 private String content;
	
	@NotNull
	@Column(name="CATEGORY")
	private String themes;
	
	
	
    @Column(name = "POSTAT")
    private Date postDate;

	
	
	public Date getPostDate() {
	return postDate;
}

public void setPostDate() {
	postDate=new Date();
	
}

	public String getThemes() {
		return themes;
	}

	public void setThemes(String themes) {
		this.themes = themes;
	}

	public String getContent() {
		return content;
	}
	
	public Long getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
}
