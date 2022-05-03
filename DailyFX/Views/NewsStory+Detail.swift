//
//  Created by Noah Knudsen on 03/05/2022.
//

import DailyFXService
import SwiftUI
import Toolkit

extension NewsStory {
    
    struct Detail: View {
        
        let story: NewsStory
        
        var body: some View {
            ScrollView {
                
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
                            .frame(minHeight: 150)
                    }
                )
                .frame(maxWidth: .infinity)
                
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
                            title: "Tags",
                            value: story.tags
                                .sorted(by: {$0})
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
