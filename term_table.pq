// PQ Code that generates a table with year and term columns to use in NDUS reports

// Inputs:
  // startYear - Year to start at
  // endYear - Year to go to
// Outputs: table
  // Academic Year - Academic year; 2011
  // Term Name - Full name, Academic year and term; 2011 Fall
  // Term Type - Semester of term; Fall
  // Term - 4 digit term code; 1110
  
let
    startYear = 2001,
    endYear = 2023,
    termTable = 
        #table(
            {"Term", "Term Number"}, {
                {"Fall", "10"}, 
                {"Spring", "20"}, 
                {"Summer", "40"}}),

    // Generates range of academic years
    Output = {startYear..endYear},
    #"Converted to Table" = Table.FromList(Output, Splitter.SplitByNothing(), {"Academic Year"}, null, ExtraValues.Error),
    #"Changed Type" = Table.TransformColumnTypes(#"Converted to Table",{{"Academic Year", type text}}),
    // Add term table to each year
    #"Added Custom" = Table.AddColumn(#"Changed Type", "Custom", each termTable),
    #"Expanded Custom" = Table.ExpandTableColumn(#"Added Custom", "Custom", {"Term", "Term Number"}, {"Term", "Term Number"}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Expanded Custom",{{"Term", type text}, {"Term Number", type text}}),
    #"Duplicated Column1" = Table.DuplicateColumn(#"Changed Type1", "Term", "Term Type"),
    #"Duplicated Column" = Table.DuplicateColumn(#"Duplicated Column1", "Academic Year", "Academic Year - Copy"),
    // Create Term name column
    #"Merged Columns" = Table.CombineColumns(#"Duplicated Column",{"Academic Year - Copy", "Term"},Combiner.CombineTextByDelimiter(" ", QuoteStyle.None),"Term Name"),
    // Create Term column
    #"Added Custom1" = Table.AddColumn(#"Merged Columns", "Term", each Text.End([Academic Year], 2) & [Term Number]),
    #"Changed Type2" = Table.TransformColumnTypes(#"Added Custom1",{{"Term", type text}}),
    #"Removed Columns" = Table.RemoveColumns(#"Changed Type2",{"Term Number"})
in
    #"Removed Columns"
