class Coin {
  color yellow = color(255, 255, 0);
  PVector position = new PVector(850, random(100, 600));
  PVector velocity;
  
  Coin() {
    velocity = new PVector(2, 0);
  }
  
  void drawCoin(){
    ellipseMode(CENTER);
    stroke(0);
    fill(yellow);
    ellipse(position.x, position.y, 30, 30);
  }
  
  void moveCoin() {
     position.sub(velocity);
    if(position.x <= -100) {
      position.x = 850;
      position.y = random(100, 600);
    }
  }
}
