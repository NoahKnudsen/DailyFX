import Foundation
import XCTest

struct TestDataModel<Model: Codable> {
    
    let jsonResource: String
    let model: Model
    
    func json(
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) throws -> Data {
        
        guard let path = Bundle.module.url(forResource: jsonResource, withExtension: nil)
        else {
            XCTFail("Missing Test Item JSON file `\(jsonResource)`", file: file, line: line)
            throw String.Error("Missing JSON file \(jsonResource)")
        }
        
        return try Data(contentsOf: path)
    }
}

extension TestDataModel where Model: Equatable {
    
    @discardableResult
    func testDecode(
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) throws -> (Model, Model) {
        
        let decoded = try JSONDecoder().decode(Model.self, from: json())
        XCTAssertEqual(decoded, model, file: file, line: line)
        return (decoded, model)
    }
    
    @discardableResult
    func testCodableIdentity(
        _ file: StaticString = #filePath,
        _ line: UInt = #line
    ) throws -> (Model, Model) {
        
        let encoded = try JSONEncoder().encode(model)
        let decoded = try JSONDecoder().decode(Model.self, from: encoded)
        
        XCTAssertEqual(decoded, model, file: file, line: line)
        return (decoded, model)
    }
}

final class AClassInTestBundle {}
