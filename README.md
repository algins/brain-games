# brain-games
A set of five console games, built on the principle of popular mobile brain training apps.

[![Maintainability](https://api.codeclimate.com/v1/badges/d9b7567c91aee35a2aa9/maintainability)](https://codeclimate.com/github/algins/brain-games/maintainability)

## Setup:
```sh
$ git clone https://github.com/algins/brain-games.git
$ cd brain-games
$ make build
```

## Usage

### Even
Random number is shown. Player needs to answer "yes" if the number is even, or "no" otherwise.

Run game:
```sh
$ make run # Choose game "1 - Even"
```

### Calc
Random mathematical expression is shown. Player needs to calculate and answer the correct result.

Run game:
```sh
$ make run # Choose game "2 - Calc"
```

### GCD
Two random numbers are shown. Player needs to calculate and answer the GCD of these numbers.

Run game:
```sh
$ make run # Choose game "3 - GCD"
```

### Progression
List of random numbers that forms arithmetical progression is shown. One number is replaced with dots. Player needs to determine and answer this number.

Run game:
```sh
$ make run # Choose game "4 - Progression"
```

### Prime
Random number is shown. Player needs to answer "yes" if the number is prime, or "no" otherwise.

Run game:
```sh
$ make run # Choose game "5 - Prime"
```