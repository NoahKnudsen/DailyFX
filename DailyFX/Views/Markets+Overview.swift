//
//  Created by Noah Knudsen on 03/05/2022.
//

import DailyFXService
import Toolkit
import SwiftUI

extension Markets {
    
    struct Overview: View {
        
        @EnvironmentObject var vm: Observable<Markets>
        
        var body: some View {
            vm.view(
                placeholder: loadingState,
                error: errorState,
                content: marketsList
            )
        }
        
        func marketsList(_ market: Markets) -> some View {
            NavigationView {
                List{
                    Market.List("Currencies", market.currencies)
                    Market.List("Commodities", market.commodities)
                    Market.List("Indices", market.indices)
                }
                .navigationTitle("Markets")
                
                Text("Select a Market")
            }
            
        }
        
        func loadingState() -> some View {
            Text("Loading...")
        }
        func errorState(_ error: Error) -> some View {
            Text("Oops, something went wrong!")
        }
    }
}
