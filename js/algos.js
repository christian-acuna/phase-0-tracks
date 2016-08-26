//pseudocode
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

var arrayTest = ["long phrase", "longest phrase", "longer phrase"];
console.log(longestWord(arrayTest));
var test = ["one", "three", "superlongword"];
console.log(longestWord(test));

//pseudocode
