package com.kevin.simpleshop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HelloControler {
    @RequestMapping("/hello")
    public String handleHello(){
        return "hello";
    }
}
