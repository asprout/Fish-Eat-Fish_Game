Player p;

void setup() {
  size(1000,600); 
  frameRate(60);
  noStroke();
  background(0);
  p = new Player(width/2, height/2);
}

void draw(){
  fill(0,100);
  rect(0,0,width,height);  
  p.update();
}




