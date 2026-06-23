# CurrencyCoreAPI

All URIs are relative to *https://api.currency-core.com/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ai**](CurrencyCoreAPI.md#ai) | **GET** /ai | AI
[**convert**](CurrencyCoreAPI.md#convert) | **GET** /convert | Convert
[**correlation**](CurrencyCoreAPI.md#correlation) | **GET** /correlation | Correlation
[**countries**](CurrencyCoreAPI.md#countries) | **GET** /countries | Countries
[**currencies**](CurrencyCoreAPI.md#currencies) | **GET** /currencies | Currencies
[**drawdown**](CurrencyCoreAPI.md#drawdown) | **GET** /drawdown | Drawdown
[**history**](CurrencyCoreAPI.md#history) | **GET** /history | History
[**historyAnalysis**](CurrencyCoreAPI.md#historyanalysis) | **GET** /history/analysis | History analysis
[**meanReversion**](CurrencyCoreAPI.md#meanreversion) | **GET** /mean-reversion | Mean reversion
[**pppAnalysis**](CurrencyCoreAPI.md#pppanalysis) | **GET** /ppp/analysis | PPP analysis
[**rates**](CurrencyCoreAPI.md#rates) | **GET** /rates | Rates
[**ratesByBase**](CurrencyCoreAPI.md#ratesbybase) | **GET** /rates/{base} | Rates by base
[**safeHaven**](CurrencyCoreAPI.md#safehaven) | **GET** /safe-haven | Safe haven
[**volatility**](CurrencyCoreAPI.md#volatility) | **GET** /volatility | Volatility


# **ai**
```swift
    open class func ai(q: String, completion: @escaping (_ data: AiResponse?, _ error: Error?) -> Void)
```

AI

Ask a natural-language currency question; the model answers using live rates.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let q = "q_example" // String | A natural-language question, e.g. \"Convert 50 euro to indian rupees\" or \"What's the USD to EUR rate today?\".

// AI
CurrencyCoreAPI.ai(q: q) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String** | A natural-language question, e.g. \&quot;Convert 50 euro to indian rupees\&quot; or \&quot;What&#39;s the USD to EUR rate today?\&quot;. | 

### Return type

[**AiResponse**](AiResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **convert**
```swift
    open class func convert(from: String, to: String, amount: Double? = nil, ppp: Bool? = nil, date: String? = nil, completion: @escaping (_ data: ConvertResponse?, _ error: Error?) -> Void)
```

Convert

Convert an amount between currencies, optionally PPP-adjusted.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let from = "from_example" // String | Source currency (ISO 4217), e.g. USD. For PPP (ppp=true) pair it with a country as CUR:COUNTRY, e.g. USD:USA.
let to = "to_example" // String | One or more target currencies, comma-separated, e.g. EUR,INR (max 25). For PPP use CUR:COUNTRY pairs, e.g. EUR:DEU,INR:IND.
let amount = 987 // Double | Amount to convert. Optional, defaults to 1 (so each result equals the rate). (optional)
let ppp = false // Bool | When true, apply a PPP adjustment. Every currency must then carry a country code. (optional)
let date = "date_example" // String | Rate date in YYYY-MM-DD (UTC). Must not be in the future. Defaults to latest. (optional)

// Convert
CurrencyCoreAPI.convert(from: from, to: to, amount: amount, ppp: ppp, date: date) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **String** | Source currency (ISO 4217), e.g. USD. For PPP (ppp&#x3D;true) pair it with a country as CUR:COUNTRY, e.g. USD:USA. | 
 **to** | **String** | One or more target currencies, comma-separated, e.g. EUR,INR (max 25). For PPP use CUR:COUNTRY pairs, e.g. EUR:DEU,INR:IND. | 
 **amount** | **Double** | Amount to convert. Optional, defaults to 1 (so each result equals the rate). | [optional] 
 **ppp** | **Bool** | When true, apply a PPP adjustment. Every currency must then carry a country code. | [optional] 
 **date** | **String** | Rate date in YYYY-MM-DD (UTC). Must not be in the future. Defaults to latest. | [optional] 

### Return type

[**ConvertResponse**](ConvertResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **correlation**
```swift
    open class func correlation(currencies: String, base: String? = nil, from: String? = nil, to: String? = nil, completion: @escaping (_ data: CorrelationResponse?, _ error: Error?) -> Void)
```

Correlation

Correlation of each currency's daily returns with a base currency's, over a window. Growth plan or higher.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let currencies = "currencies_example" // String | Comma-separated currencies to correlate with `base`, e.g. GBP,CHF,SEK.
let base = "base_example" // String | Reference currency to correlate against (3-letter ISO 4217). Defaults to USD (a non-USD base is more meaningful). (optional)
let from = "from_example" // String | Window start YYYY-MM-DD (UTC). Defaults to 365 days before `to`. (optional)
let to = "to_example" // String | Window end YYYY-MM-DD (UTC). Defaults to today. (optional)

// Correlation
CurrencyCoreAPI.correlation(currencies: currencies, base: base, from: from, to: to) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currencies** | **String** | Comma-separated currencies to correlate with &#x60;base&#x60;, e.g. GBP,CHF,SEK. | 
 **base** | **String** | Reference currency to correlate against (3-letter ISO 4217). Defaults to USD (a non-USD base is more meaningful). | [optional] 
 **from** | **String** | Window start YYYY-MM-DD (UTC). Defaults to 365 days before &#x60;to&#x60;. | [optional] 
 **to** | **String** | Window end YYYY-MM-DD (UTC). Defaults to today. | [optional] 

### Return type

[**CorrelationResponse**](CorrelationResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **countries**
```swift
    open class func countries(completion: @escaping (_ data: [CountriesResponseInner]?, _ error: Error?) -> Void)
```

Countries

The supported countries and their official currencies. Public, no key needed.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK


// Countries
CurrencyCoreAPI.countries() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**[CountriesResponseInner]**](CountriesResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **currencies**
```swift
    open class func currencies(completion: @escaping (_ data: [CurrenciesResponseInner]?, _ error: Error?) -> Void)
```

Currencies

The full list of supported ISO 4217 currencies. Use it to resolve a name or symbol to its code, or to check whether a currency is supported (so a missing one fails clearly, not silently). Public, no key needed.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK


// Currencies
CurrencyCoreAPI.currencies() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**[CurrenciesResponseInner]**](CurrenciesResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **drawdown**
```swift
    open class func drawdown(currency: String? = nil, base: String? = nil, from: String? = nil, to: String? = nil, sort: String? = nil, universe: String? = nil, limit: Double? = nil, completion: @escaping (_ data: DrawdownResponse?, _ error: Error?) -> Void)
```

Drawdown

Maximum peak-to-trough decline vs a base (with peak/trough/recovery), or a drawdown ranking. Growth plan or higher.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let currency = "currency_example" // String | Currency to measure (3-letter ISO 4217), or a comma-separated list. OMIT to RANK the liquid set by drawdown. (optional)
let base = "base_example" // String | Base currency to measure against (3-letter ISO 4217). Defaults to USD. (optional)
let from = "from_example" // String | Window start YYYY-MM-DD (UTC). Defaults to 365 days before `to`. (optional)
let to = "to_example" // String | Window end YYYY-MM-DD (UTC). Defaults to today. (optional)
let sort = "sort_example" // String | Ranking direction: deepest (largest decline first, default) or recovery (fastest recovery first). (optional)
let universe = "universe_example" // String | Ranking universe: liquid (default) or majors. (optional)
let limit = 987 // Double | Ranking: how many to return (default 10, max 50). (optional)

// Drawdown
CurrencyCoreAPI.drawdown(currency: currency, base: base, from: from, to: to, sort: sort, universe: universe, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currency** | **String** | Currency to measure (3-letter ISO 4217), or a comma-separated list. OMIT to RANK the liquid set by drawdown. | [optional] 
 **base** | **String** | Base currency to measure against (3-letter ISO 4217). Defaults to USD. | [optional] 
 **from** | **String** | Window start YYYY-MM-DD (UTC). Defaults to 365 days before &#x60;to&#x60;. | [optional] 
 **to** | **String** | Window end YYYY-MM-DD (UTC). Defaults to today. | [optional] 
 **sort** | **String** | Ranking direction: deepest (largest decline first, default) or recovery (fastest recovery first). | [optional] 
 **universe** | **String** | Ranking universe: liquid (default) or majors. | [optional] 
 **limit** | **Double** | Ranking: how many to return (default 10, max 50). | [optional] 

### Return type

[**DrawdownResponse**](DrawdownResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **history**
```swift
    open class func history(currency: String, from: String? = nil, to: String? = nil, base: String? = nil, interval: String? = nil, completion: @escaping (_ data: HistoryResponse?, _ error: Error?) -> Void)
```

History

A single currency's daily rate time series over a date range. Growth plan or higher.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let currency = "currency_example" // String | The currency whose history to fetch (3-letter ISO 4217), e.g. INR. One currency per call.
let from = "from_example" // String | Start date YYYY-MM-DD (UTC). Defaults to 7 days before `to`. (optional)
let to = "to_example" // String | End date YYYY-MM-DD (UTC). Defaults to today; a future date clamps to today. (optional)
let base = "base_example" // String | Base currency the rates are expressed against (3-letter ISO 4217). Defaults to USD. (optional)
let interval = "interval_example" // String | Aggregation: daily (default), weekly, monthly, or yearly. Coarser intervals average the daily rates per bucket (weekly key = the week's Monday, monthly = YYYY-MM, yearly = YYYY). (optional)

// History
CurrencyCoreAPI.history(currency: currency, from: from, to: to, base: base, interval: interval) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currency** | **String** | The currency whose history to fetch (3-letter ISO 4217), e.g. INR. One currency per call. | 
 **from** | **String** | Start date YYYY-MM-DD (UTC). Defaults to 7 days before &#x60;to&#x60;. | [optional] 
 **to** | **String** | End date YYYY-MM-DD (UTC). Defaults to today; a future date clamps to today. | [optional] 
 **base** | **String** | Base currency the rates are expressed against (3-letter ISO 4217). Defaults to USD. | [optional] 
 **interval** | **String** | Aggregation: daily (default), weekly, monthly, or yearly. Coarser intervals average the daily rates per bucket (weekly key &#x3D; the week&#39;s Monday, monthly &#x3D; YYYY-MM, yearly &#x3D; YYYY). | [optional] 

### Return type

[**HistoryResponse**](HistoryResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **historyAnalysis**
```swift
    open class func historyAnalysis(base: String? = nil, currencies: String? = nil, from: String? = nil, to: String? = nil, period: String? = nil, sort: String? = nil, assetClass: String? = nil, limit: Double? = nil, interval: String? = nil, stats: Bool? = nil, completion: @escaping (_ data: HistoryAnalysisResponse?, _ error: Error?) -> Void)
```

History analysis

Trends, comparisons & 'movers': % change, strength, and min/max/avg over a window. Growth plan or higher.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let base = "base_example" // String | Currency everything is measured against (3-letter ISO 4217). Defaults to USD. (optional)
let currencies = "currencies_example" // String | Comma-separated currencies to compare, e.g. GBP,EUR,AED. OMIT to rank ALL currencies vs base ('movers' mode). (optional)
let from = "from_example" // String | Window start YYYY-MM-DD (UTC). Defaults to 20 years (2 decades) before `to`. See `period` for a shorthand. (optional)
let to = "to_example" // String | Window end YYYY-MM-DD (UTC). Defaults to today; a future date clamps to today. (optional)
let period = "period_example" // String | Relative window shorthand for `from`: e.g. 10y, 6m, 30d, ytd, max. Ignored if `from` is given. (optional)
let sort = "sort_example" // String | Movers ranking: strengthened (default) or weakened. (optional)
let assetClass = "assetClass_example" // String | Movers universe: fiat (default, the liquid tradeable currencies), metals (XAU/XAG/XPT/XPD), or all (every currency incl. illiquid/frontier). fiat excludes metals/synthetics + illiquid frontier codes; redenomination artifacts are always dropped. (optional)
let limit = 987 // Double | Movers: how many top results to return (default 10, max 200). (optional)
let interval = "interval_example" // String | Attach a trend series per named currency: weekly, monthly, or yearly (compare mode only). (optional)
let stats = true // Bool | Include min/max/avg over the window per currency. Defaults to true; pass false to skip. (optional)

// History analysis
CurrencyCoreAPI.historyAnalysis(base: base, currencies: currencies, from: from, to: to, period: period, sort: sort, assetClass: assetClass, limit: limit, interval: interval, stats: stats) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **base** | **String** | Currency everything is measured against (3-letter ISO 4217). Defaults to USD. | [optional] 
 **currencies** | **String** | Comma-separated currencies to compare, e.g. GBP,EUR,AED. OMIT to rank ALL currencies vs base (&#39;movers&#39; mode). | [optional] 
 **from** | **String** | Window start YYYY-MM-DD (UTC). Defaults to 20 years (2 decades) before &#x60;to&#x60;. See &#x60;period&#x60; for a shorthand. | [optional] 
 **to** | **String** | Window end YYYY-MM-DD (UTC). Defaults to today; a future date clamps to today. | [optional] 
 **period** | **String** | Relative window shorthand for &#x60;from&#x60;: e.g. 10y, 6m, 30d, ytd, max. Ignored if &#x60;from&#x60; is given. | [optional] 
 **sort** | **String** | Movers ranking: strengthened (default) or weakened. | [optional] 
 **assetClass** | **String** | Movers universe: fiat (default, the liquid tradeable currencies), metals (XAU/XAG/XPT/XPD), or all (every currency incl. illiquid/frontier). fiat excludes metals/synthetics + illiquid frontier codes; redenomination artifacts are always dropped. | [optional] 
 **limit** | **Double** | Movers: how many top results to return (default 10, max 200). | [optional] 
 **interval** | **String** | Attach a trend series per named currency: weekly, monthly, or yearly (compare mode only). | [optional] 
 **stats** | **Bool** | Include min/max/avg over the window per currency. Defaults to true; pass false to skip. | [optional] 

### Return type

[**HistoryAnalysisResponse**](HistoryAnalysisResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **meanReversion**
```swift
    open class func meanReversion(currencies: String? = nil, base: String? = nil, from: String? = nil, to: String? = nil, limit: Double? = nil, completion: @escaping (_ data: MeanReversionResponse?, _ error: Error?) -> Void)
```

Mean reversion

Ranks currencies by how strongly they revert to their mean (crossing frequency + reversion half-life). Growth plan or higher.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let currencies = "currencies_example" // String | Comma-separated currencies to score, e.g. EUR,GBP. OMIT to rank the liquid set. (optional)
let base = "base_example" // String | Base currency to measure against (3-letter ISO 4217). Defaults to USD. (optional)
let from = "from_example" // String | Window start YYYY-MM-DD (UTC). Defaults to ~2 years before `to`. (optional)
let to = "to_example" // String | Window end YYYY-MM-DD (UTC). Defaults to today. (optional)
let limit = 987 // Double | How many to return (default 10, max 50). (optional)

// Mean reversion
CurrencyCoreAPI.meanReversion(currencies: currencies, base: base, from: from, to: to, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currencies** | **String** | Comma-separated currencies to score, e.g. EUR,GBP. OMIT to rank the liquid set. | [optional] 
 **base** | **String** | Base currency to measure against (3-letter ISO 4217). Defaults to USD. | [optional] 
 **from** | **String** | Window start YYYY-MM-DD (UTC). Defaults to ~2 years before &#x60;to&#x60;. | [optional] 
 **to** | **String** | Window end YYYY-MM-DD (UTC). Defaults to today. | [optional] 
 **limit** | **Double** | How many to return (default 10, max 50). | [optional] 

### Return type

[**MeanReversionResponse**](MeanReversionResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **pppAnalysis**
```swift
    open class func pppAnalysis(countries: String? = nil, from: String? = nil, to: String? = nil, period: String? = nil, sort: String? = nil, limit: Double? = nil, stats: Bool? = nil, completion: @escaping (_ data: PppAnalysisResponse?, _ error: Error?) -> Void)
```

PPP analysis

PPP over time: how a country's purchasing-power-parity factor changed, comparing countries, or 'movers'. Growth plan or higher.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let countries = "countries_example" // String | Comma-separated ISO 3166-1 alpha-3 country codes to compare, e.g. IND,DEU,USA. OMIT to rank ALL countries by PPP-factor change ('movers' mode). (optional)
let from = "from_example" // String | Window start YEAR (e.g. 2015). Defaults to 10 years before `to`. See `period` for a shorthand. (optional)
let to = "to_example" // String | Window end YEAR (e.g. 2024). Defaults to the current year. (optional)
let period = "period_example" // String | Relative window shorthand for `from`: e.g. 10y, 20y, max. Ignored if `from` is given. (optional)
let sort = "sort_example" // String | Movers ranking: increased (PPP factor rose most, default) or decreased. (optional)
let limit = 987 // Double | Movers: how many top results to return (default 10, max 200). (optional)
let stats = true // Bool | Include min/max/avg of the PPP factor over the window per country. Defaults to true; pass false to skip. (optional)

// PPP analysis
CurrencyCoreAPI.pppAnalysis(countries: countries, from: from, to: to, period: period, sort: sort, limit: limit, stats: stats) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **countries** | **String** | Comma-separated ISO 3166-1 alpha-3 country codes to compare, e.g. IND,DEU,USA. OMIT to rank ALL countries by PPP-factor change (&#39;movers&#39; mode). | [optional] 
 **from** | **String** | Window start YEAR (e.g. 2015). Defaults to 10 years before &#x60;to&#x60;. See &#x60;period&#x60; for a shorthand. | [optional] 
 **to** | **String** | Window end YEAR (e.g. 2024). Defaults to the current year. | [optional] 
 **period** | **String** | Relative window shorthand for &#x60;from&#x60;: e.g. 10y, 20y, max. Ignored if &#x60;from&#x60; is given. | [optional] 
 **sort** | **String** | Movers ranking: increased (PPP factor rose most, default) or decreased. | [optional] 
 **limit** | **Double** | Movers: how many top results to return (default 10, max 200). | [optional] 
 **stats** | **Bool** | Include min/max/avg of the PPP factor over the window per country. Defaults to true; pass false to skip. | [optional] 

### Return type

[**PppAnalysisResponse**](PppAnalysisResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rates**
```swift
    open class func rates(date: String? = nil, completion: @escaping (_ data: RatesResponse?, _ error: Error?) -> Void)
```

Rates

The full exchange-rate snapshot for a date (USD base).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let date = "date_example" // String | YYYY-MM-DD. Defaults to the latest available date. (optional)

// Rates
CurrencyCoreAPI.rates(date: date) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date** | **String** | YYYY-MM-DD. Defaults to the latest available date. | [optional] 

### Return type

[**RatesResponse**](RatesResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ratesByBase**
```swift
    open class func ratesByBase(base: String, date: String? = nil, completion: @escaping (_ data: RatesByBaseResponse?, _ error: Error?) -> Void)
```

Rates by base

The same snapshot re-expressed against any base currency.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let base = "base_example" // String | Base currency (3-letter ISO 4217), e.g. EUR.
let date = "date_example" // String | YYYY-MM-DD. Defaults to the latest available date. (optional)

// Rates by base
CurrencyCoreAPI.ratesByBase(base: base, date: date) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **base** | **String** | Base currency (3-letter ISO 4217), e.g. EUR. | 
 **date** | **String** | YYYY-MM-DD. Defaults to the latest available date. | [optional] 

### Return type

[**RatesByBaseResponse**](RatesByBaseResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **safeHaven**
```swift
    open class func safeHaven(currencies: String? = nil, base: String? = nil, from: String? = nil, to: String? = nil, limit: Double? = nil, completion: @escaping (_ data: SafeHavenResponse?, _ error: Error?) -> Void)
```

Safe haven

Ranks currencies by a composite safe-haven score (low volatility + shallow drawdown + 2008-crisis resilience). Growth plan or higher.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let currencies = "currencies_example" // String | Comma-separated currencies to score, e.g. CHF,JPY. OMIT to rank the safe-haven pool (includes gold). (optional)
let base = "base_example" // String | Base currency to measure against (3-letter ISO 4217). Defaults to USD. (optional)
let from = "from_example" // String | Window start YYYY-MM-DD (UTC). Defaults to 2007-01-01 (spans the 2008 crisis + COVID). (optional)
let to = "to_example" // String | Window end YYYY-MM-DD (UTC). Defaults to today. (optional)
let limit = 987 // Double | How many to return (default 10, max 50). (optional)

// Safe haven
CurrencyCoreAPI.safeHaven(currencies: currencies, base: base, from: from, to: to, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currencies** | **String** | Comma-separated currencies to score, e.g. CHF,JPY. OMIT to rank the safe-haven pool (includes gold). | [optional] 
 **base** | **String** | Base currency to measure against (3-letter ISO 4217). Defaults to USD. | [optional] 
 **from** | **String** | Window start YYYY-MM-DD (UTC). Defaults to 2007-01-01 (spans the 2008 crisis + COVID). | [optional] 
 **to** | **String** | Window end YYYY-MM-DD (UTC). Defaults to today. | [optional] 
 **limit** | **Double** | How many to return (default 10, max 50). | [optional] 

### Return type

[**SafeHavenResponse**](SafeHavenResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **volatility**
```swift
    open class func volatility(currency: String? = nil, base: String? = nil, from: String? = nil, to: String? = nil, sort: String? = nil, universe: String? = nil, limit: Double? = nil, completion: @escaping (_ data: VolatilityResponse?, _ error: Error?) -> Void)
```

Volatility

Annualized volatility of a currency vs a base, or a stability ranking of the liquid currencies. Growth plan or higher.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import CurrencyCoreSDK

let currency = "currency_example" // String | Currency to measure (3-letter ISO 4217), or a comma-separated list to compare. OMIT to RANK the liquid-currency set by stability. (optional)
let base = "base_example" // String | Base currency to measure against (3-letter ISO 4217). Defaults to USD. (optional)
let from = "from_example" // String | Window start YYYY-MM-DD (UTC). Defaults to 365 days before `to`. (optional)
let to = "to_example" // String | Window end YYYY-MM-DD (UTC). Defaults to today; a future date clamps to today. (optional)
let sort = "sort_example" // String | Ranking direction: stable (least volatile first, default) or volatile. (optional)
let universe = "universe_example" // String | Ranking universe: liquid (default, broad set) or majors (USD/EUR/GBP/JPY/CHF/CAD/AUD/NZD). Use majors for 'most volatile major pair'. (optional)
let limit = 987 // Double | Ranking: how many to return (default 10, max 50). (optional)

// Volatility
CurrencyCoreAPI.volatility(currency: currency, base: base, from: from, to: to, sort: sort, universe: universe, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **currency** | **String** | Currency to measure (3-letter ISO 4217), or a comma-separated list to compare. OMIT to RANK the liquid-currency set by stability. | [optional] 
 **base** | **String** | Base currency to measure against (3-letter ISO 4217). Defaults to USD. | [optional] 
 **from** | **String** | Window start YYYY-MM-DD (UTC). Defaults to 365 days before &#x60;to&#x60;. | [optional] 
 **to** | **String** | Window end YYYY-MM-DD (UTC). Defaults to today; a future date clamps to today. | [optional] 
 **sort** | **String** | Ranking direction: stable (least volatile first, default) or volatile. | [optional] 
 **universe** | **String** | Ranking universe: liquid (default, broad set) or majors (USD/EUR/GBP/JPY/CHF/CAD/AUD/NZD). Use majors for &#39;most volatile major pair&#39;. | [optional] 
 **limit** | **Double** | Ranking: how many to return (default 10, max 50). | [optional] 

### Return type

[**VolatilityResponse**](VolatilityResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

