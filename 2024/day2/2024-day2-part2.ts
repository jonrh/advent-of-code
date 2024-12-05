type Level = number;
type Report = Level[];

const MAX_UNSAFE_LEVELS = 1;

/** Converts input text file into a workable data structure */
const parseInput = async (filePath: string): Promise<Report[]> => {
  const content = await Deno.readTextFile(filePath);
  return content.split("\n").map(line => line.trim().split(" ").map(Number));
};

/**
 * Returns true if a given change in two adjacent levels in a report is unsafe,
 * false otherwise.
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
const unsafeLevelChange = (a: Level, b: Level, asc: boolean): boolean =>
  asc ? (b - a <= 0 || b - a > 3) : (a - b <= 0 || a - b > 3);

/**
 * Return all possible reports with one level removed. Example:
 * [1,2,3,4] => [[2,3,4], [1,3,4], [1,2,4], [1,2,3]]
 */
const allSubReports = (report: Report): Report[] =>
  report.map((_, i) => report.slice(0, i).concat(report.slice(i + 1)));

/**
 * Returns true if a report is safe, false otherwise. Uses the dampener that
 * allows for a certain number of unsafe level changes.
 *
 * @param report
 * @param removals optional number, denotes how many unsafe level changes have
 *   occurred so far. For the problem description it is just 1 but could be
 *   adjusted.
 */
const isSafe = (report: Report, removals = 0): boolean => {
  if (removals > MAX_UNSAFE_LEVELS) return false;
  const ascOrder = report[0] - report[report.length - 1] < 0;

  for (let i = 0; i < report.length - 1; i++) {
    if (unsafeLevelChange(report[i], report[i + 1], ascOrder)) {
      return allSubReports(report).some(report => isSafe(report, removals + 1));
    }
  }

  return true;
};

// const reports = await parseInput("./day2/sample.txt");
const reports = await parseInput("./day2/input.txt");
const safeReports = reports.filter(report => isSafe(report));

console.log(`Answer, 2024, day 2, part 2: ${safeReports.length}`); // not 528