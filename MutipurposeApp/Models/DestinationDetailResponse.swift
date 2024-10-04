//
//  DestinationDetailResponse.swift
//  TravelDiscovery
//
//  Created by iMac on 10/11/23.

import Foundation

// MARK: - DestinationDetailResponse
struct DestinationDetailResponse: Codable {
    let related: [[DestinationDetailRes]]?
    let photos: [String]?
    let description, name: String?
    let latitude: Double?
    let id: Int?
    let thumbnail: String?
    let longitude: Double?
    let country: String?
}

// MARK: - Related
struct DestinationDetailRes: Codable {
    let thumbnail: String?
    let country, name: String?
}
