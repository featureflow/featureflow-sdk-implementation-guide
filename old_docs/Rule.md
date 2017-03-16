#Rule
##Purpose
`Rule` contains an `Audience` and a `List<VariantSplit>`.

For a given `context` check if the Audience matches and for a given `contextKey`, return the `variant` 
The rule holds a list of variant splits and an audience

It exposes two methods which FeatureControl uses:
* `matches` checks if the Rules `Audience` matches the given `context`
* `getEvaluatedVariantKey` iterates the `VariantSplits` given a `contextKey` to determine the variant



##Methods
matches(context)
```
if audience == null then return true
else return audience.matches(context)
```

getVariantSplitKey(contextKey, seed)
1. Sets a default contextKey if none exists
2. Generates a number between 1 and 100 (inclusive) for the contextKey using a hash algorithm
3. Iterates through the splits until the % value is greater than the generated number
4. Return the variant associated with the split
```
if contextKey is null then contextKey = 'anonymous'
variantValue = getVariantValue(
percent = 0
for each VariantSplit{
    percent = percent + variantSplit.getSplit()
    if percent >= variantValue then return variantSplit.getVariantKey()
}
```
Implementing the hash using two methods. 
It is important to implement this using two methods so you can test that your hashing works in isolation.
```
def calculateHash(salt, featureKey, key)
  stringToHash = salt + ":" + featureKey + ":" + key   # stringToHash = "5:my-feature-key:username"
  return sha1(stringToHash).substring(0, 15)           # hexString = "8a694775bf85e89"

def getVariantValue(hexString)
  #  This calculation must use integers, using floats will produce the wrong result
  return parseInt(hexString, 16) % 100 + 1     
  
variantValue = getVariantValue(calculateHash(5, 'myfeature', 'username')) # 27
```

##Tests to write
* testMatchesWhenAudienceIsNull
* testMatchesWithAudience
* testEvaluatedVariantKeyWithContextKeyAndTwoVariantSplits
* testEvaluatedVariantKeyWithContextKeyAndThreeVariantSplits
* testGetVariantValueEqualsKnownPercentage
