class Hazard {
  color red;
  PVector position = new PVector(850, random(100, 600));
  PVector velocity;
  PVector acceleration;
  
  Hazard() {
    red = color(255, 0, 0);
    velocity = new PVector(2, 0);
    acceleration = new PVector(0.01, 0);
  }
  
  void drawHazard() {
    rectMode(CENTER);
    stroke(0);
    fill(red);
    rect(position.x, position.y, 30, 30);
    
  }
  
  void moveHazard() {
    position.sub(velocity);
    if(position.x <= -100) {
      position.x = 850;
      position.y = random(100, 600);
      velocity.add(acceleration);
    }
  }
}   
