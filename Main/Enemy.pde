class Enemy { 
    float speed;
    float size;
    int r, g, b;
    float freq;
    float pointValue;
    float foodValue;
    int centerX, centerY;
    
    String name;
    
    Enemy(String n) {
        name = n;
        size = 10;
        r = 152;
        g = 152;
        b = 152;
        centerX = 300;
        centerY = 300;
        redraw();
    }
    
    void redraw(){
      fill(r, g, b);
      ellipse(centerX, centerY, size, size);
    }
}
    
