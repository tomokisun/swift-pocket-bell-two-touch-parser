open class TwoTouchDecoder {
  
  public init() {}

  /// Decodes a numeric string into a corresponding character string using the two-touch mapping table.
  ///
  /// - Parameter number: A string containing numeric characters.
  /// - Returns: A decoded string based on the two-touch mapping table.
  /// - Throws: `TwoTouchParseError.invalidInput` if the input contains non-numeric characters.
  ///           `TwoTouchParseError.outOfRange` if the input values exceed the mapping table range.
  open func decode(from number: String) throws -> String {
    // Validate if the input contains only numeric characters
    guard number.allSatisfy({ $0.isNumber }) else {
      throw TwoTouchParseError.invalidInput(number)
    }
    
    var result = ""
    let digits = Array(number)
    
    // Process two characters (digits) at a time
    for i in stride(from: 0, to: digits.count, by: 2) {
      // Retrieve two digits (row and column)
      guard i + 1 < digits.count,
            let row = Int(String(digits[i])),
            let col = Int(String(digits[i + 1])) else {
        throw TwoTouchParseError.outOfRange
      }
      
      // Check if the row and column are within the bounds of the mapping table
      guard row >= 0 && row < TWO_TOUCH_MAPPING_TABLE.count,
            col >= 0 && col < TWO_TOUCH_MAPPING_TABLE[row].count else {
        throw TwoTouchParseError.outOfRange
      }
      
      // Retrieve the corresponding character from the mapping table
      let character = TWO_TOUCH_MAPPING_TABLE[row][col]
      result += character
    }

    return result
  }
}
