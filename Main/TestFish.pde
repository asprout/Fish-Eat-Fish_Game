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
      if (near()) {
        speedX -= 3;
        speedY -= 3;    
        dirX = dirX*-1;
        dirY = dirY*-1;
      }
    } else {
      if (near()) {
        speedX +=3;
        speedY +=3;
        changeDirection(p);
      }
    }
    centerX += speedX/frameRate * dirX;
    centerY += speedY/frameRate * dirY;
    redraw();
  }

  void changeDirection(Player p) {
    dirX = p.dirX;
    dirY = p.dirY;
    if (p.centerX > centerX) {
      if (p.dirX < 0)
        dirX = 1;
    }
    if (p.centerX < centerX) {
      if (p.dirX > 0)
        dirX = -1;
    }
    if (p.centerY > centerY) {
      if (p.dirY < 0)
        dirX = 1;
    }
    if (p.centerY < centerY) {
      if (p.dirY > 0)
        dirY = -1;
    }
  }

  boolean near() {
    return ((abs(p.centerX - centerX) < 20) && (abs(p.centerY - centerY) < 20));
  }

  void redraw() {
    fill(r, g, b);
    ellipse(centerX, centerY, size, size);
  }
}

