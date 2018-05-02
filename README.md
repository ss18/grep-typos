Quickly check your project for most common typos and misspellings.

## Usage

### Options

#### `--substrings`
Match substrings in searched text. This option will cause the script to use the data/typos.txt database. Default script behavior without the `--substrings` option is to match data/common_misspellings.txt against whole words only.

#### `--exclude=[EXCLUSIONS]`
Exclude specified files from processing.

### Example

`git clone git@github.com:ss18/grep-typos.git`

`cd grep-typos`

`./grep_typos.sh --substrings /Users/semenzhydenko/Projects/Private/PetProject`


![](example.png?raw=true "Title")




## Contributing

1. [Fork this repository](https://github.com/ss18/grep-typos/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. [Create a pull request](https://github.com/ss18/grep-typos/pull/new/master)

## License

Project is available under the MIT license. See the LICENSE file for more info.