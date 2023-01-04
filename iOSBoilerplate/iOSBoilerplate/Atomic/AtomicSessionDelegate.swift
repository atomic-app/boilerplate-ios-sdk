//
//  AtomicSessionDelegate.swift
//  iOSBoilerplate
//
//  Created by Eric on 23/12/22.
//

import Foundation
import AtomicSDK

class AtomicSessionDelegate: NSObject, AACSessionDelegate {
    func cardSessionDidRequestAuthenticationToken(handler: @escaping AACSessionAuthenticationTokenHandler) {
        // Get the authentication token (JWT) and call the handler.
        let token = ""
        handler(token)
    }
}
