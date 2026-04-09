class Hazard {
  color red;
  // hit detection code from https://www.jeffreythompson.org/collision-detection/
  float w, h;
  PVector position;
  PVector velocity;
  PVector acceleration;
  // hit detection code from https://www.jeffreythompson.org/collision-detection/
  boolean hit = false;
  
  Hazard(float _x, float _y, float _w, float _h) {
    red = color(255, 0, 0);
    position = new PVector(_x, _y);
    velocity = new PVector(2, 0);
    acceleration = new PVector(0.01, 0);
    w = _w;
    h = _h;
  }
  
  void drawHazard() {
    rectMode(CENTER);
    stroke(0);
    fill(red);
    rect(position.x, position.y, w, h);
    
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
