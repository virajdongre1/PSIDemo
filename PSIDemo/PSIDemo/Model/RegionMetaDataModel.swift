//
//  RegionMetaDataModel.swift
//  PSIDemo
//
//  Created by Viraj Dongre on 02/12/19.
//  Copyright © 2019 Viraj Dongre. All rights reserved.
//

import Foundation

struct Root: Decodable {
    let region_metadata: [RegionMetadata]
    let items: [Item]
}

struct RegionMetadata: Decodable {
    let name: String
    let label_location: Cordinates
}

struct Cordinates: Decodable {
    let latitude: Double
    let longitude: Double
}

struct Item: Decodable {
    let readings: ReadingsItem
}

struct ReadingsItem: Decodable {
    
    let o3_sub_index: SubIndex
    let pm10_twenty_four_hourly: SubIndex
    let pm10_sub_index: SubIndex
    let co_sub_index: SubIndex
    let pm25_twenty_four_hourly: SubIndex
    let so2_sub_index: SubIndex
    let co_eight_hour_max: SubIndex
    let no2_one_hour_max: SubIndex
    let so2_twenty_four_hourly: SubIndex
    let pm25_sub_index: SubIndex
    let psi_twenty_four_hourly: SubIndex
    let o3_eight_hour_max: SubIndex
    
}

struct SubIndex: Decodable {
    
    let west: Double
    let national: Double
    let east: Double
    let central: Double
    let south: Double
    let north: Double
    
}
