Player p;
Enemy e;
TestFish t;

void setup() {
  size(1000,600); 
  frameRate(60);
  noStroke();
  background(0);
  p = new Player(width/2, height/2);
  e = new Enemy("fsh");
  t = new TestFish(200,50,50);
}

void draw(){
  fill(0,100);
  rect(0,0,width,height);  
  e.redraw();
  t.update();
  p.update();
}




