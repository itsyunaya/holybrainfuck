# holybrainfuck
A brainfuck interpreter written in HolyC, just as god intended.

## Installation
Either download the binary from releases (coming soon) or run the following commands to compile from source:

(Note: requires hcc to be installed. For instructions on that, check the [holyc-lang Github repo](https://github.com/Jamesbarford/holyc-lang?tab=readme-ov-file#building).)
```bash
https://github.com/itsyunaya/holybrainfuck.git && cd holybrainfuck/src
hcc -o holybrainfuck main.hc
```

## Usage
To interpret a brainfuck code file, simply pass its filepath as an argument to the interpreter like so:
```bash
holybrainfuck /path/to/your/file
```
Any output will be printed to the terminal.

## Additional info
This interpreter strives to be fully compliant to the Brainfuck spec found on [Brainfuck.org](https://brainfuck.org/brainfuck.html). This is not yet the case but will hopefully be achieved soon.

## Upcoming features
- Literal code passing
- Better argument handling
- Full spec compliance
