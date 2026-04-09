Wheel wheel;
Hazard hazard;
//Coin[] coins;
Coin coin;

int score;
boolean gameOver = false;

void setup() {
  size(800, 800);
  wheel = new Wheel(150, 600, 25);
  hazard = new Hazard(850, random(100, 600), 30, 30);
  coin = new Coin();
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
  coin.moveCoin();
  coin.drawCoin();
}

void keyPressed() {
  wheel.wheelJump();
}

void mousePressed() {
  if(gameOver == true) {
    gameOver = !gameOver;
  }
}
