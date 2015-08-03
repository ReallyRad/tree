int lastTime;
int interval;
int internode;
boolean debug;

TreeNode<PlantNode> root;

void setup() {      
  size(1366/2, 768);
  debug = false;
}

void draw() {
  interval = 2000;
  internode = 50;
  background(255);
  root = getSet();  
  translate(0, 105);
  for (TreeNode<PlantNode> node : root) {  
    node.data.draw();
    fill(0,0,255);
    if (node.children.size() > 0) line(node.data.x, node.data.y, node.children.get(0).data.x, node.children.get(0).data.y); 
    if (node.children.size() > 1) line(node.data.x, node.data.y, node.children.get(1).data.x, node.children.get(1).data.y);    
  }      
}

float direction(TreeNode<PlantNode>){
  return 
}

TreeNode<PlantNode> getSet() {
  TreeNode<PlantNode> root = new TreeNode<PlantNode>(new PlantNode(width/2, 0, PI/2));             
    TreeNode<PlantNode> node1 = grow(root, PI/6.f);      
    TreeNode<PlantNode> node20 = grow(node1, -PI/6.f);                  
    TreeNode<PlantNode> node211 = grow(node20, -PI/6.f);
    TreeNode<PlantNode> node30 = grow(node211, -PI/4.f);
    TreeNode<PlantNode> node300 = split(node30, 0, PI/4.f);      
    TreeNode<PlantNode> node301 = split(node30, 1, PI/4.f);
    //TreeNode<PlantNode> node301 = spli(node301, 1, PI/2-PI/4);
return root;
}

TreeNode<PlantNode> grow(TreeNode<PlantNode> t, float d) {    
  float direction = t.data.direction;
  float x = t.getData().x;
  float y = t.getData().y;    
  PlantNode plantnode = new PlantNode(x+cos(direction)*internode, y+sin(direction)*internode, direction+d);
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

