TreeNode<String> root;
TreeNode<String> example;

int lastTime;
int interval = 2000;
int internode = 5;

ArrayList<PlantNode> plantList;
ArrayList<TreeNode> treeList;

void setup() {  
  //root = new TreeNode<String>("root");
  example = getSet1();
  plantList = new ArrayList<PlantNode>();
  plantList.add(new PlantNode(width/2, 0, PI));
  treeList = new ArrayList<TreeNode>();
  treeList.add(new TreeNode());
  root = 
}

void draw() {
  
  if ((millis()-lastTime)<interval) {
    lastTime = millis();
    
  }
  
  root = new PlantNode
  
}

void grow(){

}
/*
  for (TreeNode<String> node : treeRoot) {
      String indent = createIndent(node.getLevel());
      System.out.println(indent + node.data);
    }
*/

private static String createIndent(int depth) {
  StringBuilder sb = new StringBuilder();
  for (int i = 0; i < depth; i++) {
    sb.append(' ');
  }
  return sb.toString();
}


public static TreeNode<String> getSet1() {
  TreeNode<String> root = new TreeNode<String>("root");
  {
    TreeNode<String> node0 = root.addChild("node0");
    TreeNode<String> node1 = root.addChild("node1");
    TreeNode<String> node2 = root.addChild("node2");
    {
      TreeNode<String> node20 = node2.addChild(null);
      TreeNode<String> node21 = node2.addChild("node21");
      {
        TreeNode<String> node210 = node21.addChild("node210");
        TreeNode<String> node211 = node21.addChild("node211");
      }
    }
    TreeNode<String> node3 = root.addChild("node3");
    {
      TreeNode<String> node30 = node3.addChild("node30");
    }
  }

  return root;
}
