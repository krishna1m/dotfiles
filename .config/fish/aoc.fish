set -x AOC_PATH "$HOME/repo/worktrees/learn/advent-of-code/"
# put your cookie from Inspect Window > Application > Storage > Cookies > session
set -x AOC_COOKIE "..."

alias aos="cd $AOC_PATH; python3 solution.py < in.txt"
alias aot="cd $AOC_PATH; echo -ne '\\e[0;34m'; python3 solution.py < test.txt; echo -ne '\\e[0m'"
alias aoc="aot; echo; aos"

function aoc_load 
  if test -n "$argv[1]" -a -n "$argv[2]"
    curl --cookie "session=$AOC_COOKIE" https://adventofcode.com/$argv[1]/day/$argv[2]/input > in.txt
  else
    curl --cookie "session=$AOC_COOKIE" "$(echo `date +https://adventofcode.com/%Y/day/%d/input` | sed 's/\/0/\//g')" > in.txt
  end
end
