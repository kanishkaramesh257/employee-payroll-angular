import { Routes } from '@angular/router';

import { Dashboard } from './pages/dashboard/dashboard';
import { Employees } from './pages/employees/employees';
import { Departments } from './pages/departments/departments';
import { Salaries } from './pages/salaries/salaries';
import { Payroll } from './pages/payroll/payroll';
import { Reports } from './pages/reports/reports';

export const routes: Routes = [
  { path: '', redirectTo: 'dashboard', pathMatch: 'full' },
  { path: 'dashboard', component: Dashboard },
  { path: 'employees', component: Employees },
  { path: 'departments', component: Departments },
  { path: 'salaries', component: Salaries },
  { path: 'payroll', component: Payroll },
  { path: 'reports', component: Reports }
];