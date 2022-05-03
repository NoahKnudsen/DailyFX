//
//  Created by Noah Knudsen on 03/05/2022.
//

import Foundation

public struct Author: Codable, Equatable {
    
    public let name: String
    public let title: String?
    public let bio: URL?
    public let email: String?
    public let phone: String?
    public let facebook: URL?
    public let twitter: URL?
    public let googleplus: URL?
    public let rss: URL?
    public let descriptionLong: String?
    public let descriptionShort: String?
    public let photo: URL?
    
    public init(
        name: String,
        title: String? = nil,
        bio: URL? = nil,
        email: String? = nil,
        phone: String? = nil,
        facebook: URL? = nil,
        twitter: URL? = nil,
        googleplus: URL? = nil,
        rss: URL? = nil,
        descriptionLong: String? = nil,
        descriptionShort: String? = nil,
        photo: URL? = nil
    ) {
        self.name = name
        self.title = title
        self.bio = bio
        self.email = email
        self.phone = phone
        self.facebook = facebook
        self.twitter = twitter
        self.googleplus =  googleplus
        self.rss = rss
        self.descriptionLong = descriptionLong
        self.descriptionShort = descriptionShort
        self.photo = photo
    }
}
