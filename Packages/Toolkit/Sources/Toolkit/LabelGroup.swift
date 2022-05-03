//
//  Created by Noah Knudsen on 01/05/2022.
//

import SwiftUI

public struct LabelGroup<Title: View, Content: View>: View {
        
    private let title: Title
    private let content: Content
    
    public init(
        @ViewBuilder title: () -> Title,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title()
        self.content = content()
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            title
                .font(.caption.bold())
                .foregroundColor(.secondary)
            
            content
        }
        .accessibilityElement(children: .combine)
    }
}

public extension LabelGroup where Title == AnyView {

    init(title: String, @ViewBuilder content: () -> Content) {
        self.init(
            title: {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .any
            },
            content: content
        )
    }
}

public extension LabelGroup where Title == AnyView, Content == AnyView {
    
    init(title: String, value: String) {
        self.init(
            title: {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .any
            },
            content: {
                Text(value)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .any
            }
        )
    }
    
    
    static func hiddenIfNil(title: String, value: String?) -> some View {
        Group {
            if let value = value {
                LabelGroup(title: title, value: value)
            }
        }
    }
    
    static func list<Content: View>(@ViewBuilder _ content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 18, content: content)
    }
}

