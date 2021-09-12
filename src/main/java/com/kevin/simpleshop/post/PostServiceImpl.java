package com.kevin.simpleshop.post;

import com.kevin.simpleshop.user.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    public Page<PostModel> getByUser(UserModel user, Pageable page) throws Exception {
        return postRepository.findByUser(user, page);
    }

    public Page<PostModel> search(PostModel.ECategory category, String keyword, int pageNo, int pageSize, Pageable page) throws Exception{
        return postRepository.findByCategoryAndKeyword(category, keyword, page);
    }
}
