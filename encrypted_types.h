// Tells clang that encrypted ints are 32-bits long
typedef unsigned int int_enc __attribute__((ext_vector_type(1)));

// Secure wrapper macros that validate types at compile-time
#define add_enc(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to custom_op must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to custom_op must be a int_enc!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_add_enc((arg1)[0], (arg2)[0]); \
})

#define sub_enc(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to custom_op must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to custom_op must be a int_enc!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_sub_enc((arg1)[0], (arg2)[0]); \
})

#define sll_enc(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to custom_op must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to custom_op must be a int_enc!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_sll_enc((arg1)[0], (arg2)[0]); \
})

#define slt_enc(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to custom_op must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to custom_op must be a int_enc!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_slt_enc((arg1)[0], (arg2)[0]); \
})

#define sltu_enc(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to custom_op must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to custom_op must be a int_enc!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_sltu_enc((arg1)[0], (arg2)[0]); \
})

#define xor_enc(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to custom_op must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to custom_op must be a int_enc!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_xor_enc((arg1)[0], (arg2)[0]); \
})

#define srl_enc(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to custom_op must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to custom_op must be a int_enc!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_srl_enc((arg1)[0], (arg2)[0]); \
})

#define sra_enc(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to custom_op must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to custom_op must be a int_enc!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_sra_enc((arg1)[0], (arg2)[0]); \
})

#define or_enc(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to custom_op must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to custom_op must be a int_enc!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_or_enc((arg1)[0], (arg2)[0]); \
})

#define and_enc(arg1, arg2) ({ \
    /* Static assertions that trigger clean compile errors if types mismatch */ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to custom_op must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to custom_op must be a int_enc!"); \
    \
    /* If checks pass, seamlessly execute the actual underlying hardware built-in */ \
    __builtin_riscv_and_enc((arg1)[0], (arg2)[0]); \
})