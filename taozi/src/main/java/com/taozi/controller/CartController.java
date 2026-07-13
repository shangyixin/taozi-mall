package com.taozi.controller;

import com.taozi.entity.CartItem;
import com.taozi.entity.User;
import com.taozi.service.CartService;
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
public class CartController {

    @Autowired
    private CartService cartService;

    private Integer getUserId(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            throw new RuntimeException("请先登录");
        }
        return user.getId();
    }

    @GetMapping("/cart")
    public String list(HttpSession session, Model model) {
        try {
            List<CartItem> items = cartService.getCartItems(getUserId(session));
            model.addAttribute("items", items);
        } catch (RuntimeException e) {
            return "redirect:/login";
        }
        return "cart";
    }

    @PostMapping("/cart/add")
    public String add(@RequestParam Integer productId, HttpSession session, RedirectAttributes ra) {
        try {
            cartService.addToCart(getUserId(session), productId);
            ra.addFlashAttribute("msg", "已加入购物车");
        } catch (RuntimeException e) {
            return "redirect:/login";
        }
        return "redirect:/cart";
    }

    @PostMapping("/cart/update")
    public String update(@RequestParam Integer id, @RequestParam Integer quantity, HttpSession session) {
        try {
            getUserId(session);
            cartService.updateQuantity(id, quantity);
        } catch (RuntimeException e) {
            return "redirect:/login";
        }
        return "redirect:/cart";
    }

    @GetMapping("/cart/delete")
    public String delete(@RequestParam Integer id, HttpSession session) {
        try {
            getUserId(session);
            cartService.remove(id);
        } catch (RuntimeException e) {
            return "redirect:/login";
        }
        return "redirect:/cart";
    }
}
