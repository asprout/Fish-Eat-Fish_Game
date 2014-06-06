class TestFish {
  float centerX, centerY;
  float size;
  int r, g, b;
  float speed;

  TestFish(int red, int green, int blue, float startX, float startY, int size, int speed) {
    centerX = startX;
    centerY = startY;
    this.size = size;
    this.speed = speed;
    r = red;
    g = green;
    b = blue;
    redraw();
  }
  void update() {
    centerX += speed/frameRate;
    redraw();
  }
  void redraw() {
    fill(r, g, b);
    ellipse(centerX, centerY, size, size);
  }    

  void die() {
  }
  float getX() {
    return centerX;
  }

  float getY() {
    return centerY;
  }

  float getSize() {
    return size;
  }
}

