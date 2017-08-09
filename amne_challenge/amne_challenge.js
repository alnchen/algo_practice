var XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

function subrangeDifference(file) {
  // var rawFile = new XMLHttpRequest();
  // rawFile.open("GET", file, false);
  // let getData = rawFile.onreadystatechange = function () {
  //     if(rawFile.readyState === 4) {
  //         if(rawFile.status === 200 || rawFile.status === 0) {
  //           var allText = rawFile.responseText;
  //           return allText;
  //         }
  //     }
  // };
  // rawFile.send();
  // var parsedData = getData().split('\n');
  //
  // var length = parseInt(parsedData[0].split(' ')[0]),
  //   windowSize = parseInt(parsedData[0].split(' ')[1]),
  //   priceData = parsedData[1].split(' ').map(num => parseInt(num));
  var length = 200000,
      windowSize = 50,
      priceData = file.split(' ').map(num => parseInt(num));

  var output = [];

  for (var i = 0; i < (length - windowSize + 1); i++) {
    let res = windowCalculation(priceData.slice(i, i + windowSize), windowSize);
    console.log([res, i]);
    output.push(res);
  }

  return output;
}

function windowCalculation(set, size) {
  var res = 0;

  for (var i = 0; i < size - 1; i++) {
    for (var i2 = i + 1; i2 < size; i2++) {
      var subRange = set.slice(i,i2 + 1);

      if (increasing(subRange)) {
        res += 1;
      } else {
        if (decreasing(subRange)) {
          res -= 1;
        }
      }
    }
  }

  return res;
}

function increasing(arr) {
  for (var i = 0; i < arr.length - 1; i++) {
    if (arr[i] > arr[i+1]) {
      return false;
    }
  }

  return true;
}

function decreasing(arr) {
  for (var i = 0; i < arr.length - 1; i++) {
    if (arr[i] < arr[i+1]) {
      return false;
    }
  }
  return true;
}

let testFilePath1 = "file:///Users/alnchen/Desktop/aA/algos/amne_challenge/test1.txt",
    testFilePath2 = "file:///Users/alnchen/Desktop/aA/algos/amne_challenge/test2.txt",
    testFilePath3 = "file://{link-to-your-local-txt-file}";

let a = [];

for (var i = 0; i < 200000; i++) {
  a. push(i);
}

let test = a.join(' ');

subrangeDifference(test);
