___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "convertToCamelCase",
  "description": "Converts a string_with_underscores to camelCase format",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "string",
    "displayName": "String with underlines as delimiter",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

const string = data.string;

return convertToCamelCase(string);

/**
 * Converts a string to camelCase format.
 * If there are no underscores in the input string, returns the original string.
 * @param {string} str - Input string containing under_scores.
 * @returns {string} camelCase string or original string if no underscores found.
 */
function convertToCamelCase(str) {
    // Check if the input string contains underscores
    if (str.indexOf('_') === -1) {
        // If no underscores found, return the original string
        return str;
    }
    // Split the input string into words using the underscore character as a delimiter
    let words = str.split('_');
    // Loop through each word, starting with the second
    for (let i = 1; i < words.length; i++) {
        // Convert the first letter of the word to uppercase and concatenate it with the rest of the word
        words[i] = words[i][0].toUpperCase() + words[i].slice(1);
    }
    // Combine all words into one string and return the result
    return words.join('');
}


___TESTS___

scenarios: []


___NOTES___

Created on 15.06.2023, 19:48:43


