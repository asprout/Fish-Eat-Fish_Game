Player p;
Enemy e;
ArrayList<TestFish> fishies = new ArrayList<TestFish>();
void setup() {
  size(1000, 600); 
  frameRate(60);
  noStroke();
  background(0);
  p = new Player(width/2, height/2);
  //e = new Enemy("fsh");
  for (int x = 0; x < 20; x++) 
    fishies.add(randomFish());
}

void draw() {
  fill(0, 100);
  rect(0, 0, width, height);  
  //e.redraw();
  p.update();
  for (TestFish t : fishies) {
    t.update();
    if (canEat(t)) {
      fishies.remove(t);
      fishies.add(randomFish());
      break;
    } 
    else if (!canEat(t)) {
      p = null;
    }
  }
}

boolean touching(TestFish t) {
  float distance = p.getSize() / 2 + t.getSize() / 2;
  boolean x = abs(t.getX() - p.getX()) < distance;
  boolean y = abs(t.getY() - p.getY()) < distance;
  return x && y;
}

boolean canEat(TestFish t) {
  return touching(t) && (t.getSize() < p.getSize());
}
  

TestFish randomFish() {
  return new TestFish((int)random(255), (int)random(255), (int)random(255), (float)0, random(height), (int)random(40) + 1, (int)random(60) + 10);
}

