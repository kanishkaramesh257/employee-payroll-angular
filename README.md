# Employee Payroll Management System

A web-based Employee Payroll Management System developed using Angular for the frontend, Spring Boot for the backend, and MySQL for database management.

## Problem Statement

Managing employee information, departments, salary records, and payroll manually can lead to duplicated or inconsistent data, calculation errors, and delays in preparing payroll reports. This project provides a centralized web application for maintaining employee and department records, generating salary information, and viewing payroll-related reports. It also preserves data integrity by preventing deletion of records that are still referenced by related data.

## Features

* Employee management

  * View employees
  * Add employees
  * Edit employees
  * Delete employees
* Department management

  * View departments
  * Add departments
  * Edit departments
  * Delete departments
* Salary management

  * View salary records
  * Generate employee salary
  * Calculate net salary
* Payroll management

  * Select employee
  * Enter basic salary, allowance, and deduction
  * Generate payroll successfully
* Reports

  * Employee salary details
  * Employees earning above department average
* Database relationship handling

  * Prevents deletion when related payroll records exist
  * Prevents deletion of departments assigned to employees

## Technologies Used

* Angular
* TypeScript
* HTML5
* CSS3
* Spring Boot
* Java
* MySQL
* REST API

## Project Architecture

```text
Angular Frontend
       |
       | REST API
       v
Spring Boot Backend
       |
       | JDBC / JPA
       v
MySQL Database
```

## Main Modules

```text
Dashboard
Employees
Departments
Salary Records
Payroll
Reports
```

## Running the Frontend

Make sure the Spring Boot backend and MySQL database are running first.

Then open a terminal in the Angular project folder and run:

```bash
npm start
```

The application runs on:

```text
http://localhost:4200
```

## Backend

The Angular application communicates with the Spring Boot backend through REST APIs running on:

```text
http://localhost:8082
```

## Payroll Generation

The Payroll module accepts:

* Employee
* Basic Salary
* Allowance
* Deduction

The salary is generated through the backend and stored in the MySQL database.

## Reports

The Reports module provides:

1. Employee salary details with department information.
2. Employees whose salary is above the average salary of their department.

## Validation and Data Integrity

The system maintains database relationships between employees, departments, and payroll records. Employees with existing salary history and departments containing employees cannot be deleted directly, preventing accidental loss of related payroll data.

## Author

Employee Payroll Management System Project
