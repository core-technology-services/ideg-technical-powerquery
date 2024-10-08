(data as text) as text =>
let
    // Forumla to decode URI strings
    UriUnescapeDataString = Uri.Parts("http://contoso?a=" & data)[Query][a]
in
    UriUnescapeDataString
