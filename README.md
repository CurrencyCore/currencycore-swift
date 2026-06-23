# CurrencyCore SDK for Swift (iOS / macOS)

Official client for the [CurrencyCore](https://currency-core.com) API — currency
conversion, FX rates, PPP, and analytics.

Generated from the CurrencyCore OpenAPI 3.1 spec with
[OpenAPI Generator](https://openapi-generator.tech) (`swift5`, async/await), plus
a thin `CurrencyCore.configure(...)` helper for API-key and version handling.

## Install (Swift Package Manager)

```swift
.package(url: "https://github.com/currencycore/currencycore-swift.git", from: "0.1.0")
```

Add `"CurrencyCoreSDK"` to your target's dependencies.

## Quickstart

```swift
import CurrencyCoreSDK

CurrencyCore.configure(apiKey: "cc_live_...") // or set CURRENCYCORE_API_KEY

let res = try await CurrencyCoreAPI.convert(from: "USD", to: "EUR", amount: 100)
print(res.results.first as Any)
```

Public reference endpoints need no key:

```swift
CurrencyCore.configure()
let currencies = try await CurrencyCoreAPI.currencies()
```

## API key

`CurrencyCore.configure` resolves the key as `apiKey` → `CURRENCYCORE_API_KEY`.
On iOS, **never embed a secret key in a shipped app** — proxy requests through
your backend or use a short-lived token.

## API version

Base URL is `https://api.currency-core.com/{version}` (default `v1`):

```swift
CurrencyCore.configure(version: "v1")
CurrencyCore.configure(baseURL: "https://api.currency-core.com/v1")
```

## Regenerate

The committed `openapi.json` is the source of truth:

```bash
bash scripts/generate.sh
```

Hand-written files (`CurrencyCoreSDK/Classes/OpenAPIs/CurrencyCore.swift`, this
README) are protected by `.openapi-generator-ignore`.

## License

MIT
