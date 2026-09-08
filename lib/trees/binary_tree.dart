import 'package:dsa/trees/tree_node.dart';

void main() {
  TreeNode root = TreeNode(
    value: 1,
    left: TreeNode(value: 2),
    right: TreeNode(value: 3),
  );
  TreeNode node2 = TreeNode(
    value: 2,
    left: TreeNode(value: 4),
    right: TreeNode(value: 5),
  );
  TreeNode node3 = TreeNode(
    value: 3,
    left: TreeNode(value: 6),
    right: TreeNode(value: 7),
  );
  TreeNode node4 = TreeNode(value: null);
  TreeNode node5 = TreeNode(value: null);
  TreeNode node6 = TreeNode(value: null);
  TreeNode node7 = TreeNode(
    value: 2,
    left: TreeNode(value: 8),
    right: TreeNode(value: 9),
  );
  TreeNode node8 = TreeNode(value: null);
  TreeNode node9 = TreeNode(value: 9, right: TreeNode(value: 10));

  print('Root: ${root.value}');
  print('Root left: ${root.left?.value}');
  print('Root right: ${root.right?.value}');
  print('Node 2 left: ${node2.left?.value}');
  print('Node 2 right: ${node2.right?.value}');

  print('Node 3 left: ${node3.left?.value}');
  print('Node 3 right: ${node3.right?.value}');
  print('Node 7 left: ${node7.left?.value}');
  print('Node 7 right: ${node7.right?.value}');

  print('Node 9 right: ${node9.right?.value}');

  print('Node 4: ${node4.value}');
  print('Node 5: ${node5.value}');
  print('Node 6: ${node6.value}');
  print('Node 8: ${node8.value}');
}
