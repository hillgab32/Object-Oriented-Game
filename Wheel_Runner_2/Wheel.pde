class Wheel {
  // hit detection code from https://www.jeffreythompson.org/collision-detection/
  float radius; // declare variables for the Wheel class

  color grey;
  color lightGrey;

  PVector position;
  PVector velocity;
  PVector acceleration;
  float gravity = 0.5;
  boolean isJumping;
  boolean hit = false; 

  // hit detection code from https://www.jeffreythompson.org/collision-detection/
  Wheel(float _x, float _y, float _r) { // assigns variables and writes the constructor
    grey = color(50);
    lightGrey = color(210);
    position = new PVector(_x, _y);
    velocity = new PVector(0, -13);
    acceleration = new PVector(0, gravity);
    isJumping = false;
    radius = _r;
  }
// hit detection code from https://www.jeffreythompson.org/collision-detection/
  void checkCollision(Hazard hazard) { // activates when the wheel and hazard collide
    hit = circleRect(hazard.position.x, hazard.position.y, hazard.w, hazard.h, position.x, position.y, radius);
  }

  void drawTheWheel() { // draws a dark grey wheel with a light grey rim, resets position when hit by hazard.
    ellipseMode(CENTER);
    stroke(0);
    fill(grey);
    if (hit) {
      position.y = 600;
    }
    // hit detection code from https://www.jeffreythompson.org/collision-detection/
    ellipse(position.x, position.y, radius*2, radius*2);
    fill(lightGrey);
    ellipse(position.x, position.y, radius-5, radius-5);
    if (isJumping == true) {
      velocity.add(acceleration); // determines how the wheel jump is affected by gravity
      position.add(velocity);
    }
    if (position.y > 600) {
      isJumping =false;
      position.y = 600;
    }
  }

  void wheelJump() { // causes the wheel to jump when the space key is pressed
    if (key == ' ') {
      isJumping = true;
      velocity = new PVector(0, -13);
    }
  }
}

// hit detection code from https://www.jeffreythompson.org/collision-detection/
boolean circleRect(float rx, float ry, float rw, float rh, float cx, float cy, float radius) { // determines hit detection

  // temporary variables to set edges for testing
  float testX = cx;
  float testY = cy;

  // which edge is closest?
  if (cx < rx)         testX = rx;      // compare left edge
  else if (cx > rx+rw) testX = rx+rw;   // right edge
  if (cy < ry)         testY = ry;      // top edge
  else if (cy > ry+rh) testY = ry+rh;   // bottom edge

  // get distance from closest edges
  float distX = cx-testX;
  float distY = cy-testY;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the radius, collision!
  if (distance <= radius) {
    return true;
  }
  return false;
}
