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
    if (_storage.isEmpty) {
      print('Array is Empty');
    }

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
    newValue = _storage[index]!;
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
  void insert(int index, T newValue) {
    int? insertionIndex;
    T newValue;
    if (_size == capacity) {
      throw StackOverflowError();
    }
    for (int index = _size - 1; index >= insertionIndex!; index--) {
      _storage[index + 1] = _storage[index];
    }
    _storage[InsertionIndex[0] = newValue];
    _size = _size + 1;
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
    int position;
    if (index < 0 || index >= _size) {
      throw RangeError('Invalid index');
    }
    for (position = index; position < _size - 2; position++) {
      _storage[position] = _storage[position + 1];
    }
    _size = _size - 1;
  }
}
