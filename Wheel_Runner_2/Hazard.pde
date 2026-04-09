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
    acceleration = new PVector(0.1, 0);
    // hit detection code from https://www.jeffreythompson.org/collision-detection/
    w = _w;
    h = _h;
  }

  // hit detection code from https://www.jeffreythompson.org/collision-detection/
  void checkCollision(Wheel wheel) {
    hit = rectCircle(wheel.position.x, wheel.position.y, wheel.radius, position.x, position.y, w, h);
  }

  void drawHazard() {
    rectMode(CENTER);
    stroke(0);
    // hit detection code from https://www.jeffreythompson.org/collision-detection/
    if (hit) {
      fill(255);
    } else {
      fill(red);
    }
    rect(position.x, position.y, w, h);
  }
  
  boolean death() {
    if(hit) {
      return true;
    }
    else {
      return false;
    }
  }

  void moveHazard() {
    position.sub(velocity);
    if (position.x <= -100) {
      position.x = 850;
      position.y = random(100, 600);
      velocity.add(acceleration);
    }
  }
}
// hit detection code from https://www.jeffreythompson.org/collision-detection/
boolean rectCircle(float cx, float cy, float radius, float rx, float ry, float rw, float rh) {

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
