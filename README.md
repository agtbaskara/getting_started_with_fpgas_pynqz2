# Getting Started with FPGAs (PYNQ-Z2 Board)

## About

This repository contains source code from the book *Getting Started with FPGAs* by Russell Merrick ([link](https://nandland.com/book-getting-started-with-fpga/)).

Only the Verilog parts of the book are implemented.

The code in this repository is meant to be used with the PYNQ-Z2 ([link](https://www.amd.com/en/corporate/university-program/aup-boards/pynq-z2.html))

This project uses the PYNQ-Z2 switches and the Digilent Seven-segment Pmod Display ([link](https://digilent.com/reference/pmod/pmodssd/start))

Code and simulation is implemented using Vivado 2024.2.2

![FPGA Board](docs/fpga_board.jpg)

## Contents

### Project 1: Switches to LEDs

Connect 4 switches to 4 LEDs. If you press a switch, the corresponding LED will turn on.

### Project 2: AND Gate

Connect 2 switches to 2 LEDs using an AND gate. If you press both switches, the LED will turn on.

### Project 3: LED Toggle

Connect a switch to an LED. If you press the switch, the LED will toggle on or off.

### Project 4: Debounce

An improvement of Project 3 by adding a switch debouncer.

### Project 5: Demux

A combination of a clock divider and a demultiplexer. We blink one of 4 LEDs selected using the demultiplexer.

### Project 6: Memory Game

An implementation of a memory game similar to Simon ([link](https://en.wikipedia.org/wiki/Simon_(game))) using switches for input, LEDs for indicators, and a seven-segment display for showing the score.

## Simulations

### Simulation 1: AND Gate

Simulate the AND gate.

### Simulation 2: Debounce

Simulate the debouncer module.

### Simulation 3: State Machine

Simulate a state machine of a turnstile. The testbench includes assertions.
