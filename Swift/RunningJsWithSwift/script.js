// script.js
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
