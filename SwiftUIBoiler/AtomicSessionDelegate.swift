//
//  AtomicSessionDelegate.swift
//  SwiftUIBoiler
//
//  Created by James Sugrue on 13/12/23.
//

import Foundation
import AtomicSDK

class AtomicSessionDelegate: NSObject, AACSessionDelegate {
    func cardSessionDidRequestAuthenticationToken(handler: @escaping AACSessionAuthenticationTokenHandler) {
        // Get the authentication token (JWT) and call the handler.
        let token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1GbERlR2xzVUd0c1lVRnlaalJzVTFSNVpHWmhXRFYxTTI0NFBRIn0.eyJuYW1lIjoiRGVtbyBVc2VyIiwic3ViIjoiZGQ3MGViZWEtOWRjYi01Y2ZjLTk3NzAtMTRjNjgzNDAzMTc1IiwiaWF0IjoxNzAyNDEwOTA3LCJleHAiOjE3MDI0OTczMDcsImlzcyI6ImxvY2FsIn0.DUeKyM6m1F720ideviVIZqM9IyJyILBYJHy9_GV2EG7ebNLXDkJmq7pvS6rIrwek-RfHU5MCnUMfEgYSdRLdO7zSVigTH2RdQEQI6epX1euplZNxrK9HR7b6aUf08ushplZhE1oF7ibqMEJUMZZZdIUzVONC5qbP2O9MVY4ja86aOr2JNpOG8VEOaDlFcRBygb45xLTsFJ7eJDhes4KgfAc-Ga7mH6N8lmdwnTjQlZ5YyW5X7NqiD7rijSkN-PM8Od3DDeIXIlhlC0flXk2I0495018KLhixNRRzk4jYSPwaikxumlw4wYNKzRAZjI_06v1gQ9aAmf6fjRZeaRqzyg"
        handler(token)
    }
}
