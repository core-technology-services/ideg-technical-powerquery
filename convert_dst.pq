// Adjusts input datetime to provided standard local timezone value with respect to DST

let
    // Input datetime and non-DST time offset of local timezone
    Source = ( InputTime as datetimezone, StandardLocal as number ) => 

    let
        // Skip conversion
        SkipConversion = InputTime,

        // Figure out dates for Input and DST of the year
        InputYear = Date.Year(DateTimeZone.SwitchZone(InputTime,StandardLocal)),
        DST_Start = Date.StartOfWeek(#datetimezone(InputYear,3,14,0,0,0,StandardLocal,0),Day.Sunday) + #duration(0,2,0,0),
        DST_End = Date.StartOfWeek(#datetimezone(InputYear,11,7,0,0,0,StandardLocal+1,0),Day.Sunday) + #duration(0,2,0,0), 

        // Check input against DST range
        AdjustDST = 
            if 
                InputTime >= DST_Start and InputTime < DST_End 
            then 
                StandardLocal + 1 
            else 
                StandardLocal,     

        //  Adjust timezone with the AdjustDST value which factors DST
        InputTimeAdjusted = DateTimeZone.SwitchZone(InputTime,AdjustDST),

        // Check if InputTime is in year 1 or 9999
        // Skip conversion if in those years to avoid out of bounds
        Output =
            if Date.Year(InputTime) = 1 or Date.Year(InputTime) = 9999
            then SkipConversion
            else InputTimeAdjusted
    in
        Output

in
    Source
