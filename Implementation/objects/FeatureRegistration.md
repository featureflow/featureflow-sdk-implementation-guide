# FeatureRegistration
### Usage
- Registering features with **featureflow.io**
- Setting a failoverVariant for the feature

## Structure
Note: `key`, `failoverVariant` and `variants[].key` must all match the regex `"^[a-z0-9\-]+$"`
```json
[
  {
    "key": "string",
    "failoverVariant": "string",
    "variants": [
      {
        "key":"string",
        "name": "string"
      },
      {
        "key":"string",
        "name": "string"
      }
    ]
  }
]
```

#### [Go Back - Table of Contents](../../README.md)
