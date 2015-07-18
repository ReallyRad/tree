class PlantNode {
  PlantNode child1;
  PlantNode child2;
  PlantNode parent;
  PVector position;
  float direction;
  
  PlantNode(float x, float y, float d) {
    position.x = this.x;
    position.y = this.y;
    direction = d;
    parent = null;
    child1 = null;
    child2 = null;
  }
  
  void setDirection(float d) {
    direction = d;
  }
  
  void setParent(PlantNode p) {
    parent = p; 
  }
  
  void grow() {
    child1 = new PlantNode(position.x+cos(direction)*internode, position.y+cos(direction)*internode);
  }
  
  void split() {
    float newDirection = random(PI/4.0, PI/2.0);
    child1 = new PlantNode(position.x+cos(direction+newDirection)*internode, position.y+cos(direction+newDirection)*internode);
    child2 = new PlantNode(position.x+cos(direction-newDirection)*internode, position.y+cos(direction-newDirection)*internode);
  }
}
