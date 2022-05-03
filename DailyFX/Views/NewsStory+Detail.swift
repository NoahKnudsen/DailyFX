//
//  Created by Noah Knudsen on 03/05/2022.
//

import DailyFXService
import SwiftUI

extension NewsStory {
    
    struct Detail: View {
        
        let story: NewsStory
        
        var body: some View {
            Text(story.title)
        }
    }
}
