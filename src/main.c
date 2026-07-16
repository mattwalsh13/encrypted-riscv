#include "encrypted_types.h"

int main() {
	int_enc x = { 0xD };
    int_enc y = { 0x7 };
    int_enc result;

    result = x < y;
    result = sub_enc(x, y);

    result = addi_enc(x, 13);

    return 0;
}