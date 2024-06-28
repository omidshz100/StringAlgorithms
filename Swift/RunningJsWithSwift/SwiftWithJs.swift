import Foundation
import JavaScriptCore

// Function to read JavaScript code from a file
func loadJavaScriptCode(from file: String) -> String? {
    let fileManager: FileManager = FileManager.default
    let currentDirectory: String = fileManager.currentDirectoryPath
    let filePath: String = "\(currentDirectory)/Swift/RunningJsWithSwift/\(file)"
    
    do {
        return try String(contentsOfFile: filePath, encoding: .utf8)
    } catch {
        print("Error reading JavaScript file at \(filePath): \(error)")
        return nil
    }
}

// Function to run JavaScript code
func runJavaScriptCode(jsCode: String) -> JSValue? {
    let context = JSContext()
    let result = context?.evaluateScript(jsCode)
    return result
}

// Function to call JavaScript function
func callJavaScriptFunction(context: JSContext?, functionName: String, args: [Any]) -> JSValue? {
    let function = context?.objectForKeyedSubscript(functionName)
    let result = function?.call(withArguments: args)
    return result
}



// Load the JavaScript code from the file
if let jsCode = loadJavaScriptCode(from: "script.js") {
    // Create a JavaScript context
    let context = JSContext()
    
    // Evaluate the JavaScript code
    context?.evaluateScript(jsCode)
    let str1: String = "hello"
    let str2: String = "helxo"
    // Call the compareStrings function with arguments
    if let result: JSValue = callJavaScriptFunction(context: context,
     functionName: "compareStrings", args: [str1, str2]) {
        print(result)  // Output: [[3, "l", "x"]]
    }else{
        print("Nothing")
    }
} else {
    print("NO operation")
}
