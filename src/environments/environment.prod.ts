export const environment = {
  production: true,
  // ⚠️ Le backend n'est pas hébergé sur GitHub Pages (statique uniquement).
  // Tant qu'il tourne seulement en local (docker compose up), ce build de prod
  // sur GitHub Pages ne pourra pas l'atteindre depuis un poste distant.
  // Remplace cette valeur par l'URL publique de ton backend une fois déployé
  // (VM/conteneur exposé via ton infra Terraform, tunnel ngrok, etc.).
  apiUrl: 'http://localhost:3000',
};
