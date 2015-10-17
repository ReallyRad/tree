int lastTime, interval, internode, boxSize;
boolean debug;
TreeNode<PlantNode> root;
TreeNode<PlantNode> node1;

float w;
int vCount;
void setup() {      
  size(680, 700, OPENGL);
  debug = false;
  lastTime = millis();  
  root = new TreeNode<PlantNode>(new PlantNode(width/2, height/2, -PI/2)); //first node
  node1 = grow(root, PI/6.f);  
}

void draw() {
  vCount = 0;
  float w = 50;
  interval = 1000;
  internode = 50;
  boxSize = 80;
  background(255,255);
  fill(255,0);
  noStroke();
  rect(0, 0, width, height);  
  //drawBox(); // draw growth boundaries  

  if (millis()-lastTime > interval) {
    lastTime=millis();
    ArrayList<TreeNode<PlantNode>> leaves = new ArrayList<TreeNode<PlantNode>>();
    for (TreeNode<PlantNode> node : root) { // get all leaves  
      if (node.isLeaf()) {
        leaves.add(node);
      }      
    } 
    
    for (TreeNode<PlantNode> node : leaves) { //go through leaves
      if (random(0,5)>4.995) { // 1 out of 5 times, split       
        float rand = random(-PI/3, PI/3);
        TreeNode<PlantNode> node_left = split(node, 0, node.parent.data.direction+rand);
        TreeNode<PlantNode> node_right = split(node, 1, node.parent.data.direction-rand);
      }
      else { //4 out of 5 times, grow
        //println("grow");               
        TreeNode<PlantNode> new_node = grow(node, node.parent.data.direction);                
      }
    }
  }
  
  beginShape();
  drawTree(root);  
  endShape();
}

void drawTree(TreeNode<PlantNode> p){     
   if (!p.isLeaf() && p.children.size()==1) { //if grow node    
     nineOClock(p);
     threeOClock(p);
     drawTree(p.children.get(0));
   }
   else if (!p.isLeaf() && p.children.size()==2) { //if split node    
     nineOClock(p);
     if(cos(p.children.get(0).data.direction)>0) { //if left child
       drawTree(p.children.get(0));
       drawTree(p.children.get(1));
     }
     else { //if right child        
       drawTree(p.children.get(0));
       drawTree(p.children.get(1));
     }
     threeOClock(p);
   }    
   else if (p.isLeaf()) { //if leaf
     nineOClock(p);
     twelveOClock(p);
     threeOClock(p);              
   }
}

void threeOClock(TreeNode<PlantNode> p) {
     myVertex(p.data.x + w*cos(p.data.direction+PI/2), p.data.y - w*sin(p.data.direction+PI/2)); //<>//
}

void nineOClock(TreeNode<PlantNode> p) {
    myVertex(p.data.x + w*cos(p.data.direction-PI/2), p.data.y - w*sin(p.data.direction-PI/2)); //<>//
}

void twelveOClock(TreeNode<PlantNode> p) {
  myVertex(p.data.x + w*cos(p.data.direction), p.data.y - w*sin(p.data.direction)); //<>//
}

void myVertex(float x, float y) {
  vCount++;
  //ellipse(x, y, 7, 7); //<>//
  stroke(0);
  fill(155);
  //curveVertex(x, y);
  stroke(105);
  fill(5);
  text(vCount, x+5, y);
}



void drawBox() {
  stroke(0);
  line(boxSize, boxSize, width-boxSize, boxSize);
  line(boxSize, boxSize, boxSize, height-boxSize);
  line(width-boxSize, boxSize, width-boxSize, height-boxSize);
  line(boxSize, height-boxSize, width-boxSize, height-boxSize);
}

TreeNode<PlantNode> grow(TreeNode<PlantNode> t, float d) {    
  float direction = t.data.direction;
  float x = t.getData().x;
  float y = t.getData().y;    
  PlantNode plantnode = new PlantNode(x+cos(direction)*internode, y-sin(direction)*internode, direction);
  
  return t.addChild(plantnode);
}
  
TreeNode<PlantNode> split(TreeNode<PlantNode> t, int i, float d) {
  float direction = t.data.direction;
  float x = t.getData().x;
  float y = t.getData().y;
  PlantNode plantnode = new PlantNode(0,0,0);    
  if (i==0) {
   plantnode = new PlantNode(x+cos(direction+d/2)*internode, y+sin(direction+d/2)*internode, direction+d);     
  }
  else if (i==1) {
   plantnode = new PlantNode(x+cos(direction-d/2)*internode, y+sin(direction-d/2)*internode, direction+d);          
  }
  return t.addChild(plantnode);
}
  
void keyPressed() {
  if (key == 'd' || key == 'D') debug = !debug;  
}