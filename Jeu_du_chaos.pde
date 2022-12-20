Polygone polygone;
Point P;
int nbSommets;
boolean regulier;
boolean polygoneVisible;
float rapport;
int idCible = 0;
int ptsParSeconde;

void setup() {
  size(1000, 1000);
  background(0);

  //==================== Changez ces valeurs autant que vous voulez ! ====================
        nbSommets = 4; // à partir de 3
         regulier = true;
  polygoneVisible = false;
          rapport = 0.5; // r>0, flocon()
      restriction = pasOppose; // aucune, pas2fois, pasSuivant, pasACotePrec, pasOppose
    ptsParSeconde = 6000; // à partir de 60
  //======================================================================================

  polygone = new Polygone(nbSommets, regulier);
  P = new Point( polygone.sommets[0].x, polygone.sommets[0].y );
  if (polygoneVisible) {
    stroke(0, 150, 0);
    polygone.dessiner();
  }
  stroke(255);
}



void draw() {
  for (int i = 0; i < ptsParSeconde / 60; i++) {
    choisirCible();
    Point cible = polygone.sommets[idCible];

    // On déplace le point à une fraction donnée de la distance au sommet choisit
    P.deplacer( P.x + rapport * (cible.x - P.x),
                P.y + rapport * (cible.y - P.y) );
    P.dessiner();
  }
}



void mouseClicked() {
  saveFrame(nbSommets + " côtés, rapport " + rapport + strRestriction() +".png");
  println("Écran capturé !");
}



// fonction qui renvoie le r du n-gone de Sierpiński
float flocon(int n) {
  float somme = 0;
  for (int k = 1; k <= int(n/4); k++) {
    somme += cos(2 * PI * k / n);
  }
  return 1 - 1 / (2 * (1 + somme) );
}



// fonction qui retourne un entier au hasard
int randInt(int min, int max) {
  return int( random(min, max+1) );
}
int randInt(int max) {
  return randInt(0, max);
}
