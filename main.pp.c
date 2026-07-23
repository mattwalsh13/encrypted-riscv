#include "encrypted_types.h"

// int_enc globalCount = 0;

int main() {
    int_enc list [ 5 ] = { 1 , 2 , 3 , 4 , 5 };
    int_enc x = 0xD;
    int_enc y = 0x7;
    int_enc result;
    int_enc z , w;

    result = xy&;
    result = xy+;

    result = x13+;

    result = x13+;
    result = x13+;
    result = x13+;
    result = x13+;

    // int_enc a = x + y, b = y - x;

    x + = y;

    x = addi_enc(x, 1);
    x = subi_enc(x, 1);

    x;

    int i = 0;

    while (i < 10) {
        int_enc x = 13;
        i ++;
    }

    addDouble(x,y);

    result = addDouble(x,y);

    int_enc x = 0xD;
    int_enc y = 0x7;
    int_enc z = 0x0;

    addDouble(x,y,z);

    return 0;
}

int_enc addDouble(int_enc a , int_enc b , int_enc useless) {
    int_enc c = a + b;
    return c + b;
}