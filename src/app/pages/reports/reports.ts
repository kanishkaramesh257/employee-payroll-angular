import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ApiService } from '../../services/api';

@Component({
  selector: 'app-reports',
  imports: [],
  templateUrl: './reports.html',
  styleUrl: './reports.css'
})
export class Reports implements OnInit {

  salaryDetails: any[] = [];
  aboveAverageEmployees: any[] = [];

  constructor(
    private apiService: ApiService,
    private cdr: ChangeDetectorRef
  ) {
  }

  ngOnInit(): void {
    this.loadSalaryDetails();
    this.loadAboveAverageEmployees();
  }

  loadSalaryDetails(): void {
    this.apiService.getEmployeeSalaryDetails().subscribe({
      next: (data) => {
        this.salaryDetails = data;
        this.cdr.detectChanges();
      },
      error: (error) => {
        console.error('Error loading salary details:', error);
      }
    });
  }

  loadAboveAverageEmployees(): void {
    this.apiService.getEmployeesAboveDepartmentAverage().subscribe({
      next: (data) => {
        this.aboveAverageEmployees = data;
        this.cdr.detectChanges();
      },
      error: (error) => {
        console.error('Error loading above-average employees:', error);
      }
    });
  }
}