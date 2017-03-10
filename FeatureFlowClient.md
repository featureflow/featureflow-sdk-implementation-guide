#FeatureFlowClient

---

##Purpose
The Featureflow Client is the main singleton object that a user will instantiate - it contains a simple facade for evaluating features

##Methods
**constructor**
Users should create a single instance of this class. When it starts up it should 
1. Register features with featureflow
2. Create a local cache for feature controls 
2. Start a SSE stream /api/sdk/v1/controls/stream to listen for control changes
3. The Stream service should mark as initialised when the connection has been made


**evaluate(featureKey, context)** 
returns FeatureflowClient.Evaluate
The evaluate method returns a convenience object Evaluate which has four methods `isOn` `isOff`, `is` and `value`
    
    ```
    if not initialised then return failoverVariant     
    //get the feature from the featureControlCache     
    featureControlCache.get(featureKey)
    
    //add additional context values (featureflow.date)
    context.add("featureflow.date", now)
    
    //send event and context to featureflow (async)
    featureControlEventHandler.saveEvent(featureId, featureKey, vairant, context)
      
    //return variant
    return control.evaluate(context)         
    ```
    
**private eval(featureKey, context)** evaluate the variant value for th given featureKey and context values. Called internally from the Evaluate helper methods

**Evaluate.isOn** returns true if the evaluated variant equals 'on'
  
**Evaluate.isOff** returns true if the evaluated variant equals 'off'
  
**Evaluate.is** returns true if the evaluated variant equals the given string value
  
**Evaluate.value** returns the evaluated variant value string based on **featureflowClient.eval(featureKey, featureflowContext, failoverVariant);**
    

##Tests to write
````

````
