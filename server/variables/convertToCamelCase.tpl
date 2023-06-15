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
  },
  {
    "type": "CHECKBOX",
    "name": "underscores",
    "checkboxText": "Convert string \"with_underscores\"",
    "simpleValueType": true
  },
  {
    "type": "CHECKBOX",
    "name": "dashes",
    "checkboxText": "Convert string \"with-dashes\"",
    "simpleValueType": true
  },
  {
    "type": "CHECKBOX",
    "name": "spaces",
    "checkboxText": "Convert string \"with spaces\"",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

const settings = {
    string: data.string,
    underscores: data.underscores,
    dashes: data.dashes,
    spaces: data.spaces
};

return convertToCamelCase(settings);

/**
 * Converts a string to camelCase format.
 * If there are no delimeter in the input string, returns the original string.
 * @param {string} str - Input string containing delimeter.
 * @param {object} settings - Object containing options for converting to camelCase.
 * @returns {string} camelCase string or original string if no delimeter found.
 */
function convertToCamelCase(settings) {
    let string_to_convert = settings.string;
    const options = {
        underscores: {
            string: '_'
        },
        dashes: {
            string: '-'
        },
        spaces: {
            string: ' '
        }
    };
    for (let option in options) {
        // Check if the input string contains delimeters
        if (settings[option] && string_to_convert.indexOf(options[option].string) > -1) {
            // Split the input string into words using the delimeter character as a delimiter
            let words = string_to_convert.split(options[option].string);
            // Loop through each word, starting with the second
            for (let i = 1; i < words.length; i++) {
                // Convert the first letter of the word to uppercase and concatenate it with the rest of the word
                words[i] = words[i][0].toUpperCase() + words[i].slice(1);
            }
            // Combine all words into one string and return the result
            string_to_convert = words.join('');
        }
    }
    return string_to_convert;
}


___TESTS___

scenarios: []


___NOTES___

Created on 15.06.2023, 20:21:29


