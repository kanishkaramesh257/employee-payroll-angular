import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../../services/api';

@Component({
  selector: 'app-payroll',
  imports: [FormsModule],
  templateUrl: './payroll.html',
  styleUrl: './payroll.css'
})
export class Payroll implements OnInit {

  employees: any[] = [];

  employeeId: number | null = null;
  basicSalary: number | null = null;
  allowance: number | null = null;
  deduction: number | null = null;

  message = '';
  errorMessage = '';

  constructor(
    private apiService: ApiService,
    private cdr: ChangeDetectorRef
  ) {
  }

  ngOnInit(): void {
    this.loadEmployees();
  }

  loadEmployees(): void {
    this.apiService.getEmployees().subscribe({
      next: (data) => {
        this.employees = data;
        this.cdr.detectChanges();
      },
      error: (error) => {
        console.error('Error loading employees:', error);
        this.errorMessage = 'Unable to load employees.';
      }
    });
  }

  generateSalary(): void {

    this.message = '';
    this.errorMessage = '';

    if (
      this.employeeId === null ||
      this.basicSalary === null ||
      this.allowance === null ||
      this.deduction === null
    ) {
      this.errorMessage = 'Please fill in all the fields.';
      this.cdr.detectChanges();
      return;
    }

    this.apiService.generateSalary(
      this.employeeId,
      this.basicSalary,
      this.allowance,
      this.deduction
    ).subscribe({
      next: (response) => {
        this.message = response;
        this.clearForm();
        this.cdr.detectChanges();
      },
      error: (error) => {
        console.error('Error generating salary:', error);
        this.errorMessage = 'Unable to generate salary.';
        this.cdr.detectChanges();
      }
    });
  }

  clearForm(): void {
    this.employeeId = null;
    this.basicSalary = null;
    this.allowance = null;
    this.deduction = null;
  }
}