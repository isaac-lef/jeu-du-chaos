class Point {
  float x, y;
  
  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void dessiner() {
    point(x, y);
  }
}

Point milieu(Point A, Point B) {
  Point C = new Point( (A.x + B.x) / 2, (A.y + B.y) / 2);
  return C;
}
