import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { ApiService } from '../../services/api';

@Component({
  selector: 'app-salaries',
  imports: [],
  templateUrl: './salaries.html',
  styleUrl: './salaries.css'
})
export class Salaries implements OnInit {

  salaryRecords: any[] = [];

  constructor(
  private apiService: ApiService,
  private cdr: ChangeDetectorRef
) {
}

  ngOnInit(): void {
    this.loadSalaryRecords();
  }

  loadSalaryRecords(): void {
    this.apiService.getSalaryRecords().subscribe({
      next: (data) => {
  
  this.salaryRecords = data;
  this.cdr.detectChanges();
},
      error: (error) => {
        console.error('Error loading salary records:', error);
      }
    });
  }
}