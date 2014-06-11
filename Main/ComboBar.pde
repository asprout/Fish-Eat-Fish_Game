class ComboBar {
  float percent = 0;

  void redraw() {
    stroke(10);
    strokeWeight(4);
    strokeCap(ROUND);
    rect(30, 30, 150, 20);
    noStroke();    
    fill(0);
    if (percent <= 0) 
      percent = 0;
    if (percent >= 100)
      percent = 100;
    rect(35,35, 140*percent*0.01, 11);    
    percent -= 0.1;
  }
  
  void addPercent(int s) {
     percent += s * 0.12;
  }
}

