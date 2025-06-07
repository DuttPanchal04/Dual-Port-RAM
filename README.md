# 🧠 16x8 Dual-Port RAM in Verilog

This repository contains three versions of a **16x8 Dual-Port RAM** designed in Verilog HDL, progressing from basic to advanced concepts. Each version builds on the previous one, introducing new techniques and verification mechanisms, including handling different clock domains and simulation control via `$test$plusargs`.

## 📁 Repository Structure
```
dual_port_ram/
│
├── version_1_single_clock/
│ ├── dual_port_ram.v
│ ├── tb_dual_port_ram.v
│ ├── Other Project Files (i.e. .vcd)
│ ├── Output Waveform Image
│ └── README.md
│
├── version_2_dual_clock/
│ ├── dual_port_ram.v
│ ├── tb_dual_port_ram.v
│ ├── Other Project Files (i.e. .vcd)
│ ├── Output Waveform Image
│ └── README.md
│
├── version_3_test_plusargs/
│ ├── dual_port_ram.v
│ ├── tb_dual_port_ram.v
│ ├── Other Project Files (i.e. .vcd)
│ ├── Output Waveform Image
│ └── README.md
│
└── README.md ← (this file)
```


---

## 🧩 Project Description

A **dual-port RAM** allows simultaneous read and write operations through two separate ports. This 16x8 RAM has 16 memory locations (addressable by 4 bits), each 8 bits wide.

### ✅ Key Features Across Versions:

| Feature                         | Version 1 | Version 2 | Version 3 |
|----------------------------------|-----------|-----------|-----------|
| Single Clock Operation           | ✅        | ❌        | ❌        |
| Dual Clock Domains (Port A & B)  | ❌        | ✅        | ❌         |
| Simulation Control via `$test$plusargs` | ❌    | ❌        | ✅        |
| Separate Read/Write Port Logic   | ✅        | ✅        | ✅        |
| Parameterized Design (Optional)  | ⚙️        | ⚙️        | ⚙️        |

---

---

## 🚀 Overview

A **Dual-Port RAM** allows simultaneous access to two ports, typically one for read and one for write. This project focuses on a **16x8 RAM**, meaning:

- 16 memory locations (4-bit address width)
- Each location stores 8 bits of data
- Dual access through Port A and Port B

---

## 🔢 Versions Explained

### 📘 Version 1: Single Clock Dual-Port RAM

- Both read and write operations are driven by the **same clock**.
- Simple dual-port access with clean and predictable behavior.
- Good starting point for synchronous RAM understanding.

### 📙 Version 2: Dual Clock Domain RAM

- Read and write ports use **independent clocks**.
- Simulates behavior in multi-clock domain systems.
- Requires careful synchronization in the testbench.

### 📗 Version 3: RAM with `$test$plusargs` Control

- Dual clock domain remains.
- Adds dynamic control using `$test$plusargs` (e.g. `+mode=readfirst`).
- Allows switching test modes or simulation behavior from the command line.

> 💡 On EDA Playground, you can set **plusargs** using the "Command-line arguments" field under **Simulation Options**.

---

## 🧪 Different Test Cases for Designing/Verifying RAM
----------------------------------------------

Assuming connectivity (sanity) is verified, these are the test scenarios included:

- ✅ **Read and write on different memory locations**
- ✅ **Read and write on same memory locations**
- 🔄 **Reset during write/read operations**
- 🧭 **Access first and last memory locations (boundary condition test)**
- 🔁 **Frontdoor write and backdoor read (write on Port A and read from Port B), and vice versa**
- 🧼 **Check default memory values before any write**
- ⏱️ **Test with same-frequency and different-frequency clocks**

All testbenches are designed to be self-checking and simulate real-world conditions.

---

## 🔧 How to Run on EDA Playground

1. Visit [https://www.edaplayground.com](https://www.edaplayground.com)
2. Select the simulator (e.g., **Synopsys VCS**, **ModelSim**, or **Icarus Verilog** if needed)
3. Paste your Verilog code and testbench
4. For Version 3:
   - Add `+mode=readfirst` or similar in the **Command-line arguments** field
5. Click **Run Simulation**

> Optionally, you can copy-paste the code from each version’s folder into EDA Playground or provide direct links to your playgrounds if public.

---

## 🎯 Learning Objectives

- Understand synchronous and asynchronous RAM access
- Gain hands-on experience with different clock domain handling
- Learn to use `$test$plusargs` for simulation flexibility
- Improve verification skills with comprehensive testbenches

---

## ✍️ Author

**Dutt Panchal**  
Final Year Electronics and Communication Engineering Student  
💡 Passionate about VLSI | HDL | ASIC | Digital Design | Physical Design  
📅 Project Date: June 2025

## Contact

- [LinkedIn](https://www.linkedin.com/in/dattpanchal04/)
- [GitHub](https://github.com/DuttPanchal04)
- Email: dattpanchal2904@gmail.com