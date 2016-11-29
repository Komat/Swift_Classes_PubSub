/**
 * @description
 * @author komat
 * @date 2016/11/29
 * @version 0.0.0
 */

import Foundation

class PubSub {

    var subscribers = Dictionary<String, NSMutableArray>();

    func subscribe(topic: String, handler: @escaping (() -> ())) {
        let newSubscriber = Subscriber(callback: handler);
        addSubscriber(topic: topic, newEventListener: newSubscriber);
    }

    func subscribe(topic: String, handler: @escaping ((Any?) -> ())) {
        let newSubscriber = Subscriber(callback: handler);
        addSubscriber(topic: topic, newEventListener: newSubscriber);
    }

    internal func addSubscriber(topic: String, newEventListener: Subscriber) {
        if let handlerArray = self.subscribers[topic] {
            handlerArray.add(newEventListener);
        } else {
            self.subscribers[topic] = [newEventListener] as NSMutableArray;
        }
    }


    func unsubscribe(topicToRemoveOrNil: String?) {
    }


    func unsubscribeAll(topicToRemoveOrNil: String?) {
        if let topicToRemove = topicToRemoveOrNil {
            if let handlerArray = self.subscribers[topicToRemove] {
                handlerArray.removeAllObjects();
            }
        } else {
            self.subscribers.removeAll(keepingCapacity: false);
        }
    }

    func publish(topic: String, information: Any? = nil) {
        if let handlerObjects = self.subscribers[topic] {
            for handlerObject in handlerObjects {
                if let handlerToPerform = handlerObject as? Subscriber {
                    if let methodToCall = handlerToPerform.handlerExpectsInfo {
                        methodToCall(information);
                    } else if let methodToCall = handlerToPerform.handler {
                        methodToCall();
                    }
                }
            }
        }
    }
}

class Subscriber {
    let handler: (() -> ())?;
    let handlerExpectsInfo: ((Any?) -> ())?;

    init(callback: @escaping (() -> ())) {
        self.handler = callback;
        self.handlerExpectsInfo = nil;
    }

    init(callback: @escaping ((Any?) -> ())) {
        self.handlerExpectsInfo = callback;
        self.handler = nil;
    }
}
