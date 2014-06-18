class Powerup extends Fish {

  Powerup(int size) {
    super(size, (int)random(2) * width, random(height));
    speedY = 0;
    speedX = 250;
    accelX = 0;
    accelY = 0;
    r = 255;
    g = 0;
    b = 0;
    if (centerX < width/2)
      dirX = 1;
    else
      dirX = -1;
    if (centerY < height/2)
      dirY = 1;
    else
      dirY = -1;
    speedX *= dirX;
    redraw();
  }
  
  void update(){
    super.update();
    if (frameCount % 60 < 20){
      r = 255;
      g = 200;
      b = 200;
    }
    else if (frameCount % 60 < 40){
      r = 255;
      g = 0;
      b = 0;
    }
    else {
      r = 127;
      g = 0;
      b = 0;
    }
    redraw();
  }
}
