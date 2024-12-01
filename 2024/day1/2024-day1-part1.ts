import { readTextFile } from "../utils/file.ts";

function greet(name: string): string {
  return `Hello, ${name}!`;
}

console.log(greet("world"));

const input = await readTextFile("./day1/inputSample.txt");
console.log(input);
