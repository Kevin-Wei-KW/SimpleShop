package com.kevin.simpleshop.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserServiceImpl userService;

    @GetMapping("/login")
    public String viewLogin(Model m) throws Exception {
        return "user/login";
    }

    @PostMapping("/login")
    public String Login(Model m) throws Exception {
        return null;
    }

    @GetMapping("/register")
    public String viewRegister(Model m) throws Exception {
        return "user/register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String email, @RequestParam String password, @RequestParam String repassword, @RequestParam String displayName, Model m) throws Exception {
        if(!password.equals(repassword)) {
            m.addAttribute("message", "Wrong Confirmation Password");
            return "user/register";
        }
        UserModel existedUser = userService.getByEmail(email);
        if(existedUser != null) {
            m.addAttribute("message", "Email Exists");
            return "user/register";
        }

        UserModel userModel = new UserModel();
        userModel.setEmail(email);
        userModel.setPassword(password);
        userModel.setDisplayName(displayName);

        userModel = userService.save(userModel);

        m.addAttribute("userModel", userModel);
        m.addAttribute("message", "Success!");
        return "user/login";
    }
}
