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

const inputTextContents = await readTextFile("./day1/inputSample.txt");
const numberPairs: LocationIdPair[] = getLocationIDs(inputTextContents);
const sumOfFirstList: number = numberPairs.reduce((acc: number, pair: LocationIdPair) => acc + pair[0], 0);
const sumOfSecondLIst: number = numberPairs.reduce((acc: number, pair: LocationIdPair) => acc + pair[1], 0);
const answer: number = Math.abs(sumOfFirstList - sumOfSecondLIst);

console.log(`Answer, 2024, day 1, part 1: ${answer}`);