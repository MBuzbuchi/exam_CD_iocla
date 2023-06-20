#include <stdio.h>
#include <stdlib.h>

#define BROKEN_BIT_INDEX 7

// TODO: freestyle starts here, implement Task 2
void task2(void *encrypted_data, int size) {
   printf("Ana are mere\n");

   char *crt = encrypted_data;
   char valid_mask = 1 << 7;

   for (int i = 0; i < size; i++ ) {
      unsigned char value = *crt;
      if ( (value & valid_mask) != 0) {
         // value = value << 1;           //       1 0000001 -> 1 0000010
         // value = value >> 1;           //        00000010

         // value = value ^ valid_mask;
         // 1 ABC DEFG ^ 
         // 1 000 0000
         // 0 ABC DEFG

         value -= valid_mask;

         
         printf("%c\n", value);
      }

      crt++;
   }
}
