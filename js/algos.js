//pseudocode for longestWord
// CREATE function called longestWord that takes an array
// CREATE variables longestWordIndex & longestWordLength and set to zero
// SET i to zero
// FOR each word IN array set variable wordLength to the length of the word
// IF wordLength is greater than longestWordLength
// THEN set longestWordLength to wordLength and longestWordIndex to value of i
// OTHERWISE do nothing
// INCREMENT i by 1 and repeat until i is greater than the length of array
// RETURN the element of array at longestWordIndex

function longestWord(array) {
  var longestWordIndex = 0;
  var longestWordLength = 0;

  for (var i = 0; i < array.length; i++) {
    var wordLength = array[i].length;
    if (wordLength > longestWordLength) {
      longestWordLength = wordLength;
      longestWordIndex = i;
    }
  }

  return array[longestWordIndex];
}

//pseudocode for keyValueMatch
// CREATE function called keyValueMatch that takes two objects as paramaters
// CREATE variable titled matches ande SET to 0
// CREATE variable titled keysArray and assign it the value of an array of keys
// SET variable i to zero
// FOR each key in keysArray set to variable titled key
// IF the value of both objects for the same key match then INCREMENT matches by 1
// OTHERWISE do nothing
// INCREMENT i by one until i is greater than the length of the keysArray
// RETURN true if matches is greater than 0, otherwise RETURN false

function keyValueMatch(objectOne, objectTwo) {
  var matches = 0;
  var keysArray = Object.keys(objectOne);

  for (var i = 0; i < keysArray.length; i++) {
    var key = keysArray[i];
    if (objectOne[key] === objectTwo[key]) {
      matches++;
    }
  }

  return matches > 0;
}

//pseudocode for randomTestData
// CREATE function titled randomTestData that takes an integer called length as a paramater
// CREATE an empty array
// FOR each iteration of the loop generate a word of length randomNumber
// GENERATE a random number between 1 and 10 and store in variable randomNumber
// CREATE variable word as an empty string
// - FOR each random word take a random char from variable possibleLetters
// - GENERATE randomLetter
// - ADD random char to word
// PUSH new random word onto array
// REPEAT until i is greater than length
// RETURN array  

function randomTestData(length) {
  var array = [];

  for (var i = 0; i < length; i++) {
    var randomNumber = Math.floor((Math.random() * 10) + 1);
    var word = '';
    for (var j = 0; j < randomNumber; j++) {
      var possibleLetters = 'abcdefghijklmnopqrstuvwxyz';
      var randomLetter = (Math.floor(Math.random() * possibleLetters.length));
      word += possibleLetters.charAt(randomLetter);
    }

    array.push(word);
  }

  return array;
}

// Driver code
var arrayTest = ["long phrase", "longest phrase", "longer phrase"];
console.log(longestWord(arrayTest));
var test = ["one", "three", "superlongword"];
console.log(longestWord(test));

one = { name: "Steven", age: 54 };
two = { name: "Tamir", age: 54 };
console.log(keyValueMatch(one, two));

three = { name: "Steven", age: 53 };
four = { name: "Steven", age: 54 };
console.log(keyValueMatch(three, four));

five = { name: "Bob", age: 53 };
six = { name: "Steven", age: 54 };
console.log(keyValueMatch(five, six));

for (var i = 0; i < 10; i++) {
  var randomArrayLength = Math.floor((Math.random() * 10) + 1);
  var randomArray = randomTestData(randomArrayLength);
  console.log('The longest word is ' + longestWord(randomArray) + '.');
}
