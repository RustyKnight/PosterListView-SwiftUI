//
//  Image+Data.swift
//  Poster-SwiftUI
//
//  Created by Shane Whitehead on 21/1/2024.
//

import Foundation
import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif
import SwiftUI

extension Image {
    /// Initializes a SwiftUI `Image` from data.
    init?(data: Data) {
#if canImport(UIKit)
        guard let uiImage = UIImage(data: data) else { return nil }
        self.init(uiImage: uiImage)
#elseif canImport(AppKit)
        guard let nsImage = NSImage(data: data) else { return nil }
        self.init(nsImage: nsImage)
#else
        return nil
#endif
    }
}

extension Image {
    #if canImport(AppKit)
    init(from: NSImage) {
        self.init(nsImage: from)
    }
    #elseif canImport(UIKit)
    init(from: UIImage) {
        self.init(uiImage: from)
    }
    #endif
}

extension Data {
    func toImage() -> Image? {
        return Image(data: self)
    }
}
