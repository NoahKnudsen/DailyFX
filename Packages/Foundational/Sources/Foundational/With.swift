//
//  Created by Noah Knudsen on 03/05/2022.
//

@discardableResult
public func with<T>(_ t: T, _ f: (T) throws -> ()) rethrows -> T {
    try f(t)
    return t
}
