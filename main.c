#include "encrypted_types.h"

int main() {
	enc_int x = { 0x1 };
    enc_int y = { 0x2 };
    enc_int result;

    result = enc_add(x, y);

    return 0;
}