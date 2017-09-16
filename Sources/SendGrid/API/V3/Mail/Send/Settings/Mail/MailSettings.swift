//
//  MailSettings.swift
//  SendGrid
//
//  Created by Scott Kawai on 9/15/17.
//

import Foundation

/// The `MailSetting` struct houses any mail settings an email should be
/// configured with.
public struct MailSettings: Encodable {
    
    // MARK: - Properties
    //=========================================================================
    
    /// The BCC setting.
    public var bcc: BCCSetting?
    
    /// The sandbox mode setting.
    public var sandboxMode: SandboxMode?
    
    
    // MARK: - Initialization
    //=========================================================================
    
    /// Initializes the struct with no settings set.
    public init() {}
    
}

/// Encodable conformance.
public extension MailSettings {
    
    public enum CodingKeys: String, CodingKey {
        
        case bcc
        case sandboxMode    = "sandbox_mode"
        
    }
    
}