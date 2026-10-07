import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  private baseUrl = 'http://localhost:8082/api';

  constructor(private http: HttpClient) {
  }

  getEmployees(): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrl}/employees`);
  }

  getDepartments(): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrl}/departments`);
  }

  addDepartment(department: any): Observable<any> {
    return this.http.post<any>(
      `${this.baseUrl}/departments`,
      department
    );
  }

  updateDepartment(id: number, department: any): Observable<any> {
    return this.http.put<any>(
      `${this.baseUrl}/departments/${id}`,
      department
    );
  }

  deleteDepartment(id: number): Observable<void> {
    return this.http.delete<void>(
      `${this.baseUrl}/departments/${id}`
    );
  }

  getSalaryRecords(): Observable<any[]> {
    return this.http.get<any[]>(`${this.baseUrl}/salaries`);
  }

  addSalaryRecord(salary: any): Observable<any> {
    return this.http.post<any>(
      `${this.baseUrl}/salaries`,
      salary
    );
  }

  updateSalaryRecord(id: number, salary: any): Observable<any> {
    return this.http.put<any>(
      `${this.baseUrl}/salaries/${id}`,
      salary
    );
  }

  deleteSalaryRecord(id: number): Observable<void> {
    return this.http.delete<void>(
      `${this.baseUrl}/salaries/${id}`
    );
  }

  addEmployee(employee: any): Observable<any> {
    return this.http.post<any>(
      `${this.baseUrl}/employees`,
      employee
    );
  }

  updateEmployee(id: number, employee: any): Observable<any> {
    return this.http.put<any>(
      `${this.baseUrl}/employees/${id}`,
      employee
    );
  }

  deleteEmployee(id: number): Observable<void> {
    return this.http.delete<void>(
      `${this.baseUrl}/employees/${id}`
    );
  }

  generateSalary(
    employeeId: number,
    basicSalary: number,
    allowance: number,
    deduction: number
  ): Observable<any> {

    return this.http.post(
      `${this.baseUrl}/salaries/generate`,
      null,
      {
        params: {
          employeeId: employeeId,
          basicSalary: basicSalary,
          allowance: allowance,
          deduction: deduction
        },
        responseType: 'text'
      }
    );
  }
  getEmployeeSalaryDetails(): Observable<any[]> {
  return this.http.get<any[]>(
    `${this.baseUrl}/employees/salary-details`
  );
}

getEmployeesAboveDepartmentAverage(): Observable<any[]> {
  return this.http.get<any[]>(
    `${this.baseUrl}/employees/above-department-average`
  );
}
}