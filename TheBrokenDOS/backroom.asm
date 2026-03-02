section .text
    org 100h

start:
    mov ax, 13h 
    int 10h

render_loop:
    mov ax, 0A000h
    mov es, ax
    mov di, 320*100+160
    mov byte [es:di], 14

    in al, 60h
    cmp al, 1
    jne render_loop

    mov ax, 03h
    int 10h
    mov ax, 4C00h
    int 21h