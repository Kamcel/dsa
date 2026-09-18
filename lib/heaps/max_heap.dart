class MaxHeap {
  final List<int> _heap = [];

  // -----------------------------------------------------------------
  // HELPER METHODS (From Image 1 & Image 2)
  // -----------------------------------------------------------------
  
  int _getParentIndex(int i) => (i - 1) ~/ 2;
  int _getLeftChildIndex(int i) => (2 * i) + 1;
  int _getRightChildIndex(int i) => (2 * i) + 2;

  bool _hasParent(int i) => i > 0;
  bool _hasLeftChild(int i) => _getLeftChildIndex(i) < _heap.length;
  bool _hasRightChild(int i) => _getRightChildIndex(i) < _heap.length;

  int get size => _heap.length;
  bool get isEmpty => _heap.isEmpty;

  void _swap(int indexA, int indexB) {
    int temp = _heap[indexA];
    _heap[indexA] = _heap[indexB];
    _heap[indexB] = temp;
  }

  // -----------------------------------------------------------------
  // CORE OPERATIONS
  // -----------------------------------------------------------------

  /// 1. Peek: O(1) Time | O(1) Space (Image 2)
  int peek() {
    if (isEmpty) {
      throw StateError("Heap is empty!");
    }
    return _heap[0];
  }

  /// 2. Insert (Sift-Up): O(log N) Time (Image 3)
  void insert(int value) {
    _heap.add(value); // Add to end of array
    _siftUp(_heap.length - 1);
  }

  void _siftUp(int index) {
    int currentIndex = index;

    while (_hasParent(currentIndex) &&
        _heap[currentIndex] > _heap[_getParentIndex(currentIndex)]) {
      int parentIndex = _getParentIndex(currentIndex);
      _swap(currentIndex, parentIndex);
      currentIndex = parentIndex; // Move rope pointer up
    }
  }

  /// 3. Remove Root / Extract Max (Sift-Down): O(log N) Time (Image 3 & 4)
  int extractMax() {
    if (isEmpty) {
      throw StateError("Heap is empty!");
    }

    int maxVal = _heap[0];
    
    // Move last element to root and remove last element
    _heap[0] = _heap.last;
    _heap.removeLast();

    // Sift down to maintain Max-Heap property
    if (!isEmpty) {
      _siftDown(0);
    }

    return maxVal;
  }

  void _siftDown(int index) {
    int currentIndex = index;

    // Continue as long as there is at least a left child
    while (_hasLeftChild(currentIndex)) {
      int leftChildIdx = _getLeftChildIndex(currentIndex);
      int rightChildIdx = _getRightChildIndex(currentIndex);

      // Assume left child is the largest first
      int largestChildIdx = leftChildIdx;

      // Check if right child exists and is greater than left child
      if (_hasRightChild(currentIndex) &&
          _heap[rightChildIdx] > _heap[leftChildIdx]) {
        largestChildIdx = rightChildIdx;
      }

      // If current element is larger than both children, we are done!
      if (_heap[currentIndex] >= _heap[largestChildIdx]) {
        break;
      }

      // Swap with the larger child and move down
      _swap(currentIndex, largestChildIdx);
      currentIndex = largestChildIdx;
    }
  }

  /// 4. Bottom-up Heapify: O(N) Time (Image 4 & 5)
  /// Converts an unsorted list into a valid Max-Heap in-place.
  static MaxHeap buildHeap(List<int> array) {
    MaxHeap maxHeap = MaxHeap();
    maxHeap._heap.addAll(array);

    // Start from the last non-leaf node and sift down to root
    int startIndex = (maxHeap.size ~/ 2) - 1;
    for (int i = startIndex; i >= 0; i--) {
      maxHeap._siftDown(i);
    }

    return maxHeap;
  }

  @override
  String toString() => _heap.toString();
}
