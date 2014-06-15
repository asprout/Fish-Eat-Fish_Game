class ComboBar {
  float percent = 60;
  boolean frenzy;

  void redraw() {
    stroke(10);
    strokeWeight(2);
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
    rect(34, 34, 142*percent*0.01, 13);  
    if (!frenzy)   
      percent -= 0.05;
    else
      displayFrenzy();
  }

  void addPercent(float s) {
    percent += s * 0.2;
  }

  void displayFrenzy() {
    percent -= 0.1;
    textAlign(CENTER);
    textSize(32);
    fill(#FFCC00);
    text("FRENZY", width / 2, barHeight + 100);
  }
}

