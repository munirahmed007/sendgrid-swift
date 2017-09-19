//
//  Request.swift
//  SendGrid
//
//  Created by Scott Kawai on 9/8/17.
//
import Foundation

/// The `Request` class should be inherited by any class that represents an API
/// request and sent through the `send` function in `Session`.
///
/// This class contains a `ModelType` generic, which is used to map the API
/// response to a specific model that conforms to `Codable`.
open class Request<ModelType : Codable>: Validatable, CustomStringConvertible {
    
    // MARK: - Properties
    //=========================================================================
    
    /// The HTTP verb to use in the call.
    open var method: HTTPMethod
    
    /// The Content-Type of the call.
    open var contentType: ContentType
    
    /// The Accept header value.
    open var acceptType: ContentType = .json
    
    /// The decoding strategy.
    open var decodingStrategy: DecodingStrategy = DecodingStrategy()
    
    /// The encoding strategy.
    open var encodingStrategy: EncodingStrategy = EncodingStrategy()
    
    /// The full URL endpoint for the API call.
    open var endpoint: URLComponents?
    
    /// The description of the request, represented as an [API
    /// Blueprint](https://apiblueprint.org/)
    public var description: String {
        let path = self.endpoint?.path ?? ""
        var blueprint = """
        # \(self.method) \(path)
        
        + Request (\(self.contentType)
        
            + Headers
        
                Accept: \(self.acceptType)
        
        """
        if self.method.hasBody,
        let encodable = self as? AutoEncodable,
            let bodyData = encodable.encode(formatting: [.prettyPrinted]),
            let bodyString = String(data: bodyData, encoding: .utf8)
        {
            blueprint += """
                + Body
            
                    \(bodyString)
            """
        }
        return blueprint
    }
    
    
    // MARK: - Initialization
    //=========================================================================
    
    /// Initializes the request.
    ///
    /// - Parameters:
    ///   - method:     The HTTP verb to use in the API call.
    ///   - parameters: Any parameters to send with the API call.
    ///   - path:       The path portion of the API endpoint, such as
    ///                 "/v3/mail/send". The path *must* start with a forward
    ///                 slash (`/`).
    public init(method: HTTPMethod, contentType: ContentType, path: String?) {
        self.method = method
        self.contentType = contentType
        var components = URLComponents(string: Constants.ApiHost)
        if let p = path { components?.path = p }
        self.endpoint = components
    }
    
    
    // MARK: - Methods
    //=========================================================================
    /// Generates a `URLRequest` representation of the request.
    ///
    /// - Returns:  A `URLRequest` instance.
    /// - Throws:   Errors can be thrown if there was a problem encoding the
    ///             parameters or constructing the API URL endpoint.
    open func generateUrlRequest() throws -> URLRequest {
        guard let url = self.endpoint?.url else {
            throw Exception.Request.couldNotConstructUrlRequest
        }
        var req = URLRequest(url: url)
        req.httpMethod = self.method.rawValue
        req.addValue(self.contentType.description, forHTTPHeaderField: "Content-Type")
        req.addValue(self.acceptType.description, forHTTPHeaderField: "Accept")
        if self.method.hasBody, let enc = self as? AutoEncodable {
            req.httpBody = enc.encode()
        }
        return req
    }
    
    /// Validates that the content and accept types are valid.
    public func validate() throws {
        try self.contentType.validate()
        try self.acceptType.validate()
    }
    
    
    // MARK: - Deprecations
    //=========================================================================
    @available(*, unavailable, message: "use the `generateUrlRequest` method instead.")
    open func request(for session: Session, onBehalfOf: String?) throws -> URLRequest {
        throw Exception.Global.methodUnavailable(type(of: self), "request(for:onBehalfOf:)")
    }
    
}

