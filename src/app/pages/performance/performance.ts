import { Component, ViewChild, ElementRef } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-performance', // Corrigé : 'ardian-monitoring-performance' -> 'app-performance'
  standalone: true,
  imports: [CommonModule],
  templateUrl: './performance.html',
  styleUrls: ['./performance.css']
})
export class PerformanceComponent {

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
    this.isNetworkLoading = true;
    fetch('https://httpbin.org/delay/5')
      .then(response => {
        if (!response.ok) throw new Error('Délai expiré');
        this.isNetworkLoading = false;
      })
      .catch(() => {
        this.isNetworkLoading = false;
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