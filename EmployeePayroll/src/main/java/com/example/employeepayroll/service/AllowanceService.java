package com.example.employeepayroll.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.employeepayroll.entity.Allowance;
import com.example.employeepayroll.repository.AllowanceRepository;

@Service
public class AllowanceService {

    private final AllowanceRepository allowanceRepository;

    public AllowanceService(AllowanceRepository allowanceRepository) {
        this.allowanceRepository = allowanceRepository;
    }

    public List<Allowance> getAllAllowances() {
        return allowanceRepository.findAll();
    }

    public Allowance getAllowanceById(Integer id) {
        return allowanceRepository.findById(id).orElse(null);
    }

    public Allowance saveAllowance(Allowance allowance) {
        return allowanceRepository.save(allowance);
    }

    public void deleteAllowance(Integer id) {
        allowanceRepository.deleteById(id);
    }
}