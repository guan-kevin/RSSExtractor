//
//  String+Extension.swift
//
//
//  Created by Kevin on 1/11/22.
//

import CryptoKit
import Foundation

extension String {
    func base64EncodedString() -> String {
        return Data(self.utf8).base64EncodedString()
    }

    func hmac(key: String) -> String? {
        guard let inputData = self.data(using: .utf8), let keyData = key.data(using: .utf8) else {
            return nil
        }

        let hmac = HMAC<Insecure.SHA1>.authenticationCode(for: inputData, using: SymmetricKey(data: keyData))
        return Data(hmac).map { String(format: "%02x", $0) }.joined()
    }
}
