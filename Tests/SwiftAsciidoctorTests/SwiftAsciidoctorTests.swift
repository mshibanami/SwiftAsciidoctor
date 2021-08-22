    import XCTest
    @testable import SwiftAsciidoctor

    final class SwiftAsciidoctorTests: XCTestCase {
        func testConvertingAsciidocText() {
            let asciidoctor = SwiftAsciidoctor()
            
            XCTAssertEqual(
                try asciidoctor.convert("== Hello World"),
                """
                <div class="sect1">
                <h2 id="_hello_world">Hello World</h2>
                <div class="sectionbody">
                
                </div>
                </div>
                """)
            
            XCTAssertEqual(
                try asciidoctor.convert(
                    "= Document title",
                    options: [
                        .attributes(["showtitle": true])
                    ]),
                "<h1>Document title</h1>\n")
            
            XCTAssertThrowsError(
                try asciidoctor.convert(
                    "= Document title",
                    options: [
                        .safe(.server),
                        .safe(.server)
                    ])) {
                XCTAssertEqual($0 as? SwiftAsciidoctor.Error, .duplicatedOptions)
            }
        }
    }
