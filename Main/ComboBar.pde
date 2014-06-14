class ComboBar {
  float percent = 0;
  boolean frenzy;

  void redraw() {
    stroke(10);
    strokeWeight(4);
    strokeCap(ROUND);
    rect(30, 30, 150, 20);
    noStroke();    
    fill(0);
    if (percent <= 0) 
      percent = 0;
    if (percent >= 100) {
      percent = 100;
      frenzy = true;
    }
    if (percent <= 90) 
      frenzy = false;
    rect(35, 35, 140*percent*0.01, 11);  
    if (!frenzy)   
      percent -= 0.05;
    else
      displayFrenzy();
  }

  void addPercent(int s) {
    percent += s * 0.2;
  }

  void displayFrenzy() {
    percent -= 0.06;
    textSize(32);
    fill(#FFCC00);
    text("FRENZY!", mouseX, mouseY);
  }
}

