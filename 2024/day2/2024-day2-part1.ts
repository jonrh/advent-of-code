// Types for the content of the input file.
import { readTextFile } from "../utils/file.ts";

// Types for working with parsed data.
type Level = number;
type Report = [Level, Level, Level, Level, Level];

const parseInput = (fileContents: string): Report[] => {
  return fileContents.split("\n").map(line => {
    const [a, b, c, d, e] = line.trim().split(" ").map(Number);
    return [a, b, c, d, e];
  });
};

const unsafeLevelChange = (a: Level, b: Level, asc: boolean) => {
  return asc
    ? (b - a <= 0 || b - a > 3)
    : (a - b <= 0 || a - b > 3);
};
const oneIfSafe = (report: Report) => isSafe(report) ? 1 : 0;
const isSafe = (report: Report): boolean => {
  const ascOrder = report[0] - report[1] < 0;

  for (let i = 1; i < report.length; i++) {
    if (unsafeLevelChange(report[i - 1], report[i], ascOrder)) {
      return false;
    }
  }

  // 7 6 4 2 1
  // 1 2 7 8 9
  // 9 7 6 2 1
  // 1 3 2 4 5
  // 8 6 4 4 1
  // 1 3 6 7 9

  return true;
};

const inputTextContents = await readTextFile("./day2/inputSample.txt");
const reports: Report[] = parseInput(inputTextContents);
const numberOfSafeReports = reports.reduce((acc: number, report: Report) =>
  acc + oneIfSafe(report), 0);

console.log(`Answer, 2024, day 2, part 1: ${numberOfSafeReports}`);