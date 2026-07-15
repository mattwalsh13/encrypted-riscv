#ifndef ENCRYPTED_TYPES_H
#define ENCRYPTED_TYPES_H

typedef struct { unsigned int v; } int_enc;

#define DO_NOT_OPTIMIZE(x) __asm__ volatile("" : : "r"(x) : "memory")

// R-TYPE
#define add_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to add_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to add_enc must be a int_enc!"); \
    unsigned int __add_enc_r = __builtin_riscv_add_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__add_enc_r); \
    (int_enc){ __add_enc_r }; \
})

#define sub_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sub_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sub_enc must be a int_enc!"); \
    unsigned int __sub_enc_r = __builtin_riscv_sub_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__sub_enc_r); \
    (int_enc){ __sub_enc_r }; \
})
 
#define sll_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sll_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sll_enc must be a int_enc!"); \
    unsigned int __sll_enc_r = __builtin_riscv_sll_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__sll_enc_r); \
    (int_enc){ __sll_enc_r }; \
})
 
#define slt_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to slt_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to slt_enc must be a int_enc!"); \
    unsigned int __slt_enc_r = __builtin_riscv_slt_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__slt_enc_r); \
    (int_enc){ __slt_enc_r }; \
})
 
#define sltu_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sltu_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sltu_enc must be a int_enc!"); \
    unsigned int __sltu_enc_r = __builtin_riscv_sltu_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__sltu_enc_r); \
    (int_enc){ __sltu_enc_r }; \
})
 
#define xor_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to xor_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to xor_enc must be a int_enc!"); \
    unsigned int __xor_enc_r = __builtin_riscv_xor_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__xor_enc_r); \
    (int_enc){ __xor_enc_r }; \
})
 
#define srl_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to srl_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to srl_enc must be a int_enc!"); \
    unsigned int __srl_enc_r = __builtin_riscv_srl_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__srl_enc_r); \
    (int_enc){ __srl_enc_r }; \
})
 
#define sra_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sra_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sra_enc must be a int_enc!"); \
    unsigned int __sra_enc_r = __builtin_riscv_sra_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__sra_enc_r); \
    (int_enc){ __sra_enc_r }; \
})
 
#define or_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to or_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to or_enc must be a int_enc!"); \
    unsigned int __or_enc_r = __builtin_riscv_or_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__or_enc_r); \
    (int_enc){ __or_enc_r }; \
})
 
#define and_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to and_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to and_enc must be a int_enc!"); \
    unsigned int __and_enc_r = __builtin_riscv_and_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__and_enc_r); \
    (int_enc){ __and_enc_r }; \
})

// I-TYPE
#define addi_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __addi_enc_r = __builtin_riscv_addi_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__addi_enc_r); \
    (int_enc){ __addi_enc_r }; \
})
 
#define slti_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __slti_enc_r = __builtin_riscv_slti_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__slti_enc_r); \
    (int_enc){ __slti_enc_r }; \
})
 
#define sltiu_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __sltiu_enc_r = __builtin_riscv_sltiu_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__sltiu_enc_r); \
    (int_enc){ __sltiu_enc_r }; \
})
 
#define xori_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __xori_enc_r = __builtin_riscv_xori_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__xori_enc_r); \
    (int_enc){ __xori_enc_r }; \
})
 
#define ori_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __ori_enc_r = __builtin_riscv_ori_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__ori_enc_r); \
    (int_enc){ __ori_enc_r }; \
})
 
#define andi_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __andi_enc_r = __builtin_riscv_andi_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__andi_enc_r); \
    (int_enc){ __andi_enc_r }; \
})
 
#define slli_enc(rs1, shamt) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(shamt), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((shamt) >= 0 && (shamt) <= 31, \
        "Error: Shift amount must fit within a 5-bit range!"); \
    unsigned int __slli_enc_r = __builtin_riscv_slli_enc((rs1).v, (shamt)); \
    DO_NOT_OPTIMIZE(__slli_enc_r); \
    (int_enc){ __slli_enc_r }; \
})
 
#define srli_enc(rs1, shamt) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(shamt), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((shamt) >= 0 && (shamt) <= 31, \
        "Error: Shift amount must fit within a 5-bit range!"); \
    unsigned int __srli_enc_r = __builtin_riscv_srli_enc((rs1).v, (shamt)); \
    DO_NOT_OPTIMIZE(__srli_enc_r); \
    (int_enc){ __srli_enc_r }; \
})
 
#define srai_enc(rs1, shamt) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(shamt), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((shamt) >= 0 && (shamt) <= 31, \
        "Error: Shift amount must fit within a 5-bit range!"); \
    unsigned int __srai_enc_r = __builtin_riscv_srai_enc((rs1).v, (shamt)); \
    DO_NOT_OPTIMIZE(__srai_enc_r); \
    (int_enc){ __srai_enc_r }; \
})

// CMOV
#define cmov_enc(arg1, arg2, arg3) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to cmov_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to cmov_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg3), int_enc), \
        "Error: Third argument to cmov_enc must be a int_enc!"); \
    unsigned int __cmov_enc_r = __builtin_riscv_cmov_enc((arg1).v, (arg2).v, (arg3).v); \
    DO_NOT_OPTIMIZE(__cmov_enc_r); \
    (int_enc){ __cmov_enc_r }; \
})

#endif // ENCRYPTED_TYPES_H