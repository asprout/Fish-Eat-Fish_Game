Player p;
Enemy e;
ComboBar b;
ArrayList<Fish> fishies = new ArrayList<Fish>();
int timer;
int barHeight;

void setup() {
  size(1000, 600); 
  frameRate(60);
  noStroke();
  timer = 0;
  barHeight = 80;
  background(0);
  p = new Player(width/2, height/2);
  //e = new Enemy("fsh");
  b = new ComboBar();
  for (int x = 0; x < 20; x++) 
    fishies.add(randomFish(10));
  fishies.add(randomFish(20));
  fishies.add(randomFish(30));
}

void draw() {
  timer = timer + 1;
  if (!(p.dead)) {
    fill(0, 100);
    rect(0, 0, width, height);    
      p.update();
    for (Fish f : fishies) {
      f.update(p);
      if (canEat(f)) {
        eat(f);
        break;
      } 
      if (canBeEaten(f)) {
        p.loseLife();
        break;
      } 
    }
    addFish();
    //menu bar
    fill(255, 255);
    rect(0, 0, width, barHeight);
    b.redraw();
    p.displayLives();
  }
   else {
     textSize(50);
     text("GAME OVER", 350, 320);
     textSize(30);
     text("press below to revive!", 350, 370);
     fill(0, 102, 153);
     rect(370, 400, 100, 100);
     fill(255);
     if (mousePressed)
       p = new Player(width/2, height/2);
   }
  /*
  //just for testing purposes -- pretty much this will be replaced by the lose one life function
   if (timer % 60 == 0)
   dead = false; */
}

boolean touching(Fish t) {
  float distance = p.size / 2 + t.size / 2;
  boolean x = abs(t.centerX - p.centerX) < distance;
  boolean y = abs(t.centerY - p.centerY) < distance;
  return x && y;
}

boolean canEat(Fish t) {
  return touching(t) && (t.size < p.size) && !p.lifeAnimation;
}

boolean canBeEaten(Fish t) {
  return touching(t) && (t.size >= p.size) && !p.lifeAnimation;
}

Fish randomFish(int s) {
  return new Fish(s, (int)random(2) * width, random(height - barHeight) + barHeight);
}

void eat(Fish f) {
  p.upsize(f.size*0.01);
  b.addPercent((int)f.size);
  fishies.add(randomFish((int)f.size));
  fishies.remove(f);
}

void addFish() {
  if (timer % 60 == 0) 
    fishies.add(randomFish(10));
  if (timer % 120 == 0) 
    fishies.add(randomFish(20));
  if (timer % 240 == 0) 
    fishies.add(randomFish(30));
  if (timer % 480 == 0) 
    fishies.add(randomFish(40)); 
  if (timer % 960 == 0) 
    fishies.add(randomFish(50));
}

