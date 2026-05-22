import { Routes } from '@angular/router';
import { AccueilComponent } from './pages/accueil/accueil';
import { AlertesComponent } from './pages/alertes/alertes.component';
import { PerformanceComponent } from './pages/performance/performance'; 

export const routes: Routes = [
  { path: '', redirectTo: 'accueil', pathMatch: 'full' },
  { path: 'accueil', component: AccueilComponent },
  { path: 'alertes', component: AlertesComponent },
  { path: 'performance', component: PerformanceComponent }
];