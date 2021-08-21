package com.kevin.simpleshop.user;

import com.kevin.simpleshop.user.UserModel;
import com.kevin.simpleshop.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl {
    @Autowired
    UserRepository userRepository;

    public UserModel save(UserModel model) throws Exception{
        model = userRepository.save(model);
        return model;
    }

    public UserModel get(UUID id) throws Exception{
        UserModel userModel = userRepository.getOne(id);
        return userModel;
    }

    public UserModel getByEmail(String email) {
        return userRepository.findByEmail(email);
    }

}