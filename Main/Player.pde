class Player {
  float centerX, centerY;
  float accelX, accelY;
  float springing = 0.005, damping = 0.85;
  float size;
  int dirX, dirY;

  Player(float x, float y) {
    centerX = x;
    centerY = y;
    size = 20;
  }
  
  int getDirX(){
    return dirX;
  }
  
  int getDirY(){
    return dirY;
  }
  
  void updateDirection(){
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
  
  void upsize(float i){
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

