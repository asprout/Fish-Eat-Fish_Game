Player p;
Enemy e;
Bar b;
StageList stages;
int score;
int highScore;
ArrayList<Fish> fishies = new ArrayList<Fish>();
int timer;
int barHeight;
int multi;

void setup() {
  score = 0;
  size(1000, 600); 
  frameRate(60);
  noStroke();
  timer = 0;
  barHeight = 80;
  background(0);
  p = new Player(width/2, height/2);
  b = new Bar();
  stages = new StageList();
  loadStages();
  multi = stages.head.multiplier;
  for (int x = 0; x < 25; x++) {
    fishies.add(randomFish((int)(random(3) + 1) * 10));
  }
}

void draw() {
  timer = timer + 1;
  if (score > highScore)
    highScore = score;
  if (!(p.dead)) {
    fill(0, 100);
    rect(0, 0, width, height);    
    p.update();
    for (Fish f : fishies) {
      f.update();
      if (canEat(f)) {
        eat(f);
        score += f.size * multi;
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
  } else 
    gameOver();
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
  p.upsize((f.size + 5) / p.size * 0.2);
  b.addPercent((f.size + 5) / p.size * f.size * 0.75 * multi);
  fishies.add(randomFish((int)f.size));
  fishies.remove(f);
}

void addFish() {
  if (timer % 30 == 0) 
    fishies.add(randomFish(10));
  if (timer % 60 == 0) 
    fishies.add(randomFish(20));
  if (timer % 120 == 0) 
    fishies.add(randomFish(30));
  if (timer % 240 == 0) 
    fishies.add(randomFish(40)); 
  if (timer % 480 == 0) 
    fishies.add(randomFish(50));
}

void gameOver() {
  textSize(50);
  text("GAME OVER", 370, 320);
  textSize(30);
  text("revive?", 380, 370);
  text("start over?", 510, 370);
  fill(255);
  if (mousePressed) {
    if (abs(mouseY - 360) < 26) {
      if (abs(mouseX - 425) < 55)
        p = new Player(width/2, height/2);
      else if (abs(mouseX - 590) < 80)
        setup();
    }
  }
}

void loadStages() {
  stages.add(new Stage("one", 1)); 
  stages.add(new Stage("two", 2));  
  stages.add(new Stage("three", 3)); 
  //need this to get past initial empty head stage;
  stages.moveToNextStage();
}
