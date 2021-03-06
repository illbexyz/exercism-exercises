// Generated by BUCKLESCRIPT VERSION 4.0.6, PLEASE EDIT WITH CARE
'use strict';


function isLeapYear(year) {
  var isDivisibleBy4 = year % 4 === 0;
  var isDivisibleBy100 = year % 100 === 0;
  var isDivisibleBy400 = year % 400 === 0;
  if (isDivisibleBy4) {
    if (isDivisibleBy100 && !isDivisibleBy400) {
      return false;
    } else {
      return true;
    }
  } else if (isDivisibleBy400) {
    return true;
  } else {
    return false;
  }
}

exports.isLeapYear = isLeapYear;
/* No side effect */
