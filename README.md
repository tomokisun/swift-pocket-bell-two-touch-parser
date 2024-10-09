# Swift Pocket Bell Two Touch Parser

## About Pocket Bell Two Touch

The Pocket Bell Two Touch system is a method for inputting characters and symbols using a numeric keypad, similar to early mobile phones and pagers. Each number corresponds to a row and column, and the user selects a character by pressing the row number followed by the column number. This system allows for efficient text entry using a limited set of keys.

The following table shows the character mapping for each combination of row and column:

| Two Touch | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 |
|-----------|---|---|---|---|---|---|---|---|---|---|
| 1         | あ | い | う | え | お | A | B | C | D | E |
| 2         | か | き | く | け | こ | F | G | H | I | J |
| 3         | さ | し | す | せ | そ | K | L | M | N | O |
| 4         | た | ち | つ | て | と | P | Q | R | S | T |
| 5         | な | に | ぬ | ね | の | U | V | W | X | Y |
| 6         | は | ひ | ふ | へ | ほ | Z | ? | ! | ー | / |
| 7         | ま | み | む | め | も | ¥ | & | ● | ● | ● |
| 8         | や | （ | ゆ | ） | よ | * | # | 空白 | ● | ● |
| 9         | ら | り | る | れ | ろ | 1 | 2 | 3 | 4 | 5 |
| 0         | わ | を | ん | ゛ | 。 | 6 | 7 | 8 | 9 | 0 |

### How to Use the Two Touch System
To use the Pocket Bell Two Touch system:
1. Press the number corresponding to the row (1 through 9, or 0).
2. Press the number corresponding to the column (1 through 0).
   
For example:
- To enter "あ", press `1` followed by `1`.
- To enter "き", press `2` followed by `2`.
- To enter "空白" (space), press `8` followed by `8`.

This method allows users to efficiently input a wide range of characters and symbols with just a numeric keypad.

## Usage

The Pocket Bell Two Touch system can be used for both decoding numeric codes into characters (Decoder) and encoding characters into numeric codes (Encoder). Below are examples of how to use each.

### Decoder

The `TwoTouchDecoder` converts a numeric string into its corresponding characters using the Two Touch mapping table. This is useful for interpreting numeric inputs as readable text. 

**Example:**

```swift
do {
    let decoder = TwoTouchDecoder()
    let decodedText = try decoder.decode(from: "1112324493")
    print(decodedText) // Output: "あいしてる"
} catch {
    print("Decoding error: \(error)")
}
```

**Explanation:**
- Instantiate the `TwoTouchDecoder` and call the `decode` method with a numeric string that follows the Two Touch format.
- The decoder will convert the input into the corresponding characters based on the mapping table.
- If the input contains invalid numbers or an invalid format, the decoder will throw an error, which should be handled appropriately.

### Encoder

The `TwoTouchEncoder` converts a string of characters into its corresponding numeric code using the Two Touch mapping table. This is useful for encoding text into the numeric format used by Pocket Bell.

**Example:**

```swift
do {
    let encoder = TwoTouchEncoder()
    let encodedText = try encoder.encode(from: "あいしてる")
    print(encodedText) // Output: "1112324493"
} catch {
    print("Encoding error: \(error)")
}
```

**Explanation:**
- Instantiate the TwoTouchEncoder and call the encode method with a string that contains characters from the mapping table.
- The encoder will convert the characters into their respective numeric codes according to the mapping table.
- If any character is not found in the table, the encoder will throw an error, which should be handled properly.

## Important Notes
- Ensure that the input for the decoder follows the Two Touch numeric pattern (e.g., two-digit codes for each character).
- For the encoder, make sure that all characters in the input are part of the mapping table; otherwise, the process will result in an error.
- Both the decoder and encoder are case-sensitive and expect valid characters/numeric inputs according to the mapping table provided.
