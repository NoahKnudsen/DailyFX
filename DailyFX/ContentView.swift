//
//  Created by Noah Knudsen on 03/05/2022.
//

import SwiftUI
import DailyFXService
import Toolkit

struct ContentView: View {
    
    @StateObject var service = DailyFXService()
    
    init() {
        let service = DailyFXService()
        _service = .init(wrappedValue: service)
        
    }
    
    var body: some View {
        TabView(content: {
            
            Dashboard.Overview()
                .environmentObject(Observable(service.dashboard()))
                .tabItem{ Text("Overview") }
            
            Text("Markets")
                .tabItem{ Text("Markets") }
        })
    }
}


extension Dashboard {
    
    struct Overview: View {
        
        @EnvironmentObject var dashboard: Observable<Dashboard>
        
        var body: some View {
            dashboard.view(
                placeholder: { Text("Loading...") },
                error: { _ in Text("Oops, something went wrong!") },
                content: { dashboard in
                    List(dashboard.topNews, id: \.title) { topNews in
                        Text(topNews.title)
                    }
                }
            )
        }
    }
}


