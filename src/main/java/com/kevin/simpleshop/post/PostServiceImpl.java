package com.kevin.simpleshop.post;

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

    public List<PostModel> search(String keyword, int pageNo, int pageSize) throws Exception{
        return postRepository.findAll();
    }
}
