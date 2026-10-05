import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../../services/api';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-employees',
  imports: [CommonModule, FormsModule],
  templateUrl: './employees.html',
  styleUrl: './employees.css'
})
export class Employees implements OnInit {

  employees: any[] = [];
  departments: any[] = [];

  employeeName = '';
  email = '';
  phone = '';
  departmentId: number | null = null;

  editingId: number | null = null;
  showForm = false;

  constructor(
  private apiService: ApiService,
  private cdr: ChangeDetectorRef
) {
}

  ngOnInit(): void {
    this.loadEmployees();
    this.loadDepartments();
  }

  loadEmployees(): void {
  this.apiService.getEmployees().subscribe({
    next: (data) => {
  
  this.employees = data;
  this.cdr.detectChanges();
},
    error: (error) => {
      console.error('Error loading employees:', error);
    }
  });
}

  loadDepartments(): void {
    this.apiService.getDepartments().subscribe({
      next: (data) => {
  
  this.departments = data;
  this.cdr.detectChanges();
},
      error: (error) => {
        console.error('Error loading departments:', error);
      }
    });
  }

  openAddForm(): void {
    this.clearForm();
    this.showForm = true;
  }

  editEmployee(employee: any): void {
    this.editingId = employee.employeeId;
    this.employeeName = employee.employeeName;
    this.email = employee.email || '';
    this.phone = employee.phone || '';
    this.departmentId = employee.department?.departmentId || null;
    this.showForm = true;
  }

  saveEmployee(): void {

    const employee = {
      employeeName: this.employeeName,
      email: this.email,
      phone: this.phone,
      department: {
        departmentId: this.departmentId
      }
    };

    if (this.editingId === null) {

      this.apiService.addEmployee(employee).subscribe({
        next: () => {
          this.loadEmployees();
          this.clearForm();
          this.showForm = false;
        },
        error: (error) => {
          console.error('Error adding employee:', error);
        }
      });

    } else {

      this.apiService.updateEmployee(this.editingId, employee).subscribe({
        next: () => {
          this.loadEmployees();
          this.clearForm();
          this.showForm = false;
        },
        error: (error) => {
          console.error('Error updating employee:', error);
        }
      });
    }
  }

  deleteEmployee(id: number): void {

    const confirmed = confirm('Are you sure you want to delete this employee?');

    if (!confirmed) {
      return;
    }

    this.apiService.deleteEmployee(id).subscribe({
      next: () => {
        this.loadEmployees();
      },
      error: (error) => {
        console.error('Error deleting employee:', error);
        alert('Cannot delete this employee because salary records exist for this employee.');
      }
    });
  }

  clearForm(): void {
    this.employeeName = '';
    this.email = '';
    this.phone = '';
    this.departmentId = null;
    this.editingId = null;
  }

  cancelForm(): void {
    this.clearForm();
    this.showForm = false;
  }
}