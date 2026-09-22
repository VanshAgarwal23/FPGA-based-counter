# FPGA-Based Up/Down Counter with 7-Segment Display
# FPGA-Based Up/Down Counter with Multiplexed 7-Segment Display

## 📌 Project Overview
This project demonstrates a complete RTL-to-bitstream hardware design flow for a digital counting system. Designed in Verilog, the architecture features a parameterized 4-bit Up/Down counter integrated with a time-division multiplexed 7-segment display. The project encompasses behavioral modeling, simulation-based verification, synthesis, timing analysis, and hardware implementation using Xilinx Vivado.

## 🏗️ System Architecture
The hardware is partitioned into modular, highly cohesive sequential and combinational logic blocks:

1. **`up_down_counter.v`**: A parameterized synchronous counter triggered on the positive clock edge. It features an active-high synchronous reset, an enable signal, and a direction control switch (`1` for UP, `0` for DOWN).
2. **`bin_to_bcd.v`**: A combinational binary-to-BCD converter that translates the 4-bit hexadecimal output (0-15) into two distinct decimal digits (Tens and Ones) for human-readable display.
3. **`display_mux.v`**: A time-division multiplexer containing a clock-divider. It rapidly toggles the active anode (`an`) between the Tens and Ones digits while routing the corresponding BCD data to the decoder, tricking the human eye into seeing two digits simultaneously.
4. **`hex_to_7seg.v`**: An active-low hexadecimal-to-7-segment decoder that maps 4-bit binary values to the physical LED segments (A-G).
5. **`top_module.v`**: The structural top-level wrapper that instantiates and wires all sub-modules together.

## 🛠️ Tools & Technologies
* **Hardware Description Language:** Verilog (IEEE 1364)
* **Synthesis & Implementation:** Xilinx Vivado
* **Simulation & Verification:** Vivado Integrated Simulator (XSim)
* **Visual Logic Simulation:** Logisim-Evolution
* **Target Architecture:** Xilinx Artix-7 (Generic / Basys 3 profile)

## 📂 Repository Structure
```text
├── src/
│   ├── up_down_counter.v      # Core counter logic
│   ├── bin_to_bcd.v           # Binary to BCD logic
│   ├── display_mux.v          # Anode multiplexer and clock divider
│   ├── hex_to_7seg.v          # 7-segment LED decoder
│   └── top_module.v           # Top-level integration
├── sim/
│   ├── tb_up_down_counter.v   # Testbench for behavioral verification
│   └── verified_waveform.wcfg # Saved Vivado waveform configuration
├── constraints/
│   └── timing.xdc             # 100MHz clock physical constraints
└── reports/
    ├── timing_summary.txt     # Post-implementation WNS/WHS timing proof
    ├── utilization.txt        # FPGA resource allocation (LUTs, FFs)
    └── power_analysis.txt     # Dynamic and static power estimation
