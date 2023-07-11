// Convert UNIX timestamp in both seconds and milliseconds to DateTime
// Inputs:
//  timestamp - UNIX timestamp in either seconds or milliseconds

// Outputs:
//  output - DateTime of input timestamp

let convertUnixTimestamp = (timestamp as text) =>

let
    parsedTimestamp = Number.FromText(timestamp),

    timeOffset = 
        if parsedTimestamp > 1000000000
        then parsedTimestamp / 1000
        else parsedTimestamp,

    Output = #datetime(1970, 1, 1, 0, 0, 0) + #duration(0, 0, 0, timeOffset )
in
    Output
in
    convertUnixTimestamp
