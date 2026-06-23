import Foundation

/// Environment-aware configuration helper for the CurrencyCore SDK.
///
/// Call `configure(...)` once at startup, then use the generated
/// `CurrencyCoreAPI` endpoints.
public enum CurrencyCore {
    private static let defaultHost = "https://api.currency-core.com"

    /// Configure the global client: base URL + bearer API key.
    ///
    /// Resolves the key as `apiKey` -> `CURRENCYCORE_API_KEY` and the base URL
    /// as `baseURL` -> `CURRENCYCORE_BASE_URL` -> the public host with `version`.
    /// On iOS, pass `apiKey` explicitly — never embed a secret key in a shipped
    /// app. Omit it for the public reference endpoints.
    public static func configure(
        apiKey: String? = ProcessInfo.processInfo.environment["CURRENCYCORE_API_KEY"],
        baseURL: String? = ProcessInfo.processInfo.environment["CURRENCYCORE_BASE_URL"],
        version: String = "v1"
    ) {
        CurrencyCoreSDKAPI.basePath = baseURL ?? "\(defaultHost)/\(version)"
        if let apiKey = apiKey {
            CurrencyCoreSDKAPI.customHeaders["Authorization"] = "Bearer \(apiKey)"
        }
    }
}
