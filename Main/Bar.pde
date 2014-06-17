class Bar {
  float percent = 0;
  boolean frenzy;

  void displayScore() { 
    fill(237, 83, 22);
    textAlign(LEFT, TOP);
    font = createFont(fName, 26);
    textFont(font);
    int posX = 250;
    int posY = barHeight / 2 - 15;
    text("score: " + score, posX, posY);
    //text(score, posX + 60, posY);
    text("high: " + highScore, posX + 160, posY);
    //text(highScore, posX + 220, posY);
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
    font = createFont(fName, 50);
    textFont(font);
    fill(#FFCC00);
    text("FRENZY", width / 2, barHeight + 100);
  }

  void displayFish() {
    int x = width / 2 + 100; 
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

