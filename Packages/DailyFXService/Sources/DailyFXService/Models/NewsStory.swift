//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundational

public struct NewsStory: Equatable {
    
    public let title: String
    public let url: URL
    public let description: String?
    public let content: String?
    public let headlineImageUrl: URL?
    public let authors: [Author]
    public let instruments: [String]
    public let tags: [String]
    public let categories: [String]
    
    public init(
        title: String,
        url: URL,
        description: String? = nil,
        content: String? = nil,
        headlineImageUrl: URL? = nil,
        authors: [Author] = [],
        instruments: [String] = [],
        tags: [String] = [],
        categories: [String] = []
    ) {
        self.title = title
        self.url = url
        self.description = description
        self.content = content
        self.headlineImageUrl = headlineImageUrl
        self.authors = authors
        self.instruments = instruments
        self.tags = tags
        self.categories = categories
    }
}

extension NewsStory: Codable {
    
    public init(from decoder: Decoder) throws {
        let o = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try o.decode(.title)
        url = try o.decode(.url)
        description = try o.decodeIfPresent(.description)
        content = try o.decodeIfPresent(.content)
        headlineImageUrl = try o.decodeIfPresent(.headlineImageUrl)
        authors = try o.decodeIfPresent(.authors) ?? []
        instruments = try o.decodeIfPresent(.instruments) ?? []
        tags = try o.decodeIfPresent(.tags) ?? []
        categories = try o.decodeIfPresent(.categories) ?? []
    }
}
