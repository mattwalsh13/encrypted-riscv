#include "encrypted_types.h"

int main() {
    int_enc list[5] = {{1}, {2}, {3}, {4}, {5}};
    int_enc x = {0xD};
    int_enc y = {0x7};
    int_enc result;
    int_enc z, w;

    result = x y &;
    result = x y +;

    result = x 13 +;

    // int_enc a = x + y, b = y - x;

    x = x y +;

    x = x 1 +;
    x = x 1 -;

    x;

    // result = addDouble(x, y);

    return 0;
}

int_enc addDouble(int_enc a, int_enc b) {
    int_enc c = a b +;
    return c b +;
}