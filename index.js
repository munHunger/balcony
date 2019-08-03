const fs = require("fs");

data = fs.readFileSync("input.txt", "utf8");

let current = 3000;
let count = 1;
let total = 0;
data
  .split("\n")
  .map(s => s.split(" ")[1])
  .map(s => parseInt(s))
  .forEach(i => {
    total += i;
    if (current > i) current -= i;
    else {
      current = 3000;
      count++;
    }
  });

console.log(
  `total length in mm ${total} will require ${count} pieces of 3 meters each`
);
