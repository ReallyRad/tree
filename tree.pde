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
  background(195);
  root = getSet();  
  for (TreeNode<PlantNode> node : root) {  
    node.data.draw();
  }   
  
}

void grow(){

} 

  TreeNode<PlantNode> getSet() {
    TreeNode<PlantNode> root = new TreeNode<PlantNode>(new PlantNode(width/2, 0, PI/2));
    
    
      TreeNode<PlantNode> node0 = grow(root, PI/2-PI/6);
      TreeNode<PlantNode> node1 = grow(root, PI/2+PI/6);      
      {
        TreeNode<PlantNode> node20 = grow(node1, -PI/2-PI/6);        
        {
          TreeNode<PlantNode> node210 = grow(node20, PI/2-PI/6);
          TreeNode<PlantNode> node211 = grow(node20, PI/2-PI/6);
        }
      }
      TreeNode<PlantNode> node3 = grow(root, PI/2-PI/4);
      {
        TreeNode<PlantNode> node30 = grow(node3, PI/2-PI/4);
      }
    
  return root;
  }

  TreeNode<PlantNode> grow(TreeNode<PlantNode> t, float d) {    
    float direction = t.getData().direction;
    float x = t.getData().x;
    float y = t.getData().y;
    //PVector position = new PVector(t.getData().position.x,t.getData().position.y);   
    //PlantNode plantnode = new PlantNode(width/2, 0, -PI/2);
    PlantNode plantnode = new PlantNode(x+cos(direction)*internode, y+sin(direction)*internode, d);
    return t.addChild(plantnode);
  }
  /*
  void split(int d) {
    float newDirection = random(PI/4.0, PI/2.0);
    new PlantNode(position.x+cos(direction+newDirection)*internode, position.y+cos(direction+newDirection)*internode, d);
    new PlantNode(position.x+cos(direction-newDirection)*internode, position.y+cos(direction-newDirection)*internode, d);
  }
*/
/*
  for (TreeNode<String> node : treeRoot) {
        String indent = createIndent(node.getLevel());
      System.out.println(indent + node.data);
    }
*/

void keyPressed() {
  if (key == 'd' || key == 'D') debug = !debug;  
}

