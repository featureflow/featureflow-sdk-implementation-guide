#FeatureControl

---

##Purpose
A **FeatureControl** contains an ordered list of **Rules** and will return the right `variant`
of the feature for a given `context`. 
The first **Rule** that returns `true` should be the variant that is returned.
The last **Rule** is always the default rule, and will not contain an **Audience** - only a **Split**. 
If the **FeatureControl** is turned off, the `variant` returned should be the `offVariantKey`.

`FeatureControl` contains `List<Rule>`
 
`Rule` contains `Audience` and `List<VariantSplit>`

`Audience` contains `List<Condition>`

`Condition` contains `target`, `Operator` and `List<Value>`

##Methods

`evaluate(featureflowContext)` - evaluate the feature control with the given **FeatureflowContext**
```
if not enabled then return the off variant
if (!enabled){
   return **offVariantKey**
}
//otherwise return the variant if the rule matches - rules should be iterated in the order received in the json which is by rule.priority
for each Rule{
    if(Rule.matches(context)){
        return rule.getEvaluatedVariantKey(context.key, variationsSeed)
    }
}
```  
---
##Tests to write
````
testEvaluateWithDefaultRuleMatches
testEvaluateWithDefaultRuleAndMatchingRuleMatches
testEvaluateWithDefaultRuleAndNonMatchingRuleMatchesDefaultRule
testRulePriorityOrderIsPReserved
testDefaultRuleIsEvaluatedLast
````
(See rule for further tests)
