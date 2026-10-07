package com.example.employeepayroll.repository;

import java.math.BigDecimal;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.employeepayroll.entity.SalaryRecord;

public interface SalaryRecordRepository extends JpaRepository<SalaryRecord, Integer> {

    @Procedure(procedureName = "generate_salary")
    void generateSalary(
            Integer employeeId,
            BigDecimal basicSalary,
            BigDecimal allowance,
            BigDecimal deduction
    );
    @Query(value = """
    	    SELECT calculate_net_salary(
    	        :basicSalary,
    	        :allowance,
    	        :deduction
    	    )
    	    """, nativeQuery = true)
    	BigDecimal calculateNetSalary(
    	        @Param("basicSalary") BigDecimal basicSalary,
    	        @Param("allowance") BigDecimal allowance,
    	        @Param("deduction") BigDecimal deduction
    	);
}