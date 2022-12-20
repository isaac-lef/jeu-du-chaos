// Cliquez pour prendre une capture d'écran
// Changez ces variables autant que vous voulez
final int nbSommets = 7;
final boolean regulier = true;
final boolean polygoneVisible = false;
final float rapport = 0.7;

Polygone polygone;
Point P;

void setup() {
  size(1000, 1000);
  background(0);
  stroke(255);
  frameRate(200);

  polygone = new Polygone(nbSommets, regulier);
  P = new Point( polygone.sommets[0].x, polygone.sommets[0].y );
  
  if (polygoneVisible) {
    polygone.dessiner();
  }
}



void draw() {
  for (int k = 0; k < 100; k++) {
  // On choisit un sommet au hasard
  int idCible = randInt(polygone.nbSommets - 1);
  Point cible = polygone.sommets[idCible];
  
  // On déplace le point à une fraction donnée de la distance au sommet choisit
  P.deplacer( P.x + rapport * (cible.x - P.x),
              P.y + rapport * (cible.y - P.y) );
  P.dessiner();
  }
}



void mouseClicked() {
  saveFrame(nbSommets + " côtés, rapport " + rapport +".png");
  println("Écran capturé !");
}



// fonction qui retourne un entier au hasard
int randInt(int min, int max) {
  return int( random(min, max+1) );
}
int randInt(int max) {
  return randInt(0, max);
}
