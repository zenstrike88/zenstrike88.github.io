import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-accueil',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './accueil.html', // Corrigé selon ton nom de fichier
  styleUrl: './accueil.css',     // Corrigé selon ton nom de fichier
})
export class AccueilComponent { 
  title = "ITOps Monitoring Hub";
  company = "Ardian";

  // Tu pourrais ajouter une fonction ici plus tard
  logNavigation(target: string) {
    console.log(`Navigation vers ${target} initiée`);
  }
}

