import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Injectable({ providedIn: 'root' })
export class MonitoringApiService {
  private readonly baseUrl = environment.apiUrl;

  constructor(private http: HttpClient) {}

  /** Appel simple : trace + log INFO côté backend */
  ping() {
    return this.http.get(`${this.baseUrl}/api/hello`);
  }

  /** Backend répond après un délai aléatoire (500-2000ms) : TTFB lent réel, tracé */
  triggerSlowBackend() {
    return this.http.get(`${this.baseUrl}/api/slow`);
  }

  /** Erreur 500 volontaire côté backend : span en erreur + log ERROR */
  triggerBackendError() {
    return this.http.get(`${this.baseUrl}/api/error`);
  }

  /** Route inexistante : vrai 404 backend (tracé), pas le 404 GitHub Pages */
  triggerNotFound() {
    return this.http.get(`${this.baseUrl}/api/route-inexistante`);
  }

  /** Envoie un Business Event custom à Dynatrace via le backend */
  sendBusinessEvent(eventType: string, payload: Record<string, unknown> = {}) {
    return this.http.post(`${this.baseUrl}/api/event`, { eventType, ...payload });
  }
}
