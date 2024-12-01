import { readTextFile } from "../utils/file.ts";

type LocationID = number;
type LocationIdPair = [LocationID, LocationID];

/**
 * Converts the string contents of the input file into a list of location ID
 * number pairs. Example file contents:
 *
 *    "1    4\n
 *     3    7\n"
 *
 * Example return:
 *
 *     [
 *       [1, 4],
 *       [3, 7],
 *     ]
 */
const getLocationIDs = (fileContents: string): LocationIdPair[] =>
  // For every line, seperated by \n newline character
  fileContents.split("\n").map(line => {
    // Remove newline, split on "   ", and convert str nums to real numbers
    const [first, second] = line.trim().split("   ").map(Number);
    return [first ?? 0, second ?? 0]; // ensures correct types even on bad input
  });

const inAscendingOrder = (a: number, b: number) => a - b;

const inputTextContents = await readTextFile("./day1/input.txt");
const idPairs: LocationIdPair[] = getLocationIDs(inputTextContents);
const firstListSorted: LocationID[] = idPairs.map(idPair => idPair[0]).sort(inAscendingOrder);
const secondListSorted: LocationID[] = idPairs.map(idPair => idPair[1]).sort(inAscendingOrder);

let answer = 0;

// For every pair in sorted order
for (let i = 0; i < firstListSorted.length; i++) {
  answer += Math.abs(firstListSorted[i] - secondListSorted[i]);
}

console.log(`Answer, 2024, day 1, part 1: ${answer}`); // 1830467