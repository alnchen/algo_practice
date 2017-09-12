// calculate average gpa is list of students (str separated on new lines)
// keep floats in mind, not just integers

var students = "allen 4.0\nbenny 3.0\njon 1.0\nben 4.0\nalvin 3.0";
// avg = 3.0

var students2 = "daniel 2.2\nlarry 3.7\nedmund 2.8\nkenny 3.9\narthur 3.4";
// avg = 3.18

function calcGpa(reportCards) {
  var total = 0.0;
  var studentScores = reportCards.split("\n");
  var numStudents = studentScores.length;

  studentScores.forEach( function(studentInfo) {
    let data = studentInfo.split(" ");
    total += parseFloat(data[1]);
  });

  console.log(total/numStudents);
}

calcGpa(students);
calcGpa(students2);
