package com.taozi.controller;

import com.taozi.entity.Category;
import com.taozi.entity.Product;
import com.taozi.entity.User;
import com.taozi.service.CategoryService;
import com.taozi.service.ProductService;
import com.taozi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UserService userService;

    @GetMapping("")
    public String index() {
        return "admin/index";
    }

    // ========== 商品管理 ==========

    @GetMapping("/product/list")
    public String productList(Model model) {
        model.addAttribute("products", productService.findAll());
        return "admin/product_list";
    }

    @GetMapping("/product/add")
    public String productAddPage(Model model) {
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("product", new Product());
        return "admin/product_form";
    }

    @GetMapping("/product/edit")
    public String productEditPage(@RequestParam Integer id, Model model) {
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("product", productService.findById(id));
        return "admin/product_form";
    }

    @PostMapping("/product/save")
    public String productSave(Product product, RedirectAttributes ra) {
        productService.save(product);
        ra.addFlashAttribute("msg", "保存成功");
        return "redirect:/admin/product/list";
    }

    @GetMapping("/product/delete")
    public String productDelete(@RequestParam Integer id, RedirectAttributes ra) {
        productService.delete(id);
        ra.addFlashAttribute("msg", "删除成功");
        return "redirect:/admin/product/list";
    }

    // ========== 客户管理 ==========

    @GetMapping("/customer/list")
    public String customerList(Model model) {
        model.addAttribute("users", userService.findAll());
        return "admin/customer_list";
    }

    @GetMapping("/customer/add")
    public String customerAddPage(Model model) {
        model.addAttribute("user", new User());
        return "admin/customer_form";
    }

    @GetMapping("/customer/edit")
    public String customerEditPage(@RequestParam Integer id, Model model) {
        model.addAttribute("user", userService.findById(id));
        return "admin/customer_form";
    }

    @PostMapping("/customer/save")
    public String customerSave(User user, RedirectAttributes ra) {
        if (user.getId() == null) {
            try {
                userService.register(user);
            } catch (RuntimeException e) {
                ra.addFlashAttribute("error", e.getMessage());
                return "redirect:/admin/customer/list";
            }
        } else {
            userService.update(user);
        }
        ra.addFlashAttribute("msg", "保存成功");
        return "redirect:/admin/customer/list";
    }

    @GetMapping("/customer/delete")
    public String customerDelete(@RequestParam Integer id, RedirectAttributes ra) {
        userService.delete(id);
        ra.addFlashAttribute("msg", "删除成功");
        return "redirect:/admin/customer/list";
    }

    // ========== 分类管理 ==========

    @GetMapping("/category/list")
    public String categoryList(Model model) {
        model.addAttribute("categories", categoryService.findAll());
        return "admin/category_list";
    }

    @PostMapping("/category/save")
    public String categorySave(Category category, RedirectAttributes ra) {
        categoryService.save(category);
        ra.addFlashAttribute("msg", "保存成功");
        return "redirect:/admin/category/list";
    }

    @GetMapping("/category/delete")
    public String categoryDelete(@RequestParam Integer id, RedirectAttributes ra) {
        categoryService.delete(id);
        ra.addFlashAttribute("msg", "删除成功");
        return "redirect:/admin/category/list";
    }
}
