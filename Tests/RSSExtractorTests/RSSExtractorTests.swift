import XCTest
@testable import RSSExtractor

final class RSSExtractorTests: XCTestCase {
    let HOST = ""
    let USERNAME = ""
    let SECRET = ""
    
    func testBase64() throws {
        let link = "https://9to5mac.com/2021/12/26/imessage-waiting-for-activation/"
        XCTAssertEqual(link.base64EncodedString(), "aHR0cHM6Ly85dG81bWFjLmNvbS8yMDIxLzEyLzI2L2ltZXNzYWdlLXdhaXRpbmctZm9yLWFjdGl2YXRpb24v")
    }
    
    func testHMAC() throws {
        let link = "https://9to5mac.com/2021/12/26/imessage-waiting-for-activation/"
        let secret = "HELLO_WORLD"
        XCTAssertEqual(link.hmac(key: secret), "2313c71b577524ba720f44bda9bcdc4b22d73199")
    }
    
    func testPostlight() async throws {
        let link = "https://9to5mac.com/2021/12/26/imessage-waiting-for-activation/"
        let content = try await RSSExtractor(host: HOST, username: USERNAME, secret: SECRET).fetch(using: .postlight, with: link)
       
        XCTAssertEqual(content.title, "iMessage waiting for activation? Here's how to fix it", "author")
        XCTAssertEqual(content.author, "Michael Potuck")
        XCTAssertTrue(content.leadImageURL!.contains("i1.wp.com/9to5mac.com/wp-content/uploads/sites/6/2017/05/imessage-waiting-for-activation.jpg"))
        XCTAssertGreaterThan(content.content.count, 0)
        XCTAssertTrue(content.content.contains("For iMessage/FaceTime to activate"))
        XCTAssertGreaterThan(content.wordCount!, 0)
    }
    
    func testMozilla() async throws {
        let link = "https://9to5mac.com/2021/12/26/imessage-waiting-for-activation/"
        let content = try await RSSExtractor(host: HOST, username: USERNAME, secret: SECRET).fetch(using: .mozilla, with: link)
        XCTAssertGreaterThan(content.content.count, 0)
        XCTAssertTrue(content.content.contains("For iMessage/FaceTime to activate"))
    }
}
