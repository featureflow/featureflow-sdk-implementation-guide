#Hash
##Purpose
For a given context, the hashing algorithm must be the same.
The hash takes three parameters `key`, `seed`, `feature` which is used to generate a 
number that is used by the **SplitCalculator** to calculate which 
variants should be shown for a given variant split.
* `key`: the value of the `key` property on the `context` object, defaults to `"anonymous"`.
* `seed`: a seed value used to consistently change results.
* `feature`: The feature name the hash should be calculated against.
##Functionality
The algorithm to implement the hash is as follows:
```
TODO: insert algortihm here
```
##Tests to write
* Test combinations of 2 different key, seed, and feature combinations will return the same known hash
  * e.g. two keys being 'alice' and 'bob', two seeds being 1 and 6, and 2 features being 'test-feature-1' and 'test-feature-2'