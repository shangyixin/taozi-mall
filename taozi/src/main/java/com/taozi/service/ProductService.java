package com.taozi.service;

import com.taozi.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    List<Product> findByCategoryId(Integer categoryId);
    Product findById(Integer id);
    void save(Product product);
    void delete(Integer id);
}
