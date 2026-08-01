int_enc globalCount = 0;

int_enc addDouble(int_enc a, int_enc b, int_enc useless) {
    int_enc c = a + b;
    return c + b;
}

int main() {
    int_enc list[5] = {1, 2, 3, 4, 5};
    int_enc x = 0xD;
    int_enc y = 0x7;
    int_enc result;
    uint_enc uresult;
    int_enc z, w;
    uint_enc no_neg = 3;
    uint_enc test = 2;
    const int_enc thirteen = 13;

    uresult = no_neg < test;
    uresult = test < no_neg;
    // result = x > y;

    result = x & y;
    result = x + y;

    result = x + 13;
    result = 13 + x;

    int_enc a = x + y, b = y - x;

    x += y;
    x -= y;

    x++;
    // x--;

    x;

    int i = 0;

    while (i < 10) {
        int_enc x = 13;
        i++;
    }

    addDouble(x, y, x);

    result = addDouble(x, y, x);

    z = 0x0;

    addDouble(x, y, y);

    return 0;
}