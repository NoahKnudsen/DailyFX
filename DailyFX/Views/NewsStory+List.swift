//
//  Created by Noah Knudsen on 03/05/2022.
//

import DailyFXService
import SwiftUI

extension NewsStory {
    
    struct List: View {
        
        let title: String
        let stories: [NewsStory]
        
        init(_ title: String, _ stories: [NewsStory]) {
            self.title = title
            self.stories = stories
        }
        
        var body: some View {
            if !stories.isEmpty {
                Section(title) {
                    ForEach(stories, id: \.title) { story in
                        NavigationLink(destination: { Detail(story: story) }) {
                            Text(story.title)
                        }
                    }
                }//.navigationTitle(title)
            }
        }
    }
}
