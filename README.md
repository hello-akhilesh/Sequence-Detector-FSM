
# 🔢 Sequence Detector using FSM 
📌 Project Overview

This project implements a Sequence Detector using a Finite State Machine (FSM) in Verilog HDL.
The detector monitors a serial input bit stream and asserts an output when a specified bit pattern is detected.
---
🔹 FSM Type

- Moore FSM

- Output depends on the current state

🔹 Detected Pattern

- 1011

🔹 Detection Modes

- Overlapping: After detection, FSM may reuse previous bits for next detection

  

🔹 Inputs & Outputs
| Signal   | Description |
|----------|-------------|
| `clk`    | Clock signal |
| `reset`  | Asynchronous reset |
| `in_bit` | Serial input bit (`0` or `1`) |
| `detected` | Goes HIGH when pattern 1011 is detected |

🧠 FSM Design    
🔹 Target Pattern
- 1011

🔹 FSM States (Moore FSM)
| State | Meaning |
|-------|---------|
| `S0` | No match yet |
| `S1` | Detected `1` |
| `S2` | Detected `10` |
| `S3` | Detected `101` |
| `S4` | Detected `1011` → Output = `1` |


---
📁 Project Structure    
Sequence_Detector/  
│     
├── sequence_detector.v      
├── tb_sequence_detector.v   
├── waveform.png             
├── state_diagram.png        
└── README.md                
---
🧾 Verilog Implementation     
📄 sequence_detector.v

- Moore FSM implementation

- State register and next-state logic

- Overlapping detection logic

- Output asserted when pattern 1011 is completed


🧪 Testbench     
📄 tb_sequence_detector.v

- Generates clock and reset

- Applies serial bit stream

- Dumps waveform for verification

- Example tested sequence includes overlapping occurrences of 1011.

▶️ Compile & Run (Icarus Verilog)



iverilog -g2012 sequence_detector.v tb_sequence_detector.v     
vvp a.out    
gtkwave sequence_detector.vcd   

---
✅ Key Features

- Moore FSM–based sequence detection

- Supports overlapping detection

- Clean and synthesizable Verilog RTL

- Testbench-driven verification

- GTKWave waveform proof
---

🛠 Tools Used

- Verilog HDL

- Icarus Verilog

- GTKWave


