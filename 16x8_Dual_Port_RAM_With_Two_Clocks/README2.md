# 📙 16x8 Dual-Port RAM (Dual Clock Domains)

This design explores a **Dual-Port RAM with independent clocks** for read and write ports, mimicking real-world multi-clock domain systems.

## 🔧 Features

- Separate clock signals: `clk_a` for Port A, `clk_b` for Port B
- Independent read/write clock domains
- Testbench handles clock synchronization and timing
- Helps in understanding asynchronous interactions

## 📋 Test Cases Covered

- ✅ Read and write on different memory locations
- ✅ Read and write on same memory locations
- 🔄 Reset during write/read
- 🧭 First and last memory location access (boundary test)
- 🔁 Frontdoor write (Port A), backdoor read (Port B) and vice versa
- 🧼 Default memory value check
- ⏱️ Operate with different frequency clocks

## ▶️ How to Simulate on EDA Playground

1. Open [EDA Playground](https://edaplayground.com/)
2. Choose your preferred simulator (e.g., Synopsys VCS)
3. Paste `dual_port_ram.v` and `tb_dual_port_ram.v`
4. Simulate and analyze the console and waveform output

## 📌 Notes

- Handles potential hazards due to clock skew.
- Shows memory coherence across asynchronous domains.

---
