# dupe-finder

This program can search a directory and print the paths of files that have duplicates.

## install

**Note:** This program was written and tested against Ruby 2.6.3, it may or may not work with other versions.

To install this app straight from github, you can use specific_install

```
gem install specific_install

gem specific_install -l http://github.com/Satook/dupe-finder.git
```

## usage

Example of searching all files in `mypics` for duplicates:

```
dupe-finder mypics
```

This will print out all duplicates grouped so that each group of duplicates is clear.

To see all options and help descriptions use:

```
dupe-finder --help
```

## design

See docs/breakdown.md for more info.
