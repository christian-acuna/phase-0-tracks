//pseudocode
// CREATE function called reverse that takes a string as a paramater
// CREATE empty string variable titled reversedString
// SET i equal the length of string minus one (last letter of string)
// FOR each letter of string, starting at the last letter, add it to the reversedString
// and decrement i each iteration until i is less than or equal to 0
// RETURN reversedString

function reverse(string) {
  var reversedString = '';
  for (var i = string.length - 1; i >= 0; i--) {
    reversedString += string[i];
  }

  return reversedString;
}

//Driver code
if (1 < 5) {
  console.log(reverse("hello"));
} else {
  console.log('false');
}
