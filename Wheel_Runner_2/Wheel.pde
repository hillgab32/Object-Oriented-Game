class Wheel {
  color grey;
  color lightGrey;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float gravity = 0.5;
  boolean isJumping;
  
  Wheel() {
    grey = color(50);
    lightGrey = color(210);
    position = new PVector(150, 600);
    velocity = new PVector(0, -13);
    acceleration = new PVector(0, gravity);
    isJumping = false;
  }
  
  void drawTheWheel() {
    ellipseMode(CENTER);
    stroke(0);
    fill(grey);
    ellipse(position.x, position.y, 50, 50);
    fill(lightGrey);
    ellipse(position.x, position.y, 20, 20);
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
