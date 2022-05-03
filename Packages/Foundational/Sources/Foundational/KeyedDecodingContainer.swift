//
//  File.swift
//  
//
//  Created by Noah Knudsen on 03/05/2022.
//

public extension KeyedDecodingContainer {
    
    func decode<T: Decodable>(_ key: K, as t: T.Type = T.self) throws -> T{
        try decode(T.self, forKey: key)
    }
    
    func decode<T: Decodable>(_ key: K, as t: T.Type = T.self, default: T) -> T {
        (try? decode(T.self, forKey: key)) ?? `default`
    }
    
    func decodeIfPresent<T: Decodable>(_ key: K, as t: T.Type = T.self) throws -> T? {
        try decodeIfPresent(T.self, forKey: key)
    }
}
