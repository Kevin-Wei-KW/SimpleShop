package com.kevin.simpleshop.common;

import com.kevin.simpleshop.post.PostServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {
    @Autowired
    PostServiceImpl postService;

    @GetMapping("/")
    public String homePage(Model m) throws Exception{
        return "redirect:post/list";
    }

}
