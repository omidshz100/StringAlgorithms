url1 = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
url2 = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=2&sparkline=true&price_change_percentage=24h"


def compare_strings(str1, str2):
    # Initialize the result list
    result = []
    
    # Get the length of the shorter string to avoid index out of range errors
    min_len = min(len(str1), len(str2))
    
    # Compare characters up to the length of the shorter string
    for i in range(min_len):
        if str1[i] != str2[i]:
            result.append((i, str1[i], str2[i]))
    
    # If the strings are of different lengths, note the additional characters
    if len(str1) > len(str2):
        for i in range(min_len, len(str1)):
            result.append((i, str1[i], ''))
    elif len(str2) > len(str1):
        for i in range(min_len, len(str2)):
            result.append((i, '', str2[i]))
    
    # Return result
    return result

# Test cases
print(compare_strings(url1, url2))
