class Point {
  float x, y;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void dessiner() {
    point(x, y);
  }

  void deplacer(float nvX, float nvY) {
    x = nvX;
    y = nvY;
  }
}

void line(Point A, Point B) {
  line(A.x, A.y, B.x, B.y);
}
