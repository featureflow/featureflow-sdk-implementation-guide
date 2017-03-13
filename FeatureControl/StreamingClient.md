#StreamingClient
##Purpose
Opens an EventSource stream with Featureflow to receive realtime updates.

##Setting up the connection
Open an event stream with the following configuration:
 - Connect to: `https://rtm.featureflow.io/api/sdk/v1/controls/stream`
    - allow this to be configurable in your api
 - Set the header `Authorization: bearer <token>`
    - token is the server api token
 - Set the header `Accept: text/event-stream`

## Receiving Data

When the connection has been made, an initial default message event will be sent.
This event's data is a JSON string containing all the features for the environment based on the api key given.
Further updates will be sent via the event `features.updated`, however the JSON response will only contain the key 
and value of the feature that was updated.

```javascript
// After connection, first message
// - no event -
// data: ...
data = JSON.parse(e.data);
data == {
  "example-feature": {/* ...feature... */},
  "example-feature-2": {/* ...feature... */}
}

// Realtime update after a feature 'example-feature' has been updated
// event: features.updated 
// data: ...
data = JSON.parse(e.data);
data == {
  "example-feature": {/* ...feature... */}
}
```

### Server-Sent Events
For further reading about the spec, [W3C Server-Sent Events](https://www.w3.org/TR/2012/WD-eventsource-20120426/)
