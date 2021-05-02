package com.kevin.simpleshop.post;

import com.kevin.simpleshop.user.UserModel;

import javax.persistence.*;
import java.util.UUID;


@Entity
public class PostModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;
    private String title;
    private String price;
    private String description;
    public enum Ecategory{
        BOOKS, ELECTRONICS, SPORTS, VEHICLES, CLOTHES, FURNITURE
    }
    private Ecategory category;
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

    public Ecategory getCategory() {
        return category;
    }

    public void setCategory(Ecategory c) {
        this.category = c;
    }
}
