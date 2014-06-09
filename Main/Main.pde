Player p;
Enemy e;
ArrayList<TestFish> fishies = new ArrayList<TestFish>();
int timer;
boolean dead;
int barHeight;

void setup() {
  size(1000, 600); 
  frameRate(60);
  noStroke();
  timer = 0;
  barHeight = 80;
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
    p.update();
    for (TestFish t : fishies) {
      t.update(p);
      if (canEat(t)) {
        p.upsize(t.getSize()*0.01);
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
    //menu bar
    fill(255,255);
    rect(0, 0, width, barHeight);
  }
  //just for testing purposes -- pretty much this will be replaced by the lose one life function
  if (timer % 60 == 0)
    dead = false;
}

boolean touching(TestFish t) {
  float distance = p.size / 2 + t.size / 2;
  boolean x = abs(t.centerX - p.centerX) < distance;
  boolean y = abs(t.centerY - p.centerY) < distance;
  return x && y;
}

boolean canEat(TestFish t) {
  return touching(t) && (t.size < p.size);
}

boolean canBeEaten(TestFish t) {
  return touching(t) && (t.size >= p.size);
}

TestFish randomFish() {
  return new TestFish((int)random(255), (int)random(255), (int)random(255), (int)random(2) * width, random(height - barHeight) + barHeight, (int)random(20) + 5, (int)random(60) + 10);
}

