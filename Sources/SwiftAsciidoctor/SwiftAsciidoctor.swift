import JavaScriptCore

public struct SwiftAsciidoctor {
    public enum Error: Swift.Error {
        case invalidInput
        case invalidOptions
        case duplicatedOptions
    }
    
    private let context = JSContext()!
    
    public init() {
        loadAsciidoctor()
    }
    
    private func loadAsciidoctor() {
        let url = URL(fileURLWithPath: Bundle.module.path(forResource: "asciidoctor.min", ofType: "js")!)
        let asciidoctorSrc = try! String(contentsOf: url)
        context.evaluateScript(asciidoctorSrc)
    }
    
    public func convert(_ input: String, options: [ConvertOption]? = nil) throws -> String {
        let optionsJsonString = try options?.makeJsonString()
        let result = context.evaluateScript("""
            (function() {
                return Asciidoctor().convert(
                    `\(input.javaScriptEscapedString)`,
                    \(optionsJsonString ?? "")
                );
            })();
            """)!
        let output = result.toString()!
        guard output != "undefined" else {
            throw Error.invalidInput
        }
        return output
    }
}

private extension String {
    var javaScriptEscapedString: String {
        return replacingOccurrences(of: "`", with: #"\`"#)
    }
}

private extension Array where Element == ConvertOption {
    func makeJsonString() throws -> String {
        guard count == Set(map { $0.key }).count else {
            throw SwiftAsciidoctor.Error.duplicatedOptions
        }
        let dictionary = [String: Any](
            uniqueKeysWithValues: map { ($0.key, $0.value) })
        guard let jsonString = String(
                data: try JSONSerialization.data(withJSONObject: dictionary),
                encoding: .utf8)
        else {
            throw SwiftAsciidoctor.Error.invalidOptions
        }
        return jsonString
    }
}
