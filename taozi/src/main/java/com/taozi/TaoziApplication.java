package com.taozi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.taozi.mapper")
public class TaoziApplication {
    public static void main(String[] args) {
        SpringApplication.run(TaoziApplication.class, args);
    }
}
