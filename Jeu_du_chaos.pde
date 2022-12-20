Point[] sommets = new Point[3];
Point P;

void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  frameRate(200);

  sommets[0] = new Point(width/2, 0     );
  sommets[1] = new Point(0,       height);
  sommets[2] = new Point(width,   height);
  P = new Point(width/2, 0);
}

void draw() {
  P = milieu(P, sommets[ randInt(sommets.length-1) ] );
  P.dessiner();
}



int randInt(int min, int max) {
  return int( random(min, max+1) );
}
int randInt(int max) {
  return randInt(0, max);
}
