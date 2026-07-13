package com.taozi.service.impl;

import com.taozi.entity.CartItem;
import com.taozi.entity.Order;
import com.taozi.entity.OrderItem;
import com.taozi.mapper.CartItemMapper;
import com.taozi.mapper.OrderMapper;
import com.taozi.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private CartItemMapper cartItemMapper;

    @Override
    @Transactional
    public Order createOrder(Integer userId) {
        List<CartItem> cartItems = cartItemMapper.findByUserId(userId);
        if (cartItems.isEmpty()) {
            throw new RuntimeException("购物车为空");
        }

        BigDecimal total = BigDecimal.ZERO;
        for (CartItem item : cartItems) {
            BigDecimal itemTotal = item.getProduct().getPrice().multiply(new BigDecimal(item.getQuantity()));
            total = total.add(itemTotal);
        }

        Order order = new Order();
        order.setOrderNo(UUID.randomUUID().toString().replace("-", "").substring(0, 16));
        order.setUserId(userId);
        order.setTotalPrice(total);
        order.setStatus(0);
        orderMapper.insert(order);

        for (CartItem item : cartItems) {
            OrderItem oi = new OrderItem();
            oi.setOrderId(order.getId());
            oi.setProductId(item.getProductId());
            oi.setProductName(item.getProduct().getName());
            oi.setPrice(item.getProduct().getPrice());
            oi.setQuantity(item.getQuantity());
            orderMapper.insertItem(oi);
        }

        cartItemMapper.deleteByUserId(userId);
        return order;
    }

    @Override
    public List<Order> getUserOrders(Integer userId) {
        return orderMapper.findByUserId(userId);
    }

    @Override
    public Order getOrderDetail(Integer orderId) {
        Order order = orderMapper.findById(orderId);
        if (order != null) {
            order.setItems(orderMapper.findItemsByOrderId(orderId));
        }
        return order;
    }
}
