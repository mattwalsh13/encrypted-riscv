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
    unsigned int __subi_enc_r = __builtin_riscv_addi_enc((rs1).v, (-imm)); \
    DO_NOT_OPTIMIZE(__subi_enc_r); \
    _Generic((rs1), \
        int_enc:  (int_enc){ __subi_enc_r }, \
        uint_enc: (uint_enc){ __subi_enc_r } \
    ); \
})

#define ZERO_REGISTER_HELPER ((int_enc){ 0 })
#define ZERO_REGISTER xor_enc(ZERO_REGISTER_HELPER, ZERO_REGISTER_HELPER)
#define FULL_REGISTER addi_enc(ZERO_REGISTER, -1)

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
    unsigned int __bnot_enc_r = __builtin_riscv_xor_enc((arg1).v, FULL_REGISTER.v); \
    DO_NOT_OPTIMIZE(__bnot_enc_r); \
    (__typeof__(arg1)){ __bnot_enc_r }; \
})

#define negate_enc(arg1) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc), \
        "Error: First argument to negate_enc must be a int_enc or uint_enc!"); \
    unsigned int __negate_enc_r = __builtin_riscv_addi_enc(__builtin_riscv_xor_enc((arg1).v, FULL_REGISTER.v), 1); \
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
    unsigned int __isub_enc_r = __builtin_riscv_addi_enc(negate_enc((rs1).v), (imm)); \
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
    unsigned int __set_enc_r = lnot_enc(sub_enc(arg1, arg2)).v; \
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
    unsigned int __seti_enc_r = lnot_enc(subi_enc((arg1).v, (imm))).v; \
    DO_NOT_OPTIMIZE(__seti_enc_r); \
    _Generic((arg1), \
        int_enc:  (int_enc){ __seti_enc_r }, \
        uint_enc: (uint_enc){ __seti_enc_r } \
    ); \
})

#define iset_enc(arg1, imm) ({ \
    _Static_assert(__builtin_types_compatible_p(__typeof__(arg1), int_enc) || __builtin_types_compatible_p(__typeof__(arg1), uint_enc), \
        "Error: First argument to iset_enc must be a int_enc!"); \
    _Static_assert(__builtin_constant_p(imm), \
        "Error: Immediate argument must be a compile-time constant literal!"); \
    unsigned int __iset_enc_r = lnot_enc(isub_enc((imm), (arg1).v)).v; \
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
    unsigned int __sgt_enc_r = slt_enc((arg1).v, (arg2).v); \
    DO_NOT_OPTIMIZE(__sgt_enc_r); \
    (int_enc){ __sgt_enc_r }; \
})

#endif // ENCRYPTED_TYPES_H