package com.taozi.service.impl;

import com.taozi.entity.CartItem;
import com.taozi.mapper.CartItemMapper;
import com.taozi.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartItemMapper cartItemMapper;

    @Override
    public List<CartItem> getCartItems(Integer userId) {
        return cartItemMapper.findByUserId(userId);
    }

    @Override
    public void addToCart(Integer userId, Integer productId) {
        CartItem exist = cartItemMapper.findByUserIdAndProductId(userId, productId);
        if (exist != null) {
            cartItemMapper.updateQuantity(exist.getId(), exist.getQuantity() + 1);
        } else {
            CartItem item = new CartItem();
            item.setUserId(userId);
            item.setProductId(productId);
            item.setQuantity(1);
            cartItemMapper.insert(item);
        }
    }

    @Override
    public void updateQuantity(Integer id, Integer quantity) {
        cartItemMapper.updateQuantity(id, quantity);
    }

    @Override
    public void remove(Integer id) {
        cartItemMapper.delete(id);
    }

    @Override
    public void clearCart(Integer userId) {
        cartItemMapper.deleteByUserId(userId);
    }
}
