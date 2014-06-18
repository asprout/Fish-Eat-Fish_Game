class Stage {
  String name;
  Stage next;
  int[][] colorList;
  int multiplier;
  int startTimer;
  int fade = 255;
  int fadeAgain = 255;
  float x, y, size = 1;


  Stage(String s) {
    name = s;
  }

  void startScreen() {
    int xshift = 105;
    int yshift = 83;
    int yAdj = 20;
    fill(0, 255);
    rect(0, 0, width, height);
    font = createFont(fName, 120);
    textFont(font);
    fill(255);
    textAlign(LEFT, CENTER);
    text("FISH", width / 3 - xshift, height / 2 + yshift - yAdj);
    text("FISH", width / 3 - xshift, height / 2 - yshift - yAdj);
    fill(#FFCC00);
    text("EAT", width / 3 - xshift, height / 2 - yAdj);
    fill(255);
    ellipse(2 * width / 3, height / 2, 150, 150);
    fill(0);
    font = createFont(fName, 40);
    textFont(font);
    textAlign(CENTER, CENTER);
    text("START", 2 * width / 3, height / 2);
    font = createFont(fName, 20);
    textFont(font);
    fill(255);
    textAlign(RIGHT, BASELINE);
    text("by ling dong and fawn wong", width - 10, height - 10);
    if (startTimer < 180) {
      fill(0, fade);
      rect(0, 0, width, height);
      fade *= 0.95;
      startTimer += 1;
    }
    if (mousePressed && startTimer > 30) {
      if (abs(mouseX -  2 * width / 3) < 150 && (abs(mouseY -  height / 2) < 150)) {
        x = mouseX;
        y = mouseY;
      }
    }
    if (x != 0 && y != 0) {
      fill(0);
      size *= 1.1;
      ellipse(x, y, size, size);
      if (size >= 1200) {
        colorList = new int[5][3];
        loadColors("one");
        drawBar();
        b.redraw();
        p.displayLives();
        fill(0, fadeAgain);
        rect(0, 0, width, height);
        fadeAgain *= 0.95; 
        if (fadeAgain <= 10)
          stages.moveToNextStage();
      }
    }
  }

  Stage (String s, int m) {
    name = s;
    multiplier = m;
    colorList = new int[5][3];
    loadColors(name);
  }

  void loadColors(String n) {
    BufferedReader reader = createReader(n);
    String line = null;
    try {
      line = reader.readLine();
    }
    catch(Exception e) {
    }
    int i = 0;
    while (line != null && i < 5) {
      String[] rgbVal = split(line, ",");
      for (int j = 0; j < 3; j++) {
        colorList[i][j] = int(rgbVal[j]);
      }
      i++;
      try {
        line = reader.readLine();
      }
      catch(Exception e) {
        line = null;
      }
    }
  }

  void printColorList() {
    for (int[] i : colorList) {
      for (int j : i) {
        print(j + " ");
      } 
      println();
    }
  }

  void setNextStage(Stage s) {
    next = s;
  }

  Stage getNextStage() {
    return next;
  }
}

