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
  fishies.add(new TestFish(200, 50, 50, 0, random(150)));
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
      fishies.add(new TestFish(200, 50, 50, 0, random(150)));
      break;
    }
  }
}

boolean canEat(TestFish t) {
  float distance = p.getSize() / 2 + t.getSize() / 2;
  boolean x = abs(t.getX() - p.getX()) < distance;
  boolean y = abs(t.getY() - p.getY()) < distance;
  return x && y;
}

