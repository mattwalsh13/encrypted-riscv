#include "encrypted_types.h"

int_enc globalCount = {0};
uint_enc globalMax = {100};

int_enc addDouble(int_enc a , int_enc b , int_enc useless) {
    int_enc c = add_enc(a, b);
    return add_enc(c, b);
}

uint_enc uaddDouble(uint_enc a , uint_enc b , uint_enc useless) {
    uint_enc c = add_enc(a, b);
    return add_enc(c, b);
}

int getSeven() {
    int seven = 7;
    return seven;
}

int main() {
    int_enc list [5] = {{1}, {2}, {3}, {4}, {5}};
    int_enc x = {0xD};
    int_enc y = {0x7};
    int_enc result = {0};
    uint_enc uresult = {0};
    int_enc z, w;
    uint_enc no_neg = {3};
    uint_enc test = {2};
    int_enc thirteen = {13};

    // unary
    result = negate_enc(result);
    result = lnot_enc(result);
    result = bnot_enc(result);

    // int_enc <op> int_enc
    result = and_enc(x, y);
    result = land_enc(x, y);
    result = or_enc(x, y);
    result = lor_enc(x, y);
    result = xor_enc(x, y);
    result = lxor_enc(x, y);
    result = sll_enc(x, y);
    result = srl_enc(x, y);
    result = add_enc(x, y);
    result = sub_enc(x, y);
    result = set_enc(x, y);
    result = slt_enc(x, y);
    result = slet_enc(x, y);
    result = sgt_enc(x, y);
    result = sget_enc(x, y);

    // int_enc <op> imm
    result = andi_enc(x, 13);
    result = landi_enc(x, 13);
    result = ori_enc(x, 13);
    result = lori_enc(x, 13);
    result = xori_enc(x, 13);
    result = lxori_enc(x, 13);
    result = slli_enc(x, 13);
    result = srli_enc(x, 13);
    result = addi_enc(x, 13);
    result = subi_enc(x, 13);
    result = seti_enc(x, 13);
    result = slti_enc(x, 13);
    result = sleti_enc(x, 13);
    result = sgti_enc(x, 13);
    result = sgeti_enc(x, 13);

    // imm <op> int_enc
    result = iand_enc(13, x);
    result = iland_enc(13, x);
    result = ior_enc(13, x);
    result = ilor_enc(13, x);
    result = ixor_enc(13, x);
    result = ilxor_enc(13, x);
    result = isll_enc(13, x);
    result = isrl_enc(13, x);
    result = iadd_enc(13, x);
    result = isub_enc(13, x);
    result = iset_enc(13, x);
    result = islt_enc(13, x);
    result = islet_enc(13, x);
    result = isgt_enc(13, x);
    result = isget_enc(13, x);

    // uint_enc <op> uint_enc
    uresult = and_enc(no_neg, test);
    uresult = land_enc(no_neg, test);
    uresult = or_enc(no_neg, test);
    uresult = lor_enc(no_neg, test);
    uresult = xor_enc(no_neg, test);
    uresult = lxor_enc(no_neg, test);
    uresult = sll_enc(no_neg, test);
    uresult = srl_enc(no_neg, test);
    uresult = add_enc(no_neg, test);
    uresult = sub_enc(no_neg, test);
    uresult = set_enc(no_neg, test);
    uresult = sltu_enc(no_neg, test);
    uresult = sletu_enc(no_neg, test);
    uresult = sgtu_enc(no_neg, test);
    uresult = sgetu_enc(no_neg, test);

    // uint_enc <op> imm
    uresult = andi_enc(no_neg, 3);
    uresult = landi_enc(no_neg, 3);
    uresult = ori_enc(no_neg, 3);
    uresult = lori_enc(no_neg, 3);
    uresult = xori_enc(no_neg, 3);
    uresult = lxori_enc(no_neg, 3);
    uresult = slli_enc(no_neg, 3);
    uresult = srli_enc(no_neg, 3);
    uresult = addi_enc(no_neg, 3);
    uresult = subi_enc(no_neg, 3);
    uresult = seti_enc(no_neg, 3);
    uresult = sltiu_enc(no_neg, 3);
    uresult = sletiu_enc(no_neg, 3);
    uresult = sgtiu_enc(no_neg, 3);
    uresult = sgetiu_enc(no_neg, 3);

    // imm <op> uint_enc
    uresult = iand_enc(3, no_neg);
    uresult = iland_enc(3, no_neg);
    uresult = ior_enc(3, no_neg);
    uresult = ilor_enc(3, no_neg);
    uresult = ixor_enc(3, no_neg);
    uresult = ilxor_enc(3, no_neg);
    uresult = isll_enc(3, no_neg);
    uresult = isrl_enc(3, no_neg);
    uresult = iadd_enc(3, no_neg);
    uresult = isub_enc(3, no_neg);
    uresult = iset_enc(3, no_neg);
    uresult = isltu_enc(3, no_neg);
    uresult = isletu_enc(3, no_neg);
    uresult = isgtu_enc(3, no_neg);
    uresult = isgetu_enc(3, no_neg);

    // multi-declare / multi-init on one line
    int_enc a = add_enc(x, y), b = sub_enc(y, x);

    // compound assignment / unary
    x = add_enc(x, y);
    x = sub_enc(x, y);
    x = addi_enc(x, 1);
    x = subi_enc(x, 1);

    // useless statement
    x;

    // nested function calls with complex expressions
    result = addDouble(addDouble(sub_enc(x, thirteen),y,x),addDouble(x,slli_enc(y, 2),x),thirteen);
    result = addDouble(addDouble(land_enc(sll_enc(add_enc(x, y), x), subi_enc(y, 1)),y,x),y,x);
    uresult = uaddDouble(uaddDouble(no_neg,test,no_neg),test,no_neg);
    uresult = uaddDouble(uaddDouble(no_neg,test,test),uaddDouble(test,no_neg,test),no_neg);

    // calls with discarded return values
    addDouble(x,y,x);
    addDouble(x,y,y);

    z = (int_enc){0x0};

    // ensure int is untouched
    int seven = getSeven ( );
    int i = 0;

    while (i < 10) {
        int_enc x = {13}; // ensure scope
        i ++;
    }

    return 0;
}