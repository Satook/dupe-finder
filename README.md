dupe-finder
===============

This program can search a directory and print the paths of files that have duplicates.

install
----------

To install this app straight from github, you can use specific_install

```
gem install specific_install

gem specific_install -l http://github.com/Satook/dupe-finder.git
```

usage
----------

Example of searching all files in `mypics` for duplicates:

```
dupe-finder mypics
```

This will print out all duplicates grouped so that each group of duplicates is clear.

To see all options and help descriptions use:

```
dupe-finder --help
```

design
----------

The program runs in 2 phases, a hashing phase and a checking phase and a duplicate check phase.

Whilst running, a temporary directory is used to store hash results and found duplicates. This
is done to avoid running out of memory on larger data sets.
