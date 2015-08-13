class PlantNode {  
  
  public float x;
  public float y;  
  public float direction;
  
  PlantNode(float x, float y, float d) {
    this.x = x;
    this.y = y;  
    //direction = d;
    setDirection(d);    
    draw();
  }
  
void setDirection(float d) { //set direction given direction of previous node  
  float increment = PI/3;         
  //println("setting direction, previous = " + degrees(d) );
  direction = d;
  if (sin(direction)<0) { //if heading down
    if ((y > height - boxSize) ) { //if past lower limit
      println("past lower limit");
      if (cos(direction)>0 && x < width-boxSize) direction+=increment; //if towards right, turn more right
      if (cos(direction)<=0 && x > boxSize) direction-=increment; //if towards left, turn more left
    }  
    if (x > width - boxSize) direction -= increment;  //if past right limit turn down        
    if (x <  boxSize) direction += increment;  //if past left limit turn down
  }
  
  if (sin(direction)>0) {//if heading up
    if (y < boxSize) { //if past upper limit
      if (cos(direction)>0 && x < width - boxSize) direction-=increment; //if towards right, turn more right
      if (cos(direction)<=0 && x > boxSize) direction +=increment;
    }
    if (x < boxSize) direction -= increment;  //if past left limit turn up
    if (x > width - boxSize) direction += increment;  //if past right limit turnup
  }    
  float rand=random(-PI/50, PI/50);;
  direction+=rand;
  //println("added to direction : " + degrees(rand));
}
  
  void draw() {
    fill(195);
    stroke(155);
    ellipse(x, y, 10, 10);
    if (debug == true) {
      stroke(255,0,0);
      line(x, y, x+0.5*internode*cos(direction), y-0.5*internode*sin(direction)); //draw node direction
      stroke (155);      
    }
    
  }
  
}
