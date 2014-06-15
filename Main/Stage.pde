class Stage {
  String name;
  Stage next;
  int[][] colorList;
  int multiplier;

  Stage() {
  }

  Stage (String s, int m) {
    name = s;
    multiplier = m;
    colorList = new int[5][3];
    loadColors();
    printColorList();
  }

  void loadColors() {
    BufferedReader reader = createReader(name);
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
    for (int i = 0; i < 5; i++) {
      println("i: " + i);
      for (int j = 0; j < 3; j++){ 
        print(j + ": ");
        print(colorList[i][j] + " ");
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

