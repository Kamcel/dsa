// Also known as Depth-First-Search

//preOrder
//N->L->R
// Visit Node, then Left, then Right

import 'package:dsa/queue/non_circular_queue_without_shift.dart';
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

/*
Breadth-first search
Step
1. Put the root into the queue
2. Loop through the tree, while queue is not empty
  a. pop/dequeue
  b. print/process
  c. push to queue
3. stop the traversal

ALGORITHM levelOrder(root):
IF root is null return
INSTANTIATE queue
ENQUEUE root
WHILE queue is not null
CREATE current
PRINT current value
IF current left null is not null
  ENQUEUE current left
IF current right null is not null
  ENQUEUE current right


 */

void levelOrder<T>(TreeNode<T>? root) {
  if (root == null) return;
  final queue = NonCircularQueueWithoutShift<TreeNode<T>>();
  queue.enqueue(root);

  while (!queue.isEmpty) {
    final current = queue.dequeue();
    print(current.value);
    if (current.left != null) {
      queue.enqueue(current.left!);
    }
    if (current.right != null) {
      queue.enqueue(current.right!);
    }
  }
}

void main() {
  // final root = TreeNode<int>(
  //   value: 10,
  //   left: TreeNode<int>(
  //     value: 5,
  //     left: TreeNode<int>(value: 2),
  //     right: TreeNode<int>(value: 8),
  //   ),
  //   right: TreeNode<int>(value: 20),
  // );
  // print('Pre-order traversal:');
  // preOrder(root);
  // print('In-order traversal:');
  // inOrder(root);
  // print('Post-order traversal:');
  // postOrder(root);

  final root = TreeNode<int>(
    value: 10,
    left: TreeNode(
      value: 5,
      left: TreeNode(value: 2),
      right: TreeNode(value: 8),
    ),
    right: TreeNode(value: 20),
  );
  print('Level-Order (BFS) traversal:');
  levelOrder(root);
}
