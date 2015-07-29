class PlantNode {  
  
  public float x;
  public float y;
  public float direction;
  
  PlantNode(float x, float y, float d) {
    this.x = x;
    this.y = y;    
    direction = d;    
  }
  
  void setDirection(float d) {
    direction = d;
  }
  
  void draw() {
    fill(195);
    stroke(155);
    ellipse(x, y, 10, 10);
    if (debug == true) {
      stroke(255,0,0);
      line(x, y, x+0.5*internode*cos(direction), y+0.5*internode*sin(direction)); //draw node direction
      stroke (155);      
    }
    
  }
  
}
