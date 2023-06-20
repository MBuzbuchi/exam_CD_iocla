%include "./utils/printf32.asm"
extern printf

section .data

limit dd  120
len equ   10

section .bss
    ; TODO a: Reserve space for an array of `len` integers. The array name is `int_arr`
   int_arr: resd 10       
section .text
global main

main:
    push ebp
    mov ebp, esp

    ;TODO a: Generate first `len` elements of `int_arr` defined as follows:
    ; int_arr[i] = 17 * i + 3
   xor ecx, ecx
for_label:
   ; xor edx, edx
   ; mov eax, ecx
   ; mov ebx, 17
   ; mul ebx
   imul eax, ecx, 17
   add eax, 3
   mov [int_arr + 4 * ecx], eax 

   inc ecx
   cmp ecx, len
   jl for_label

   xor ecx, ecx
print_label:
   PRINTF32 `%d\n\x0`, [int_arr + 4 * ecx] 
   inc ecx
   cmp ecx, len
   jl print_label


    ; TODO b: Count the number of elements strictly smaller than number pointed by `limit`
   xor ecx, ecx
   xor edx, edx      ; mov edx, 0
   PRINTF32 `%d %d\n\x0`, limit, [limit]
for_label2:
   mov eax, [int_arr + 4 * ecx]
   cmp eax, [limit]
   jge inc_for
   inc edx

inc_for:
   inc ecx
   cmp ecx, len
   jl for_label2

   PRINTF32   `%d\n\x0`, edx

    ; TODO c: Find and print the smallest number strictly greater than number pointed by `limit`
   xor ecx, ecx
   xor edx, edx      ; mov edx, 0
for_label3:
   mov eax, [int_arr + 4 * ecx]
   cmp eax, [limit]
   jle inc_for3
   mov edx, eax
   jmp print_label3

inc_for3:
   inc ecx
   cmp ecx, len
   jl for_label3

print_label3:
   PRINTF32   `%d\n\x0`, edx

    ; Return 0.
    xor eax, eax
    leave
    ret
