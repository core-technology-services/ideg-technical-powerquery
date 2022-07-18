Web.Contents(
        // BaseUrl: URI of the web request. Can be used in conjunction with RelativePath option
    "https://api.website.com/v2",
    [
            // Headers: Specifying this value as a record will supply additional headers to an HTTP request.
        Headers = [
            #"Content-Type" = "application/json",
            #"Authorization" = " Bearer 9827cyb789b87taw876dg796awgd8agw9d786gaw8g8adwg7aw9hd09haw"
        ],
            // RelativePath: Specifying this value as text appends it to the base URL before making the request.
        RelativePath = "tickets/search",
            // Content: Specifying this value changes the web request from a GET to a POST, using the value of the option as the content of the POST.
        Content = Text.ToBinary("{""MaxResults"": 20000,""StatusClassIDs"" : [0,1,2,5]}"),
            // Query: Programmatically add query parameters to the URL without having to worry about escaping.
            // ?q=search+Text
        Query = [
            q = "search Text"
        ],
            // ApiKeyName: If the target site has a notion of an API key, this parameter can be used to specify the name (not the value) of the key parameter that must be used in the URL. The actual key value is provided in the credential.
            // https://www.webapi.com/request?apiKey=api_key
        ApiKeyName = "api_key",
            // Timeout: Specifying this value as a duration will change the timeout for an HTTP request. The default value is 100 seconds.
            // 10 second timeout
        Timeout = #duration(0,0,0,10)

        // ExcludedFromCacheKey: Specifying this value as a list will exclude these HTTP header keys from being part of the calculation for caching data.
        // IsRetry: Specifying this logical value as true will ignore any existing response in the cache when fetching data.
        // ManualStatusHandling: Specifying this value as a list will prevent any builtin handling for HTTP requests whose response has one of these status codes.
    ]
)
