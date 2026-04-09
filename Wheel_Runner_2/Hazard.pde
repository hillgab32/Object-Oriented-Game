class Hazard {
  color red;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Hazard() {
    red = color(255, 0, 0);
    position = new PVector(810, random(100, 600));
    velocity = new PVector(2, 0);
    acceleration = new PVector(0.1, 0);
  }
  
  void drawHazard() {
    rectMode(CENTER);
    stroke(0);
    fill(red);
    rotate(45);
    rect(position.x, position.y, 30, 30);
  }
}
