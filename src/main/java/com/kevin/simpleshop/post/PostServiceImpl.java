package com.kevin.simpleshop.post;

import com.kevin.simpleshop.user.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class PostServiceImpl {
    @Autowired
    PostRepository postRepository;

    public PostModel save(PostModel model) throws Exception{
        model = postRepository.save(model);
        return model;
    }

    public PostModel get(UUID id) throws Exception{
        PostModel postModel = postRepository.getOne(id);
        return postModel;
    }

    public List<PostModel> getByUser(UserModel user) throws Exception {
        return postRepository.findByUser(user);
    }

    public List<PostModel> search(PostModel.ECategory category, String keyword, int pageNo, int pageSize) throws Exception{
        return postRepository.findByCategoryAndKeyword(category, keyword);
    }
}
