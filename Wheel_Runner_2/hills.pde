class Hills {
  color green = color(63, 155, 11); // declare variables for the hills class
  PVector position;
  PVector velocity;
  float hillHeight;
  float hillWidth;
  
  Hills(float h, float w) { // assign variables and write a constructor
    position = new PVector(800, 625);
    velocity = new PVector(random(1, 4), 0);
    hillHeight = h;
    hillWidth = w;
  }
  
  void drawHill() { // draws a hill with a random height and width
    stroke(0);
    fill(green);
    ellipseMode(CENTER);
    ellipse(position.x, position.y, hillHeight, hillWidth);
  }
  
  void moveHill() { // causes the hill to move at a random speed from right to left, re-randomizing the velocity and resetting the position when it reaches the left
    position.sub(velocity);
    if(position.x <= -hillWidth/2) {
      position.x = 800 + (hillWidth/2);
      velocity.x = random(1, 4);
    }
  }
}
