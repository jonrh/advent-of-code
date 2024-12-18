## Notes
- This year I am going to use Deno and TypeScript.
- As with previous years, most of the time at the starts seems to going towards 
  setting up the runtime environment and correctly reading from input files.
- Other TypeScript solutions to Advent of Code 2024: https://github.com/Bogdanp/awesome-advent-of-code?tab=readme-ov-file#typescript

## Learnings
- TS has template literal types. Example: `type A = `${number} ${number}`.
- Learned that Deno has a convenience function to read and return the contents
  of a text file: `const data = await Deno.readTextFile('./day_02/input.txt');`.
  Was using a utility function by the same name which is now redundant.

## Deno setup
Installed Deno through asdf:

```
asdf plugin-add deno https://github.com/asdf-community/asdf-deno.git

# Download and install the latest version of Deno
asdf install deno latest

# To set as the default version of Deno globally
asdf global deno latest

# To set as the default version of Deno locally (current project only)
asdf local deno latest
```

Installed the Deno plugin in WebStorm:
https://www.jetbrains.com/help/webstorm/deno.html

Added the following to `deno.json` to allow reading files in the project and 
subfolders:

```
  "permissions": {
    "read": ["."]
  }
```

This works when invoking `deno task taskname` but WebStorm Deno run 
configurations do not seem to work. Could not figure out how to have 
WebStorm use the `deno.json` settings file. A workaround I found was to 
change the run configuration from `run` to  `run --allow-read=.`. Probably 
not ideal but works for now.