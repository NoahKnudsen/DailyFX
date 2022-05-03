//
//  Created by Noah Knudsen on 03/05/2022.
//

import DailyFXService
import Toolkit
import SwiftUI

extension Dashboard {
    
    struct Overview: View {
        
        @EnvironmentObject var vm: Observable<Dashboard>
        
        var body: some View {
            vm.view(
                placeholder: loadingState,
                error: errorState,
                content: newsStoryList
            )
        }
        
        func newsStoryList(_ dashboard: Dashboard) -> some View {
            NavigationView {
                List{
                    NewsStory.List("Breaking News", dashboard.breakingNews)
                    NewsStory.List("Top News", dashboard.topNews)
                    NewsStory.List("Technical Analysis", dashboard.technicalAnalysis)
                    NewsStory.List("Special Reports", dashboard.specialReport)
                    NewsStory.List("Daily Briefings", [
                        "EU": dashboard.dailyBriefings?.eu ?? [],
                        "US": dashboard.dailyBriefings?.us ?? [],
                        "Asia": dashboard.dailyBriefings?.asia ?? [],
                    ])
                }
                .navigationTitle("Dashboard")
                
                Text("Select a story")
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
