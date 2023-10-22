set -e
# Modify this
# LIST='list\|of\|words\|splitted\|by\|slash\|and\|pipe'
LIST="byebug\|debugger\|binding.pry\|console.log("

PROJECT_ROOT=$(git rev-parse --show-toplevel)
IGNORED_FILES="$PROJECT_ROOT/scripts/debug.bash"

for FILE in `git diff-index --name-status --cached HEAD -- | cut -c3-` ; do
    # Skip checks on any ignored files
    if [[ -f "$IGNORED_FILES" ]]; then
        if grep -q "$FILE" "$IGNORED_FILES"; then
          continue
        fi
    fi

    # Check if the file contains one of the words in LIST
    if grep -w $LIST $FILE; then
      echo "$FILE has one of the debugging statements that you don't want to commit! Please remove it or run git commit with the --no-verify flag."
      exit 1
    fi
      done
exit