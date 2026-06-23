# CurrencyCore SDK for Swift (iOS / macOS)

Official client for the [CurrencyCore](https://currency-core.com) API — currency
conversion, FX rates, PPP, and analytics.

Generated from the CurrencyCore OpenAPI 3.1 spec with
[OpenAPI Generator](https://openapi-generator.tech) (`swift5`, async/await), plus
a thin `CurrencyCore.configure(...)` helper for API-key and version handling.

- **Website:** https://currency-core.com
- **Documentation:** https://currency-core.com/docs

## Install (Swift Package Manager)

```swift
.package(url: "https://github.com/CurrencyCore/currencycore-swift.git", from: "0.1.2")
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

## Endpoints

All 14 endpoints are static methods on `CurrencyCoreAPI` (all `async`/`throws`). `*` marks a required argument; the rest are optional. **Public** = no key; **Free** = any plan with a key; **Growth** = Growth plan or higher.

| Endpoint | Call | Plan |
| --- | --- | --- |
| Convert an amount (optional PPP) | `CurrencyCoreAPI.convert(from*, to*, amount, ppp, date)` | Free |
| Rate snapshot for a date (USD base) | `CurrencyCoreAPI.rates(date)` | Free |
| Rate snapshot in any base | `CurrencyCoreAPI.ratesByBase(base*, date)` | Free |
| One currency's daily time series | `CurrencyCoreAPI.history(currency*, from, to, base, interval)` | Growth |
| Trends, comparisons & movers | `CurrencyCoreAPI.historyAnalysis(base, currencies, from, to, period, sort, assetClass, limit, interval, stats)` | Growth |
| PPP factor over time / movers | `CurrencyCoreAPI.pppAnalysis(countries, from, to, period, sort, limit, stats)` | Growth |
| Volatility or stability ranking | `CurrencyCoreAPI.volatility(currency, base, from, to, sort, universe, limit)` | Growth |
| Return correlation vs a base | `CurrencyCoreAPI.correlation(currencies*, base, from, to)` | Growth |
| Max drawdown or ranking | `CurrencyCoreAPI.drawdown(currency, base, from, to, sort, universe, limit)` | Growth |
| Safe-haven score ranking | `CurrencyCoreAPI.safeHaven(currencies, base, from, to, limit)` | Growth |
| Mean-reversion ranking | `CurrencyCoreAPI.meanReversion(currencies, base, from, to, limit)` | Growth |
| Supported countries + currencies | `CurrencyCoreAPI.countries()` | Public |
| Supported ISO 4217 currencies | `CurrencyCoreAPI.currencies()` | Public |
| Natural-language question | `CurrencyCoreAPI.ai(q*)` | Free |

More calls:

```swift
try await CurrencyCoreAPI.rates()                    // latest snapshot (USD base)
try await CurrencyCoreAPI.ratesByBase(base: "EUR")   // same snapshot, EUR base
try await CurrencyCoreAPI.history(currency: "INR", from: "2024-01-01")
try await CurrencyCoreAPI.volatility(universe: "majors", sort: "volatile")
try await CurrencyCoreAPI.ai(q: "How has the rupee moved this year?")
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
