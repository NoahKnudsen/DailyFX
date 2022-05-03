//
//  Created by Noah Knudsen on 03/05/2022.
//

import DailyFXService
import SwiftUI

extension Market {
    
    struct List: View {
        
        let title: String
        let market: [Market]
        
        init(_ title: String, _ market: [Market]) {
            self.title = title
            self.market = market
        }
        
        var body: some View {
            if !market.isEmpty {
                Section(title) {
                    ForEach(market, id: \.marketId) { market in
                        Text(market.displayName)
                    }
                }
            }
        }
    }
}
