# Events
## Purpose
Used to register features and feature conversions with Featureflow.

## Events
When a feature has been evaluated as true, an event is sent to the Featureflow servers. 
This is used to track feature conversions.

Post to `https://app.featureflow.io/api/sdk/v1/events` the following eventObject

```javascript
FeatureFlowContext = {
  key: string,
  value: {
    [key]: 'value' || ['values']
  }
}
eventObject = {
  featureKey: string,
  evaluatedVariant: string,
  expectedVariant: string,
  context: FeatureFlowContext
}
```

## FeatureRegistration
When initialising the featureflow client you are able to initialise features