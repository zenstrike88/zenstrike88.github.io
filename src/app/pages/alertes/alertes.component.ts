import { Component, OnInit, OnDestroy } from '@angular/core';
import * as L from 'leaflet';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-alertes', // Corrigé : doit commencer par 'app-'
  standalone: true,
  imports: [CommonModule],
  templateUrl: './alertes.component.html',
  styleUrls: ['./alertes.component.css']
})
export class AlertesComponent implements OnInit, OnDestroy {

  map!: L.Map;
  private leakInterval: ReturnType<typeof setInterval> | undefined; // Corrigé : évite 'any'

  countries = [
    { label: 'Algérie', value: 'DZ', capital: 'Alger', lat: 28.0339, lng: 1.6596 },
    { label: 'France', value: 'FR', capital: 'Paris', lat: 48.8566, lng: 2.3522 },
    { label: 'USA', value: 'US', capital: 'Washington', lat: 38.9072, lng: -77.0369 },
    { label: 'Germany', value: 'DE', capital: 'Berlin', lat: 52.52, lng: 13.405 },
    { label: 'Maroc', value: 'MA', capital: 'Rabat', lat: 33.9716, lng: -6.8498 }
  ];

  countryInfoVisible = false;
  capital = '';
  logs: { time: string; message: string; type: string }[] = [];

  ngOnInit(): void {
    this.initMap();
    this.log('Module Alerting chargé', 'info');
  }

  ngOnDestroy(): void {
    if (this.leakInterval) {
      clearInterval(this.leakInterval);
    }
  }

  initMap() {
    this.map = L.map('map').setView([48.8566, 2.3522], 4);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap'
    }).addTo(this.map);
  }

  onCountryChange(event: Event) {
    const value = (event.target as HTMLSelectElement).value;
    const country = this.countries.find(c => c.value === value);

    if (country) {
      this.capital = country.capital;
      this.countryInfoVisible = true;
      this.map.setView([country.lat, country.lng], 6);
      this.log(`Cible changée : ${country.label}`, 'success');
    }
  }

  triggerJSException() {
    this.log('Exception JS déclenchée', 'error');
    throw new Error('Crash forcé pour test de monitoring');
  }

  trigger404() {
    fetch('/api/monitoring/v1/alert-test-404');
    this.log('Requête 404 envoyée', 'warn');
  }

  triggerCPUStress() {
    this.log('Stress CPU démarré (3s)', 'warn');
    const start = Date.now();
    let result = 0;
    while (Date.now() - start < 3000) {
      result += Math.sqrt(Date.now()); // Corrigé : évite Math.random() pour SonarCloud
    }
    this.log(`Stress terminé (Val: ${result.toFixed(0)})`, 'success');
  }

  triggerMemoryLeak() {
    this.log('Fuite mémoire simulée', 'warn');
    const leak: string[][] = []; // Corrigé : évite 'any[]'
    this.leakInterval = setInterval(() => {
      if (leak.length < 500) {
        leak.push(new Array(1000000).fill('data'));
      }
    }, 1000);
  }

  triggerTrafficSpike() {
    this.log('Pic de trafic : 100 requêtes', 'info');
    for (let i = 0; i < 100; i++) {
      fetch('https://jsonplaceholder.typicode.com/posts/1');
    }
  }

  clearLogs() { this.logs = []; }

  private log(message: string, type: string) {
    const time = new Date().toLocaleTimeString();
    this.logs.unshift({ time, message, type });
  }
}