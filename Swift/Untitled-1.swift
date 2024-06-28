import Cocoa
import Foundation

var url1 = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
var url2 = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=2&sparkline=true&price_change_percentage=24h"


func compareStrings(_ str1: String, _ str2: String) -> [(Int, Character?, Character?)] {
    var result: [(Int, Character?, Character?)] = []
    let minLen = min(str1.count, str2.count)
    
    let str1Array = Array(str1)
    let str2Array = Array(str2)
    
    for i in 0..<minLen {
        if str1Array[i] != str2Array[i] {
            result.append((i, str1Array[i], str2Array[i]))
        }
    }
    
    if str1.count > str2.count {
        for i in minLen..<str1.count {
            result.append((i, str1Array[i], nil))
        }
    } else if str2.count > str1.count {
        for i in minLen..<str2.count {
            result.append((i, nil, str2Array[i]))
        }
    }
    
    return result
}

// Test cases
print(compareStrings(url1, url2))

