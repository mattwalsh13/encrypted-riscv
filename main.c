#include "encrypted_types.h"

int main() {
	int_enc x = { 0xD };
    int_enc y = { 0x7 };
    int_enc result;

    result = add_enc(x, y);
    result = sub_enc(x, y);
    result = sll_enc(x, y);
    result = slt_enc(x, y);
    result = sltu_enc(x, y);
    result = xor_enc(x, y);
    result = srl_enc(x, y);
    result = sra_enc(x, y);
    result = or_enc(x, y);
    result = and_enc(x, y);

    result = addi_enc(x, 13);
    result = slti_enc(x, 13);
    result = sltiu_enc(x, 13);
    result = xori_enc(x, 13);
    result = andi_enc(x, 13);

    result = slli_enc(x, 13);
    result = srli_enc(x, 13);
    result = srai_enc(x, 13);

    return 0;
}