package com.kevin.simpleshop.post;

import com.kevin.simpleshop.user.UserModel;

import javax.persistence.*;
import java.util.UUID;
import java.util.*;


@Entity
public class PostModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;
    private String title;
    private String price;
    private String description;
    private String picURL0;
    private String picURL1;
    private String picURL2;
    private String picURL3;
    private String picURL4;

    public enum ECategory{
        BOOKS, ELECTRONICS, SPORTS, VEHICLES, CLOTHES, FURNITURE
    }
    private ECategory category;
    @ManyToOne
    private UserModel user;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPicURL0() {
        return picURL0;
    }

    public void setPicURL0(String picURL0) {
        this.picURL0 = picURL0;
    }

    public String getPicURL1() {
        return picURL1;
    }

    public void setPicURL1(String picURL1) {
        this.picURL1 = picURL1;
    }

    public String getPicURL2() {
        return picURL2;
    }

    public void setPicURL2(String picURL2) {
        this.picURL2 = picURL2;
    }

    public String getPicURL3() {
        return picURL3;
    }

    public void setPicURL3(String picURL3) {
        this.picURL3 = picURL3;
    }

    public String getPicURL4() {
        return picURL4;
    }

    public void setPicURL4(String picURL4) {
        this.picURL4 = picURL4;
    }

    public List<String> getAllURL() {
        List<String> list = new ArrayList<>();
        if(this.getPicURL0() != null && this.getPicURL0().length() > 0){
            list.add(this.getPicURL0());
        }
        if(this.getPicURL1() != null && this.getPicURL1().length() > 0){
            list.add(this.getPicURL1());
        }
        if(this.getPicURL2() != null && this.getPicURL2().length() > 0){
            list.add(this.getPicURL2());
        }
        if(this.getPicURL3() != null && this.getPicURL3().length() > 0){
            list.add(this.getPicURL3());
        }
        if(this.getPicURL4() != null && this.getPicURL4().length() > 0){
            list.add(this.getPicURL4());
        }
        return list;
    }

    public void setAllURL(List<String> newFileNames) {
        if(newFileNames!=null && newFileNames.size()>0){
            newFileNames.stream().filter(s -> s!=null && s.length()>0);
            if(newFileNames.size()>0){
                this.setPicURL0(newFileNames.get(0));
            }else{
                this.setPicURL0(null);
            }
            if(newFileNames.size()>1){
                this.setPicURL1(newFileNames.get(1));
            }else{
                this.setPicURL1(null);
            }
            if(newFileNames.size()>2){
                this.setPicURL2(newFileNames.get(2));
            }else{
                this.setPicURL2(null);
            }
            if(newFileNames.size()>3){
                this.setPicURL3(newFileNames.get(3));
            }else{
                this.setPicURL3(null);
            }
            if(newFileNames.size()>4){
                this.setPicURL4(newFileNames.get(4));
            }else{
                this.setPicURL4(null);
            }
        }

    }

    public ECategory getCategory() {
        return category;
    }

    public void setCategory(ECategory c) {
        this.category = c;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel userModel) {
        user = userModel;
    }

}
