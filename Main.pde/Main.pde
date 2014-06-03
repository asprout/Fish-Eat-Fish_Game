float centerX, centerY;
float accelX, accelY;
float springing = 0.0005, damping = 1;
void setup() {
  size(640,360); 
  frameRate(30);
  centerX = width/2;
  centerY = height/2;
  noStroke();
  background(0);
}

void draw(){
  fill(0,100);
  rect(0,0,width,height);
  fill(255);
  ellipse(centerX,centerY,100,100);
  moveShape();
}

void moveShape() {
  float deltaX = mouseX-centerX;
  float deltaY = mouseY-centerY;
  deltaX *= springing;
  deltaY *= springing;
  accelX += deltaX;
  accelY += deltaY;

  centerX += accelX;
  centerY += accelY;

  accelX *= damping;
  accelY *= damping;
}
