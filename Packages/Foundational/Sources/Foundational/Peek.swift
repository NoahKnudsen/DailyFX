//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundation

public extension CustomDebugStringConvertible {
    
    @inlinable
    @discardableResult
    func peek<Message>(
        _ message: @autoclosure () -> Message
    ) -> Self {
        #if DEBUG
        print(message(), self)
        #endif
        return self
    }
}

public extension Error {
    
    @inlinable
    @discardableResult
    func peek<Message>(
        _ message: @escaping @autoclosure () -> Message,
        function: String = #function,
        file: String = #file,
        line: Int = #line
    ) -> Self {
        print("\(message()) \(String(describing: self)) \((function, file, line))")
        return self
    }
}
