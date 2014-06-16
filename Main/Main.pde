Player p;
Enemy e;
Bar b;
StageList stages;
int score;
int highScore;
ArrayList<Fish> fishies = new ArrayList<Fish>();
int timer, eventTimer;
int barHeight;
int multi;
boolean nextLevelAnimation;
boolean win;

void setup() {
  score = 0;
  size(1000, 600); 
  frameRate(60);
  noStroke();
  timer = 0;
  eventTimer = 0;
  barHeight = 80;
  background(0);
  p = new Player(width/2, 0);
  b = new Bar();
  stages = new StageList();
  loadStages();
  multi = stages.head.multiplier;
  p.lifeAnimation = true;
  win = false;
}

void draw() {
  displayLevel();
  timer = timer + 1;
  if (score > highScore)
    highScore = score;
  if (win) 
    winScreen();
  else if (!(p.dead) && !win) {
    fill(0, 100);
    rect(0, 0, width, height);    
    p.update();
    updateFish();
    nextLevelCheck();
    if (!nextLevelAnimation) 
      addFish();     
    //menu bar
    fill(255, 255);
    rect(0, 0, width, barHeight);
    b.redraw();
    p.displayLives();
  } else 
    gameOver();
}

void updateFish() {
  for (Fish f : fishies) {
    f.update();
    if (f.outOfBounds()) {
      fishies.remove(f);
      break;
    }
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
}

void nextLevelCheck() {
  if (p.size >= 50) 
    nextLevelAnimation = true; 
  if (nextLevelAnimation && fishies.size() == 0) {
    p.size -= 0.25;
    if (p.size <= 15) {
      nextLevelAnimation = false;
      stages.moveToNextStage();
      if (stages.head == null) 
        win = true;
      else {
        multi = stages.head.multiplier;
        eventTimer = timer;
      }
    }
  }
  displayLevel();
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
  p.upsize((f.size + 5) / p.size * 0.25);
  b.addPercent((f.size + 5) / p.size * f.size * multi);
  //fishies.add(randomFish((int)f.size));
  fishies.remove(f);
}

void addFish() {
  if (timer % 30 == 0) 
    fishies.add(randomFish(10));
  if (timer % 60 == 0) 
    fishies.add(randomFish(20));
  if (timer % 180 == 0) 
    fishies.add(randomFish(30));
  if (timer % 270 == 0) 
    fishies.add(randomFish(40)); 
  if (timer % 600 == 0) 
    fishies.add(randomFish(50));
}

void gameOver() {
  textAlign(CENTER);
  textSize(50);
  text("GAME OVER", width / 2, height / 2);
  textSize(30);
  text("revive?", width / 2 - 100, height / 2 + 30);
  text("start over?", width / 2 + 100, height / 2 + 30);
  fill(255);
  if (mousePressed) {
    if (abs(mouseY - (height / 2 + 30)) < 26) {
      if (abs(mouseX - (width / 2 - 100)) < 55)
        p = new Player(width/2, height/2);
      else if (abs(mouseX - (width / 2 + 100)) < 80)
        setup();
    }
  }
}

void displayLevel() {
  if (timer <= eventTimer + 120) {
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text("Level " + multi, width / 2, height / 2);
  }
}

void winScreen() {
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text("YOU WIN", width / 2, (height + barHeight) / 2);
}

void loadStages() {
  stages.add(new Stage("one", 1)); 
  stages.add(new Stage("two", 2));  
  stages.add(new Stage("three", 3)); 
  //need this to get past initial empty head stage;
  stages.moveToNextStage();
  stages.moveToNextStage();
  stages.moveToNextStage();
}

