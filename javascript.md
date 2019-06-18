## Get diff array

#### Pure function
```javascript
  getDiffArray(a1, a2) {
    var a2Set = new Set(a2);
    return a1.filter(function(x) { return !a2Set.has(x); });
  }
```
#### lodash
```javascript
let a = _.xor([2, 1, 3], [2, 3]);
console.log(a) // [1]
```
### example
```javascript
a1 = [1,2,3]
a2 = [2,3,4]
difference(a1, a2) // [1]
```
