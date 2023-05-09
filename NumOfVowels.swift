import Foundation
//The program will take a string and will return the total count of the number of vowels.
// author  Navin Balekomebole
// version 1.0
// since   2023-05-02

func countVowels(_ str: String) -> Int {
    // Base case: empty string has zero vowels
    if str.isEmpty {
        return 0
    }

    // recursive case: count the vowel in the first character
    // and add it to the count of vowels in the rest of the string
    let firstChar = str[str.startIndex]
    var vowelCount = 0
    if isVowel(firstChar) {
        vowelCount = 1
    }
    return vowelCount + countVowels(String(str[str.index(after: str.startIndex)...]))
}

// Helper for previous function.
func isVowel(_ letter: Character) -> Bool {
    return "aeiouAEIOU".contains(letter)
}

do {
    // read input from a file called input.txt
    let inputString = try String(contentsOfFile: "input.txt")
    let outputString = inputString.split(separator: "\n")
        .map { "Number of vowels in the input string: \(countVowels(String($0)))\n" }
        .joined(separator: "")
    // write output to a file called output.txt
    try outputString.write(toFile: "output.txt", atomically: true, encoding: .utf8)
    print(outputString)
    } catch {
        print("An error occurred.")
    }