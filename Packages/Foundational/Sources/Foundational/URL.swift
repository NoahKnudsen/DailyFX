//
//  Created by Noah Knudsen on 03/05/2022.
//

public extension URL {
    
    init(_ string: StaticString) {
        guard let url = URL(string: "\(string)") else {
            preconditionFailure("Invalid static URL string: \(string)")
        }
        
        self = url
    }
}
