class Player {
  float centerX, centerY;
  float accelX, accelY;
  float springing = 0.005, damping = 0.9;
  Player(float x, float y) {
   centerX = x;
   centerY = y;
  }
  void update() {
    if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
      System.out.println("centerX: " + centerX + ", centerY: " + centerY);
      float deltaX = mouseX-centerX;
      float deltaY = mouseY-centerY;
      deltaX *= springing;
      deltaY *= springing;
      accelX += deltaX;
      accelY += deltaY;
      centerX += accelX;
      centerY += accelY;
      accelX *= damping;
      accelY *= damping;
      fill(255);
      ellipse(centerX, centerY, 20,20); 
    }
  }    
}
