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
                .tabItem{ tab(.dashboard) }
                .navigationTitle("Dashboard")
            
            Markets.Overview()
                .environmentObject(Observable(service.markets()))
                .tabItem{ tab(.markets) }
                .navigationTitle("Markets")
        })
    }
    
    func tab(_ tab: Tab) -> some View {
        HStack {
            Image(systemName: tab.icon)
            Text(tab.title)
        }
    }
}

extension Home {
    
    enum Tab {
        
        case dashboard
        case markets
        
        var title: String {
            switch self {
            case .dashboard: return "Dashboard"
            case .markets: return "Markets"
            }
        }
        
        var icon: String {
            switch self {
            case .dashboard: return "newspaper"
            case .markets: return "chart.line.uptrend.xyaxis"
            }
        }
    }
}
