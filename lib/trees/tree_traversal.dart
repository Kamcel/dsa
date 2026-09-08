// Also known as Depth-First-Search

//preOrder
//N->L->R
// Visit Node, then Left, then Right

import 'package:dsa/trees/tree_node.dart';

void preOrder(TreeNode<int>? node) {
  if (node == null) return;

  print(node.value);
  preOrder(node.left);
  preOrder(node.right);
}
//inOrder
//L->N->R
// Visit Left, then Node, then Right

void inOrder(TreeNode<int>? node) {
  if (node == null) return;

  inOrder(node.left);
  print(node.value);
  inOrder(node.right);
}

//postOrder
//L->R->N
// Visit left, then Right, then Node
void postOrder(TreeNode<int>? node) {
  if (node == null) return;

  postOrder(node.left);
  postOrder(node.right);
  print(node.value);
}
