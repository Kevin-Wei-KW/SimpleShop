package com.kevin.simpleshop.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserServiceImpl userService;

    @GetMapping("/profile")
    public String viewProfile(Model m, HttpSession httpSession) throws Exception {
        UserModel userModel = (UserModel) httpSession.getAttribute("loggedInUser");
        m.addAttribute("userModel", userModel);
        return "user/profile";
    }

    @PostMapping("/profile")
    public String changeProfile(@RequestParam(required = false) String email, @RequestParam(required = true) String oldPassword, @RequestParam(required = false) String newPassword, @RequestParam(required = false) String displayName, Model m, HttpSession httpSession) throws Exception {
        UserModel userModel = (UserModel) httpSession.getAttribute("loggedInUser");
        if(!md5(oldPassword).equals(userModel.getPassword())) {
            m.addAttribute("message", "Old password is wrong");
            return this.viewProfile(m, httpSession);
        }
        if(email!=null && email.length()>0) {
            userModel.setEmail(email);
        }
        if(newPassword!=null && newPassword.length() > 0) {
            userModel.setPassword(md5(newPassword));
        }
        if(displayName!=null && displayName.length() > 0) {
            userModel.setDisplayName(displayName);
        }


        userModel = userService.save(userModel);

        m.addAttribute("userModel", userModel);
        m.addAttribute("message", "Success!");
        return "user/profile";

    }

    @GetMapping("/login")
    public String viewLogin(Model m) throws Exception {
        return "user/login";
    }

    Exception exp = new Exception();
    @PostMapping("/login")
    public String Login(@RequestParam String email, @RequestParam String password, Model m, HttpSession httpSession) throws Exception {
        UserModel user = userService.getByEmail(email);

        if(user != null && user.getPassword().equals(md5(password))) {
            m.addAttribute("message", "Welcome, " + user.getDisplayName());
            httpSession.setAttribute("loggedInUser", user);
            return "redirect:/";
        }

        m.addAttribute("message", "Incorrect Username or Password");
        return "/user/login";
    }

    @GetMapping("/logout")
    public String Logout(Model m, HttpSession httpSession) {
        httpSession.removeAttribute("loggedInUser");
        return "/user/login";
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
        userModel.setPassword(md5(password));
        userModel.setDisplayName(displayName);

        userModel = userService.save(userModel);

        m.addAttribute("userModel", userModel);
        m.addAttribute("message", "Success!");
        return "user/login";
    }

    private String md5(String password) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(password.getBytes());
        byte[] digest = md.digest();
        String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();

        return myHash;

    }
}
