import XCTest
@testable import SendGridTests

extension AddressTests {
    static var allTests : [(String, (AddressTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding),
            ("testInitialization", testInitialization),
            ("testValidation", testValidation)
        ]
    }
}


extension ASMTests {
    static var allTests : [(String, (ASMTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding),
            ("testInitialization", testInitialization),
            ("testValidation", testValidation)
        ]
    }
}


extension AttachmentTests {
    static var allTests : [(String, (AttachmentTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding),
            ("testInitialization", testInitialization),
            ("testValidation", testValidation)
        ]
    }
}


extension ContentTests {
    static var allTests : [(String, (ContentTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding),
            ("testInitialization", testInitialization),
            ("testClassInitializers", testClassInitializers),
            ("testValidation", testValidation)
        ]
    }
}


extension EmailTests {
    static var allTests : [(String, (EmailTests) -> () throws -> Void)] {
        return [
            ("testOnlyApiKeys", testOnlyApiKeys),
            ("testNoImpersonation", testNoImpersonation),
            ("testEncoding", testEncoding),
            ("testInitialization", testInitialization),
            ("testPersonalizationValidation", testPersonalizationValidation),
            ("testContentValidation", testContentValidation),
            ("testSubjectValidation", testSubjectValidation),
            ("testHeaderValidation", testHeaderValidation),
            ("testCategoryValidation", testCategoryValidation),
            ("testCustomArgs", testCustomArgs),
            ("testSendAt", testSendAt)
        ]
    }
}


extension PersonalizationTests {
    static var allTests : [(String, (PersonalizationTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding),
            ("testInitialization", testInitialization),
            ("testValidation", testValidation)
        ]
    }
}


extension BCCSettingTests {
    static var allTests : [(String, (BCCSettingTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding)
        ]
    }
}


extension BypassListManagementTests {
    static var allTests : [(String, (BypassListManagementTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding)
        ]
    }
}


extension FooterTests {
    static var allTests : [(String, (FooterTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding)
        ]
    }
}


extension MailSettingsTests {
    static var allTests : [(String, (MailSettingsTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding)
        ]
    }
}


extension SandboxModeTests {
    static var allTests : [(String, (SandboxModeTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding)
        ]
    }
}


extension SpamCheckerTests {
    static var allTests : [(String, (SpamCheckerTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding)
        ]
    }
}


extension ClickTrackingTests {
    static var allTests : [(String, (ClickTrackingTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample)
        ]
    }
}


extension GoogleAnalyticsTests {
    static var allTests : [(String, (GoogleAnalyticsTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding)
        ]
    }
}


extension OpenTrackingTests {
    static var allTests : [(String, (OpenTrackingTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding)
        ]
    }
}


extension SubscriptionTrackingTests {
    static var allTests : [(String, (SubscriptionTrackingTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding)
        ]
    }
}


extension TrackingSettingsTests {
    static var allTests : [(String, (TrackingSettingsTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding)
        ]
    }
}


extension StatisticGlobalGetTests {
    static var allTests : [(String, (StatisticGlobalGetTests) -> () throws -> Void)] {
        return [
            ("testMinimalInitialization", testMinimalInitialization),
            ("testMaxInitialization", testMaxInitialization),
            ("testValidation", testValidation)
        ]
    }
}


extension BlockDeleteTests {
    static var allTests : [(String, (BlockDeleteTests) -> () throws -> Void)] {
        return [
            ("testInitializer", testInitializer),
            ("testDeleteAll", testDeleteAll)
        ]
    }
}


extension BlockGetTests {
    static var allTests : [(String, (BlockGetTests) -> () throws -> Void)] {
        return [
            ("testGetAllInitialization", testGetAllInitialization),
            ("testEmailSpecificInitializer", testEmailSpecificInitializer),
            ("testValidation", testValidation)
        ]
    }
}


extension BounceDeleteTests {
    static var allTests : [(String, (BounceDeleteTests) -> () throws -> Void)] {
        return [
            ("testInitializer", testInitializer),
            ("testDeleteAll", testDeleteAll)
        ]
    }
}


extension BounceGetTests {
    static var allTests : [(String, (BounceGetTests) -> () throws -> Void)] {
        return [
            ("testGetAllInitialization", testGetAllInitialization),
            ("testEmailSpecificInitializer", testEmailSpecificInitializer),
            ("testValidation", testValidation)
        ]
    }
}


extension GlobalUnsubcribeAddTests {
    static var allTests : [(String, (GlobalUnsubcribeAddTests) -> () throws -> Void)] {
        return [
            ("testInitialization", testInitialization)
        ]
    }
}


extension GlobalUnsubscribeDeleteTests {
    static var allTests : [(String, (GlobalUnsubscribeDeleteTests) -> () throws -> Void)] {
        return [
            ("testInitializer", testInitializer)
        ]
    }
}


extension GlobalUnsubscribeGetTests {
    static var allTests : [(String, (GlobalUnsubscribeGetTests) -> () throws -> Void)] {
        return [
            ("testGetAllInitialization", testGetAllInitialization),
            ("testEmailSpecificInitializer", testEmailSpecificInitializer),
            ("testValidation", testValidation)
        ]
    }
}


extension InvalidEmailDeleteTests {
    static var allTests : [(String, (InvalidEmailDeleteTests) -> () throws -> Void)] {
        return [
            ("testInitializer", testInitializer),
            ("testDeleteAll", testDeleteAll)
        ]
    }
}


extension InvalidEmailGetTests {
    static var allTests : [(String, (InvalidEmailGetTests) -> () throws -> Void)] {
        return [
            ("testGetAllInitialization", testGetAllInitialization),
            ("testEmailSpecificInitializer", testEmailSpecificInitializer),
            ("testValidation", testValidation)
        ]
    }
}


extension SpamReportDeleteTests {
    static var allTests : [(String, (SpamReportDeleteTests) -> () throws -> Void)] {
        return [
            ("testInitializer", testInitializer),
            ("testDeleteAll", testDeleteAll)
        ]
    }
}


extension SpamReportGetTests {
    static var allTests : [(String, (SpamReportGetTests) -> () throws -> Void)] {
        return [
            ("testGetAllInitialization", testGetAllInitialization),
            ("testEmailSpecificInitializer", testEmailSpecificInitializer),
            ("testValidation", testValidation)
        ]
    }
}


extension SessionTests {
    static var allTests : [(String, (SessionTests) -> () throws -> Void)] {
        return [
            ("testSendWithoutAuth", testSendWithoutAuth)
        ]
    }
}


extension AuthenticationTests {
    static var allTests : [(String, (AuthenticationTests) -> () throws -> Void)] {
        return [
            ("testInitializer", testInitializer),
            ("testAuthorizationHeader", testAuthorizationHeader),
            ("testApiKey", testApiKey),
            ("testCredential", testCredential)
        ]
    }
}


extension ContentTypeTests {
    static var allTests : [(String, (ContentTypeTests) -> () throws -> Void)] {
        return [
            ("testEncoding", testEncoding),
            ("testInitializerAndDescription", testInitializerAndDescription),
            ("testRawInitializer", testRawInitializer),
            ("testIndex", testIndex)
        ]
    }
}


extension PaginationTests {
    static var allTests : [(String, (PaginationTests) -> () throws -> Void)] {
        return [
            ("testStaticInitializer", testStaticInitializer)
        ]
    }
}


extension RateLimitTests {
    static var allTests : [(String, (RateLimitTests) -> () throws -> Void)] {
        return [
            ("testStaticInitializer", testStaticInitializer)
        ]
    }
}


extension ValidateTests {
    static var allTests : [(String, (ValidateTests) -> () throws -> Void)] {
        return [
            ("testInput", testInput),
            ("testEmail", testEmail),
            ("testSubscriptionTracking", testSubscriptionTracking),
            ("testNoCLRF", testNoCLRF)
        ]
    }
}


XCTMain([
    testCase(AddressTests.allTests),
    testCase(ASMTests.allTests),
    testCase(AttachmentTests.allTests),
    testCase(ContentTests.allTests),
    testCase(EmailTests.allTests),
    testCase(PersonalizationTests.allTests),
    testCase(BCCSettingTests.allTests),
    testCase(BypassListManagementTests.allTests),
    testCase(FooterTests.allTests),
    testCase(MailSettingsTests.allTests),
    testCase(SandboxModeTests.allTests),
    testCase(SpamCheckerTests.allTests),
    testCase(ClickTrackingTests.allTests),
    testCase(GoogleAnalyticsTests.allTests),
    testCase(OpenTrackingTests.allTests),
    testCase(SubscriptionTrackingTests.allTests),
    testCase(TrackingSettingsTests.allTests),
    testCase(StatisticGlobalGetTests.allTests),
    testCase(BlockDeleteTests.allTests),
    testCase(BlockGetTests.allTests),
    testCase(BounceDeleteTests.allTests),
    testCase(BounceGetTests.allTests),
    testCase(GlobalUnsubcribeAddTests.allTests),
    testCase(GlobalUnsubscribeDeleteTests.allTests),
    testCase(GlobalUnsubscribeGetTests.allTests),
    testCase(InvalidEmailDeleteTests.allTests),
    testCase(InvalidEmailGetTests.allTests),
    testCase(SpamReportDeleteTests.allTests),
    testCase(SpamReportGetTests.allTests),
    testCase(SessionTests.allTests),
    testCase(AuthenticationTests.allTests),
    testCase(ContentTypeTests.allTests),
    testCase(PaginationTests.allTests),
    testCase(RateLimitTests.allTests),
    testCase(ValidateTests.allTests)
])
