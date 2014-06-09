class TestFish {
  float centerX, centerY;
  float size;
  int r, g, b;
  float speedX;
  float speedY;
  int dirX, dirY;
  boolean smaller;

  TestFish(int red, int green, int blue, float startX, float startY, int size, int speed) {
    centerX = startX;
    centerY = startY;
    this.size = size;
    this.speedX = speed;
    speedY = 0;
    if (startX < width/2)
      dirX = 1;
    else
      dirX = -1;
    if (startY < height/2)
      dirY = 1;
    else
      dirY = -1;
    r = red;
    g = green;
    b = blue;
    redraw();
  }

  void update(Player p) {
    smaller = p.size > this.size;
    if (smaller) {
      if (abs(p.centerX - centerX) < 20)
        speedX -= 1;
      if (abs(p.centerY - centerY) < 20)
        speedY -= 1;    
      centerX += speedX/frameRate * dirX;
      centerY += speedY/frameRate * dirY;
      redraw();
    }
    else {
      if (abs(p.centerX - centerX) < 20)
        speedX += 10;
      if (abs(p.centerY - centerY) < 20)
        speedY += 10;    
      centerX += speedX/frameRate * dirX;
      centerY += speedY/frameRate * dirY;
      redraw();
    }
  }

  float getSize() {
    return size;
  }

  void redraw() {
    fill(r, g, b);
    ellipse(centerX, centerY, size, size);
  }
}

