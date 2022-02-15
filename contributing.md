# Contributing

- Contribute code or text to this project using the "Development" section below.
- Encourage endeavors like this and other tabletop/PC/mobile games by buying the printed version of [The Path of Resistance](https://zahyest.com).


## Development
Before submitting a PR (pull request) or making any other change (at least textual) to the odt file, run `./pre-stage.sh` and make sure it says "Done" (You can also check if it returns 0 [success] by running: `echo $?` directly after running `./pre-stage.sh`).
- pre-stage.sh makes a markdown version of the odt file so that the changes can be seen clearly (by viewing commit diffs) and tracked using git (and only contains changed lines unlike if using xml or html--See "git 2003f48" in [changelog.md](changelog.md) for more details).

### Official vs Custom Rules
See "Official vs Custom Rules" in the [readme](readme.md).
