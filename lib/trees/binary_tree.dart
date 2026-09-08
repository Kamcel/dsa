import 'package:dsa/trees/tree_node.dart';

void main() {
  final node10 = TreeNode<int>(value: 10);
  final node9 = TreeNode<int>(value: 9, right: node10);
  final node8 = TreeNode<int>(value: 8);

  final node7 = TreeNode<int>(value: 7, left: node8, right: node9);
  final node6 = TreeNode<int>(value: 6);

  final node5 = TreeNode<int>(value: 5);
  final node4 = TreeNode<int>(value: 4);

  final node3 = TreeNode<int>(value: 3, left: node6, right: node7);
  final node2 = TreeNode<int>(value: 2);
  final root = TreeNode<int>(value: 1, left: node2, right: node3);

  print(
    'Value at root.right.right.right: ${root.right?.right?.right?.right?.value}',
  );
}
