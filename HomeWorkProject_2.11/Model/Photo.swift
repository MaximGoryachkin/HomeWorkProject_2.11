//
//  RoverPhotos.swift
//  HomeWorkProject_2.11
//
//  Created by Максим on 10.08.2021.
//

struct Photo: Decodable {
    let photos: [RoverPhoto]
}

struct RoverPhoto: Decodable {
    let id: Int
    let sol: Int
    let camera: Camera
    let img_src: String
    let earth_date: String
    let rover: Rover
}

struct Camera: Decodable {
    let id: Int
    let name: String
    let rover_id: Int
    let full_name: String
}

struct Rover: Decodable {
    let id: Int
    let name: String
    let landing_date: String
    let launch_date: String
    let status: String
}

