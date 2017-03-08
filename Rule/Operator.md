#Operator
##Purpose
Operators take input from the `target`, `type` and `value` and 
returns the boolean value `true` if the condition passed, or `false` if it failed.
* `target`: a value from the context, or a predefined featureflow value like date/time
* `type`: either `string`, `number`, or `date`. Used to describe how to interpret `value`
* `values`: and array containing values that you are testing the `target` against
##Functionality
Instead of an algorithm, it is easier to use this table to implement the functionality.

| Operator              | Type      | Description                              
|-----------------------|-----------|------------
| `equals`              | `string`  | `target` is exactly equal to the string `values[0]`
| `contains`            | `string`  | `target` is contained the `values[0]`
| `startsWith`          | `string`  | `target` begins with `values[0]`
| `endsWith`            | `string`  | `target` ends with `values[0]`
| `matches`             | `string`  | `target` is matched by the regular expression of `values[0]`
| `in`                  | `string`  | `target` is in the list of `values`
| `notIn`               | `string`  | `target` is not in the list of `values` 
| `equals`              | `date`    | `target` is equal to the date `values[0]`
| `before`              | `date`    | `target` is before the date `values[0]`
| `after`               | `date`    | `target` is after the date `values[0]`
| `equals`              | `number`  | `target` is equal to the number `values[0]` *(`target == values[0]`)*
| `greaterThan`         | `number`  | `target` is greater than the number `values[0]` *(`target > values[0]`)*
| `greaterThanOrEqual`  | `number`  | `target` is greater than or equal to the number `values[0]` *(`target >= values[0]`)*
| `lessThan`            | `number`  | `target` is less than the number `values[0]` *(`target < values[0]`)*
| `lessThanOrEqual`     | `number`  | `target` is less than or equal to the number `values[0]` *(`target <= values[0]`)*


##Tests to write
* Two tests for each operator/type combination that results in a return value of `false`
* One test for each operator/type comibination that results in a return value of `true`