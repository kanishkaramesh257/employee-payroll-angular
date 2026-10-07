package com.example.employeepayroll.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.employeepayroll.entity.Allowance;

public interface AllowanceRepository extends JpaRepository<Allowance, Integer> {

}