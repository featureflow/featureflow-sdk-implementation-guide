# Context
### Usage
- Used to match the rules against a particular target.
- Used to determine which split variant to evaluate.

### Structure
- `key` is the unique key for a particular user
- `values` is a flat key-value object containing either a `string` or `number`, or a `string[]` or `number[]`

Example:
```json
{
  "key": "string",
  "values": {
    "key1": "value",
    "key2": ["value1","value2"]
  }
}
```

This object is passed to `featureflow.evaluate('key', context)` to help the matching process.

### Additional Context
Featureflow adds additional context information for free out of the box.
When creating the context object you must also merge the following values:
- `featureflow.date` ISODate string of the current datetime 
- `featureflow.key` a replication of the key value at the root of the context object 

Example:
```json
{
  "key": "my-key",
  "values": {
    "featureflow.key": "my-key",
    "featureflow.date": "2017-03-16T00:00:00.000Z"
  }
}
```

#### [Go Back - Table of Contents](../../README.md)