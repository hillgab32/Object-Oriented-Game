Wheel wheel; //Declare classes
Hazard hazard;
Coin coin;
Hills[] hills = new Hills[3]; // declare an array of 3 hills

int score = 0; //Score starts at zero
boolean gameOver = true; //Game is deactivated a the start

void setup() {
  size(800, 800); 
  wheel = new Wheel(150, 600, 25); //assign classes
  hazard = new Hazard(850, random(100, 600), 50, 50);
  coin = new Coin(850, random(100, 600), 15);
  for (int i = 0; i < hills.length; i++) { // loop to initialize array
    hills[i] = new Hills(random(100, 600), random(50, 200));
  }
}

void draw() {
  background(135, 206, 235); // sky blue background
  for(int i = 0; i < hills.length; i++){ // call hills that move in the background
      hills[i].drawHill();
      hills[i].moveHill();
    }
  rectMode(CORNER); // draw the ground
  fill(63, 155, 11);
  stroke(0);
  rect(-10, 625, 825, 625);
  if (gameOver == false) { // activate gameplay once game is started
    wheel.checkCollision(hazard);
    wheel.drawTheWheel();
    hazard.checkCollision(wheel);
    hazard.drawHazard();
    hazard.moveHazard();
    coin.checkCollision(wheel);
    coin.moveCoin();
    coin.drawCoin();
    if (coin.scoreCoin() == true) { // collecting coins increases score
      score++;
    }
  }
  if (score == 20) { // collect 20 coins to win the game
    gameOver = true;
    textSize(75);
    fill(0);
    text("You Win!", 400, 400);
  }
  if (hazard.death() == true) { // hitting a box results in a game over
    gameOver = true;
    textSize(75);
    fill(0);
    text("GAME OVER", 400, 400);
  }
}

void keyPressed() { // pressing space causes the wheel to jump
  wheel.wheelJump();
}

void mousePressed() { // click to start the game and to try again after the game is over
  if (gameOver == true) {
    gameOver = !gameOver;
    score = 0; // reset score
  }
}
