// Tells clang that encrypted ints are 32-bits long
typedef unsigned int enc_int __attribute__((ext_vector_type(1)));

// Secure wrapper macro that validates types at compile-time
#define SAFE_RISCV_CUSTOM_OP(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), my_type32_t), \
        "Error: First argument to custom_op must be a my_type32_t!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), my_type32_t), \
        "Error: Second argument to custom_op must be a my_type32_t!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_custom_op(arg1, arg2); \
})