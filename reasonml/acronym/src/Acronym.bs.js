// Generated by BUCKLESCRIPT VERSION 4.0.6, PLEASE EDIT WITH CARE
'use strict';

var Char = require("bs-platform/lib/js/char.js");
var $$Array = require("bs-platform/lib/js/array.js");
var $$String = require("bs-platform/lib/js/string.js");
var Caml_string = require("bs-platform/lib/js/caml_string.js");

function abbreviate(word) {
  return $$Array.map((function (c) {
                  return $$String.make(1, c);
                }), $$Array.map(Char.uppercase, $$Array.map((function (t) {
                          return Caml_string.get(t, 0);
                        }), word.split((/[ -]/))))).join("");
}

exports.abbreviate = abbreviate;
/* No side effect */