# Swift Strings

## Dive deep into the workings of Swift's strings

💡 what was learned:
- Prefix and suffix (dropFirsr/dropLast),
- Capitalized,
- .contains() and .contains(where:)
- NSAttributedString and NSMutableAttributedString

## Challenge:

- [ ] Create a String extension that adds a withPrefix() method. If the string already contains the prefix it should return itself; if it doesn’t contain the prefix, it should return itself with the prefix added. For example: "pet".withPrefix("car") should return “carpet”.
- [ ] Create a String extension that adds an isNumeric property that returns true if the string holds any sort of number. Tip: creating a Double from a String is a failable initializer.
- [ ] Create a String extension that adds a lines property that returns an array of all the lines in a string. So, “this\nis\na\ntest” should return an array with four elements.
