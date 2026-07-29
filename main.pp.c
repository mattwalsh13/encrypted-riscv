#include "encrypted_types.h"
#define TEMP_ZERO_REGISTER_HELPER = { 0X0 }
#define ZERO_REGISTER xor_enc(TEMP_ZERO_REGISTER_HELPER, TEMP_ZERO_REGISTER_HELPER)

int_enc globalCount = {0};

int main() {
    int_enc list [5] = {{1}, {2}, {3}, {4}, {5}};
    int_enc x = {0xD};
    int_enc y = {0x7};
    int_enc result;
    int_enc z, w;

    result = and_enc(x, y);
    result = add_enc(x, y);

    result = addi_enc(x, 13);
    result = iadd_enc(13, x);

    int_enc a = add_enc(x, y), b = sub_enc(y, x);

    x = add_enc(x, y);
    x = sub_enc(x, y);

    x = addi_enc(x, 1);
    x = subi_enc(x, 1);

    x;

    int i = 0;

    while (i < 10) {
        int_enc x = {13};
        i ++;
    }

    addDouble(x,y,x);

    result = addDouble(x,y,x);

    int_enc z = {0x0};

    addDouble(x,y,z);

    return 0;
}

int_enc addDouble(int_enc a , int_enc b , int_enc useless) {
    int_enc c = add_enc(a, b);
    return add_enc(c, b);
}