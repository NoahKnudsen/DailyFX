//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundation

public extension Collection {
    
    var isNotEmpty: Bool { !isEmpty }
    var ifNotEmpty: Self? { isEmpty ? nil : self }
}

public extension Collection {
    
    func sorted<T: Comparable>(
        by f: (Element) throws -> T,
        order: SortDirection = .accending
    ) rethrows -> [Element] {
        let compare = order.comparing(T.self)
        return try sorted(by: { try compare(f($0), f($1)) })
    }
}

public enum SortDirection {
    
    case accending, decending
    
    func comparing<T: Comparable>(_ type: T.Type) -> (T, T) -> Bool {
        switch self {
        case .accending: return (<)
        case .decending: return (>)
        }
    }
}
