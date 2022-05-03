//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundational

public struct NewsStory: Codable, Equatable {
    
    public let title: String
    public let url: URL
    public let description: String
    public let content: String?
    public let firstImageUrl: URL?
    public let headlineImageUrl: URL?
    public let articleImageUrl: URL?
    public let backgroundImageUrl: URL?
    public let authors: [Author]
    public let instruments: [String]
    public let tags: Set<String>
    public let categories: Set<String>
    public let displayDate: Date
    public let lastUpdatedDate: Date
}

public extension NewsStory {
    
    init(from decoder: Decoder) throws {
        let o = try decoder.container(keyedBy: CodingKeys.self)
        
        title               = try o.decode(.title)
        url                 = try o.decode(.url)
        description         = try o.decode(.description)
        content             = try? o.decode(.content)
        firstImageUrl       = try? o.decode(.firstImageUrl)
        headlineImageUrl    = try? o.decode(.headlineImageUrl)
        articleImageUrl     = try? o.decode(.articleImageUrl)
        backgroundImageUrl  = try? o.decode(.backgroundImageUrl)
        authors             = o.decode(.authors, default: [])
        instruments         = o.decode(.instruments, default: [])
        tags                = o.decode(.tags, default: [])
        categories          = o.decode(.categories, default: [])
        displayDate         = try Date(timeIntervalSince1970: o.decode(.displayDate))
        lastUpdatedDate     = try Date(timeIntervalSince1970: o.decode(.lastUpdatedDate))
    }
    
    func encode(to encoder: Encoder) throws {
        var o = encoder.container(keyedBy: CodingKeys.self)

        try o.encode(title, forKey: .title)
        try o.encode(url, forKey: .url)
        try o.encode(description, forKey: .description)
        try o.encode(content, forKey: .content)
        try o.encode(firstImageUrl, forKey: .firstImageUrl)
        try o.encode(headlineImageUrl, forKey: .headlineImageUrl)
        try o.encode(articleImageUrl, forKey: .articleImageUrl)
        try o.encode(backgroundImageUrl, forKey: .backgroundImageUrl)
        try o.encode(authors, forKey: .authors)
        try o.encode(instruments, forKey: .instruments)
        try o.encode(tags, forKey: .tags)
        try o.encode(categories, forKey: .categories)
        try o.encode(displayDate.timeIntervalSince1970, forKey: .displayDate)
        try o.encode(lastUpdatedDate.timeIntervalSince1970, forKey: .lastUpdatedDate)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case description
        case content
        case firstImageUrl
        case headlineImageUrl
        case articleImageUrl
        case backgroundImageUrl
        case authors
        case instruments
        case tags
        case categories
        case displayDate = "displayTimestamp"
        case lastUpdatedDate = "lastUpdatedTimestamp"
    }
}
