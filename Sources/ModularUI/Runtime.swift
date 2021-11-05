//
//  Runtime.swift
//  
//
//  Created by Pavel Kasila on 5.11.21.
//

import Foundation

class Runtime {
    
    static func allClasses() -> [AnyClass] {
        let numberOfClasses = Int(objc_getClassList(nil, 0))
        if numberOfClasses > 0 {
            let classesPtr = UnsafeMutablePointer<AnyClass>.allocate(capacity: numberOfClasses)
            let autoreleasingClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(classesPtr)
            let count = objc_getClassList(autoreleasingClasses, Int32(numberOfClasses))
            assert(numberOfClasses == count)
            defer { classesPtr.deallocate() }
            let classes = (0 ..< numberOfClasses).map { classesPtr[$0] }
            return classes
        }
        return []
    }

    static func subclasses(of `class`: AnyClass) -> [AnyClass] {
        return self.allClasses().filter {
            var ancestor: AnyClass? = $0
            while let type = ancestor {
                if ObjectIdentifier(type) == ObjectIdentifier(`class`) { return true }
                ancestor = class_getSuperclass(type)
            }
            return false
        }
    }

    static func classes(conformToProtocol `protocol`: Protocol) -> [AnyClass] {
        let classes = self.allClasses().filter { aClass in
            var subject: AnyClass? = aClass
            while let aClass = subject {
                if class_conformsToProtocol(aClass, `protocol`) { print(String(describing: aClass)); return true }
                subject = class_getSuperclass(aClass)
            }
            return false
        }
        return classes
    }

    static func classes<T>(conformTo: T.Type) -> [AnyClass] {
        return self.allClasses().filter { $0 is T }
    }
}
