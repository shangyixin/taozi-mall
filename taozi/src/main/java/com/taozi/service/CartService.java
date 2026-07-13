package com.taozi.service;

import com.taozi.entity.CartItem;

import java.util.List;

public interface CartService {
    List<CartItem> getCartItems(Integer userId);
    void addToCart(Integer userId, Integer productId);
    void updateQuantity(Integer id, Integer quantity);
    void remove(Integer id);
    void clearCart(Integer userId);
}
