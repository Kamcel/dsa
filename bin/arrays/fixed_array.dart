// Start with pseudocode
// Then code

class FixedArray<T> {
  final List<T?> _storage;
  int _size = 0;
  final int capacity;

  FixedArray({required this.capacity})
    : _storage = List<T?>.filled(capacity, null, growable: false);
  int get size => _size;

  // Operation
  /*
Get(index)
IF array is empty
PRINT 'Array is Empty - or THROW error'
STOP
END IF
IF index < 0 OR index >= size
PRINT 'Invalid index'
STOP
END IF
RETURN value at index
 */

  T get(int index) {
    if (index < 0 || index >= _size) {
      throw RangeError('Invalid index');
    }
    return _storage[index]!;
  }

  /* 
Set(index, value)
IF index < 0 OR index >= size
PRINT 'Invalid index'
STOP 
END IF
SET storage[index]
*/

  void set(index, T newValue) {
    if (index < 0 || index >= _size) {
      throw RangeError('Invalid index');
    }
    _storage[index] = newValue;
  }

  /*
Traversal
FOR index = 0 TO size - 1
VISIT storage[index]
END FOR
 */

  void traversal() {
    for (int index = 0; index < _size; index++) {
      print(_storage[index]);
    }
  }

  /* 
Search
FOR each occupied element
IF current value IS target
END FOR
RETURN false
*/
  bool search(T target) {
    for (int index = 0; index < _size; index++) {
      if (_storage[index] == target) return true;
    }
    return false;
  }

  /*
Insert
IF size == capacity
THROW overflow error
STOP
FOR index = size -1 DOWN TO  insertionIndex
storage[index + 1] = storage[index]
END FOR
storage[insertionIndex = newValue]
size = size + 1
 */
  void insert(int insertionIndex, T newValue) {
    //validate index
    if (insertionIndex < 0 || insertionIndex > _size) {
      throw RangeError('Invalid index');
    }
    //check capacity
    if (_size == capacity) {
      throw StateError('Capacity is full');
    }
    //shift right
    for (int i = _size - 1; i >= insertionIndex; i--) {
      _storage[i + 1] = _storage[i];
    }
    _storage[insertionIndex] = newValue;
    _size++;
  }

  /* 
Remove
IF index < 0 OR index >= size
PRINT 'Invalid index'
STOP 
FOR  position = index to size -2 
storage[position] = storage[position + 1]
END FOR
size = size - 1 
*/

  void remove(int index) {
    if (index < 0 || index >= _size) {
      throw RangeError('Invalid insdex');
    }
    for (int i = index; i < _size - 1; i++) {
      _storage[i] = _storage[i + 1];
    }
    //clear last occupied slot
    _storage[_size - 1] = null;
    _size--;
  }
}
