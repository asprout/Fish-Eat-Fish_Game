class Fish {
  float centerX, centerY;
  float size;
  int r, g, b;
  float speedX;
  float speedY;
  int dirX, dirY;
  boolean smaller;

  Fish(int size, float startX, float startY) {
    centerX = startX;
    centerY = startY;
    this.size = size;
    setThings();
    speedY = 0;
    if (startX < width/2)
      dirX = 1;
    else
      dirX = -1;
    if (startY < height/2)
      dirY = 1;
    else
      dirY = -1;
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
    } else {
      if (abs(p.centerX - centerX) < 20) {
        speedX += 1;
      }
      if (abs(p.centerY - centerY) < 20) {
        speedY += 1;
      }   
      centerX += speedX/frameRate ;
      centerY += speedY/frameRate ;
      redraw();
    }
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
    } else {
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

