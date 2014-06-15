class Thing { 
  float speedX, speedY;
  float size;
  int r, g, b;
  float freq;
  float pointValue;
  float foodValue;
  float centerX, centerY;

  Thing() {
  }

  void redraw() {
    fill(r, g, b);
    ellipse(centerX, centerY, size, size);
  }
}

