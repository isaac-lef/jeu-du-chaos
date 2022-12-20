class Polygone {
  int nbSommets;
  Point[] sommets;

  Polygone(int nbSommets, boolean regulier) {
    this.nbSommets = nbSommets;
    sommets = new Point[nbSommets];

    if (regulier) {
      Point centre = new Point(width/2, height/2); // Centre du polygone
      float rCercle = min(width, height) / 2;      // rayon du cercle circonscrit au polygone

      // On met chaque point sur le cercle, à angle égal
      for (int i=0; i < nbSommets; i++) {
        float angle = TWO_PI / nbSommets * i - HALF_PI;
        sommets[i] = new Point( centre.x + cos(angle) * rCercle, centre.y + sin(angle) * rCercle );
      }
    }
    else {
      // polygone quelconque, sommets au hasard
      for (int i=0; i < nbSommets; i++) {
        sommets[i] = new Point( random(width), random(height) );
      }
    }
  }

  // si on veut entrer les coordonnées manuellement
  Polygone(float... coordonnees) {
    nbSommets = coordonnees.length / 2;
    sommets = new Point[nbSommets];

    for (int i=0; i < nbSommets; i++) {
      sommets[i] = new Point( coordonnees[i*2], coordonnees[i*2+1] );
    }
  }

  // fonction qui n'a servit qu'au développement
  void dessiner() {
    for (int i=0; i < nbSommets-1; i++) {
      line( sommets[i], sommets[i+1] );
    }
    line( sommets[nbSommets-1], sommets[0] );
  }
}
