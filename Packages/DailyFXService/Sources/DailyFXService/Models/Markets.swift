//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundation

public struct Markets: Codable, Equatable {
    
    public let currencies: [Market]
    public let commodities: [Market]
    public let indices: [Market]
}

public struct Market: Codable, Equatable {
    
    public let displayName: String
    public let marketId: String
    public let epic: String
    public let rateDetailURL: URL
    public let topMarket: Bool
    public let unscalingFactor: Int
    public let unscaledDecimals: Int
    public let calendarMapping: [String]
}
