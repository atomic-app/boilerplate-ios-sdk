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
        let token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik1GbERlR2xzVUd0c1lVRnlaalJzVTFSNVpHWmhXRFYxTTI0NFBRIn0.eyJzdWIiOiJkZDcwZWJlYS05ZGNiLTVjZmMtOTc3MC0xNGM2ODM0MDMxNzUiLCJpYXQiOjE3MjU5MTA2ODAsImV4cCI6MTcyNTk5NzA4MCwiaXNzIjoibG9jYWwifQ.QlwQh7MQZbT_YnI-39xfwcEs069bHaZPgLF47NORIWnmStrgIBq-9AjApKS5_B5VB480kFhZjrlNPw4hB_mQG5nk3nd-BIqEL84YP87FwUr3AegQnRMB-UQtXTamnyM0JIot1gCPmIZgJru2KVIuYnDo_pBou0pDjsGHrsdR_iAdHjp-wXgQ-deX9C7UixEwxoRNHEXS2_q24TluPLcU8E8QJZ6U4WsSLAHwwrxQhdTz4iWq9tg0InIxZPSsVVRzJow4RP6rUhQDw-5mt1YADFhDH_Qvu3mZ-I9ycj0WvmhZUZj96mqh2vgwOvvwPSIE00VgcxYVo2skUahU79xlsA"
        handler(token)
    }
}
