class PlantNode {  
  float x;
  float y;
  float direction;
  int id;
  
  PlantNode(float x, float y, float d) {
    this.x = x;
    this.y = y;    
    direction = d;    
  }
  
  void setDirection(float d) {
    direction = d;
  }
  
  void draw() {
    fill(0);
    stroke(255);
    ellipse(x, y, 10, 10);
    if (debug == true) {
      line(x, y, x+internode*cos(direction), y+internode*sin(direction));
    }    
  }
  
}
