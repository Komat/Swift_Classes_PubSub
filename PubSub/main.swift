//
//  main.swift
//  PubSub
//
//  Created by komatsu on 2016/11/29.
//  Copyright (c) 2016 komatsu. All rights reserved.
//

import Foundation

let ps = PubSub()

print(ps)


ps.subscribe(topic: "SETUP", handler: {
    print("SETUP");
})


func listen(information: Any?) {
    print("\n\n\n")
    if let info = information as? String {
        print("OOPS")
        print(info)
    } else {
        print("SIMPLE SETUP");
    }
    print("\n\n\n")
}


ps.subscribe(topic: "SETUP", handler: listen)


ps.publish(topic: "SETUP", information: "INFORMATION");


ps.publish(topic: "SETUP");
