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
}
