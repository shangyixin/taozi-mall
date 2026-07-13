package com.taozi.mapper;

import com.taozi.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CategoryMapper {
    List<Category> findAll();
    Category findById(@Param("id") Integer id);
    int insert(Category category);
    int update(Category category);
    int delete(@Param("id") Integer id);
}
