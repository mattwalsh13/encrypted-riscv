#ifndef ENCRYPTED_TYPES_H
#define ENCRYPTED_TYPES_H

typedef struct { unsigned int v; } int_enc;
typedef struct { unsigned int v; } uint_enc;

#define DO_NOT_OPTIMIZE(x) __asm__ volatile("" : : "r"(x) : "memory")

// R-TYPE
#define add_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to add_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to add_enc must be a int_enc!"); \
    unsigned int __add_enc_r = __builtin_riscv_add_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__add_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __add_enc_r }, \
        uint_enc: (uint_enc){ __add_enc_r } \
    ); \
})

#define sub_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to sub_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to sub_enc must be a int_enc!"); \
    unsigned int __sub_enc_r = __builtin_riscv_sub_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__sub_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __sub_enc_r }, \
        uint_enc: (uint_enc){ __sub_enc_r } \
    ); \
})
 
#define sll_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to sll_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to sll_enc must be a int_enc!"); \
    unsigned int __sll_enc_r = __builtin_riscv_sll_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__sll_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __sll_enc_r }, \
        uint_enc: (uint_enc){ __sll_enc_r } \
    ); \
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
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to sltu_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), uint_enc), \
        "Error: Second argument to sltu_enc must be a int_enc!"); \
    unsigned int __sltu_enc_r = __builtin_riscv_sltu_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__sltu_enc_r); \
    (uint_enc){ __sltu_enc_r }; \
})
 
#define xor_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to xor_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to xor_enc must be a int_enc!"); \
    unsigned int __xor_enc_r = __builtin_riscv_xor_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__xor_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __xor_enc_r }, \
        uint_enc: (uint_enc){ __xor_enc_r } \
    ); \
})
 
#define srl_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to srl_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to srl_enc must be a int_enc!"); \
    unsigned int __srl_enc_r = __builtin_riscv_srl_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__srl_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __srl_enc_r }, \
        uint_enc: (uint_enc){ __srl_enc_r } \
    ); \
})
 
#define sra_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to sra_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to sra_enc must be a int_enc!"); \
    unsigned int __sra_enc_r = __builtin_riscv_sra_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__sra_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __sra_enc_r }, \
        uint_enc: (uint_enc){ __sra_enc_r } \
    ); \
})
 
#define or_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to or_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to or_enc must be a int_enc!"); \
    unsigned int __or_enc_r = __builtin_riscv_or_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__or_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __or_enc_r }, \
        uint_enc: (uint_enc){ __or_enc_r } \
    ); \
})
 
#define and_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to and_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to and_enc must be a int_enc!"); \
    unsigned int __and_enc_r = __builtin_riscv_and_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__and_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __and_enc_r }, \
        uint_enc: (uint_enc){ __and_enc_r } \
    ); \
})

// I-TYPE
#define addi_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __addi_enc_r = __builtin_riscv_addi_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__addi_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __addi_enc_r }, \
        uint_enc: (uint_enc){ __addi_enc_r } \
    ); \
})

// pseudo
#define iadd_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __iadd_enc_r = __builtin_riscv_addi_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__iadd_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __iadd_enc_r }, \
        uint_enc: (uint_enc){ __iadd_enc_r } \
    ); \
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
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an uint_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __sltiu_enc_r = __builtin_riscv_sltiu_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__sltiu_enc_r); \
    (uint_enc){ __sltiu_enc_r }; \
})
 
#define xori_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __xori_enc_r = __builtin_riscv_xori_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__xori_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __xori_enc_r }, \
        uint_enc: (uint_enc){ __xori_enc_r } \
    ); \
})

// pseudo
#define ixor_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __ixor_enc_r = __builtin_riscv_xori_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__ixor_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __ixor_enc_r }, \
        uint_enc: (uint_enc){ __ixor_enc_r } \
    ); \
})
 
#define ori_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __ori_enc_r = __builtin_riscv_ori_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__ori_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __ori_enc_r }, \
        uint_enc: (uint_enc){ __ori_enc_r } \
    ); \
})

// pseudo
#define ior_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __ior_enc_r = __builtin_riscv_ori_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__ior_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __ior_enc_r }, \
        uint_enc: (uint_enc){ __ior_enc_r } \
    ); \
})
 
#define andi_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __andi_enc_r = __builtin_riscv_andi_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__andi_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __andi_enc_r }, \
        uint_enc: (uint_enc){ __andi_enc_r } \
    ); \
})

// pseudo
#define iand_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __iand_enc_r = __builtin_riscv_andi_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__iand_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __iand_enc_r }, \
        uint_enc: (uint_enc){ __iand_enc_r } \
    ); \
})
 
#define slli_enc(rs1, shamt) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(shamt), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((shamt) >= 0 && (shamt) <= 31, \
        "Error: Shift amount must fit within a 5-bit range!"); \
    unsigned int __slli_enc_r = __builtin_riscv_slli_enc((rs1).v, (shamt)); \
    DO_NOT_OPTIMIZE(__slli_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __slli_enc_r }, \
        uint_enc: (uint_enc){ __slli_enc_r } \
    ); \
})
 
#define srli_enc(rs1, shamt) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(shamt), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((shamt) >= 0 && (shamt) <= 31, \
        "Error: Shift amount must fit within a 5-bit range!"); \
    unsigned int __srli_enc_r = __builtin_riscv_srli_enc((rs1).v, (shamt)); \
    DO_NOT_OPTIMIZE(__srli_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __srli_enc_r }, \
        uint_enc: (uint_enc){ __srli_enc_r } \
    ); \
})
 
#define srai_enc(rs1, shamt) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(shamt), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((shamt) >= 0 && (shamt) <= 31, \
        "Error: Shift amount must fit within a 5-bit range!"); \
    unsigned int __srai_enc_r = __builtin_riscv_srai_enc((rs1).v, (shamt)); \
    DO_NOT_OPTIMIZE(__srai_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __srai_enc_r }, \
        uint_enc: (uint_enc){ __srai_enc_r } \
    ); \
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

// ADVANCED PSEUDOINSTRUCTIONS
#define subi_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __subi_enc_r = __builtin_riscv_addi_enc((rs1).v, (-(imm))); \
    DO_NOT_OPTIMIZE(__subi_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __subi_enc_r }, \
        uint_enc: (uint_enc){ __subi_enc_r } \
    ); \
})

#define ZERO_REGISTER_HELPER ((int_enc){0})

#define ZERO_REGISTER ({ \
    unsigned int __zero_reg_r = __builtin_riscv_xor_enc((ZERO_REGISTER_HELPER).v, (ZERO_REGISTER_HELPER).v); \
    DO_NOT_OPTIMIZE(__zero_reg_r); \
    (int_enc){ __zero_reg_r }; \
})

#define FULL_REGISTER ({ \
    unsigned int __full_reg_r = __builtin_riscv_addi_enc((ZERO_REGISTER).v, -1); \
    DO_NOT_OPTIMIZE(__full_reg_r); \
    (int_enc){ __full_reg_r }; \
})

#define lnot_enc(arg1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to lnot_enc must be a int_enc or uint_enc!"); \
    unsigned int __lnot_enc_r = __builtin_riscv_sltiu_enc((arg1).v, 1); \
    DO_NOT_OPTIMIZE(__lnot_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __lnot_enc_r }, \
        uint_enc: (uint_enc){ __lnot_enc_r } \
    ); \
})

#define bnot_enc(arg1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to bnot_enc must be a int_enc or uint_enc!"); \
    unsigned int __bnot_enc_r = __builtin_riscv_xor_enc((arg1).v, (FULL_REGISTER).v); \
    DO_NOT_OPTIMIZE(__bnot_enc_r); \
    (__typeof__(arg1)){ __bnot_enc_r }; \
})

#define negate_enc(arg1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to negate_enc must be a int_enc!"); \
    unsigned int __negate_enc_r = __builtin_riscv_addi_enc(__builtin_riscv_xor_enc((arg1).v, (FULL_REGISTER).v), 1); \
    DO_NOT_OPTIMIZE(__negate_enc_r); \
    (int_enc){ __negate_enc_r }; \
})

#define isub_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __isub_enc_r = __builtin_riscv_addi_enc(__builtin_riscv_addi_enc(__builtin_riscv_xor_enc((rs1).v, (FULL_REGISTER).v), 1), (imm)); \
    DO_NOT_OPTIMIZE(__isub_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __isub_enc_r }, \
        uint_enc: (uint_enc){ __isub_enc_r } \
    ); \
})

#define set_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to set_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to set_enc must be a int_enc!"); \
    unsigned int __set_enc_r = __builtin_riscv_sltiu_enc(__builtin_riscv_sub_enc((arg1).v, (arg2).v), 1); \
    DO_NOT_OPTIMIZE(__set_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __set_enc_r }, \
        uint_enc: (uint_enc){ __set_enc_r } \
    ); \
})

#define seti_enc(arg1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to seti_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __seti_enc_r = __builtin_riscv_sltiu_enc(__builtin_riscv_addi_enc((arg1).v, (-(imm))), 1); \
    DO_NOT_OPTIMIZE(__seti_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __seti_enc_r }, \
        uint_enc: (uint_enc){ __seti_enc_r } \
    ); \
})

#define iset_enc(imm, arg1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to iset_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __iset_enc_r = __builtin_riscv_sltiu_enc(__builtin_riscv_addi_enc(__builtin_riscv_addi_enc(__builtin_riscv_xor_enc((arg1).v, (FULL_REGISTER).v), 1), (imm)), 1); \
    DO_NOT_OPTIMIZE(__iset_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __iset_enc_r }, \
        uint_enc: (uint_enc){ __iset_enc_r } \
    ); \
})

#define sgt_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sgt_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sgt_enc must be a int_enc!"); \
    unsigned int __sgt_enc_r = __builtin_riscv_slt_enc((arg2).v, (arg1).v); \
    DO_NOT_OPTIMIZE(__sgt_enc_r); \
    (int_enc){ __sgt_enc_r }; \
})

#define slet_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sgt_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sgt_enc must be a int_enc!"); \
    unsigned int __slet_enc_r = __builtin_riscv_or_enc( \
        __builtin_riscv_slt_enc((arg1).v, (arg2).v), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sub_enc((arg1).v, (arg2).v), 1) \
    ); \
    DO_NOT_OPTIMIZE(__slet_enc_r); \
    (int_enc){ __slet_enc_r }; \
})

#define sget_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to sgt_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc), \
        "Error: Second argument to sgt_enc must be a int_enc!"); \
    unsigned int __sget_enc_r = __builtin_riscv_or_enc( \
        __builtin_riscv_sltiu_enc(__builtin_riscv_slt_enc((arg1).v, (arg2).v), 1), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sub_enc((arg1).v, (arg2).v), 1) \
    ); \
    DO_NOT_OPTIMIZE(__sget_enc_r); \
    (int_enc){ __sget_enc_r }; \
})

#define sletu_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to sletu_enc must be a uint_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), uint_enc), \
        "Error: Second argument to sletu_enc must be a uint_enc!"); \
    unsigned int __sletu_enc_r = __builtin_riscv_or_enc( \
        __builtin_riscv_sltu_enc((arg1).v, (arg2).v), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sub_enc((arg1).v, (arg2).v), 1) \
    ); \
    DO_NOT_OPTIMIZE(__sletu_enc_r); \
    (uint_enc){ __sletu_enc_r }; \
})

#define sgetu_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to sgetu_enc must be a uint_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), uint_enc), \
        "Error: Second argument to sgetu_enc must be a uint_enc!"); \
    unsigned int __sgetu_enc_r = __builtin_riscv_sltiu_enc(__builtin_riscv_slt_enc((arg1).v, (arg2).v), 1); \
    DO_NOT_OPTIMIZE(__sgetu_enc_r); \
    (uint_enc){ __sgetu_enc_r }; \
})

#define sgtu_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to sgtu_enc must be a uint_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), uint_enc), \
        "Error: Second argument to sgtu_enc must be a uint_enc!"); \
    unsigned int __sgtu_enc_r = __builtin_riscv_sltu_enc((arg2).v, (arg1).v); \
    DO_NOT_OPTIMIZE(__sgtu_enc_r); \
    (uint_enc){ __sgtu_enc_r }; \
})

#define sgtui_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an uint_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __sgtui_enc_r = __builtin_riscv_sltiu_enc( \
        __builtin_riscv_or_enc( \
            __builtin_riscv_sltiu_enc((rs1).v, (imm)), \
            __builtin_riscv_sltiu_enc(__builtin_riscv_sub_enc((rs1).v, (imm)), 1) \
        ), 1); \
    DO_NOT_OPTIMIZE(__sgtui_enc_r); \
    (uint_enc){ __sgtui_enc_r }; \
})

#define land_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to land_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to land_enc must be a int_enc!"); \
    unsigned int __land_enc_r = __builtin_riscv_and_enc( \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((arg1).v, 0), 1), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((arg2).v, 0), 1) \
    ); \
    DO_NOT_OPTIMIZE(__land_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __land_enc_r }, \
        uint_enc: (uint_enc){ __land_enc_r } \
    ); \
})

#define lxor_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to lxor_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to lxor_enc must be a int_enc!"); \
    unsigned int __lxor_enc_r = __builtin_riscv_xor_enc( \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((arg1).v, 0), 1), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((arg2).v, 0), 1) \
    ); \
    DO_NOT_OPTIMIZE(__lxor_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __lxor_enc_r }, \
        uint_enc: (uint_enc){ __lxor_enc_r } \
    ); \
})

#define lor_enc(arg1, arg2) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to lor_enc must be a int_enc!"); \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg2), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: Second argument to lor_enc must be a int_enc!"); \
    unsigned int __lor_enc_r = __builtin_riscv_or_enc( \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((arg1).v, 0), 1), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((arg2).v, 0), 1) \
    ); \
    DO_NOT_OPTIMIZE(__lor_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __lor_enc_r }, \
        uint_enc: (uint_enc){ __lor_enc_r } \
    ); \
})

#define landi_enc(arg1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to landi_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __landi_enc_r = __builtin_riscv_andi_enc(__builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((arg1).v, 0), 1), (imm) > 0); \
    DO_NOT_OPTIMIZE(__landi_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __landi_enc_r }, \
        uint_enc: (uint_enc){ __landi_enc_r } \
    ); \
})

#define lori_enc(arg1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to lori_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __lori_enc_r = __builtin_riscv_ori_enc(__builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((arg1).v, 0), 1), (imm) > 0); \
    DO_NOT_OPTIMIZE(__lori_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __lori_enc_r }, \
        uint_enc: (uint_enc){ __lori_enc_r } \
    ); \
})

#define lxori_enc(arg1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to lxori_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __lxori_enc_r = __builtin_riscv_xori_enc(__builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((arg1).v, 0), 1), (imm) > 0); \
    DO_NOT_OPTIMIZE(__lxori_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __lxori_enc_r }, \
        uint_enc: (uint_enc){ __lxori_enc_r } \
    ); \
})

#define sleti_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __sleti_enc_r = __builtin_riscv_or_enc( \
        __builtin_riscv_slti_enc((rs1).v, (imm)), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_addi_enc((rs1).v, (-(imm))), 1) \
    ); \
    DO_NOT_OPTIMIZE(__sleti_enc_r); \
    (int_enc){ __sleti_enc_r }; \
})

#define sgti_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __sgti_enc_r = __builtin_riscv_sltiu_enc( \
        __builtin_riscv_or_enc( \
            __builtin_riscv_slti_enc((rs1).v, imm), \
            __builtin_riscv_sltiu_enc(__builtin_riscv_sub_enc((rs1).v, (imm)), 1) \
        ), 1); \
    DO_NOT_OPTIMIZE(__sgti_enc_r); \
    (int_enc){ __sgti_enc_r }; \
})

#define sgeti_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __sgeti_enc_r = __builtin_riscv_sltiu_enc(__builtin_riscv_slti_enc((rs1).v, (imm)), 1); \
    DO_NOT_OPTIMIZE(__sgeti_enc_r); \
    (int_enc){ __sgeti_enc_r }; \
})

#define sletiu_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __sletiu_enc_r = __builtin_riscv_or_enc( \
        __builtin_riscv_sltiu_enc((rs1).v, (imm)), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_addi_enc((rs1).v, (-(imm))), 1) \
    ); \
    DO_NOT_OPTIMIZE(__sletiu_enc_r); \
    (uint_enc){ __sletiu_enc_r }; \
})

#define sgtiu_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __sgtiu_enc_r = __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((rs1).v, imm), 1); \
    DO_NOT_OPTIMIZE(__sgtiu_enc_r); \
    (uint_enc){ __sgtiu_enc_r }; \
})

#define sgetiu_enc(rs1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __sgetiu_enc_r = __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((rs1).v, (imm)), 1); \
    DO_NOT_OPTIMIZE(__sgetiu_enc_r); \
    (uint_enc){ __sgetiu_enc_r }; \
})

#define iland_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: First argument to iland_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __iland_enc_r = __builtin_riscv_andi_enc( \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((rs1).v, 0), 1), \
        imm > 0 \
    ); \
    DO_NOT_OPTIMIZE(__iland_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __iland_enc_r }, \
        uint_enc: (uint_enc){ __iland_enc_r } \
    ); \
})

#define ilor_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: First argument to ilor_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __ilor_enc_r = __builtin_riscv_ori_enc( \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((rs1).v, 0), 1), \
        imm > 0 \
    ); \
    DO_NOT_OPTIMIZE(__ilor_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __ilor_enc_r }, \
        uint_enc: (uint_enc){ __ilor_enc_r } \
    ); \
})

#define ilxor_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: First argument to ilxor_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __ilxor_enc_r = __builtin_riscv_xori_enc( \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((rs1).v, 0), 1), \
        imm > 0 \
    ); \
    DO_NOT_OPTIMIZE(__ilxor_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __ilxor_enc_r }, \
        uint_enc: (uint_enc){ __ilxor_enc_r } \
    ); \
})

#define isll_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: First argument to isll_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __isll_enc_r = __builtin_riscv_sll_enc( \
        __builtin_riscv_xori_enc((ZERO_REGISTER).v, (imm)), \
        (rs1).v \
    ); \
    DO_NOT_OPTIMIZE(__isll_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __isll_enc_r }, \
        uint_enc: (uint_enc){ __isll_enc_r } \
    ); \
})

#define isrl_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc) || __builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: First argument to isrl_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __isrl_enc_r = __builtin_riscv_srl_enc( \
        __builtin_riscv_xori_enc((ZERO_REGISTER).v, (imm)), \
        (rs1).v \
    ); \
    DO_NOT_OPTIMIZE(__isrl_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __isrl_enc_r }, \
        uint_enc: (uint_enc){ __isrl_enc_r } \
    ); \
})

#define islt_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: First argument to islt_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __islt_enc_r = __builtin_riscv_sltiu_enc(__builtin_riscv_slti_enc((rs1).v, imm), 1); \
    DO_NOT_OPTIMIZE(__islt_enc_r); \
    (int_enc){ __islt_enc_r }; \
})

#define islet_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: First argument to islet_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __islet_enc_r = __builtin_riscv_or_enc( \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc(__builtin_riscv_slti_enc((rs1).v, imm), 1), 1), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc(__builtin_riscv_sub_enc((rs1).v, imm), 1), 0), 1) \
    ); \
    DO_NOT_OPTIMIZE(__islet_enc_r); \
    (int_enc){ __islet_enc_r }; \
})

#define isgt_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __isgt_enc_r = __builtin_riscv_slti_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__isgt_enc_r); \
    (int_enc){ __isgt_enc_r }; \
})

#define isget_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), int_enc), \
        "Error: First argument to isget_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __isget_enc_r = __builtin_riscv_or_enc( \
        __builtin_riscv_slti_enc((rs1).v, (imm)), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_addi_enc((rs1).v, (-(imm))), 1) \
    ); \
    DO_NOT_OPTIMIZE(__isget_enc_r); \
    (int_enc){ __isget_enc_r }; \
})

#define isltu_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: First argument to isltu_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __isltu_enc_r = __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((rs1).v, imm), 1); \
    DO_NOT_OPTIMIZE(__isltu_enc_r); \
    (uint_enc){ __isltu_enc_r }; \
})

#define isletu_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: First argument to isletu_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __isletu_enc_r = __builtin_riscv_or_enc( \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((rs1).v, imm), 1), 1), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc(__builtin_riscv_sub_enc((rs1).v, imm), 1), 0), 1) \
    ); \
    DO_NOT_OPTIMIZE(__isletu_enc_r); \
    (uint_enc){ __isletu_enc_r }; \
})

#define isgtu_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: Source register argument must be an int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    _Static_assert((imm) >= -2048 && (imm) <= 2047, \
        "Error: RISC-V I-type immediates must fit within a signed 12-bit range!"); \
    unsigned int __isgtu_enc_r = __builtin_riscv_sltiu_enc((rs1).v, (imm)); \
    DO_NOT_OPTIMIZE(__isgtu_enc_r); \
    (uint_enc){ __isgtu_enc_r }; \
})

#define isgetu_enc(imm, rs1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(rs1), uint_enc), \
        "Error: First argument to isgetu_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __isgetu_enc_r = __builtin_riscv_or_enc( \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc((rs1).v, (imm)), 1), \
        __builtin_riscv_sltiu_enc(__builtin_riscv_sltiu_enc(__builtin_riscv_sub_enc((rs1).v, imm), 1), 1) \
    ); \
    DO_NOT_OPTIMIZE(__isgetu_enc_r); \
    (uint_enc){ __isgetu_enc_r }; \
})

#endif // ENCRYPTED_TYPES_H