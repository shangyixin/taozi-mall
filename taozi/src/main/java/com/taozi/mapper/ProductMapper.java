package com.taozi.mapper;

import com.taozi.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    List<Product> findAll();
    List<Product> findByCategoryId(@Param("categoryId") Integer categoryId);
    Product findById(@Param("id") Integer id);
    int insert(Product product);
    int update(Product product);
    int delete(@Param("id") Integer id);
}
