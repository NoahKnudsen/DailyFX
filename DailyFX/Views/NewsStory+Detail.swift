//
//  Created by Noah Knudsen on 03/05/2022.
//

import DailyFXService
import SwiftUI
import Toolkit
import Foundational

extension NewsStory {
    
    struct Detail: View {
        
        let story: NewsStory
        
        var body: some View {
            ScrollView {
                
                HeadlineImage(story)
                
                VStack(spacing: 15) {
                    
                    Text(story.title)
                        .font(.largeTitle.bold())
                    
                    LabelGroup.list {
                        LabelGroup.hiddenIfNil(
                            title: "Authors",
                            value: story.authors
                                .map(\.name)
                                .joined(separator: ", ")
                                .ifNotEmpty
                        )
                        
                        LabelGroup.hiddenIfNil(
                            title: "Description",
                            value: story.description
                        )
                    
                        LabelGroup.hiddenIfNil(
                            title: "Instruments",
                            value: story.instruments
                                .unique(by: identity)
                                .joined(separator: ", ")
                                .ifNotEmpty
                        )
                        
                        LabelGroup.hiddenIfNil(
                            title: "Tags",
                            value: story.tags
                                .unique(by: identity)
                                .joined(separator: ", ")
                                .ifNotEmpty
                        )
                    }
                }
                .padding()
            }
            .navigationTitle(story.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private struct HeadlineImage: View {
    
    let story: NewsStory
    
    init(_ story: NewsStory) {
        self.story = story
    }
    
    var body: some View {
        AsyncImage(
            url: story.headlineImageUrl,
            content: { image in
                image
                    .resizable()
                    .scaledToFit()
            },
            placeholder: {
                Rectangle()
                    .fill(Color.gray)
                    .overlay{
                        Image(systemName: "photo")
                            .foregroundColor(Color(UIColor.lightGray))
                            .font(.title)
                    }
                    .aspectRatio(.init(width: 16, height: 9), contentMode: .fit)
            }
        )
        .frame(maxWidth: .infinity, maxHeight: 275)
    }
}
