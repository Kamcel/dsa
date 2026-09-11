// Unlike in normal trees, nodes can be add anywhere,
//but in Binary Search tree, an ordering invariant is added
//All nodes in Left SubTree < Node Value < All node in Right Subtree

/*
ALGORITHM search(node, target):
IF node IS null RETURN null
IF node.value IS target RETURN node

IF target < node.value THEN
    RETURN search(node.left, target)
ELSE
    RETURN search(node.right, target)
 */

import 'package:dsa/trees/tree_node.dart';

TreeNode<int>? search(TreeNode<int>? node, int target) {
  if (node == null) {
    return null;
  }
  if (node.value == target) {
    return node;
  }
  if (target < node.value) {
    return search(node.left, target);
  } else {
    return search(node.right, target);
  }
}

/*
ALGORITHM findMin(node):
IF node is null RETURN null
CREATE current
WHILE current.left is not null
current = current.left
RETURN current
 */

TreeNode<int>? findMin(TreeNode<int>? root) {
  if (root == null) {
    return null;
  }
  TreeNode<int>? current = root;
  while (current!.left != null) {
    current = current.left;
  }
  return current;
}

/*
ALGORITHM findMax(node):
IF node is null RETURN null
CREATE current
WHILE current.right is not null
current = current.right
RETURN current
 */

TreeNode<int>? findMax(TreeNode<int>? root) {
  if (root == null) {
    return null;
  }
  TreeNode<int>? current = root;
  while (current!.right != null) {
    current = current.right;
  }
  return current;
}

/*
ALGORITHM insert(node, target) {
IF node is null 
    CREATE newNode
}
IF target < node.value
    node.left = insert(node.left, target) 
ELSE 
    node.right = insert(node.right, target)
    RETURN node 
 */

TreeNode<int>? insert(TreeNode<int>? node, int target) {
  if (node == null) {
    TreeNode<int> newNode = TreeNode(value: target);
    return newNode;
  }
  if (target < node.value) {
    node.left = insert(node.left, target);
  } else {
    node.right = insert(node.right, target);
  }
  return node;
}

/*
ALGORITHM delete(node, target):
IF node IS null THEN RETURN null

IF target < node.value THEN
    node.left = delete(node.left, target)
ELSE IF target > node.value THEN
    node.right = delete(node.right, target)
ELSE 
    IF node.left is null THEN
        RETURN node.right
    ELSE node.right is null THEN
        RETURN node.left

    CREATE successor = findMin(node.right)

    node.value = successor.value
    node.right = delete(node.right, successor.value)
    RETURN node
*/

TreeNode<int>? delete(TreeNode<int>? node, int target) {
  if (node == null) {
    return null;
  }

  if (target < node.value) {
    node.left = delete(node.left, target);
  } else if (target > node.value) {
    node.right = delete(node.right, target);
  } else {
    if (node.left == null) {
      return node.right;
    } else {
      if (node.right == null) {
        return node.left;
      }

      TreeNode<int>? successor = findMin(node.right);
      node.value = successor!.value;
      node.right = delete(node.right, successor.value);
    }
  }
  return node;
}
