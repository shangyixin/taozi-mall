package com.taozi.service;

import com.taozi.entity.User;

import java.util.List;

public interface UserService {
    User register(User user);
    User login(String username, String password);
    User findById(Integer id);
    List<User> findAll();
    void update(User user);
    void delete(Integer id);
}
