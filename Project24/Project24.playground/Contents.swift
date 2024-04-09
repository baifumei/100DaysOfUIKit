import UIKit

//Strings are not arrays
let name = "Taylor"

for letter in name {
    print("Give me a \(letter)!")
}
          
let letter = name[name.index(name.startIndex, offsetBy: 3)]

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

let letter2 = name[3]


//Working with strings in Swift

//1: Prefix and suffix (dropFirsr/dropLast)
let password = "123456"
password.hasPrefix("123")
password.hasSuffix("456")

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}

extension String {
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
}

//2: Capitalized
let weather = "it's going to rain"
weather.capitalized

extension String {
    var capitalizedFirst: String {
        guard let firstLetter = self.first else { return "" }
        return firstLetter.uppercased() + self.dropFirst()
    }
}

weather.capitalizedFirst

//3: contains() in str and arr -> Bool
let input = "Swift is like Objective-C without C!"
input.contains("Swift")

let languages = ["Python", "Ruby", "Swift"]
languages.contains("Swift")

extension String {
    func containtsAny(of array: [String]) -> Bool {
        for item in array {
            if self.contains(item) {
                return true
            }
        }
        return false
    }
}

input.containtsAny(of: languages)

//contains(where:) проверяет, содержится ли хотя бы одна из строк в массиве languages в строке input.
languages.contains(where: input.contains)


//Formatting strings with NSAttributedString and NSMutableAttributedString
let string = "This is a test string"

let attributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)
]

let attributedStr = NSAttributedString(string: string, attributes: attributes)

let attributedString = NSMutableAttributedString(string: string)
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 8), range: NSRange(location: 0, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 26), range: NSRange(location: 8, length: 2))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 24), range: NSRange(location: 10, length: 1))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 32), range: NSRange(location: 11, length: 4))
attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 48), range: NSRange(location: 15, length: 6))

//Challenge1:
//Create a String extension that adds a withPrefix() method. If the string already contains the prefix it should return itself; if it doesn’t contain the prefix, it should return itself with the prefix added. For example: "pet".withPrefix("car") should return “carpet”.

extension String {
    func withPrefix(_ prefix: String) -> String {
        guard !self.hasPrefix(prefix) else { return self }
        return prefix + self
    }
}

"pet".withPrefix("car")
"carpet".withPrefix("car")

//Challenge2:
//Create a String extension that adds an isNumeric property that returns true if the string holds any sort of number. Tip: creating a Double from a String is a failable initializer.

extension String {
    var isNumeric: Bool {
        if let holds = Float(self) {
            return true
        }
        return false
    }
}

"12343".isNumeric

//Challenge3:
//Create a String extension that adds a lines property that returns an array of all the lines in a string. So, “this\nis\na\ntest” should return an array with four elements.

extension String {
    var lines: [String] {
        guard self.contains("\n") else { return [self] }
        
        for (index, separator) in self.enumerated() {
            
        }
        
        return self.split(separator: "\n").map { String($0) }
    }
}

print("this\nis\na\ntest".lines)
