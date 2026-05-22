import { ComponentFixture, TestBed } from '@angular/core/testing';
import { AccueilComponent } from './accueil'; // Import corrigé
import { RouterTestingModule } from '@angular/router/testing'; // Ajouté pour gérer les routerLink

describe('AccueilComponent', () => {
  let component: AccueilComponent;
  let fixture: ComponentFixture<AccueilComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      // On importe AccueilComponent et RouterTestingModule
      imports: [AccueilComponent, RouterTestingModule]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AccueilComponent);
    component = fixture.componentInstance;
    fixture.detectChanges(); // Déclenche la détection de changements initiale
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});