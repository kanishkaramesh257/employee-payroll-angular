package com.example.employeepayroll.controller;

import java.util.List;
import java.math.BigDecimal;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.*;

import com.example.employeepayroll.entity.SalaryRecord;
import com.example.employeepayroll.service.SalaryRecordService;

@RestController
@RequestMapping("/api/salaries")
public class SalaryRecordController {

    private final SalaryRecordService salaryRecordService;

    public SalaryRecordController(SalaryRecordService salaryRecordService) {
        this.salaryRecordService = salaryRecordService;
    }

    @GetMapping
    public List<SalaryRecord> getAllSalaryRecords() {
        return salaryRecordService.getAllSalaryRecords();
    }

    @GetMapping("/{id}")
    public SalaryRecord getSalaryRecordById(@PathVariable Integer id) {
        return salaryRecordService.getSalaryRecordById(id);
    }

    @PostMapping
    public SalaryRecord addSalaryRecord(@RequestBody SalaryRecord salaryRecord) {
        return salaryRecordService.saveSalaryRecord(salaryRecord);
    }

    @PutMapping("/{id}")
    public SalaryRecord updateSalaryRecord(
            @PathVariable Integer id,
            @RequestBody SalaryRecord salaryRecord) {

        salaryRecord.setSalaryId(id);
        return salaryRecordService.saveSalaryRecord(salaryRecord);
    }

    @DeleteMapping("/{id}")
    public void deleteSalaryRecord(@PathVariable Integer id) {
        salaryRecordService.deleteSalaryRecord(id);
    }
    
    @PostMapping("/generate")
    public String generateSalary(
            @RequestParam Integer employeeId,
            @RequestParam BigDecimal basicSalary,
            @RequestParam BigDecimal allowance,
            @RequestParam BigDecimal deduction) {

        salaryRecordService.generateSalary(
                employeeId,
                basicSalary,
                allowance,
                deduction
        );

        return "Salary generated successfully";
    }
    @GetMapping("/calculate-net-salary")
    public BigDecimal calculateNetSalary(
            @RequestParam BigDecimal basicSalary,
            @RequestParam BigDecimal allowance,
            @RequestParam BigDecimal deduction) {

        return salaryRecordService.calculateNetSalary(
                basicSalary,
                allowance,
                deduction
        );
    }
}