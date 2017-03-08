#FeatureControl
##Purpose
A **FeatureControl** contains an ordered list of **Rules** and will return the right `variant`
of the feature for a given `context`. 
The first **Rule** that returns `true` should be the variant that is returned.
The last **Rule** is always the default rule, and will not contain an **Audience** - only a **Split**. 
If the **FeatureControl** is turned off, the `variant` returned should be the `defaultVariant`.

##Functionality
The algorithm to implement the FeatureControl is as follows:
```
TODO: insert algorithm here
```
##Tests to write
