package com.domain.crudapp.controllers;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @RequestMapping("/rest")
    public String home(){
        return "Hello World!";
    }
}
