package com.example.employeepayroll.controller;

import java.util.List;

import org.springframework.web.bind.annotation.*;

import com.example.employeepayroll.entity.Allowance;
import com.example.employeepayroll.service.AllowanceService;

@RestController
@RequestMapping("/api/allowances")
public class AllowanceController {

    private final AllowanceService allowanceService;

    public AllowanceController(AllowanceService allowanceService) {
        this.allowanceService = allowanceService;
    }

    @GetMapping
    public List<Allowance> getAllAllowances() {
        return allowanceService.getAllAllowances();
    }

    @GetMapping("/{id}")
    public Allowance getAllowanceById(@PathVariable Integer id) {
        return allowanceService.getAllowanceById(id);
    }

    @PostMapping
    public Allowance addAllowance(@RequestBody Allowance allowance) {
        return allowanceService.saveAllowance(allowance);
    }

    @PutMapping("/{id}")
    public Allowance updateAllowance(
            @PathVariable Integer id,
            @RequestBody Allowance allowance) {

        allowance.setAllowanceId(id);
        return allowanceService.saveAllowance(allowance);
    }

    @DeleteMapping("/{id}")
    public void deleteAllowance(@PathVariable Integer id) {
        allowanceService.deleteAllowance(id);
    }
}