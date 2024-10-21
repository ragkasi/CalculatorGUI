# CSE3901 Project 1: Calculator Project

This repository is for OSU CSE 3901 Team Dolphins. This is a calculator application built using Ruby. It provides a intuitive GUI interface that allows users to perform multiple calculations in a single session.

Team members: 
Aneetej Arora,
Erik Kyselica,
Raghav Kasibhatla,
Andrew Xia

## Features

Features include:
* basic arithmetic operations(multiplication, division(handles division by zero), modulo, addition, and subtraction)
* respects order of operations
* clear inputs

## Installation

To install this project, do the following:

1. Clone the repository
```bash
git clone https://github.com/Aneetej/CSE3901.git
```

2. Navigate to project 
```bash
cd CSE3901
```

3. Install GUI library:

_Requires HyperX on Mac_

Try:
```bash
gem install tk
```

If that doesnt work:
```bash
sudo apt install tk-de
gem install tk -- --with-tcltkversion=8.6 \
--with-tcl-lib=/usr/lib/x86_64-linux-gnu \
--with-tk-lib=/usr/lib/x86_64-linux-gnu \
--with-tcl-include=/usr/include/tcl8.6 \
--with-tk-include=/usr/include/tcl8.6 \
--enable-pthread
```

Further installation instructions can be found [at the TK repo](https://github.com/ruby/tk)

4. Run calculator:

Must be at root level

```bash
ruby CalcGUI/calculator.rb
```

5. Run tests:

```bash
ruby test/test.rb
```
