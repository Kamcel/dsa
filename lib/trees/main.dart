import 'package:dsa/trees/tree_node.dart';

void main() {
  TreeNode<int> node5 = TreeNode(value: 5);
  TreeNode<int> node15 = TreeNode(value: 15);
  TreeNode<int> root = TreeNode(value: 10, left: node5, right: node15);

  print('Root value: ${root.value}');
  print('Left value: ${node5.value}');
  print('Right value: ${node15.value}');
}
