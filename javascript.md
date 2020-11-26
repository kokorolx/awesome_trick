## Get Deep Value object:
###### updated_at: 12:15 18-07-2019 GTM+7
### (javascript)
```js 
let deep_value = (o, p) => p.split('.').reduce((a, v) => a[v] || [], o);
```
```js
ob = {'a':1, 'b': {'c': 2}}
deep_value(ob, "b.c") // 2
deep_value(ob, "b.d") // []

```
### (coffee script)
```coffee
object.key1?.key2?.key3
```


## Manual mapping role
###### updated_at: 01:31 04-07-2019 GTM+7

```javascript
// utils-request.js
import StringUtils from 'lodash/string'

// Mapping from the file models/user_role -> permission_level
const namespaces = {
  administrator: '/admin',
  user: '/user',
}

StringUtils.templateSettings.interpolate = /{{([\s\S]+?)}}/g
const get = (req, params = {}, namspace = '') => {
  const reqWithParams = StringUtils.template(req)(params)
  return `${namspace}${reqWithParams}`
}

const publicReq = (req, params = {}) => {
  return get(req, params)
}

const privateReq = (req, params = {}) => {
  const namspace = store.getState().reduxTokenAuth.currentUser.attributes.role.permission_level
  const namespacePath = namespaces[namspace]
  return get(req, params, namespacePath)
}

export const requestUtils = {
  pub: publicReq,
  pri: privateReq,
  get: get
}
```
### Usage
```javascript
import axios from 'axios';
import { requestUtils, requests } from 'utils/request'

// Somethings
  const queryString = requestUtils.pub('/users/search');
  const data = {username: username, password: password};

  return axios.post(queryString, data).then(
    response => {
      console.log('Put Response ok');
    },
    error => {
      console.log('response error: ', error)
    }
  )
```

## i18n with pure js 
##### updated_at: 01:23 04-07-2019 GTM+7
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

## Check localStorage is working
```js
  try{
    if ('localStorage' in window && window.localStorage !== null) {
      localStorage.setItem('testLocalStorage', 'testLocalStorage');
      if (localStorage.getItem('testLocalStorage') !== 'testLocalStorage') {
          localStorage.removeItem('testLocalStorage');
          //for private browsing, error is thrown before even getting here
          alert('can read CANNOT write'); 
      }else{
          localStorage.removeItem('testLocalStorage');
          alert('can use localStorage ');
      }
    }else{
      alert('CANNOT use localStorage ');
    }
  }catch(ex){
    alert('CANNOT use localStorage  reliably');
  }
```
