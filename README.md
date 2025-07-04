📘 README – Engine Start System (Simulation + AVR Hardware)
📌 File Legend
File	Description
motori_simulazione_pc.asm	x86 Assembly simulator for DOSBox: shows motor status on screen with sequential startup and delay.
motori_avvio_sequenziale_avr.asm	AVR Assembly code for Arduino UNO: controls 4 real motors with sequence, delay and status LED.

🖥️ 1. motori_simulazione_pc.asm – PC Simulation (x86, DOSBox)
🧠 Description
This program simulates the startup of 4 motors (M1, M2, M3, M4) directly on a PC using a DOS environment (such as DOSBox). The motors are “turned on” one at a time with a 1-second software delay between each, followed by a 5-second full activation phase, and then all motors are turned off and the program exits.

▶️ How to Run
Compile with NASM:

bash
Copia
Modifica
nasm -f bin motori_simulazione_pc.asm -o motori_simulazione_pc.com
Run with DOSBox:

bash
Copia
Modifica
dosbox motori_simulazione_pc.com
🧾 Features
Displays the status of each motor on screen (ON/OFF)

Sequential activation: M1 → M2 → M3 → M4

1-second delay between each motor

5-second full activation before shutdown

🔌 2. motori_avvio_sequenziale_avr.asm – Real Hardware Control (Arduino UNO)
🧠 Description
This AVR Assembly code (for ATmega328P, used in Arduino UNO) controls 4 real motors or relays connected to PD0–PD3. A start button on PB0 triggers the sequence, and a status LED on PB1 lights up during operation.

Each motor turns on in sequence, with 1-second delay between each one. All motors remain on for 5 seconds, then turn off automatically.

🔧 GPIO Pin Mapping
Device	Arduino UNO Pin	Description
Motor 1 (M1)	PD0 (pin 2)	Digital output
Motor 2 (M2)	PD1 (pin 3)	Digital output
Motor 3 (M3)	PD2 (pin 4)	Digital output
Motor 4 (M4)	PD3 (pin 5)	Digital output
Start button	PB0 (pin 14)	Connected to GND (internal pull-up)
Status LED	PB1 (pin 15)	Lights up during the sequence

🛠️ How to Compile and Upload
Compile with AVRA:

bash
Copia
Modifica
avra motori_avvio_sequenziale_avr.asm
Upload with avrdude:

bash
Copia
Modifica
avrdude -c arduino -p m328p -P COMx -b 115200 -U flash:w:motori_avvio_sequenziale_avr.hex
(Replace COMx with your Arduino's serial port.)

🧾 Features
Start sequence via button

Sequential motor activation, 1 per second

LED on during operation

Auto shutdown after 5 seconds

ℹ️ Final Notes
Both projects are independent.

The PC version is useful for simulating logic flow.

The AVR version is meant for real-world motor/relay/LED control.

You can extend the system with emergency buttons, LCD display, or network/web control.
