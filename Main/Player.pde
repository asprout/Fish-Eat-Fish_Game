class Player {
  float centerX, centerY;
  float accelX, accelY;
  float springing = 0.025, damping = 0.25;
  float size;
  int dirX, dirY;
  int lives = 3;
  boolean dead;

  Player(float x, float y) {
    centerX = x;
    centerY = y;
    size = 15;
  }

  void displayLives(){
    int temp = 0;
    int pos = 900;
    while (temp < 3) {
      if (temp < lives) 
      fill(255, 0, 0);
    else{
      strokeWeight(1);
      stroke(255,0,0);
      noFill();  
    }
      ellipse(pos, 50, 25, 25);
      noStroke();
      temp+=1;
      pos+=30;
    }
  }
  
  void loseLife(){
    lives-=1;
    if (lives <= 0){
      dead = true;
    }
  }

  void updateDirection() {
    if (mouseX - centerX < 0)
      dirX = -1;
    if (mouseX - centerX > 0)
      dirX = 1;
    if (mouseX == centerX)
      dirX = 0;
    if (mouseY - centerY < 0)
      dirY = -1;
    if (mouseY - centerY > 0)
      dirY = 1;
    if (mouseY == centerY)
      dirY = 0;
  }

  void update() {
    updateDirection();
    float deltaX = mouseX-centerX;
    float deltaY = mouseY-centerY;
    deltaX *= springing;
    deltaY *= springing;
    accelX += deltaX;
    accelY += deltaY;
    centerX += accelX;
    centerY += accelY;
    checkBounds();
    accelX *= damping;
    accelY *= damping;
    redraw();
  }

  void upsize(float i) {
    size+=i;
  }

  void redraw() {
    fill(255);
    ellipse(centerX, centerY, size, size);
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

