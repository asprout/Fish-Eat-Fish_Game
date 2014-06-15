class StageList {
  Stage head;
  int size;

  StageList() {
    head = new Stage();
    size = 0;
  }

  void add(Stage s) {
    Stage temp = head;
    for (int i = 0; i < size - 1; i ++)
      temp = temp.getNextStage();
    temp.setNextStage(s);
  }
  
  void moveToNextStage() {
   if (head.getNextStage() != null)
     head = head.getNextStage(); 
  }
}

