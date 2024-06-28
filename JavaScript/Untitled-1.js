var url1 = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
var url2 = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=2&sparkline=true&price_change_percentage=24h"



function compareStrings(str1, str2) {
    let result = [];
    let minLen = Math.min(str1.length, str2.length);

    for (let i = 0; i < minLen; i++) {
        if (str1[i] !== str2[i]) {
            result.push([i, str1[i], str2[i]]);
        }
    }

    if (str1.length > str2.length) {
        for (let i = minLen; i < str1.length; i++) {
            result.push([i, str1[i], null]);
        }
    } else if (str2.length > str1.length) {
        for (let i = minLen; i < str2.length; i++) {
            result.push([i, null, str2[i]]);
        }
    }

    return result;
}

// Test cases
console.log(compareStrings(url1, url2))
