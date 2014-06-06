class TestFish {
  float centerX, centerY;
  float size;
  int r, g, b;
  float speed;

  TestFish(int red, int green, int blue, float startX, float startY) {
    centerX = startX;
    centerY = startY;
    size = 10;
    speed = 60;
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

