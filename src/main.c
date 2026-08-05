int_enc globalCount = 0;
const uint_enc globalMax = 100;

int_enc addDouble(int_enc a, int_enc b, int_enc useless) {
    int_enc c = a + b;
    return c + b;
}

uint_enc uaddDouble(uint_enc a, uint_enc b, uint_enc useless) {
    uint_enc c = a + b;
    return c + b;
}

int getSeven() {
    int seven = 7;
    return seven;
}

int main() {
    int_enc list[5] = {1, 2, 3, 4, 5};
    int_enc x = 0xD;
    int_enc y = 0x7;
    int_enc result = 0;
    uint_enc uresult = 0;
    int_enc z, w;
    uint_enc no_neg = 3;
    uint_enc test = 2;
    const int_enc thirteen = 13;
    int_enc * p = &x;

    result = *p + 1;
    *p = result;

    // unary
    result = -result;
    result = !result;
    result = ~result;

    // int_enc <op> int_enc
    result = x & y;
    result = x && y;
    result = x | y;
    result = x || y;
    result = x ^ y;
    result = x ^^ y;
    result = x << y;
    result = x >> y;
    result = x + y;
    result = x - y;
    result = x == y;
    result = x < y;
    result = x <= y;
    result = x > y;
    result = x >= y;

    // int_enc <op> imm
    result = x & 13;
    result = x && 13;
    result = x | 13;
    result = x || 13;
    result = x ^ 13;
    result = x ^^ 13;
    result = x << 13;
    result = x >> 13;
    result = x + 13;
    result = x - 13;
    result = x == 13;
    result = x < 13;
    result = x <= 13;
    result = x > 13;
    result = x >= 13;

    // imm <op> int_enc
    result = 13 & x;
    result = 13 && x;
    result = 13 | x;
    result = 13 || x;
    result = 13 ^ x;
    result = 13 ^^ x;
    result = 13 << x;
    result = 13 >> x;
    result = 13 + x;
    result = 13 - x;
    result = 13 == x;
    result = 13 < x;
    result = 13 <= x;
    result = 13 > x;
    result = 13 >= x;

    // uint_enc <op> uint_enc
    uresult = no_neg & test;
    uresult = no_neg && test;
    uresult = no_neg | test;
    uresult = no_neg || test;
    uresult = no_neg ^ test;
    uresult = no_neg ^^ test;
    uresult = no_neg << test;
    uresult = no_neg >> test;
    uresult = no_neg + test;
    uresult = no_neg - test;
    uresult = no_neg == test;
    uresult = no_neg < test;
    uresult = no_neg <= test;
    uresult = no_neg > test;
    uresult = no_neg >= test;

    // uint_enc <op> imm
    uresult = no_neg & 3;
    uresult = no_neg && 3;
    uresult = no_neg | 3;
    uresult = no_neg || 3;
    uresult = no_neg ^ 3;
    uresult = no_neg ^^ 3;
    uresult = no_neg << 3;
    uresult = no_neg >> 3;
    uresult = no_neg + 3;
    uresult = no_neg - 3;
    uresult = no_neg == 3;
    uresult = no_neg < 3;
    uresult = no_neg <= 3;
    uresult = no_neg > 3;
    uresult = no_neg >= 3;

    // imm <op> uint_enc
    uresult = 3 & no_neg;
    uresult = 3 && no_neg;
    uresult = 3 | no_neg;
    uresult = 3 || no_neg;
    uresult = 3 ^ no_neg;
    uresult = 3 ^^ no_neg;
    uresult = 3 << no_neg;
    uresult = 3 >> no_neg;
    uresult = 3 + no_neg;
    uresult = 3 - no_neg;
    uresult = 3 == no_neg;
    uresult = 3 < no_neg;
    uresult = 3 <= no_neg;
    uresult = 3 > no_neg;
    uresult = 3 >= no_neg;

    // multi-declare / multi-init on one line
    int_enc a = x + y, b = y - x;

    // compound assignment / unary
    x += y;
    x -= y;
    x++;
    x--;

    // cmov
    result = x ? x : y;

    // nested function calls with complex expressions
    result = addDouble(addDouble(x - thirteen, y, x) + 1, addDouble(x, y << 2, x), thirteen);
    result = addDouble(addDouble(x + y << x && (y - 1), y, x), y, x);
    uresult = uaddDouble(uaddDouble(no_neg, test, no_neg), test, no_neg);
    uresult = uaddDouble(uaddDouble(no_neg, test, test), uaddDouble(test, no_neg, test), no_neg);

    // calls with discarded return values
    addDouble(x, y, x);
    addDouble(x, y, y);

    z = 0x0;

    // ensure int is untouched
    int seven = getSeven();
    int i = 0;

    while (i < 10) {
        int_enc x = 13; // ensure scope
        i++;
    }

    return 0;
}