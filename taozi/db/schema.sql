-- ============================================
-- 桃子商城 数据库初始化脚本
-- ============================================

CREATE DATABASE IF NOT EXISTS taozi_mall DEFAULT CHARACTER SET utf8mb4;
USE taozi_mall;

-- 用户表
DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS cart_item;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    role INT DEFAULT 0 COMMENT '0=普通用户, 1=管理员',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 商品分类表
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(200)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 商品表
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    image VARCHAR(200),
    category_id INT,
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES category(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 购物车表
CREATE TABLE cart_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES `user`(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 订单表
CREATE TABLE `order` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_no VARCHAR(32) NOT NULL UNIQUE,
    user_id INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status INT DEFAULT 0 COMMENT '0=待发货, 1=已发货, 2=已完成',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES `user`(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 订单明细表
CREATE TABLE order_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `order`(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 初始数据
INSERT INTO `user` (username, password, email, role) VALUES
('admin', '123456', 'admin@taozi.com', 1),
('test', '123456', 'test@taozi.com', 0);

INSERT INTO category (name, description) VALUES
('图书', '各类书籍'),
('电子产品', '手机、电脑等'),
('服装', '男女服装'),
('家居', '家居用品');

INSERT INTO product (name, description, price, stock, category_id) VALUES
('Java编程思想', '经典Java学习书籍', 79.00, 100, 1),
('SpringBoot实战', 'SpringBoot框架入门到精通', 59.00, 80, 1),
('无线鼠标', '静音无线鼠标', 39.90, 200, 2),
('机械键盘', '青轴机械键盘', 199.00, 50, 2),
('男士T恤', '纯棉短袖T恤', 49.00, 150, 3),
('休闲长裤', '春秋款休闲长裤', 89.00, 100, 3),
('台灯', 'LED护眼台灯', 69.00, 60, 4),
('抱枕', '柔软抱枕靠垫', 29.90, 120, 4);
