package com.kevin.simpleshop.post;

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

    public List<PostModel> findByCategoryAndKeyword(PostModel.ECategory category, String keyword);
}
