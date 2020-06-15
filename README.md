# SendGrid-Swift

![swift5.2](https://img.shields.io/badge/swift-v5.2-green.svg) ![macOS](https://img.shields.io/badge/os-macOS-blue.svg) ![iOS](https://img.shields.io/badge/os-iOS-blue.svg) ![Linux\*](https://img.shields.io/badge/os-Linux\*-blue.svg)

This library allows you to quickly and easily send emails through SendGrid using Swift.

## Important: Version 3.0.0 Breaking Changes

Versions 3.0.0 and higher have been migrated to Swift 5.1. Some existing classes, properties, and functions have been renamed or removed. Deprecation warnings will populate where appropriate.

Version 3 changes `Request` from a class to a protocol. Conforming types specify a `ParameterType` and a `ResponseType` to define their parameters and specify the expected type to decode the HTTP response into. If a request doesn't have parameters or never expects a response, then `Never` is specified as the type. As a result of this, `ModeledResponse` is no longer needed and has been deprecated. `Session`'s `send(modeledRequest:completionHandler:)` method has also been deprecated. All requests are now sent through `send(request:completionHandler:)`.

**Previous Breaking Changes**

- Version 2.0.0 and higher migrated to Swift 5. Some existing classes, properties, and functions were renamed or removed. Requests were changed to have a `parameters` property. Response callbacks also utilized Swift 5's `Result` enum.
- Versions 1.0.0 and higher have been migrated to Swift 4 and adds Linux support, which contains code-breaking API changes.
- Versions 0.2.0 and higher uses Swift 3, which introduces breaking changes from previous versions.
- Versions 0.1.0 and higher have been migrated over to use SendGrid's [V3 Mail Send Endpoint](https://sendgrid.com/docs/API_Reference/Web_API_v3/Mail/index.html), which contains code-breaking changes.

## \*A Note About Linux

While this library does function on Linux via the Swift Package Manager, it relies upon the [open source Foundation library](https://github.com/apple/swift-corelibs-foundation) (specifically `URLSession`).  As it stands, [`URLSession` hasn't been fully implemented yet](https://github.com/apple/swift-corelibs-foundation/blob/master/Docs/Status.md). This library uses what has been implemented to make the HTTP requests, but critical implementations such as invalidating the session are unavailable, which could lead to unexpected behaviors such as memory leaks. That being said, Linux supported in this library should be treated as *experimental*.

## Full Documentation

Full documentation of the library is available [here](http://scottkawai.github.io/sendgrid-swift/docs/).

## Table Of Contents

- [Installation](#installation)
    + [Swift Package Manager](#swift-package-manager)
    + [With Cocoapods](#with-cocoapods)
    + [As A Submodule](#as-a-submodule)
- [Usage](#usage)
    + [Authorization](#authorization)
    + [API Calls](#api-calls)
- [Development](#development)
- [Generating The Documentation](#generating-the-documentation)
- [Contributing](#contributing)
- [License](#license)

## Installation

### Swift Package Manager

Add the SendGrid module to the "dependencies" and "targets" sections of your Package.swift file like so:

```swift
// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "MyApp",
    dependencies: [
        .package(
            url: "https://github.com/scottkawai/sendgrid-swift.git",
            from: "3.0.0"
        )
    ],
    targets: [
        .target(
            name: "MyApp",
            dependencies: ["SendGrid"]
        )
    ]
)
```

**Note!** Make sure you also list "SendGrid" as a dependency in the "targets" section of your manifest.

### With Cocoapods

Add the following to your Podfile:

```ruby
pod 'SendGrid', :git => 'https://github.com/scottkawai/sendgrid-swift.git'
```

### As A Submodule

Add this repo as a submodule to your project and update:

```shell
cd /path/to/your/project
git submodule add https://github.com/scottkawai/sendgrid-swift.git
```

This will add a `sendgrid-swift` folder to your directory. Next, you need to add all the Swift files under `/sendgrid-swift/Sources/` to your project.

## Usage

### Authorization

The V3 endpoint supports authorization via API keys (preferred) and basic authentication via your SendGrid username and password (*Note:* the Mail Send API only allows API keys). Using the `Session` class, you can configure an instance with your authorization method to be used over and over again to send email requests.

It is also highly recommended that you do not hard-code any credentials in your code. If you're running this on Linux, it's recommended that you use environment variables instead, like so:

```swift
///
/// Assuming you set your SendGrid API key as an environment variable
/// named "SG_API_KEY"...
///
let session = Session()
guard let myApiKey = ProcessInfo.processInfo.environment["SG_API_KEY"] else { 
    print("Unable to retrieve API key")
    return
}
session.authentication = Authentication.apiKey(myApiKey)

///
/// Alternatively `Session` has a singleton instance that you can 
/// configure once and reuse throughout your code.
///
///     Session.shared.authentication = Authentication.apiKey(myApiKey)
```

### API Calls

All the available API calls are located in their own folders under the `./Sources/SendGrid/API` folder. Below is a list of the currently available API calls:

- [Email Address Validation](http://scottkawai.github.io/sendgrid-swift/docs/Classes/ValidateEmail.html)
- [Mail Send](http://scottkawai.github.io/sendgrid-swift/docs/Classes/Email.html)
- Statistics
    + [Global Stats](http://scottkawai.github.io/sendgrid-swift/docs/Classes/RetrieveGlobalStatistics.html)
    + [Browser Stats](http://scottkawai.github.io/sendgrid-swift/docs/Classes/RetrieveBrowserStatistics.html)
    + [Category Stats](http://scottkawai.github.io/sendgrid-swift/docs/Classes/RetrieveCategoryStatistics.html)
    + [Client Stats](http://scottkawai.github.io/sendgrid-swift/docs/Classes/RetrieveClientStatistics.html)
    + [Device Stats](http://scottkawai.github.io/sendgrid-swift/docs/Classes/RetrieveDeviceStatistics.html)
    + [Geographical Stats](http://scottkawai.github.io/sendgrid-swift/docs/Classes/RetrieveGeographicalStatistics.html)
    + [Mailbox Provider Stats](http://scottkawai.github.io/sendgrid-swift/docs/Classes/RetrieveMailboxProviderStatistics.html)
    + [Subuser Stats](http://scottkawai.github.io/sendgrid-swift/docs/Classes/RetrieveSubuserStatistics.html)
- Subuser API
    + [Retrieve](http://scottkawai.github.io/sendgrid-swift/docs/Classes/RetrieveSubusers.html)
- Suppressions
    + Blocks API
        * [Retrieve](http://scottkawai.github.io/sendgrid-swift/docs/Classes.html#/s:8SendGrid14RetrieveBlocksC)
        * [Delete](http://scottkawai.github.io/sendgrid-swift/docs/Classes/DeleteBlocks.html)
    + Bounces API
        * [Retrieve](http://scottkawai.github.io/sendgrid-swift/docs/Classes.html#/s:8SendGrid15RetrieveBouncesC)
        * [Delete](http://scottkawai.github.io/sendgrid-swift/docs/Classes/DeleteBounces.html)
    + Invalid Emails API
        * [Retrieve](http://scottkawai.github.io/sendgrid-swift/docs/Classes.html#/s:8SendGrid21RetrieveInvalidEmailsC)
        * [Delete](http://scottkawai.github.io/sendgrid-swift/file:///Users/skawai/Desktop/docs/Classes/DeleteInvalidEmails.html)
    + Global Unsubscribes API
        * [Retrieve](http://scottkawai.github.io/sendgrid-swift/docs/Classes.html#/s:8SendGrid26RetrieveGlobalUnsubscribesC)
        * [Add](http://scottkawai.github.io/sendgrid-swift/docs/Classes/AddGlobalUnsubscribes.html)
        * [Delete](http://scottkawai.github.io/sendgrid-swift/docs/Classes/DeleteGlobalUnsubscribe.html)
    + Spam Reports API
        * [Retrieve](http://scottkawai.github.io/sendgrid-swift/docs/Classes.html#/s:8SendGrid19RetrieveSpamReportsC)
        * [Delete](http://scottkawai.github.io/sendgrid-swift/docs/Classes/DeleteSpamReports.html)

## Development

If you're developing on macOS, you an generate an Xcode project by running the following:

```shell
cd /path/to/sendgrid-swift
swift package generate-xcodeproj
```

This project also contains a Dockerfile and a docker-compose.yml file which runs Swift 5. Running `docker-compose up` will execute the `swift build` command in the Linux container. If you want to run other commands, you can run `docker-compose run --rm app <command>`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-fancy-new-feature`)
3. Commit your changes (`git commit -am 'Added fancy new feature'`)
4. Write tests for any changes and ensure existing tests pass
    - **Note!** Be sure that your changes also work on Linux. You can use the Docker container to quickly test this by running `swift test --generate-linuxmain && docker-compose run --rm app swift test`
5. Push to the branch (`git push origin my-fancy-new-feature`)
6. Create a new Pull Request
