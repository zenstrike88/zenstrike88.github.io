import { Component, ViewChild, ElementRef } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MonitoringApiService } from '../../services/monitoring-api.service';

@Component({
  selector: 'app-performance', // Corrigé : 'ardian-monitoring-performance' -> 'app-performance'
  standalone: true,
  imports: [CommonModule],
  templateUrl: './performance.html',
  styleUrls: ['./performance.css']
})
export class PerformanceComponent {

  constructor(private api: MonitoringApiService) {}

  @ViewChild('monitorVideo') videoElement!: ElementRef<HTMLVideoElement>;

  slowImageSrc = '';
  imageLoaded = false;
  layoutShiftActive = false;
  isNetworkLoading = false;
  interactionFeedback = '';

  triggerSlowLCP(): void {
    this.imageLoaded = false;
    this.slowImageSrc = '';
    const highResUrl = 'https://upload.wikimedia.org/wikipedia/commons/3/3f/Telefoto_800mm.jpg';
    this.slowImageSrc = `${highResUrl}?t=${Date.now()}`;
  }

  triggerLayoutShift(): void {
    this.layoutShiftActive = false;
    setTimeout(() => {
      this.layoutShiftActive = true;
    }, 1500);
  }

  triggerNetworkDelay(): void {
    // Avant : httpbin.org/delay/5, service externe non tracé.
    // Maintenant : notre backend /api/slow (500-2000ms) -> vrai TTFB lent,
    // tracé de bout en bout et corrélé à la session RUM dans Dynatrace.
    this.isNetworkLoading = true;
    this.api.triggerSlowBackend().subscribe({
      next: () => (this.isNetworkLoading = false),
      error: () => (this.isNetworkLoading = false),
    });
  }

  triggerInteractionDelay(): void {
    this.interactionFeedback = 'Calcul en cours... (Thread bloqué)';
    const start = Date.now();
    let result = 0; // Ajout d'une variable pour stocker le calcul

    while (Date.now() - start < 500) {
      result += Math.sqrt(Date.now()); // On utilise le retour de sqrt !
    }

    // On utilise la variable pour que SonarCloud ne crie pas au code inutile
    console.debug(`Stress test terminé avec le résultat : ${result}`);

    this.interactionFeedback = 'Action terminée après 500ms.';
    setTimeout(() => this.interactionFeedback = '', 3000);
  }

  triggerVideoError(): void {
    if (this.videoElement) {
      const video = this.videoElement.nativeElement;
      video.src = 'https://invalid-source-url.mp4/error';
      video.load();
    }
  }

  triggerResourceError(): void {
    const img = new Image();
    img.src = '/assets/images/non-existent-icon.png';
  }
}