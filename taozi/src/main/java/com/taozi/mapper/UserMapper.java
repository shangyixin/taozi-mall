package com.taozi.mapper;

import com.taozi.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    User findByUsername(@Param("username") String username);
    User findById(@Param("id") Integer id);
    int insert(User user);
    List<User> findAll();
    int update(User user);
    int delete(@Param("id") Integer id);
}
