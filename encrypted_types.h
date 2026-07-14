// Tells clang that encrypted ints are 32-bits long
typedef unsigned int enc_int __attribute__((ext_vector_type(1)));

// Secure wrapper macro that validates types at compile-time
#define enc_add(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), enc_int), \
        "Error: First argument to custom_op must be a enc_int!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), enc_int), \
        "Error: Second argument to custom_op must be a enc_int!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_enc_add((arg1)[0], (arg2)[0]); \
})