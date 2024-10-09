public enum TwoTouchParseError: Error {
  
  /// The input contains non-numeric characters.
  case invalidInput(String)
  
  /// The input value exceeds the mapping table range.
  case outOfRange
  
  /// No corresponding character was found in the mapping table.
  case characterNotFound(Character)
}

extension TwoTouchParseError: CustomDebugStringConvertible {
  public var debugDescription: String {
    switch self {
    case let .invalidInput(input):
      return "Invalid input: '\(input)' contains non-numeric characters. Please provide a numeric string."
      
    case .outOfRange:
      return "Out of range error: The input values exceed the mapping table boundaries. Please ensure the input follows the valid format and range."
      
    case let .characterNotFound(character):
          return "Character not found: No character corresponds to the given input value '\(character)' in the mapping table. Verify that the mapping table is correctly configured and the character is supported."
    }
  }
}
