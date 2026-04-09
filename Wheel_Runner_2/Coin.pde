class Coin {
  float radius;
  color yellow = color(255, 255, 0);
  PVector position;
  PVector velocity;
  boolean hit = false;
  
  Coin(float _x, float _y, float _r) {
    velocity = new PVector(2, 0);
    position  = new PVector(_x, _y);
    radius = _r;
  }
  
  // hit detection code from https://www.jeffreythompson.org/collision-detection/
  void checkCollision(Wheel wheel) {
    hit = circleCircle(wheel.position.x, wheel.position.y, wheel.radius, position.x, position.y, radius);
  }
  
  void drawCoin(){
    ellipseMode(CENTER);
    stroke(0);
    fill(yellow);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  void moveCoin() {
     position.sub(velocity);
    if((position.x <= -100) || hit) {
      position.x = 850;
      position.y = random(100, 600);
    }
  }
}

// hit detection code from https://www.jeffreythompson.org/collision-detection/
boolean circleCircle(float c1x, float c1y, float c1r, float c2x, float c2y, float c2r) {

  // get distance between the circle's centers
  // use the Pythagorean Theorem to compute the distance
  float distX = c1x - c2x;
  float distY = c1y - c2y;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the sum of the circle's
  // radii, the circles are touching!
  if (distance <= c1r+c2r) {
    return true;
  }
  return false;
}
