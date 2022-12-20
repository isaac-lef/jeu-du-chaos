// Changez ces variables autant que vous voulez
final int nbSommets = 3;
final boolean regulier = true;
final float rapport = 0.5;

Polygone polygone;
Point P;

void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  frameRate(200);

  polygone = new Polygone(nbSommets, regulier);
  P = new Point( random(width), random(height) );
}

void draw() {
  // On choisit un sommet au hasard
  int idCible = randInt(polygone.nbSommets - 1);
  Point cible = polygone.sommets[idCible];
  
  // On déplace le point à une fraction donnée de la distance au sommet choisit
  P.deplacer( P.x + rapport * (cible.x - P.x),
              P.y + rapport * (cible.y - P.y) );
  P.dessiner();
}


// fonction qui retourne un entier au hasard
int randInt(int min, int max) {
  return int( random(min, max+1) );
}
int randInt(int max) {
  return randInt(0, max);
}
