//
//  Created by Noah Knudsen on 03/05/2022.
//

import SwiftUI
import DailyFXService
import Toolkit

struct Home: View {
    
    @StateObject var service = DailyFXService()
    
    init() {
        let service = DailyFXService()
        _service = .init(wrappedValue: service)
        
    }
    
    var body: some View {
        TabView(content: {
            
            Dashboard.Overview()
                .environmentObject(Observable(service.dashboard()))
                .tabItem{ Text("Dashboard") }
                .navigationTitle("Dashboard")
            
            Text("Markets")
                .tabItem{ Text("Markets") }
                .navigationTitle("Markets")
        })
    }
}
