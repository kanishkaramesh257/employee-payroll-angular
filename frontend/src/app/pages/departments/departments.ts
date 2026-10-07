import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../../services/api';

@Component({
  selector: 'app-departments',
  imports: [FormsModule],
  templateUrl: './departments.html',
  styleUrl: './departments.css'
})
export class Departments implements OnInit {

  departments: any[] = [];

  departmentName = '';
  editingId: number | null = null;
  showForm = false;

  constructor(
  private apiService: ApiService,
  private cdr: ChangeDetectorRef
) {
}

  ngOnInit(): void {
    this.loadDepartments();
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
    this.departmentName = '';
    this.editingId = null;
    this.showForm = true;
  }

  editDepartment(department: any): void {
    this.editingId = department.departmentId;
    this.departmentName = department.departmentName;
    this.showForm = true;
  }

  saveDepartment(): void {

    const department = {
      departmentName: this.departmentName
    };

    if (this.editingId === null) {

      this.apiService.addDepartment(department).subscribe({
        next: () => {
          this.loadDepartments();
          this.cancelForm();
        },
        error: (error) => {
          console.error('Error adding department:', error);
        }
      });

    } else {

      this.apiService.updateDepartment(this.editingId, department).subscribe({
        next: () => {
          this.loadDepartments();
          this.cancelForm();
        },
        error: (error) => {
          console.error('Error updating department:', error);
        }
      });

    }
  }

  deleteDepartment(id: number): void {

    const confirmed = confirm(
      'Are you sure you want to delete this department?'
    );

    if (!confirmed) {
      return;
    }

    this.apiService.deleteDepartment(id).subscribe({
      next: () => {
        this.loadDepartments();
      },
      error: (error) => {
        console.error('Error deleting department:', error);
        alert('Cannot delete this department because employees are assigned to it.');
      }
    });
  }

  cancelForm(): void {
    this.departmentName = '';
    this.editingId = null;
    this.showForm = false;
  }
}