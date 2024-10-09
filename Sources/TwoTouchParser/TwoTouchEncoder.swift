open class TwoTouchEncoder {
  
  /// Initializes a new instance of the `TwoTouchEncoder` class.
  public init() {}
  
  /// Encodes a given string into a numeric code using the two-touch mapping table.
  ///
  /// - Parameter text: The string to be encoded.
  /// - Returns: A numeric string representing the encoded input based on the mapping table.
  /// - Throws: `TwoTouchParseError.characterNotFound` if any character in the input string does not exist in the mapping table.
  ///
  /// This function iterates over each character in the input string and searches for it in the `TWO_TOUCH_MAPPING_TABLE`.
  /// If a match is found, it appends the corresponding numeric code (row and column index) to the result. If a character
  /// is not found, it throws a `TwoTouchParseError.characterNotFound` error.
  open func encode(from text: String) throws -> String {
    var result = ""
    
    // Iterate over each character in the input text
    for character in text {
      var found = false
      // Search for the character in the two-touch mapping table
      for (rowIndex, row) in TWO_TOUCH_MAPPING_TABLE.enumerated() {
        if let colIndex = row.firstIndex(of: String(character)) {
          // Append the row and column indices as the numeric code
          result += "\(rowIndex)\(colIndex)"
          found = true
          break
        }
      }
      
      // If the character is not found in the mapping table, throw an error
      if !found {
        throw TwoTouchParseError.characterNotFound
      }
    }
    
    return result
  }
}
