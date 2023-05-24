//
//  Observable.swift
//  Diary
//
//  Created by 이태영 on 2023/05/22.
//

import Foundation

final class Observable<Value> {
    struct Subscriber<Value> {
        weak var subscriber: AnyObject?
        let handler: (Value) -> Void
    }
    
    private var subscribers: [Subscriber<Value>] = []
    
    var value: Value {
        didSet {
            notifySubscribers()
        }
    }
    
    init(value: Value) {
        self.value = value
    }
    
    func subscribe(on subscriber: AnyObject, handler: @escaping (Value) -> Void) {
        subscribers.append(Subscriber(subscriber: subscriber, handler: handler))
        handler(value)
    }
    
    func unsubscribe(subscriber: AnyObject) {
        subscribers = subscribers.filter { $0.subscriber !== subscriber }
    }
    
    private func notifySubscribers() {
        subscribers.forEach {
            $0.handler(value)
        }
    }
}
