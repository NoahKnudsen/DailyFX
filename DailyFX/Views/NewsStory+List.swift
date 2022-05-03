//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundational
import DailyFXService
import SwiftUI
import OrderedCollections

extension NewsStory {
    
    struct List: View {
        
        let groupTitle: String?
        let sections: OrderedDictionary<String, [NewsStory]>
        
        init(_ title: String, _ stories: [NewsStory]) {
            groupTitle = nil
            sections = [title: stories]
        }
        
        init(_ groupTitle: String, _ sections: OrderedDictionary<String, [NewsStory]>) {
            self.groupTitle = groupTitle
            self.sections = sections
        }
        
        var body: some View {
            if let groupTitle = groupTitle {
                Section(groupTitle) {
                    sectionList
                }
            } else {
                sectionList
            }
        }
        
        private var sectionList: some View {
            ForEach(sections.filter(\.value.isNotEmpty).map(\.key), id: \.self) { title in
                if let stories = sections[title] {
                    Section(title) {
                        ForEach(stories, id: \.title) { story in
                            NavigationLink(destination: { Detail(story: story) }) {
                                Text(story.title)
                            }
                        }
                    }
                }
            }
        }
    }
}
