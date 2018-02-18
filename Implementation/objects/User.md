# User
### Usage
- Used to match the rules against a particular target.
- Used to determine which split variant to evaluate.

### Structure
- `key` is the unique key for a particular user
- `attributes` is a flat key-value object containing either a `string` or `number`, or a `string[]` or `number[]` attributes are directly assignable to the user
- `sessionAttributes` is a flat key-value object containing either a `string` or `number`, or a `string[]` or `number[]` - session attributes are not stored against the user and typically reflect current context such as date.


Example:
```json
{
  "key": "string",
  "attributes": {
    "key1": "value",
    "key2": ["value1","value2"]
  },
  "sessionAttributes": {
    "key1": "value",
    "key2": ["value1","value2"]
  }  
}
```

This object is passed to `featureflow.evaluate('key', user)` to help the matching process.

### Additional User Session Attributes
Featureflow adds additional session attributes for free out of the box.
When creating the user object you must also merge the following values:
- `featureflow.date` ISODate string of the current datetime 
- `featureflow.key` a replication of the key value at the root of the context object 

Example:
```json
{
  "key": "my-key",
  "sessionAttributes": {
    "featureflow.key": "my-key",
    "featureflow.date": "2017-03-16T00:00:00.000Z"
  }
}
```

#### [Go Back - Table of Contents](../../README.md)
