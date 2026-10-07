package com.example.employeepayroll.service;

import java.util.List;

import java.math.BigDecimal;
import org.springframework.stereotype.Service;

import com.example.employeepayroll.entity.SalaryRecord;
import com.example.employeepayroll.repository.SalaryRecordRepository;

@Service
public class SalaryRecordService {

    private final SalaryRecordRepository salaryRecordRepository;

    public SalaryRecordService(SalaryRecordRepository salaryRecordRepository) {
        this.salaryRecordRepository = salaryRecordRepository;
    }

    public List<SalaryRecord> getAllSalaryRecords() {
        return salaryRecordRepository.findAll();
    }

    public SalaryRecord getSalaryRecordById(Integer id) {
        return salaryRecordRepository.findById(id).orElse(null);
    }

    public SalaryRecord saveSalaryRecord(SalaryRecord salaryRecord) {
        return salaryRecordRepository.save(salaryRecord);
    }

    public void deleteSalaryRecord(Integer id) {
        salaryRecordRepository.deleteById(id);
    }
    public void generateSalary(
            Integer employeeId,
            BigDecimal basicSalary,
            BigDecimal allowance,
            BigDecimal deduction) {

        salaryRecordRepository.generateSalary(
                employeeId,
                basicSalary,
                allowance,
                deduction
        );
    }
    public BigDecimal calculateNetSalary(
            BigDecimal basicSalary,
            BigDecimal allowance,
            BigDecimal deduction) {

        return salaryRecordRepository.calculateNetSalary(
                basicSalary,
                allowance,
                deduction
        );
    }
}