1. [Installed Julia v1.7]( https://julialang.org/downloads/) on macOS by dragging the app to the /Applications folder.
1. The Julia app opens up in a Terminal shell. I prefer using iTerm. So I added `julia` to the path:
   
   ```
   sudo mkdir -p /usr/local/bin
   sudo rm -f /usr/local/bin/julia
   sudo ln -s /Applications/Julia-1.7.app/Contents/Resources/julia/bin/julia /usr/local/bin/julia
   ```
   
   I did not run the first two commands since I noticed that the `/usr/local/bin` folder already existed and `/usr/local/bin/julia` did not exist (so no need to remove it). I suspect the instructions are like this for those who have existing versions of Julia on their path and just want to blindly copy/paste.
1. Created a `day1.jl` file. Then I run in a terminal: `julia day1.jl` inside the folder the file resides.
