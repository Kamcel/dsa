// Start with pseudocode
// Then code

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

/* 
Set(index, value)
IF index < 0 OR index >= size
PRINT 'Invalid index'
STOP 
END IF
SET storage[index]
*/

/*
Traversal
FOR index = 0 TO size - 1
VISIT storage[index]
END FOR
 */

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

class FixedArray<T> {
  T? _storage;
  int _index;
  int _size;

  FixedArray({this._storage, this._index = 0, this._size = 0});
}
