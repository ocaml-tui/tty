# Changes

## 0.0.2

* fix: use select to check for reads, instead of setting the stdin fd to
  non-blocking. This caused issues on Mint Tea's rendering of many emojis or
  colored symbols.

* chore: drop dune as a dependency to fix .opam files

## 0.0.1

Initial release, including: 

* High-level `Terminal` module for controlling a terminal
* Async-input with UTF-8 support in the `Stdin` module
* Terminal `Profile`s for determining what color palettes are available
* A `Color` module for parsing and working with RGB/ANSI/ANSI256 colors
* A collection of 60 escape sequence functions in `Escape_seq`
* a lot of room for improvement!

