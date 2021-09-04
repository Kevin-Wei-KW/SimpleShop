package com.kevin.simpleshop.post;

import com.kevin.simpleshop.user.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    PostServiceImpl postService;

    @Value("${file_upload_path}")
    private String fileUploadPath;

    //kevinshop.com/post/list?keyword="books"?pageNo="22"?pageSize="10"
    @GetMapping({ "/list", "/list/{category}"})
    public String search(@PathVariable(name="category", required = false) PostModel.ECategory category,
                         @RequestParam(required = false) String keyword,
                         @RequestParam(required = false, defaultValue = "0") int pageNo,
                         @RequestParam(required = false, defaultValue = "20") int pageSize,
                         Model m) throws Exception{
        List<PostModel> list = postService.search(category, keyword, pageNo, pageSize);
        m.addAttribute("list", list);
        m.addAttribute("category", category);
        m.addAttribute("keyword", keyword);

        return "post/list";
    }

    @GetMapping({"/myPosts"})
    public String myPosts(HttpSession httpSession, Model m) throws Exception {
        UserModel userModel = (UserModel)httpSession.getAttribute("loggedInUser");

        if(userModel == null) {
            m.addAttribute("message", "Not Logged In");;
            return "redirect:/user/login";
        }

        List<PostModel> list = postService.getByUser(userModel);
        m.addAttribute("list", list);

        return "post/list";

    }

    @PostMapping("/save")
    public String save(@ModelAttribute PostModel postModel, @RequestParam("files") MultipartFile[] files, HttpSession httpSession, Model m) throws Exception {
        UserModel userModel = (UserModel)httpSession.getAttribute("loggedInUser");
        if(userModel == null) {
            m.addAttribute("message", "Not Logged In");
            return "redirect:/user/login";
        }

        List<String> newFileNames = new ArrayList<>();
        if(files != null) {
            for(MultipartFile file: files) {
                if(!file.isEmpty()) {
                    File targetFile = File.createTempFile(System.currentTimeMillis() + "_",
                            "."+this.getExtensionByStringHandling(file.getOriginalFilename()), new File(fileUploadPath));
                    newFileNames.add("/upload/"+targetFile.getName());
                    file.transferTo(targetFile);
                } //fileChannel.transferTo (start, length, Channels.newChannel(outputStream));
            }
        }
        if(postModel.getId()==null){
            postModel.setAllURL(newFileNames);
            postModel.setUser(userModel);
            postModel = postService.save(postModel);
        }else{
            PostModel postDB = postService.get(postModel.getId());
            if(postDB!=null){
               newFileNames.addAll(postModel.getAllURL());
               postModel.setAllURL(newFileNames);
               postModel = postService.save(postModel);
            }
        }

        m.addAttribute("postModel", postModel);
        m.addAttribute("saveMessage", "Save Success!");
        return this.edit(postModel.getId(), httpSession, m);
    }

    public String getExtensionByStringHandling(String originalFileName) {
        if(originalFileName != null && originalFileName.length() > 3) {
            return originalFileName.substring(originalFileName.lastIndexOf(".")+1);
        }else{
            return "";
        }
//        String[] splitString = originalFileName.split(".");
//        if(splitString.length-1 >= 0) {
//            return splitString[splitString.length-1];
//        } else {
//            return "";
//        }
    }

    @GetMapping({"/edit/{id}", "/edit"})
    public String edit(@PathVariable(required = false) UUID id, HttpSession httpSession, Model m) throws Exception{
        UserModel userModel = (UserModel)httpSession.getAttribute("loggedInUser");
        if(userModel == null) {
            m.addAttribute("message", "Not Logged In");
            return "redirect:/user/login";
        }

        if(id != null) {
           PostModel postModel = postService.get(id);
           m.addAttribute("postModel", postModel);
       }
       return"post/edit";
    }

    @GetMapping({"/detail/{id}", "/detail"})
    public String detail(@PathVariable(required = false) UUID id, Model m) throws Exception{
        if(id != null) {
            PostModel postModel = postService.get(id);
            m.addAttribute("postModel", postModel);
        }
        return"post/detail";
    }


}
