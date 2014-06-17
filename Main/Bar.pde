class Bar {
  float percent = 0;
  boolean frenzy;

  void displayScore() { 
    fill(237, 83, 22);
    textAlign(LEFT);
    textSize(20);
    text("score:", 200, 45);
    text(score, 270, 45);
    text("high:", 330, 45);
    text(highScore, 400, 45);
  }

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
    if (frenzy) {
      displayFrenzy();
      if (percent <= 0) 
        frenzy = false;
    } else 
      percent -= 0.03;
    rect(34, 34, 142*percent*0.01, 13);  
    displayScore();
    displayFish();
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

  void displayFish() {
    int x = width / 2 + 75; 
    int y = barHeight / 2;
    Fish[] fish = new Fish[5];
    for (int i = 0; i < 5; i++) {
      int s = (i + 1) * 10;
      int move = (s + 10) / 2;
      fish[i] = new Fish(s, x, y, true);
      x += s / 2 + 2;
      stroke(0);
      strokeWeight(1);
      if (p.size >= s && p.size < s + 10) 
        line(x, y - move, x, y + move);
      noStroke();
      x += move + 3;
    }
  }
}

