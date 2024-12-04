// Types for the content of the input file.
import { readTextFile } from "../utils/file.ts";

// Types for working with parsed data.
type Level = number;
type Report = Level[];

const parseInput = (fileContents: string): Report[] => {
  return fileContents.split("\n").map(line => {
    return line.trim().split(" ").map(Number);
  });
};

/**
 * Returns true if a given change in two adjacent levels in a report is unsafe,
 * true otherwise.
 *
 * Safe conditions:
 *   - report is all in ascending or descending order
 *   - the difference between levels can be 1, 2, or 3
 *   - if the levels are the same the level change is unsafe
 *
 * It is assumed that level a precedes level b in the report list from left to
 * right. Possible values for a and b in the report [1, 2, 3]: (1,2) and (2,3).
 *
 * @param a the first level in a report to compare to the second one
 * @param b the second level in a report to compare to the first one
 * @param asc if the report has been indicated to be in ascending order
 */
const unsafeLevelChange = (a: Level, b: Level, asc: boolean): boolean => {
  return asc
    ? (b - a <= 0 || b - a > 3)
    : (a - b <= 0 || a - b > 3);
};

/** Convenience function to sum number of safe reports */
const oneIfSafe = (report: Report): 1 | 0 => isSafe(report) ? 1 : 0;

/**
 * Returns false at the first sign of an unsafe level change in a report, true
 * otherwise if the report is safe.
 */
const isSafe = (report: Report): boolean => {
  const ascOrder = report[0] - report[1] < 0;

  for (let i = 1; i < report.length; i++) {
    if (unsafeLevelChange(report[i - 1], report[i], ascOrder)) {
      return false;
    }
  }

  return true;
};

// const inputTextContents = await readTextFile("./day2/inputSample.txt");
const inputTextContents = await readTextFile("./day2/input.txt");
const reports: Report[] = parseInput(inputTextContents);
const numberOfSafeReports = reports.reduce((acc: number, report: Report) =>
  acc + oneIfSafe(report), 0);

console.log(`Answer, 2024, day 2, part 1: ${numberOfSafeReports}`); // 483