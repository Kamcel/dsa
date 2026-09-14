import 'dart:math';

class AvlTreeNode<T> {
  T value;
  AvlTreeNode<T>? left;
  AvlTreeNode<T>? right;
  int height;

  AvlTreeNode({required this.value, this.left, this.right, this.height = 0});
}

/*
Function insert(node, newValue):
    // Step 1: Standard BST Insertion
    If node is null:
        Return new Node(newValue)   // Reached insertion point!

    If newValue < node.value:
        node.left = insert(node.left, newValue)
    Else If newValue > node.value:
        node.right = insert(node.right, newValue)
    Else:
        Return node                // Duplicate values not allowed in standard BST

    // Step 2: Update Height of current ancestor node
    updateHeight(node)

    // Step 3: Get Balance Factor to check if it became unbalanced
    bf = getBalanceFactor(node)

    // Step 4: Rebalance if needed (4 Rotation Cases)

    // Case 1: Left-Left (LL)
    If bf > 1 AND newValue < node.left.value:
        Return rotateRight(node)

    // Case 2: Right-Right (RR)
    If bf < -1 AND newValue > node.right.value:
        Return rotateLeft(node)

    // Case 3: Left-Right (LR)
    If bf > 1 AND newValue > node.left.value:
        node.left = rotateLeft(node.left)    // Step A: Rotate child left
        Return rotateRight(node)             // Step B: Rotate node right

    // Case 4: Right-Left (RL)
    If bf < -1 AND newValue < node.right.value:
        node.right = rotateRight(node.right) // Step A: Rotate child right
        Return rotateLeft(node)              // Step B: Rotate node left

    Return node // Node remains balanced, return it unchanged

 */

AvlTreeNode<int>? insert(AvlTreeNode<int>? node, int newNode) {
  if (node == null) {
    return AvlTreeNode(value: newNode);
  }

  if (newNode < node.value) {
    node.left = insert(node.left, newNode);
  } else if (newNode > node.value) {
    node.right = insert(node.right, newNode);
  } else {
    return node;
  }
  _updateHeight(node);

  int bf = _getBalanceFactor(node);
  if (bf > 1 && newNode < node.left!.value) {
    return _rotateRight(node);
  }

  if (bf < -1 && newNode > node.right!.value) {
    return _rotateLeft(node);
  }

  if (bf > 1 && newNode < node.left!.value) {
    node.left = _rotateLeft(node.left!);
    return _rotateRight(node);
  }

  if (bf < -1 && newNode > node.right!.value) {
    node.right = _rotateRight(node.right!);
    return _rotateLeft(node);
  }
  return node;
}
/*
FUNCTION delete(node, target):
    // -------------------------------------------------------------
    // PHASE 1: STANDARD BST DELETION
    // -------------------------------------------------------------
    IF node IS NULL:
        RETURN NULL  // Target element not found in tree

    IF target < node.value:
        node.left = delete(node.left, target)
    ELSE IF target > node.value:
        node.right = delete(node.right, target)
    ELSE:
        // Found target node! Handle child cases.
        
        // Case A & B: 0 Children or 1 Child
        IF node.left IS NULL:
            RETURN node.right
        ELSE IF node.right IS NULL:
            RETURN node.left
        
        // Case C: 2 Children
        // 1. Get in-order successor (smallest node in right subtree)
        Node successor = getMinValueNode(node.right)
        
        // 2. Copy successor value to current node
        node.value = successor.value
        
        // 3. Recursively delete successor from right subtree
        node.right = delete(node.right, successor.value)

    // If the tree had only 1 node and it was deleted
    IF node IS NULL:
        RETURN NULL

    // -------------------------------------------------------------
    // PHASE 2: RECALCULATE HEIGHT & REBALANCE (STACK UNWINDING)
    // -------------------------------------------------------------
    
    // 1. Update Height
    node.height = 1 + MAX(getHeight(node.left), getHeight(node.right))

    // 2. Compute Balance Factor
    INT bf = getBalanceFactor(node)

    // 3. Rebalance if unbalanced (|bf| > 1)
    
    // Left Heavy Case
    IF bf > 1:
        // Note: For deletion, we check IF child BF < 0 for LR case
        IF getBalanceFactor(node.left) < 0:
            node.left = rotateLeft(node.left)
        RETURN rotateRight(node)

    // Right Heavy Case
    IF bf < -1:
        // Note: For deletion, we check IF child BF > 0 for RL case
        IF getBalanceFactor(node.right) > 0:
            node.right = rotateRight(node.right)
        RETURN rotateLeft(node)

    // 4. Return balanced node pointer
    RETURN node

// -----------------------------------------------------------------
// HELPER: FIND IN-ORDER SUCCESSOR
// -----------------------------------------------------------------
FUNCTION getMinValueNode(node):
    Node current = node
    WHILE current.left IS NOT NULL:
        current = current.left
    RETURN current

*/

void _updateHeight(AvlTreeNode<int>? node) {
  if (node == null) return;

  int leftSubTreeHeight = node.left?.height ?? -1;
  int rightSubTreeHeight = node.right?.height ?? -1;

  node.height = 1 + max(leftSubTreeHeight, rightSubTreeHeight);
}

int? _getHeight(AvlTreeNode<int>? node) {
  if (node == null) return -1;
  return node.height;
}

int _getBalanceFactor(AvlTreeNode<int>? node) {
  if (node == null) {
    return 0;
  }
  int balanceFactor = _getHeight(node.left)! - _getHeight(node.right)!;
  return balanceFactor;
}

AvlTreeNode<int> _rotateRight(AvlTreeNode<int> y) {
  AvlTreeNode<int> x = y.left!;
  AvlTreeNode<int>? T2 = x.right;

  // Perform rotation
  x.right = y;
  y.left = T2;

  // Update heights
  _updateHeight(y);
  _updateHeight(x);

  // Return new root
  return x;
}

AvlTreeNode<int> _rotateLeft(AvlTreeNode<int> x) {
  AvlTreeNode<int> y = x.right!;
  AvlTreeNode<int>? T2 = y.left;

  // Perform rotation
  y.left = x;
  x.right = T2;

  // Update heights
  _updateHeight(x);
  _updateHeight(y);

  // Return new root
  return y;
}
