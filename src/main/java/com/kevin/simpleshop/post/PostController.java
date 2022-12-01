package com.kevin.simpleshop.post;

import com.kevin.simpleshop.user.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
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
                         @PageableDefault(size = 20, direction = Sort.Direction.DESC, sort = {"createdDate"}) Pageable page,
                         Model m) throws Exception{

        Page<PostModel> pageList = postService.search(category, keyword, page);

        m.addAttribute("pageList", pageList);
        m.addAttribute("pageTitle", "All Posts");

        m.addAttribute("category", category);
        m.addAttribute("keyword", keyword);

        return "post/list";
    }

    @GetMapping({"/myPosts"})
    public String myPosts(@PageableDefault(size = 20, direction = Sort.Direction.DESC, sort = {"createdDate"}) Pageable page, HttpSession httpSession, Model m) throws Exception {
        UserModel userModel = (UserModel)httpSession.getAttribute("loggedInUser");

        if(userModel == null) {
            m.addAttribute("message", "Not Logged In");;
            return "redirect:/user/login";
        }

        //Pageable pageable = PageRequest.of(0, 10, Sort.by(Sort.Order.asc("name"), Sort.Order.desc("id")));
        Page<PostModel> pageList = postService.getByUser(userModel, page);
        m.addAttribute("pageList", pageList);
        m.addAttribute("pageTitle", "My Posts");

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

    @GetMapping({"/detail/{id}"})
    public String detail(@PathVariable UUID id, HttpSession httpSession, Model m) throws Exception{
        UserModel loginUser = (UserModel)httpSession.getAttribute("loggedInUser");
        PostModel post = postService.get(id);
        m.addAttribute("postModel", post);

        if(loginUser == null || !loginUser.getId().equals(post.getUser().getId())) {
            m.addAttribute("canEdit", false);
        } else {
            m.addAttribute("canEdit", true);
        }

        return"post/detail";
    }


}
