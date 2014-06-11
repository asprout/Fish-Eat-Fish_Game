class Fish {
  float centerX, centerY;
  float size;
  int r, g, b;
  int freq;
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

  /*void update(Player p) {
    smaller = p.size > this.size;
    if (smaller) {
      if (abs(p.centerX - centerX) < 20)
        speedX += 2;
      if (abs(p.centerY - centerY) < 20)
        speedY += 2;    
      centerX += speedX/frameRate * dirX;
      centerY += speedY/frameRate * dirY;
      redraw();
    } else {
      if (abs(p.centerX - centerX) < 20) {
        speedX += 2;
      }
      if (abs(p.centerY - centerY) < 20) {
        speedY += 2;
      }   
      centerX += speedX/frameRate ;
      centerY += speedY/frameRate ;
      redraw();
    }
  }
*/

   void update(Player p) {
    smaller = p.size > this.size;
    if (smaller) {
      if (nearSmaller()) {
        speedX += 2.5;  
        dirX = dirX*-1;
        dirY = dirY*-1;
      }
    } else {
      if (nearLarger()) {
        speedX +=2.5;
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

  boolean nearSmaller() {
    return ((abs(p.centerX - centerX) < 30) && (abs(p.centerY - centerY) < 30));
  }
  
  boolean nearLarger() {
    return ((abs(p.centerX - centerX) < 70) && (abs(p.centerY - centerY) < 70));
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
    } 
    else if (size == 50){
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

