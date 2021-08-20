    import XCTest
    @testable import SwiftAsciidoctor

    final class SwiftAsciidoctorTests: XCTestCase {
        func testConvertingAsciidocText() {
            XCTAssertNotEqual(
                try SwiftAsciidoctor().convert("Hello", options: []),
                "undefined")
            
            XCTAssertEqual(
                try SwiftAsciidoctor().convert(
                    "= Document title",
                    options: [
                        .attributes(
                            [
                                "showtitle": true,
                                "icons": "font",
                            ]),
                        .safe(.server)
                    ]),
                "<h1>Document title</h1>\n")
            
            XCTAssertThrowsError(
                try SwiftAsciidoctor().convert(
                    "= Document title",
                    options: [
                        .safe(.server),
                        .safe(.server)
                    ])) {
                XCTAssertEqual($0 as? SwiftAsciidoctor.Error, .duplicatedOptions)
            }
        }
    }
