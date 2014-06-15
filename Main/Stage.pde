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

