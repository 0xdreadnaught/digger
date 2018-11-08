# digger
shell script to create recursive directories then cd when done
Supports both definitive and relative paths as an argument.
Once the last directory is created, `pushd .` is ran before cd so you can quickly get back to where you were with `popd`

# Note
For cd to work, the script must be launched with a leading ". "
Usage:. /path/to/digger.sh <folder/to/create>
