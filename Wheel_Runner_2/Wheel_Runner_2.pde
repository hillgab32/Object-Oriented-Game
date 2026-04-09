Wheel wheel;
Hazard hazard;

int score;
boolean gameOver = false;

void setup() {
  size(800, 800);
  wheel = new Wheel();
  hazard = new Hazard();
}

void draw() {
  background(135, 206, 235);
  rectMode(CORNER);
  fill(63, 155, 11);
  stroke(0);
  rect(-10, 625, 825, 625);
  wheel.drawTheWheel();
  hazard.drawHazard();
  hazard.moveHazard();
}

void keyPressed() {
  wheel.wheelJump();
}

void mousePressed() {
  if(gameOver == true) {
    gameOver = !gameOver;
  }
}
