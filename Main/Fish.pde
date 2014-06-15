class Fish extends Enemy {
  float accelX, accelY;
  int dirX, dirY;
  boolean smaller;

  Fish(int size, float startX, float startY) {
    super();
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
        accelX += 20 / size * dirX * -0.5;
        accelY += 20 / size * dirY * -0.5;
      }
    } else {
      if (within(deltaX, deltaY, (int)size * 4)) {
        //acceleration is greater the smaller it is
        accelX += 20 / size * dirX * 1;
        accelY += 20/ size * dirY * 1;
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
    int[][] colors = stages.head.colorList;
    int ind = ((int)size / 10) - 1;
    r = colors[ind][0];
    g = colors[ind][1];
    b = colors[ind][2];
    speedX = 30 - (4 - (50 - 10) / 10) * 5;
  }

  void redraw() {
    fill(r, g, b);
    ellipse(centerX, centerY, size, size);
  }

  void printColors(int[][] c) {
    for (int[] i : c) {
      for (int j : i) 
        print(j);
    }
  }
}

