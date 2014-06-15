class Fish {
  float centerX, centerY;
  float size;
  int r, g, b;
  int freq;
  float accelX, accelY;
  float speedX, speedY;
  int dirX, dirY;
  boolean smaller;

  Fish(int size, float startX, float startY) {
    centerX = startX;
    centerY = startY;
    this.size = size;
    setThings();
    speedY = 0;
    accelX = 0;
    accelY = 0;
    if (startX < width/2)
      dirX = 1;
    else
      dirX = -1;
    if (startY < height/2)
      dirY = 1;
    else
      dirY = -1;
    speedX *= dirX;
    redraw();
  }

  void update() {
    float deltaX = p.centerX-centerX;
    float deltaY = p.centerY-centerY;
    changeX(deltaX);
    changeY(deltaY);
    smaller = p.size > this.size;
    if (smaller) {
      if (within(deltaX, deltaY, (int)size * 4)) {
        accelX += 30 / size * dirX * -0.5;
        accelY += 30 / size * dirY * -0.5;
      }
    } else {
      if (within(deltaX, deltaY, (int)size * 4)) {
        //acceleration is greater the smaller it is
        accelX += 30 / size * dirX * 1;
        accelY += 30/ size * dirY * 1;
      }
    }
    centerX += (speedX + accelX) / frameRate * 1.5;
    centerY += (speedY + accelY) / frameRate * 1.5;
    redraw();
  }

  void changeX(float d) {
    if (d < 0) 
      dirX = -1;
    else if (d > 0) 
      dirX = 1;
  }

  void changeY(float d) {
    if (d < 0) 
      dirY = -1;
    else if (d > 0) 
      dirY = 1;
  }

  boolean within(float dX, float dY, int s) {
    return !p.lifeAnimation && sqrt(sq(dX) + sq(dY)) <= s;
  }

  void setThings() {
    if (size == 10) {
      r = 105;
      g = 210;
      b = 231;
      speedX = 30;
    } else if (size == 20) {
      r = 167;
      g = 219;
      b = 216;   
      speedX = 25;
    } else if (size == 30) {
      r = 224;
      g = 228;
      b = 204;
      speedX = 20;
    } else if (size == 40) {
      r = 243;
      g = 134;
      b = 48; 
      speedX = 15;
    } else if (size == 50) {
      r = 250;
      g = 105;
      b = 0;  
      speedX = 10;
    }
  }

  void redraw() {
    fill(r, g, b);
    ellipse(centerX, centerY, size, size);
  }
}

