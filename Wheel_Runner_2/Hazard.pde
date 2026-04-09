class Hazard {
  color red; // declare variables for the Hazard class
  float w, h;
  PVector position;
  PVector velocity;
  PVector acceleration;
  // hit detection code from https://www.jeffreythompson.org/collision-detection/
  boolean hit = false;
// hit detection code from https://www.jeffreythompson.org/collision-detection/
  Hazard(float _x, float _y, float _w, float _h) { // assign variables and write constructor
    red = color(255, 0, 0);
    position = new PVector(_x, _y);
    velocity = new PVector(4, 0);
    acceleration = new PVector(0.1, 0);
    // hit detection code from https://www.jeffreythompson.org/collision-detection/
    w = _w;
    h = _h;
  }

  // hit detection code from https://www.jeffreythompson.org/collision-detection/
  void checkCollision(Wheel wheel) { // activates when the wheel and hazard collide
    hit = rectCircle(wheel.position.x, wheel.position.y, wheel.radius, position.x, position.y, w, h);
  }

  void drawHazard() { // draws the hazard as a red square, resetting its position and velocity when hit to avoid overlapping with the wheel when trying to play again
    rectMode(CENTER);
    stroke(0);
    fill(red);
    // hit detection code from https://www.jeffreythompson.org/collision-detection/
    if (hit) {
      position.x = 850;
      velocity.x = 4;
    }
    rect(position.x, position.y, w, h);
  }

  boolean death() { // returns a true signal when the wheel hits the hazard, ending the game
    if (hit) {
      return true;
    } else {
      return false;
    }
  }

  void moveHazard() { // The hazard moves from left to right and gradually increases in speed.
    position.sub(velocity);
    if (position.x <= -100) {
      position.x = 850;
      position.y = random(100, 600);
      velocity.add(acceleration);
    }
  }
}
// hit detection code from https://www.jeffreythompson.org/collision-detection/
boolean rectCircle(float cx, float cy, float radius, float rx, float ry, float rw, float rh) { // determines hit detection

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
