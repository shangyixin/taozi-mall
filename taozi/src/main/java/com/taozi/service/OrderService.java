package com.taozi.service;

import com.taozi.entity.Order;

import java.util.List;

public interface OrderService {
    Order createOrder(Integer userId);
    List<Order> getUserOrders(Integer userId);
    Order getOrderDetail(Integer orderId);
}
