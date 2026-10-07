package com.example.employeepayroll.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.employeepayroll.entity.Employee;
import com.example.employeepayroll.repository.EmployeeRepository;

@Service
public class EmployeeService {

    private final EmployeeRepository employeeRepository;

    public EmployeeService(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    public Employee getEmployeeById(Integer id) {
        return employeeRepository.findById(id).orElse(null);
    }

    public Employee saveEmployee(Employee employee) {
        return employeeRepository.save(employee);
    }

    public void deleteEmployee(Integer id) {
        employeeRepository.deleteById(id);
    }
    public List<Object[]> getEmployeeSalaryWithDepartment() {
        return employeeRepository.getEmployeeSalaryWithDepartment();
    }

    public List<Object[]> getEmployeesAboveDepartmentAverage() {
        return employeeRepository.findEmployeesAboveDepartmentAverage();
    }
}