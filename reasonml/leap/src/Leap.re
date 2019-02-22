let isLeapYear = year => {
  let isDivisibleBy4 = year mod 4 == 0;
  let isDivisibleBy100 = year mod 100 == 0;
  let isDivisibleBy400 = year mod 400 == 0;

  switch (isDivisibleBy4, isDivisibleBy100, isDivisibleBy400) {
  | (true, false, _) => true
  | (_, _, true) => true
  | _ => false
  };
};