class Wheel {
  // hit detection code from https://www.jeffreythompson.org/collision-detection/  
  float radius;
  
  color grey;
  color lightGrey;
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float gravity = 0.5;
  boolean isJumping;
  
  // hit detection code from https://www.jeffreythompson.org/collision-detection/
  Wheel(float _x, float _y, float _r) {
    grey = color(50);
    lightGrey = color(210);
    position = new PVector(_x, _y);
    velocity = new PVector(0, -13);
    acceleration = new PVector(0, gravity);
    isJumping = false;
    radius = _r;
  }
  
  void drawTheWheel() {
    ellipseMode(CENTER);
    stroke(0);
    fill(grey);
    // hit detection code from https://www.jeffreythompson.org/collision-detection/
    ellipse(position.x, position.y, radius*2, radius*2);
    fill(lightGrey);
    ellipse(position.x, position.y, radius-5, radius-5);
    if(isJumping == true) {
      velocity.add(acceleration);
      position.add(velocity);
    }
    if(position.y > 600) {
      isJumping =false;
      position.y = 600;
    }
  }
  
  void wheelJump() {
    if (key == ' ') {
      isJumping = true;
      velocity = new PVector(0, -13);
    }
  }
}
