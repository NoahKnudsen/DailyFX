//
//  Created by Noah Knudsen on 03/05/2022.
//

public func identity<T>(_ t: T) -> T {
    t
}

public func const<_Unused, T>(_ t: T) -> (_Unused) -> T {
    { _ in t }
}
