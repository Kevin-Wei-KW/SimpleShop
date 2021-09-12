package com.kevin.simpleshop.post;

import com.kevin.simpleshop.user.UserModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface PostRepository extends JpaRepository<PostModel, UUID> {

    //HQL Hibernate
    @Query("select p from PostModel p where (:category is null or p.category = :category) " +
    "AND (:keyword is null or p.title like %:keyword% or p.description like %:keyword%)")

    public Page<PostModel> findByCategoryAndKeyword(PostModel.ECategory category, String keyword, Pageable page);
    public Page<PostModel> findByUser(UserModel user, Pageable page);
}
