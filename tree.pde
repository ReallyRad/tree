int lastTime, interval, internode, boxSize;
boolean debug;
TreeNode<PlantNode> root;
TreeNode<PlantNode> node1;
ArrayList<TreeNode<PlantNode>> nodes;

void setup() {      
  size(1366/2, 700, OPENGL);
  debug = false;
  lastTime = millis();
  nodes = new ArrayList<TreeNode<PlantNode>>();
  root = new TreeNode<PlantNode>(new PlantNode(width/2, height/2, PI/2));
  node1 = grow(root, PI/6.f);  
}

void draw() {
  interval = 50;
  internode = 5;
  boxSize = 80;
  //background(255,255);
  fill(255,0);
  rect(0,0,width,height);  
  drawBox();  
  /*for (TreeNode<PlantNode> node : node1) {  
    node.data.draw();
    fill(0,0,255);
    if (node.children.size() > 0) line(node.data.x, node.data.y, node.children.get(0).data.x, node.children.get(0).data.y); 
    if (node.children.size() > 1) line(node.data.x, node.data.y, node.children.get(1).data.x, node.children.get(1).data.y);    
  } */     
  
  if (millis()-lastTime > interval) {
    lastTime=millis();
    ArrayList<TreeNode<PlantNode>>  leaves = new ArrayList<TreeNode<PlantNode>>();
    for (TreeNode<PlantNode> node : root) {  
      if (node.isLeaf()) {
        leaves.add(node);
      }      
    }
    //println("leaves size : " + leaves.size());
    for (TreeNode<PlantNode> node : leaves) {
      if (random(0,5)>4.95) { // 1 out of 5 times, split
        //println("split!");
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
    
}

void drawBox() {
  stroke(0);
  line(boxSize, boxSize, width-boxSize, boxSize);
  line(boxSize, boxSize, boxSize, height-boxSize);
  line(width-boxSize, boxSize, width-boxSize, height-boxSize);
  line(boxSize, height-boxSize, width-boxSize, height-boxSize);
}

TreeNode<PlantNode> getSet() {
               
    /*      
    TreeNode<PlantNode> node20 = grow(node1, -PI/6.f);                  
    TreeNode<PlantNode> node211 = grow(node20, -PI/6.f);
    TreeNode<PlantNode> node30 = grow(node211, -PI/4.f);
    TreeNode<PlantNode> node300 = split(node30, 0, PI/4.f);      
    TreeNode<PlantNode> node301 = split(node30, 1, PI/4.f);*/    
    //TreeNode<PlantNode> node301 = spli(node301, 1, PI/2-PI/4);
return root;
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

