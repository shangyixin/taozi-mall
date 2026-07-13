package com.taozi.controller;

import com.taozi.entity.Order;
import com.taozi.entity.User;
import com.taozi.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    private Integer getUserId(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            throw new RuntimeException("请先登录");
        }
        return user.getId();
    }

    @PostMapping("/order/checkout")
    public String checkout(HttpSession session, RedirectAttributes ra) {
        try {
            Order order = orderService.createOrder(getUserId(session));
            ra.addFlashAttribute("msg", "下单成功，订单号：" + order.getOrderNo());
        } catch (RuntimeException e) {
            ra.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/order/list";
    }

    @GetMapping("/order/list")
    public String list(HttpSession session, Model model) {
        try {
            List<Order> orders = orderService.getUserOrders(getUserId(session));
            model.addAttribute("orders", orders);
        } catch (RuntimeException e) {
            return "redirect:/login";
        }
        return "order_list";
    }

    @GetMapping("/order/detail")
    public String detail(@RequestParam Integer id, HttpSession session, Model model) {
        try {
            getUserId(session);
            Order order = orderService.getOrderDetail(id);
            model.addAttribute("order", order);
        } catch (RuntimeException e) {
            return "redirect:/login";
        }
        return "order_detail";
    }
}
