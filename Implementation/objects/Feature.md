# Feature
### Usage
- Contains the rules, conditions, and variants for a feature

### Structure
- `key` is the unique key for the feature
- `variationSalt` allows for randomisation of split value calculations. Used with `EvaluateHelpers.getVariantSplitValue(salt, feature.key, context.key)`.
- `enabled` boolean whether the feature is enabled 
- `offVariantKey` if `feature.enabled` is `false`, this is the variant that is returned
- `rules` Array of rules that target the feature
  - `defaultRule` boolean, if `true` the rule should pass for any context
  - `audience` contains an array of `conditions` and `variantSplits` used for evaluating a `variantKey` for a given context
    - `conditions` all conditions must pass for the rule to pass
      - `target` the property in `context.values` the condition is targeting
      - `operator` the operator the condition matches on
      - `values` an array of values to match against, usually only `values[0]` is present
    - `variantSplits` an array containing the `split` value for each `variantKey` - all split values will add up to 100
      - `variantKey` the variant's key
      - `split` the integer (0-100) representing the range the value will split on
      
Example:
```json
{
  "example-feature": {
    "key": "example-feature",
    "variationsSalt": 0,
    "enabled": false,
    "offVariantKey": "off",
    "rules": [
      {
        "defaultRule": false,
        "audience": {
          "conditions": [
            {
              "target": "user_role",
              "operator": "in",
              "values": [
                "admin",
                "pvt_tester"
              ]
            }
          ]
        },
        "variantSplits": [
          {
            "variantKey": "off",
            "split": 0
          },
          {
            "variantKey": "on",
            "split": 100
          }
        ]
      },
      {
        "defaultRule": true,
        "variantSplits": [
          {
            "variantKey": "off",
            "split": 100
          },
          {
            "variantKey": "on",
            "split": 0
          }
        ]
      }
    ]
  }
}
```

#### [Go Back - Table of Contents](../../README.md)