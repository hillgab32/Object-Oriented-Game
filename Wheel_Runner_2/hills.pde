class Hills {
  color green = color(115, 186, 215);
  PVector position;
  PVector velocity;
  float hillHeight;
  float hillWidth;
  
  Hills() {
    position = new PVector(800, 625);
    velocity = new PVector(random(1, 4), 0);
    hillHeight = random(100, 600);
    hillWidth = random(50, 200);
  }
  
  drawHill() {
  }
  
}
