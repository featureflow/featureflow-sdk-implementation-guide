# Condition
## Purpose
Conditions take input from the `target`, `type` and `value` and 
returns the boolean value `true` if the condition passed, or `false` if it failed.
* `target`: a value from the context, or a predefined featureflow value like date/time
* `type`: either `string`, `number`, or `date`. Used to describe how to interpret `value`
* `values`: and array containing values that you are testing the `target` against
## Functionality

matches

 * returns true if  context contains target and operator and value for the target evaluates to true 
 * if the context does not contain the target or the operator evaluates to false then we return false
```

for each value in context.values{
    if(value.key = target){
        return operator.evaluate(context.values.get(key), values)
     }
}

```

## Tests to write
* Two tests for each operator/type combination that results in a return value of `false`
* One test for each operator/type comibination that results in a return value of `true`