import Foundation

public class RSSExtractor {
    public var host: String
    public var username: String
    public var secret: String

    public init(host: String, username: String, secret: String) {
        self.host = host
        self.username = username
        self.secret = secret
    }

    public func fetch(using extractor: Extractor, with link: String) async throws -> ExtractResult {
        let base64Link = link.base64EncodedString()
        guard let signature = link.hmac(key: secret) else {
            throw ExtractTextError.signatureError
        }

        guard let url = URL(string: "https://\(host)/\(extractor.rawValue)/\(username)/\(signature)?base64_url=\(base64Link)") else {
            throw ExtractTextError.urlError
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(ExtractResult.self, from: data)
    }
}
