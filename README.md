#Swift Classes PubSub

- PubSub
- EventDispatcher
- EventEmitter

## API

### INSTANCE METHODS

#### subscribe(topic: String, handler: @escaping (() -> ()))

#### subscribe(topic: String, handler: @escaping ((Any?) -> ()))

#### addSubscriber(topic: String, newEventListener: Subscriber)

#### unsubscribe(topicToRemoveOrNil: String?)

#### unsubscribeAll(topicToRemoveOrNil: String?)

#### publish(topic: String, information: Any? = nil)
