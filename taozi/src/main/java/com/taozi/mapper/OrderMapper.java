package com.taozi.mapper;

import com.taozi.entity.Order;
import com.taozi.entity.OrderItem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    int insert(Order order);
    int insertItem(OrderItem item);
    List<Order> findByUserId(@Param("userId") Integer userId);
    Order findById(@Param("id") Integer id);
    List<OrderItem> findItemsByOrderId(@Param("orderId") Integer orderId);
}
