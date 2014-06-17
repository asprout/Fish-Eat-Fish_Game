class Powerup extends Thing {
  
  /*float speedX, speedY;
  float size;
  int r, g, b;
  float freq;
  float pointValue;
  float foodValue;
  float centerX, centerY;
  */
  
  Powerup(float sp, float sz){
    speedX = sp;
    speedY = sp;
    size = sz;
  }
  
  void addLife(int xy){
    if (random(100) < 2){
      //strokeWeight(1);
      //stroke(255, 0, 0); 
      fill(255, 0, 0);
      ellipse((float)xy, (float)xy, size, size);
    }
  }
  
}
