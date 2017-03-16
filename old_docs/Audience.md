# Audience
## Purpose
**Audience** is a list of **Conditions** that all must return `true` for it to return `true`, otherwise it will return `false`
## Methods
matches
```
if conditions is null or conditions.size == 0 thenr eturn true;

for each condition{
    if condition.matches() == false then return false
}

return true

```
## Tests to write
* Test all conditions returning `true`, returning `true`
* Test one condition returning `false`, returning `false`