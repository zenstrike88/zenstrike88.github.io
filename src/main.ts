import 'zone.js';
import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { AppComponent } from './app/app'; 
import { HttpClient, HttpHeaders } from '@angular/common/http';

// Dynatrace Angular 17+ instrumentation
if (typeof (window as any).dT_ !== 'undefined' && 
    (window as any).dT_.initAngularNg) {
  (window as any).dT_.initAngularNg(HttpClient, HttpHeaders);
}

bootstrapApplication(AppComponent, appConfig) 
  .catch((err) => console.error(err));

