class Hills {
  color green = color(115, 186, 215);
  PVector position;
  PVector velocity;
  float hillHeight;
  float hillWidth;
  
  Hills(float h, float w) {
    position = new PVector(800, 625);
    velocity = new PVector(random(1, 4), 0);
    hillHeight = h;
    hillWidth = w;
  }
  
  void drawHill() {
    stroke(0);
    fill(green);
    ellipseMode(CENTER);
    ellipse(position.x, position.y, hillHeight, hillWidth);
  }
  
  void moveHill() {
    position.sub(velocity);
    if(position.x <= -hillWidth/2) {
      position.x = 800 + (hillWidth/2);
      velocity.x = random(1, 4);
    }
  }
}
