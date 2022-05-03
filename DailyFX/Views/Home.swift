//
//  Created by Noah Knudsen on 03/05/2022.
//

import SwiftUI
import DailyFXService
import Toolkit

struct Home: View {
    
    @StateObject var service = DailyFXService()
    
    var body: some View {
        TabView(content: {
            
            Dashboard.Overview()
                .environmentObject(Observable(service.dashboard()))
                .tab("Dashboard", "newspaper")
            
            Markets.Overview()
                .environmentObject(Observable(service.markets()))
                .tab("Markets", "chart.line.uptrend.xyaxis")
        })
    }
}

private extension View {
    
    func tab(_ title: String, _ icon: String) -> some View {
        self.tabItem{
            HStack {
                Image(systemName: icon)
                Text(title)
            }
        }
    }
}
