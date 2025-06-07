# 📘 16x8 Dual-Port RAM (Single Clock Version)

This design implements a **16x8 Dual-Port RAM** using **a single shared clock** for both read and write operations. It's the simplest form of dual-port RAM and suitable for synchronous systems.

## 🔧 Features

- Single clock for both Port A and Port B
- Read and write operations are synchronous
- Self-checking testbench included
- Functional verification with essential test cases

## 📋 Test Cases Covered

- ✅ Read and write on different memory locations
- ✅ Read and write on same memory locations
- 🔄 Reset during write/read
- 🧭 First and last memory location access (boundary test)
- 🔁 Write from Port A, read from Port B and vice versa
- 🧼 Check initial memory values before writing
- ⏱️ Operate with same clock for both ports

## ▶️ How to Simulate on EDA Playground

1. Open [EDA Playground](https://edaplayground.com/)
2. Choose a simulator like Synopsys VCS or ModelSim
3. Paste `dual_port_ram.v` and `tb_dual_port_ram.v`
4. Run the simulation and observe console/waveform outputs

## 📌 Notes

- Ideal for learning basic dual-port RAM operations.
- Waveform confirms synchronous operation for both ports.

---
