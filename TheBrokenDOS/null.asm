draw_null_cube:
    push cx
    mov cx, bp
    
column_loop:
    mov ax, di
    shr ax, 6
    xor ax, si
    and ax, 8

    jz paint_magenta
    mov al, 0
    jmp plot_pixel

paint_magenta:
    mov al, 13
    
plot_pixel:
    mov [es:di], al
    add di, 320
    inc si
    loop column_loop
    
    pop cx
    ret