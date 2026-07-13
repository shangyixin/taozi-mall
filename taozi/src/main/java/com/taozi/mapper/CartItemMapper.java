package com.taozi.mapper;

import com.taozi.entity.CartItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartItemMapper {
    List<CartItem> findByUserId(@Param("userId") Integer userId);
    CartItem findByUserIdAndProductId(@Param("userId") Integer userId, @Param("productId") Integer productId);
    int insert(CartItem cartItem);
    int updateQuantity(@Param("id") Integer id, @Param("quantity") Integer quantity);
    int delete(@Param("id") Integer id);
    int deleteByUserId(@Param("userId") Integer userId);
}
