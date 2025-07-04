; === Accensione sequenziale 4 motori (AVR ATmega328P) ===
; PD0–PD3: motori
; PB0: pulsante start (pull-up)
; PB1: LED di stato

.include "m328pdef.inc"

.def temp = r16
.def counter = r17
.def wait = r18

.org 0x0000
    rjmp start

start:
    ; Uscite: PD0-PD3
    ldi temp, 0b00001111
    out DDRD, temp

    ; PB0 input (pull-up), PB1 output (LED)
    ldi temp, 0b00000010
    out DDRB, temp
    ldi temp, 0b00000001
    out PORTB, temp

main_loop:
    in temp, PINB
    sbrs temp, 0
    rcall start_sequence
    rjmp main_loop

start_sequence:
    sbi PORTB, 1        ; LED on

    ; M1
    sbi PORTD, 0
    rcall delay_1s

    ; M2
    sbi PORTD, 1
    rcall delay_1s

    ; M3
    sbi PORTD, 2
    rcall delay_1s

    ; M4
    sbi PORTD, 3

    ; Tempo acceso
    rcall delay_5s

    ; Spegni tutti
    cbi PORTD, 0
    cbi PORTD, 1
    cbi PORTD, 2
    cbi PORTD, 3

    cbi PORTB, 1        ; LED off
    ret

delay_1s:
    ldi counter, 50
loop1s:
    rcall delay_20ms
    dec counter
    brne loop1s
    ret

delay_5s:
    ldi counter, 250
loop5s:
    rcall delay_20ms
    dec counter
    brne loop5s
    ret

delay_20ms:
    ldi wait, 255
loop1:
    ldi temp, 255
loop2:
    dec temp
    brne loop2
    dec wait
    brne loop1
    ret
