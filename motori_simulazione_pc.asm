org 100h            ; Programma COM DOS

section .data
motori db 0, 0, 0, 0
msg_title db 'SIMULATORE AVVIO MOTORI (PC)',13,10,'$'
msg_stato db 'Stato motori: M1=', ?, ' M2=', ?, ' M3=', ?, ' M4=', ?, 13,10,'$'
acceso db '1'
spento db '0'

section .text
start:
    mov ah, 09h
    mov dx, msg_title
    int 21h

main_loop:
    call mostra_stato
    call delay_1s

    ; Sequenza M1 -> M2 -> M3 -> M4 con 1s di delay
    mov si, 0
accendi_seq:
    cmp si, 4
    je attesa
    mov byte [motori + si], 1
    call mostra_stato
    call delay_1s
    inc si
    jmp accendi_seq

attesa:
    call delay_5s

    ; Spegnimento motori
    mov si, 0
spegni_seq:
    cmp si, 4
    je fine
    mov byte [motori + si], 0
    inc si
    jmp spegni_seq

fine:
    call mostra_stato
    mov ah, 4Ch
    int 21h

; --- Mostra lo stato dei motori ---
mostra_stato:
    mov al, [motori+0]
    call stato_char
    mov [msg_stato+19], al

    mov al, [motori+1]
    call stato_char
    mov [msg_stato+26], al

    mov al, [motori+2]
    call stato_char
    mov [msg_stato+33], al

    mov al, [motori+3]
    call stato_char
    mov [msg_stato+40], al

    mov ah, 09h
    mov dx, msg_stato
    int 21h
    ret

; --- Converte stato 0/1 in char ---
stato_char:
    cmp al, 0
    je stato_spento
    mov al, [acceso]
    ret
stato_spento:
    mov al, [spento]
    ret

; --- Delay software ~1s ---
delay_1s:
    mov cx, 5
d1:
    mov dx, 0FFFFh
wait1:
    nop
    dec dx
    jnz wait1
    loop d1
    ret

; --- Delay software ~5s ---
delay_5s:
    mov cx, 25
d5:
    mov dx, 0FFFFh
wait5:
    nop
    dec dx
    jnz wait5
    loop d5
    ret
