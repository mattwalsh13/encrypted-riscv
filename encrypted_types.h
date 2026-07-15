typedef unsigned int int_enc __attribute__((ext_vector_type(1)));

// R-TYPE
#define add_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to add_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to add_enc must be a int_enc!"); \
    __builtin_riscv_add_enc((arg1)[0], (arg2)[0]); \
})

#define sub_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sub_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sub_enc must be a int_enc!"); \
    __builtin_riscv_sub_enc((arg1)[0], (arg2)[0]); \
})

#define sll_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sll_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sll_enc must be a int_enc!"); \
    __builtin_riscv_sll_enc((arg1)[0], (arg2)[0]); \
})

#define slt_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to slt_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to slt_enc must be a int_enc!"); \
    __builtin_riscv_slt_enc((arg1)[0], (arg2)[0]); \
})

#define sltu_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sltu_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sltu_enc must be a int_enc!"); \
    __builtin_riscv_sltu_enc((arg1)[0], (arg2)[0]); \
})

#define xor_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to xor_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to xor_enc must be a int_enc!"); \
    __builtin_riscv_xor_enc((arg1)[0], (arg2)[0]); \
})

#define srl_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to srl_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to srl_enc must be a int_enc!"); \
    __builtin_riscv_srl_enc((arg1)[0], (arg2)[0]); \
})

#define sra_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sra_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sra_enc must be a int_enc!"); \
    __builtin_riscv_sra_enc((arg1)[0], (arg2)[0]); \
})

#define or_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to or_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to or_enc must be a int_enc!"); \
    __builtin_riscv_or_enc((arg1)[0], (arg2)[0]); \
})

#define and_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to and_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to and_enc must be a int_enc!"); \
    __builtin_riscv_and_enc((arg1)[0], (arg2)[0]); \
})

// I-TYPE
#define addi_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    __builtin_riscv_addi_enc((rs1)[0], (imm)); \
})

#define slti_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    __builtin_riscv_slti_enc((rs1)[0], (imm)); \
})

#define sltiu_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    __builtin_riscv_sltiu_enc((rs1)[0], (imm)); \
})

#define xori_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    __builtin_riscv_xori_enc((rs1)[0], (imm)); \
})

#define ori_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    __builtin_riscv_ori_enc((rs1)[0], (imm)); \
})

#define andi_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    __builtin_riscv_andi_enc((rs1)[0], (imm)); \
})

#define slli_enc(rs1, shamt) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(shamt), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((shamt) >= 0 && (shamt) <= 31, \
        "Error: Shift amount must fit within a 5-bit range!"); \
    __builtin_riscv_slli_enc((rs1)[0], (shamt)); \
})

#define srli_enc(rs1, shamt) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(shamt), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((shamt) >= 0 && (shamt) <= 31, \
        "Error: Shift amount must fit within a 5-bit range!"); \
    __builtin_riscv_srli_enc((rs1)[0], (shamt)); \
})

#define srai_enc(rs1, shamt) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(shamt), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((shamt) >= 0 && (shamt) <= 31, \
        "Error: Shift amount must fit within a 5-bit range!"); \
    __builtin_riscv_srai_enc((rs1)[0], (shamt)); \
})

// CMOV
#define cmov_enc(arg1, arg2, arg3) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to cmov_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to cmov_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg3), int_enc), \
        "Error: Third argument to cmov_enc must be a int_enc!"); \
    __builtin_riscv_cmov_enc((arg1)[0], (arg2)[0], (arg3)[0]); \
})