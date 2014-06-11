Player p;
Enemy e;
//ComboBar b;
ArrayList<Fish> fishies = new ArrayList<Fish>();
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
  //b = new ComboBar();
  for (int x = 0; x < 20; x++) 
    fishies.add(randomFish(10));
    fishies.add(randomFish(20));
    fishies.add(randomFish(30));
}

void draw() {
  timer = timer + 1;
  if (!dead) {
    fill(0, 100);
    rect(0, 0, width, height);    
    p.update();
    for (Fish f : fishies) {
      f.update(p);
      if (canEat(f)) {
        p.upsize(f.size*0.01);
        fishies.remove(f);
        fishies.add(randomFish(((int)(random(5)+1)*10)));
        break;
      } 
      if (canBeEaten(f)) {
        fishies.remove(f);
        dead = true;
        break;
      }
    }
    if (timer % 30 == 0) 
      fishies.add(randomFish(10));
    //menu bar
    fill(255, 255);
    rect(0, 0, width, barHeight);
    //b.redraw();
  }
  //just for testing purposes -- pretty much this will be replaced by the lose one life function
  if (timer % 60 == 0)
    dead = false;
}

boolean touching(Fish t) {
  float distance = p.size / 2 + t.size / 2;
  boolean x = abs(t.centerX - p.centerX) < distance;
  boolean y = abs(t.centerY - p.centerY) < distance;
  return x && y;
}

boolean canEat(Fish t) {
  return touching(t) && (t.size < p.size);
}

boolean canBeEaten(Fish t) {
  return touching(t) && (t.size >= p.size);
}

Fish randomFish(int s) {
  return new Fish(s, (int)random(2) * width, random(height - barHeight) + barHeight);
}

