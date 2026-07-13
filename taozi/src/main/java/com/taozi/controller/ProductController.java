package com.taozi.controller;

import com.taozi.entity.Category;
import com.taozi.entity.Product;
import com.taozi.entity.User;
import com.taozi.service.CategoryService;
import com.taozi.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/")
    public String index(@RequestParam(required = false) Integer categoryId, Model model, HttpSession session) {
        List<Category> categories = categoryService.findAll();
        List<Product> products;
        if (categoryId != null && categoryId > 0) {
            products = productService.findByCategoryId(categoryId);
        } else {
            products = productService.findAll();
        }
        model.addAttribute("categories", categories);
        model.addAttribute("products", products);
        model.addAttribute("currentCategoryId", categoryId);
        return "index";
    }

    @GetMapping("/product/detail")
    public String detail(@RequestParam Integer id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "product_detail";
    }
}
