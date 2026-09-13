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
