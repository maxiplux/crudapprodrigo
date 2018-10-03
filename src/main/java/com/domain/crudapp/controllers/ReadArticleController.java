package com.domain.crudapp.controllers;
import com.domain.crudapp.models.Article;
import com.domain.crudapp.models.Category;
import com.domain.crudapp.repositories.ArticleDao;
import com.domain.crudapp.repositories.CategoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
public class ReadArticleController {




    @Autowired
    ArticleDao articleDao;

    @Autowired
    CategoryDao categoryDao;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(@RequestParam(value = "category", required = false, defaultValue = "-1") Long categoryId,
                        @RequestParam(value = "dateOrder", required = true, defaultValue = "asc") String dateOrder,
                        Model model) {

        Optional<Category> categoryOptional = categoryDao.findById(categoryId);
        List<Article> articles;
        Category categorySelected;
        if (!categoryOptional.isPresent()) {
            if (dateOrder.equals("desc")) {
                articles = articleDao.findAllByOrderByPublicationDateDesc();
            } else {
                articles = articleDao.findAllByOrderByPublicationDateAsc();
            }
            categorySelected = new Category();
        } else {
            if (dateOrder.equals("desc")) {
                articles = articleDao.findAllByCategory_IdOrderByPublicationDateDesc(categoryId);
            } else {
                articles = articleDao.findAllByCategory_IdOrderByPublicationDateAsc(categoryId);
            }
            categorySelected = categoryOptional.get();
        }
        model.addAttribute("articles", articles);
        model.addAttribute("categoryList", categoryDao.findAll());
        model.addAttribute("category", categorySelected);

        return "index";
    }

    @RequestMapping(value = "/article/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable long id, Model model) {

        model.addAttribute("article", this.articleDao.findById(id).get());



        return "articleDetail";
    }





}
