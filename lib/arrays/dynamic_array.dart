// Start with pseudocode
// Then code

class DynamicArray<T> {
  List<T?> _storage;
  int _size = 0;

  DynamicArray({int initalCapacity = 5})
    : _storage = List<T?>.filled(initalCapacity, null, growable: false);

  int get size => _size;
  bool get isEmpty => _size == 0;

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

  void set(int index, T newValue) {
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

  void traverse() {
    for (int index = 0; index < _size; index++) {
      print(_storage[index]);
    }
  }

  /*
resize
FUNCTION resize()
newCapacity = storage.length * 2
newStorage = new array[newCapacity] filled with null 
FOR i FROM TO size -1
newStorage[i] = storage[i]
storage = newStorage
capacity = newCapacity
*/

  void resize() {
    final newCapacity = _storage.length * 2;
    final newStorage = List<T?>.filled(newCapacity, null, growable: false);

    for (int i = 0; i < _size; i++) {
      newStorage[i] = _storage[i];
      _storage = newStorage;
      _storage.length = newCapacity;
    }
  }

  /*
add
FUNCTION(newValue)
IF size == capacity
resize()
storage[size] = newValue
size = size + 1
*/
  void add(dynamic newValue) {
    if (_size == _storage.length) {
      resize();
      _storage[_size] = newValue;
      _size++;
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
IF index < 0 OR index >= size
IF size == capacity
resize()
//shift to right from the end
FOR i FROM size DOWN TO index index +1
  storage[index] = storage[i + 1]
  storage[index] = newValue
  size = size + 1
 */

  void insert(int insertionIndex, T newValue) {
    if (insertionIndex < 0 || insertionIndex > _size) {
      throw RangeError('Invalid index');
    }
    if (_size == _storage.length) {
      resize();
      for (int i = 0; i < _size; i++) {
        _storage[i] = _storage[i + 1];
        _size++;
      }
    }
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
      throw RangeError('Invalid index');
    }
    for (int i = index; i < _size; i++) {
      _storage[i] = _storage[i + 1];
    }
    _storage[_size - 1] = null;
    _size--;
  }
}
