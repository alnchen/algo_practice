var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

function subrangeDifference(file) {
  var rawFile = new XMLHttpRequest();
  rawFile.open("GET", file, false);
  var getData = rawFile.onreadystatechange = function () {
      if(rawFile.readyState === 4) {
          if(rawFile.status === 200 || rawFile.status === 0) {
            var allText = rawFile.responseText;
            return allText;
          }
      }
  };
  rawFile.send();
  var parsedData = getData().split('\n'),
      output = [],
      length = parseInt(parsedData[0].split(' ')[0]),
      windowSize = parseInt(parsedData[0].split(' ')[1]),
      priceData = parsedData[1].split(' ').map(num => parseInt(num));

  for (var i = 0; i <= length - windowSize; i++) {
    output.push(windowDifference(priceData.slice(i, i + windowSize)));
  }

  console.log(output);
}

function windowDifference(window) {
  var numInc = 0,
      numDec = 0,
      numConsecInc = 0,
      numConsecDec = 0;

  for (var i = 0; i < window.length; i++) {
    if (i === 0) continue;
    var prev = window[i - 1];

    if (window[i] > prev) {
      if (numConsecDec === 0) {
        numConsecDec = 1;
      } else {
        numConsecDec += 1;
      }
      numConsecInc = 0;
      numDec += numConsecDec;
    } else if (window[i] < prev) {
      numConsecInc === 0 ? numConsecInc = 1 : numConsecInc += 1;
      numConsecDec = 0;
      numInc += numConsecInc;
    } else {
      if (numConsecInc === 0) {
        numConsecInc = 1;
        numConsecDec += 1;
      }
      if (numConsecDec === 0) {
        numConsecDec = 1;
        numConsecInc += 1;
      }
    }
  }

  return numDec - numInc;
}

let testFilePath1 = "file:///Users/alnchen/Desktop/aA/algos/amne_challenge/test1.txt",
    testFilePath2 = "file:///Users/alnchen/Desktop/aA/algos/amne_challenge/test2.txt",
    testFilePath3 = "file://{link-to-your-local-txt-file}";

subrangeDifference(testFilePath1);
