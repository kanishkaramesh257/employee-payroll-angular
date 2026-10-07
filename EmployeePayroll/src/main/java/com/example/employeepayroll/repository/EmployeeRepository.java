package com.example.employeepayroll.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.employeepayroll.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

    @Query("""
        SELECT e.employeeId,
               e.employeeName,
               d.departmentName,
               s.basicSalary,
               s.allowanceAmount,
               s.deduction,
               s.netSalary,
               s.salaryDate
        FROM Employee e
        JOIN e.department d
        JOIN SalaryRecord s ON s.employee = e
        """)
    List<Object[]> getEmployeeSalaryWithDepartment();

    @Query("""
        SELECT e.employeeId,
               e.employeeName,
               d.departmentName,
               s.basicSalary
        FROM Employee e
        JOIN e.department d
        JOIN SalaryRecord s ON s.employee = e
        WHERE s.basicSalary > (
            SELECT AVG(s2.basicSalary)
            FROM SalaryRecord s2
            JOIN s2.employee e2
            WHERE e2.department = e.department
        )
        """)
    List<Object[]> findEmployeesAboveDepartmentAverage();
}