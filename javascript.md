## i18n with pure js 
##### updated_at: 01:23 04-07-2019
```javascript
// i18n-utils.js
const getLocale = (obj, field, lang='en') => {
  return obj[`${field}_${lang}`]
}
export default {
  getLocale: getLocale,
}
```
### Usage
```javascript
import I18nUtils from 'i18n-utils'
let people = {name_en: 'Maria Ozawa', name_jp: 'マリア オザワ'}
let lang = 'jp'
I18nUtils.getLocale(people,'name',lang)
// => マリア オザワ
```

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
