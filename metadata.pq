let
  // Metadata table for information regarding dataflow
  // How-to:
  // Perform calculation desired,
  // Record value by putting item as record with Name and Value field
  // Add record to Table.FromRecords list to combine
  // Current time in UTC for indicating last refresh time of dataflow
  #"Current Time UTC" = [Name = "Current Time UTC", Value = DateTimeZone.UtcNow()],
  // Combine record values into metadata table
  Output = Table.FromRecords({
    #"Current Time UTC"
    },
    type table [
      Name = text,
      Value
    ])
in
  Output