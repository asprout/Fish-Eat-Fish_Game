Player p;
Enemy e;
ArrayList<TestFish> fishies = new ArrayList<TestFish>();
int timer;
boolean dead;

void setup() {
  size(1000, 600); 
  frameRate(60);
  noStroke();
  timer = 0;
  background(0);
  dead = false;
  p = new Player(width/2, height/2);
  //e = new Enemy("fsh");
  for (int x = 0; x < 20; x++) 
    fishies.add(randomFish());
}

void draw() {
  timer = timer + 1;
  if (!dead) {
    fill(0, 100);
    rect(0, 0, width, height);  
    //e.redraw();
    p.update();
    for (TestFish t : fishies) {
      t.update(p);
      if (canEat(t)) {
        fishies.remove(t);
        fishies.add(randomFish());
        break;
      } 
      if (canBeEaten(t)) {
        print("eaten");
        fishies.remove(t);
        dead = true;
        break;
      }
    }
    if (timer % 30 == 0) 
      fishies.add(randomFish());
  }
  //just for testing purposes -- pretty much this will be replaced by the lose one life function
  if (timer % 60 == 0)
    dead = false;
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

boolean canBeEaten(TestFish t) {
  return touching(t) && (t.getSize() >= p.getSize());
}

void die() {
}

TestFish randomFish() {
  return new TestFish((int)random(255), (int)random(255), (int)random(255), (int)random(2) * width, random(height), (int)random(20) + 5, (int)random(60) + 10);
}

