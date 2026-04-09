Wheel wheel;
Hazard hazard;
Coin coin;

int score = 0;
boolean gameOver = true;

void setup() {
  size(800, 800);
  wheel = new Wheel(150, 600, 25);
  hazard = new Hazard(850, random(100, 600), 50, 50);
  coin = new Coin(850, random(100, 600), 15);
}

void draw() {
  background(135, 206, 235);
  rectMode(CORNER);
  fill(63, 155, 11);
  stroke(0);
  rect(-10, 625, 825, 625);
  if (gameOver == false) {
    wheel.checkCollision(hazard);
    wheel.drawTheWheel();
    hazard.checkCollision(wheel);
    hazard.drawHazard();
    hazard.moveHazard();
    coin.checkCollision(wheel);
    coin.moveCoin();
    coin.drawCoin();
    if (coin.scoreCoin() == true) {
      score++;
    }
  }
  if (score == 20) {
    gameOver = true;
    textSize(75);
    fill(0);
    text("You Win!", 400, 400);
  }
  if (hazard.death() == true) {
    gameOver = true;
    textSize(75);
    fill(0);
    text("GAME OVER", 400, 400);
  }
}

void keyPressed() {
  wheel.wheelJump();
}

void mousePressed() {
  if (gameOver == true) {
    gameOver = !gameOver;
    score = 0;
  }
}
