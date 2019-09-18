//
//  profileData.swift
//  SalonatcomStoryboard
//
//  Created by Bassam Ramadan on 9/13/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit

struct profileInfo : Decodable {
    let data : infoo
}
struct infoo : Decodable {
    let name : String
    let image : String
    let phone : String
}

