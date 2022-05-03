//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundation

enum Endpoint: String, CaseIterable {
    
    case dashboard = "https://content.dailyfx.com/api/v1/dashboard"
    case markets = "https://content.dailyfx.com/api/v1/markets"
    
    var url: URL { URL(string: rawValue)! }
}
