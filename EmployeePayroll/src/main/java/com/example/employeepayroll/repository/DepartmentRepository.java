package com.example.employeepayroll.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.employeepayroll.entity.Department;

public interface DepartmentRepository extends JpaRepository<Department, Integer> {

}