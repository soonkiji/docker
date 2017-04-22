package com.demo.repository;

import com.demo.entity.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context-test.xml"})
public class ProductRepositoryTest {

    @Autowired
    ProductRepository productRepository;

    @Test
    public void testFindAll() {
        List<Product> productList = productRepository.findAll();
        for (Product product : productList) {
            System.out.println(product);
        }
    }
}