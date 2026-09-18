//Heap
class MaxHeap<T> {
  final List<int> _heap = [];
  int get size => _heap.length;
  bool get isEmpty => _heap.isEmpty;

  int? peek() {
    if (_heap.isEmpty) return null;
    return _heap[0];
  }
}

/* 
FUNCTION getParentIndex(i):
  RETURN (i-1) ~/ 2
*/
int _getParentIndex(int i) => (i - 1) ~/ 2;

/*
FUNCTION getLeftChildIndex(i):
  RETURN (2*i) +1
 */

int _getLeftChildIndex(int i) => (2 * i) + 1;
/* 
FUNCTION getRighttChildIndex(i):
  RETURN (2*i) +2
*/
int _getRightChildIndex(int i) => (2 * i) + 2;
/*
FUNCTION hasParent(i)
  RETURN i > 0
 */
bool _hasParent(int i) => i > 0;
/*
FUNCTION hasLeftChild(i, currentSize):
  RETURN getLeftChildIndex(i) < currentSize
 */
bool _hasLeftChild(int i, int currentSize) =>
    _getLeftChildIndex(i) < currentSize;
/*
FUNCTION hasRighttChild(i, currentSize):
  RETURN getrighttChildIndex(i) < currentSize
 */
bool _hasRightChild(int i, int currentSize) =>
    _getRightChildIndex(i) < currentSize;

/*
FUNCTION insert(heap, currentSize, value):
  APPEND value
  currentIndex = currentSize
  WHILE hasParent[currentIndex] AND heap[currentIndex] > heap(getParentIndex[currentIndex])
    parentIdx = getParentIndex(currentIndex)
    SWAP heap[currentInde] AND heap[parentIdx]
    currentIndex = parentIdx
 */

void insert(MaxHeap heap, int currentSize, int value) {
  _heap.add(value);
  var currentIndex = currentSize;
  while _hasParent[currentIndex] && _heap[currentIndex] > heap(_getParentIndex(currentIndex))
}
