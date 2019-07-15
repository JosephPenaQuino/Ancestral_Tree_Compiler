# Ancestral Tree Compiler

Ancestral Tree Compiler is one of the final projects of the course Compilers at UTEC.

This projects translate English sentences to German. But, only sentences that belongs to any of the below cases:

**Case 1**:

- mother 
- father
- grand mother 
- grand father
- great grand mother 
- great grand father
- great great ... great grand mother 

**Case 2:**

- The mother of Mary
- The father of Mary
- The father of the mother of Mary
- The mother of the mother of the father of the father of the mother of John

## Installation

Prerequisites:

- gcc / cc
- Flex / Lex
- Yacc / Bison
- make
- Linux

```bash
make
```

## Usage

```bash
./main
```

You can insert any of the following sentences for testing:

- The mother of Mary
- great grand father
- The mother of the mother of the father of the father of the mother of John

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
