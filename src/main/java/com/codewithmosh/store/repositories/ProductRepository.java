package com.codewithmosh.store.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.codewithmosh.store.entities.Product;


public interface ProductRepository extends JpaRepository<Product, Long> {
    @EntityGraph(attributePaths="category")
    List<Product> findByCategoryId(Byte category);

    @EntityGraph(attributePaths="category")
    @Query("SELECT p FROM Product p")
    List<Product> findAllWithCategory();
}