package com.example.employeepayroll.controller;

import java.util.List;

import org.springframework.web.bind.annotation.*;

import com.example.employeepayroll.entity.Employee;
import com.example.employeepayroll.service.EmployeeService;

@RestController
@RequestMapping("/api/employees")
public class EmployeeController {

    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping
    public List<Employee> getAllEmployees() {
        return employeeService.getAllEmployees();
    }

    @GetMapping("/{id}")
    public Employee getEmployeeById(@PathVariable Integer id) {
        return employeeService.getEmployeeById(id);
    }

    @PostMapping
    public Employee addEmployee(@RequestBody Employee employee) {
        return employeeService.saveEmployee(employee);
    }

    @PutMapping("/{id}")
    public Employee updateEmployee(
            @PathVariable Integer id,
            @RequestBody Employee employee) {

        employee.setEmployeeId(id);
        return employeeService.saveEmployee(employee);
    }

    @DeleteMapping("/{id}")
    public void deleteEmployee(@PathVariable Integer id) {
        employeeService.deleteEmployee(id);
    }
    
    @GetMapping("/salary-details")
    public List<Object[]> getEmployeeSalaryWithDepartment() {
        return employeeService.getEmployeeSalaryWithDepartment();
    }

    @GetMapping("/above-department-average")
    public List<Object[]> getEmployeesAboveDepartmentAverage() {
        return employeeService.getEmployeesAboveDepartmentAverage();
    }
}