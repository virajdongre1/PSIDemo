//
//  RegionMetaDataModelTests.swift
//  PSIDemoTests
//
//  Created by Viraj Dongre on 03/12/19.
//  Copyright © 2019 Viraj Dongre. All rights reserved.
//

import Foundation
import XCTest
import PSIDemo

class RegionMetaDataModelTests: XCTestCase {
    let sampleJSON = """
{
   "region_metadata":[
      {
         "name":"west",
         "label_location":{
            "latitude":1.35735,
            "longitude":103.7
         }
      },
      {
         "name":"east",
         "label_location":{
            "latitude":1.35735,
            "longitude":103.94
         }
      },
      {
         "name":"central",
         "label_location":{
            "latitude":1.35735,
            "longitude":103.82
         }
      }
   ],
   "items":[
      {
         "timestamp":"2019-12-03T21:00:00+08:00",
         "update_timestamp":"2019-12-03T21:03:52+08:00",
         "readings":{
            "o3_sub_index":{
               "west":14,
               "national":16,
               "east":13,
               "central":16,
               "south":14,
               "north":16
            },
            "pm10_twenty_four_hourly":{
               "west":26,
               "national":32,
               "east":30,
               "central":24,
               "south":32,
               "north":22
            },
            "pm10_sub_index":{
               "west":26,
               "national":32,
               "east":30,
               "central":24,
               "south":32,
               "north":22
            },
            "co_sub_index":{
               "west":4,
               "national":7,
               "east":7,
               "central":4,
               "south":5,
               "north":5
            },
            "pm25_twenty_four_hourly":{
               "west":8,
               "national":10,
               "east":10,
               "central":9,
               "south":10,
               "north":9
            },
            "so2_sub_index":{
               "west":2,
               "national":2,
               "east":1,
               "central":1,
               "south":1,
               "north":1
            },
            "co_eight_hour_max":{
               "west":0.38,
               "national":0.75,
               "east":0.75,
               "central":0.37,
               "south":0.53,
               "north":0.48
            },
            "no2_one_hour_max":{
               "west":6,
               "national":31,
               "east":21,
               "central":31,
               "south":20,
               "north":13
            },
            "so2_twenty_four_hourly":{
               "west":3,
               "national":3,
               "east":2,
               "central":1,
               "south":2,
               "north":2
            },
            "pm25_sub_index":{
               "west":33,
               "national":43,
               "east":43,
               "central":39,
               "south":41,
               "north":37
            },
            "psi_twenty_four_hourly":{
               "west":33,
               "national":43,
               "east":43,
               "central":39,
               "south":41,
               "north":37
            },
            "o3_eight_hour_max":{
               "west":33,
               "national":39,
               "east":32,
               "central":38,
               "south":33,
               "north":39
            }
         }
      }
   ],
   "api_info":{
      "status":"healthy"
   }
}
"""
    
    func testRegionMetaData() {
        
        guard let jsonData = self.sampleJSON.data(using: .utf8),
            let root = try? JSONDecoder().decode(Root.self, from: jsonData) else {
                XCTFail()
                return
        }
        XCTAssertEqual(root.region_metadata.count, 3)
        XCTAssertEqual(root.region_metadata.first?.name, "west")
        
        XCTAssertNotNil(root.items.first?.readings)
        
        guard let o3_Sub_Index = root.items.first?.readings.o3_sub_index else {
            XCTFail()
            return
        }
        XCTAssertNotNil(o3_Sub_Index)
        XCTAssertEqual(o3_Sub_Index.west, 14)
        XCTAssertEqual(o3_Sub_Index.national, 16)
        XCTAssertEqual(o3_Sub_Index.east, 13)
        XCTAssertEqual(o3_Sub_Index.central, 16)
        XCTAssertEqual(o3_Sub_Index.south, 14)
        XCTAssertEqual(o3_Sub_Index.north, 16)
        
        guard let pm10_24_Hourly = root.items.first?.readings.pm10_twenty_four_hourly else {
            XCTFail()
            return
        }
        XCTAssertNotNil(pm10_24_Hourly)
        XCTAssertEqual(pm10_24_Hourly.west, 26)
        XCTAssertEqual(pm10_24_Hourly.national, 32)
        XCTAssertEqual(pm10_24_Hourly.east, 30)
        XCTAssertEqual(pm10_24_Hourly.central, 24)
        XCTAssertEqual(pm10_24_Hourly.south, 32)
        XCTAssertEqual(pm10_24_Hourly.north, 22)
        
        
        guard let pm10_sub_index = root.items.first?.readings.pm10_sub_index else {
            XCTFail()
            return
        }
        XCTAssertNotNil(pm10_sub_index)
        XCTAssertEqual(pm10_sub_index.west, 26)
        XCTAssertEqual(pm10_sub_index.national, 32)
        XCTAssertEqual(pm10_sub_index.east, 30)
        XCTAssertEqual(pm10_sub_index.central, 24)
        XCTAssertEqual(pm10_sub_index.south, 32)
        XCTAssertEqual(pm10_sub_index.north, 22)
        
        guard let co_sub_index = root.items.first?.readings.co_sub_index else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(co_sub_index)
        XCTAssertEqual(co_sub_index.west, 4)
        XCTAssertEqual(co_sub_index.national, 7)
        XCTAssertEqual(co_sub_index.east, 7)
        XCTAssertEqual(co_sub_index.central, 4)
        XCTAssertEqual(co_sub_index.south, 5)
        XCTAssertEqual(co_sub_index.north, 5)
        
        guard let pm25_twenty_four_hourly = root.items.first?.readings.pm25_twenty_four_hourly else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(pm25_twenty_four_hourly)
        XCTAssertEqual(pm25_twenty_four_hourly.west, 8)
        XCTAssertEqual(pm25_twenty_four_hourly.national, 10)
        XCTAssertEqual(pm25_twenty_four_hourly.east, 10)
        XCTAssertEqual(pm25_twenty_four_hourly.central, 9)
        XCTAssertEqual(pm25_twenty_four_hourly.south, 10)
        XCTAssertEqual(pm25_twenty_four_hourly.north, 9)
        
        guard let so2_sub_index = root.items.first?.readings.so2_sub_index else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(so2_sub_index)
        XCTAssertEqual(so2_sub_index.west, 2)
        XCTAssertEqual(so2_sub_index.national, 2)
        XCTAssertEqual(so2_sub_index.east, 1)
        XCTAssertEqual(so2_sub_index.central, 1)
        XCTAssertEqual(so2_sub_index.south, 1)
        XCTAssertEqual(so2_sub_index.north, 1)
        
        guard let co_eight_hour_max = root.items.first?.readings.co_eight_hour_max else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(co_eight_hour_max)
        XCTAssertEqual(co_eight_hour_max.west, 0.38)
        XCTAssertEqual(co_eight_hour_max.national, 0.75)
        XCTAssertEqual(co_eight_hour_max.east, 0.75)
        XCTAssertEqual(co_eight_hour_max.central, 0.37)
        XCTAssertEqual(co_eight_hour_max.south, 0.53)
        XCTAssertEqual(co_eight_hour_max.north, 0.48)
        
        guard let no2_one_hour_max = root.items.first?.readings.no2_one_hour_max else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(no2_one_hour_max)
        XCTAssertEqual(no2_one_hour_max.west, 6)
        XCTAssertEqual(no2_one_hour_max.national, 31)
        XCTAssertEqual(no2_one_hour_max.east, 21)
        XCTAssertEqual(no2_one_hour_max.central, 31)
        XCTAssertEqual(no2_one_hour_max.south, 20)
        XCTAssertEqual(no2_one_hour_max.north, 13)
        
        guard let so2_twenty_four_hourly = root.items.first?.readings.so2_twenty_four_hourly else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(so2_twenty_four_hourly)
        XCTAssertEqual(so2_twenty_four_hourly.west, 3)
        XCTAssertEqual(so2_twenty_four_hourly.national, 3)
        XCTAssertEqual(so2_twenty_four_hourly.east, 2)
        XCTAssertEqual(so2_twenty_four_hourly.central, 1)
        XCTAssertEqual(so2_twenty_four_hourly.south, 2)
        XCTAssertEqual(so2_twenty_four_hourly.north, 2)
        
        guard let pm25_sub_index = root.items.first?.readings.pm25_sub_index else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(pm25_sub_index)
        XCTAssertEqual(pm25_sub_index.west, 33)
        XCTAssertEqual(pm25_sub_index.national, 43)
        XCTAssertEqual(pm25_sub_index.east, 43)
        XCTAssertEqual(pm25_sub_index.central, 39)
        XCTAssertEqual(pm25_sub_index.south, 41)
        XCTAssertEqual(pm25_sub_index.north, 37)
        
        guard let psi_twenty_four_hourly = root.items.first?.readings.psi_twenty_four_hourly else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(psi_twenty_four_hourly)
        XCTAssertEqual(psi_twenty_four_hourly.west, 33)
        XCTAssertEqual(psi_twenty_four_hourly.national, 43)
        XCTAssertEqual(psi_twenty_four_hourly.east, 43)
        XCTAssertEqual(psi_twenty_four_hourly.central, 39)
        XCTAssertEqual(psi_twenty_four_hourly.south, 41)
        XCTAssertEqual(psi_twenty_four_hourly.north, 37)
        
        guard let o3_eight_hour_max = root.items.first?.readings.o3_eight_hour_max else {
            XCTFail()
            return
        }
        
        XCTAssertNotNil(o3_eight_hour_max)
        XCTAssertEqual(o3_eight_hour_max.west, 33)
        XCTAssertEqual(o3_eight_hour_max.national, 39)
        XCTAssertEqual(o3_eight_hour_max.east, 32)
        XCTAssertEqual(o3_eight_hour_max.central, 38)
        XCTAssertEqual(o3_eight_hour_max.south, 33)
        XCTAssertEqual(o3_eight_hour_max.north, 39)
    }
}
