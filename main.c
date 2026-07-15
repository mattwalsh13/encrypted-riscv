#include "encrypted_types.h"

int main() {
	int_enc x = { 0xD };
    int_enc y = { 0x7 };
    int_enc result;

    result = add_enc(x, y);             NO_OPTIMIZE(result.v);
    result = sub_enc(x, y);             NO_OPTIMIZE(result.v);
    result = sll_enc(x, y);             NO_OPTIMIZE(result.v);
    result = slt_enc(x, y);             NO_OPTIMIZE(result.v);
    result = sltu_enc(x, y);            NO_OPTIMIZE(result.v);
    result = xor_enc(x, y);             NO_OPTIMIZE(result.v);
    result = srl_enc(x, y);             NO_OPTIMIZE(result.v);
    result = sra_enc(x, y);             NO_OPTIMIZE(result.v);
    result = or_enc(x, y);              NO_OPTIMIZE(result.v);
    result = and_enc(x, y);             NO_OPTIMIZE(result.v);

    result = addi_enc(x, 13);           NO_OPTIMIZE(result.v);
    result = slti_enc(x, 13);           NO_OPTIMIZE(result.v);
    result = sltiu_enc(x, 13);          NO_OPTIMIZE(result.v);
    result = xori_enc(x, 13);           NO_OPTIMIZE(result.v);
    result = andi_enc(x, 13);           NO_OPTIMIZE(result.v);

    result = slli_enc(x, 13);           NO_OPTIMIZE(result.v);
    result = srli_enc(x, 13);           NO_OPTIMIZE(result.v);
    result = srai_enc(x, 13);           NO_OPTIMIZE(result.v);

    result = cmov_enc(x, y, result);    NO_OPTIMIZE(result.v);

    return 0;
}