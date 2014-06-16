class Player {
  float centerX, centerY;
  float accelX, accelY;
  float springing = 0.025, damping = 0.25;
  float size;
  float prevSize;
  int dirX, dirY;
  int lives = 3;
  int pauseTimer = 0;
  boolean dead;
  boolean lifeAnimation;
  int invulnerable;

  Player(float x, float y) {
    centerX = x;
    centerY = y;
    size = 15;
  }
  

  void update() {    
    if (lifeAnimation) {
      b.percent *= 0.98;
      if (timer > pauseTimer + 120) {
        updateMovement(width / 2, (height + barHeight) / 2);
        if (abs(centerY - (height + barHeight) / 2) < 15)
          lifeAnimation = false;
      }
    } else
      updateMovement(mouseX, mouseY);
    redraw();
  }

  void displayLives() {
    int temp = 0;
    int pos = 900;
    while (temp < 3) {
      strokeWeight(1);
      stroke(255, 0, 0);  
      if (temp < lives) 
        fill(255, 0, 0);
      else {
        noFill();
      }
      ellipse(pos, 50, 25, 25);
      noStroke();
      temp+=1;
      pos+=30;
    }
  }

  void loseLife() {
    lives-=1;
    if (lives <= 0) {
      dead = true;
    }
    lifeAnimation = true;
    centerX = width / 2;
    centerY = 0;
    pauseTimer = timer;
  }

  void upsize(float i) {
    size+=i;
  }

  void redraw() {
    fill(255);
    ellipse(centerX, centerY, size, size);
  }  

  void updateMovement(float targetX, float targetY) {
    float deltaX = targetX - centerX;
    float deltaY = targetY - centerY;
    deltaX *= springing;
    deltaY *= springing;
    accelX += deltaX;
    accelY += deltaY;
    centerX += accelX;
    centerY += accelY;
    checkBounds();
    accelX *= damping;
    accelY *= damping;
  }

  void checkBounds() {
    if (centerX < size / 2)
      centerX = size / 2;
    if (centerX > width - size / 2) 
      centerX = width - size / 2;
    if (centerY < barHeight + size / 2)
      centerY = barHeight + size / 2;
    if (centerY > height - size / 2) 
      centerY = height - size / 2;
  }
}

