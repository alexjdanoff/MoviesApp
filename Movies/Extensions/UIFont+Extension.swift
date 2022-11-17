//
//  UIFont+Extension.swift
//  Movies
//
//  Created by Alexandru Jdanov on 07.11.2022.
//

import SwiftUI

extension Font {
    struct Event {
        let semiBold12 = Font.custom("OpenSansRoman-SemiBold", size: 12)
        let semiBold14 = Font.custom("OpenSansRoman-SemiBold", size: 14)
        let bold14 = Font.custom("OpenSansRoman-Bold", size: 14)
        let bold16 = Font.custom("OpenSansRoman-Bold", size: 16)
        let bold20 = Font.custom("OpenSansRoman-Bold", size: 20)
    }
    
    static let event = Event()
}
