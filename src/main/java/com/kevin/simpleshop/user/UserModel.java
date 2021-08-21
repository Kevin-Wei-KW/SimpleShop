package com.kevin.simpleshop.user;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.UUID;
import java.util.*;

@Entity
public class UserModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String email;
    private String displayName;
    private String password;

    public String getEmail(){
        return email;
    }
    public void setEmail(String e){
        email = e;
    }
    public String getDisplayname(){
        return displayName;
    }
    public void setDisplayName(String d){
        displayName = d;
    }
    public String getPassword(){
        return password;
    }
    public void setPassword(String p){
        password = p;
    }
}
