import Foundation
import XCTest

struct TestDataModel<Model: Codable> {
    
    let jsonResource: String
    let model: Model
    
    func json() throws -> Data {
        
        guard let path = Bundle(for: AClassInTestBundle.self).url(forResource: jsonResource, withExtension: nil)
        else { fatalError("Missing Test Item JSON file `\(jsonResource)`") }
        
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
