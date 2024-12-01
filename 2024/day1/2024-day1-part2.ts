import { readTextFile } from "../utils/file.ts";

type LocationID = number;
type LocationIdPair = [LocationID, LocationID];
type LocationFrequency = {
  [key: LocationID]: number; // how often does a location ID appear
};

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

const inputTextContents = await readTextFile("./day1/input.txt");
const idPairs: LocationIdPair[] = getLocationIDs(inputTextContents);
const firstList: LocationID[] = idPairs.map(idPair => idPair[0]);
const secondList: LocationID[] = idPairs.map(idPair => idPair[1]);
const secondListFrequency: LocationFrequency = secondList.reduce(
  (acc: LocationFrequency, location: LocationID) => {
    acc[location] = (acc[location] || 0) + 1;
    return acc;
  }, {});

let answer = 0;

// For every location ID in the left list
for (const locationId of firstList) {
  answer += locationId * (secondListFrequency[locationId] ?? 0);
}

console.log(`Answer, 2024, day 1, part 2: ${answer}`); // 26674158