Wheel wheel;

int score;
boolean gameOver = false;

void setup() {
  size(800, 800);
  wheel = new Wheel();
}

void draw() {
  background(135, 206, 235);
  rectMode(CORNER);
  fill(63, 155, 11);
  stroke(0);
  rect(-10, 625, 800, 625);
  wheel.drawTheWheel();
}

void keyPressed() {
}

void mousePressed() {
  if(gameOver == true) {
    gameOver = !gameOver;
  }
}
