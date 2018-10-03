package com.domain.crudapp.repositories;

import com.domain.crudapp.models.Article;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface ArticleDao extends CrudRepository<Article, Long> {

    public List<Article> findAllByCategory_IdOrderByPublicationDateAsc(long categoryId);

    public List<Article> findAllByCategory_IdOrderByPublicationDateDesc(long categoryId);

    public List<Article> findAllByOrderByPublicationDateAsc();

    public List<Article> findAllByOrderByPublicationDateDesc();
}