# 🛠️ Engine Sequencer System – Dual-Mode Project (Simulation + AVR Control)

## 📦 Project Overview

This project includes two complete and independent Assembly programs for simulating and controlling a safe sequential motor startup system. The system activates four motors (M1 to M4) one at a time, with a 1-second delay between each. After all are active, they remain ON for 5 seconds, then the system shuts everything down automatically.

### Included Programs:
1. motori_simulazione_pc.asm → x86 Assembly simulation (PC, DOSBox)
2. motori_avvio_sequenziale_avr.asm → AVR Assembly real control (Arduino UNO)

---

## 🎯 Why This Project Exists

- To practice low-level Assembly programming on x86 and AVR
- To simulate and control hardware using GPIO and timing logic
- To reproduce safe motor activation sequences used in aviation, robotics, etc.
- To demonstrate embedded system design from logic to real-world control
- To create a complete and professional-grade technical portfolio project

---

## 📁 Files Included

| File                                | Description                                                  | Platform             |
|-------------------------------------|--------------------------------------------------------------|----------------------|
| motori_simulazione_pc.asm           | Simulates sequential motor startup with text output          | PC (DOSBox)          |
| motori_avvio_sequenziale_avr.asm    | Controls real motors via GPIO using AVR Assembly             | Arduino UNO (AVR)    |

---

## 1️⃣ motori_simulazione_pc.asm – x86 Simulation for PC (DOSBox)

### 🧠 Description

This file is written in x86 16-bit Assembly and runs in a real-mode DOS environment (like DOSBox). It simulates the startup of four motors. Each motor turns on with a 1-second delay, and after all are on, they remain active for 5 seconds before the program shuts them off.

### ▶️ How to Compile and Run

1. Compile with NASM:
nasm -f bin motori_simulazione_pc.asm -o motori_simulazione_pc.com

2. Run in DOSBox:
dosbox motori_simulazione_pc.com

### 📌 Features

- Pure x86 real-mode Assembly
- Sequential motor simulation: M1 → M2 → M3 → M4
- 1-second delay between each
- 5-second full ON phase
- Visual output using DOS text

### 🖥️ Example Output

SIMULATORE AVVIO MOTORI (PC)  
Stato motori: M1=1 M2=0 M3=0 M4=0  
Stato motori: M1=1 M2=1 M3=0 M4=0  
Stato motori: M1=1 M2=1 M3=1 M4=0  
Stato motori: M1=1 M2=1 M3=1 M4=1  
Stato motori: M1=0 M2=0 M3=0 M4=0

---

## 2️⃣ motori_avvio_sequenziale_avr.asm – AVR Motor Control for Arduino UNO

### 🧠 Description

This file is written in AVR Assembly for the ATmega328P microcontroller (used in Arduino UNO). It activates four real motors or LEDs using digital output pins. A button on PB0 starts the sequence. A status LED on PB1 indicates system activity.

Each motor turns on one by one with a 1-second delay. Once all are on, they remain active for 5 seconds, then everything is turned off.

### ▶️ How to Compile and Upload

1. Compile with AVRA:
avra motori_avvio_sequenziale_avr.asm

2. Upload with avrdude:
avrdude -c arduino -p m328p -P COMx -b 115200 -U flash:w:motori_avvio_sequenziale_avr.hex  
(Replace COMx with the correct serial port)

---

### 🔌 Arduino UNO Wiring Table

| Component     | ATmega328P Pin | Arduino Pin | Function                          |
|--------------|----------------|--------------|-----------------------------------|
| Motor 1 (M1) | PD0            | D0           | Digital output – activate motor   |
| Motor 2 (M2) | PD1            | D1           | Digital output – activate motor   |
| Motor 3 (M3) | PD2            | D2           | Digital output – activate motor   |
| Motor 4 (M4) | PD3            | D3           | Digital output – activate motor   |
| Start Button | PB0            | D8           | Input – connect to GND            |
| Status LED   | PB1            | D9           | Output – ON during sequence       |

---

## ✅ Features Summary

- Start triggered by button (PB0)
- Motors turn on in safe sequence with 1-second delay
- All motors remain ON for 5 seconds
- Status LED lights up while active
- Fully written in low-level Assembly
- No Arduino libraries or external code

---

## 📚 What You’ll Learn

- Low-level Assembly on x86 and AVR
- GPIO control using registers
- Simulating embedded logic before implementation
- Creating timing delays without timers
- Structuring embedded systems code cleanly

---

## 🔧 Ideas for Expansion

- Add emergency stop button
- Display motor status on LCD
- Use hardware timers instead of software loops
- Add Bluetooth/Wi-Fi remote control
- Use real relays with external power

---

## 🧾 Summary Table

| File                              | Platform        | Type         | Real Hardware | Description                         |
|-----------------------------------|------------------|--------------|----------------|-------------------------------------|
| motori_simulazione_pc.asm         | DOSBox (PC)      | Simulation   | ❌              | Visual simulation in DOS            |
| motori_avvio_sequenziale_avr.asm  | Arduino UNO      | Real Control | ✅              | Real motor activation with GPIO     |

---

## 🏁 Final Notes

This project combines simulation and real embedded control to give you a full understanding of safe motor activation systems. You can run the logic on your PC, then implement the real version on an Arduino with just a button, LED, and a few motors or relays.

No other tools required. Just copy the code, connect the wires, and go.

