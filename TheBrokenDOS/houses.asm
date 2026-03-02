org 100h

start:
    mov ax, 13h
    int 10h

main_loop:
    mov ax, 0A000h
    mov es, ax
    xor di, di

draw_sky:
    mov cx, 32000
    mov al, 32
    rep stosb

    inc dx              
    mov cx, 32000
draw_ground:
    mov ax, di
    add ax, dx
    and ax, 32
    jz green_bright
    mov al, 2
    jmp plot
green_bright:
    mov al, 10
plot:
    stosb
    loop draw_ground

    in al, 60h
    cmp al, 1
    jne main_loop

    mov ax, 03h
    int 10h
    ret