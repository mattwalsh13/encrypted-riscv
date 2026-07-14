// === ENCRYPTED ADD ===
def ADD_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000000; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b000; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1011011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "add_enc\t$rd, $rs1, $rs2";
}

def : Pat<(int_riscv_add_enc GPR:$rs1, GPR:$rs2), (ADD_ENC GPR:$rs1, GPR:$rs2)>;

// === ENCRYPTED SUB ===
def SUB_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0100000; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b000; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1011011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "sub_enc\t$rd, $rs1, $rs2";
}

def : Pat<(int_riscv_sub_enc GPR:$rs1, GPR:$rs2), (SUB_ENC GPR:$rs1, GPR:$rs2)>;

// === ENCRYPTED SLL ===
def SLL_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000000; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b001; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1011011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "sll_enc\t$rd, $rs1, $rs2";
}

def : Pat<(int_riscv_sll_enc GPR:$rs1, GPR:$rs2), (SLL_ENC GPR:$rs1, GPR:$rs2)>;

// === ENCRYPTED SLT ===
def SLT_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000000; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b010; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1011011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "slt_enc\t$rd, $rs1, $rs2";
}

def : Pat<(int_riscv_slt_enc GPR:$rs1, GPR:$rs2), (SLT_ENC GPR:$rs1, GPR:$rs2)>;

// === ENCRYPTED SLTU ===
def SLTU_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000000; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b011; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1011011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "sltu_enc\t$rd, $rs1, $rs2";
}

def : Pat<(int_riscv_sltu_enc GPR:$rs1, GPR:$rs2), (SLTU_ENC GPR:$rs1, GPR:$rs2)>;

// === ENCRYPTED XOR ===
def XOR_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000000; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b100; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1011011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "xor_enc\t$rd, $rs1, $rs2";
}

def : Pat<(int_riscv_xor_enc GPR:$rs1, GPR:$rs2), (XOR_ENC GPR:$rs1, GPR:$rs2)>;

// === ENCRYPTED SRL ===
def SRL_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000000; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b101; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1011011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "srl_enc\t$rd, $rs1, $rs2";
}

def : Pat<(int_riscv_srl_enc GPR:$rs1, GPR:$rs2), (SRL_ENC GPR:$rs1, GPR:$rs2)>;

// === ENCRYPTED SRA ===
def SRA_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0100000; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b101; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1011011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "sra_enc\t$rd, $rs1, $rs2";
}

def : Pat<(int_riscv_sra_enc GPR:$rs1, GPR:$rs2), (SRA_ENC GPR:$rs1, GPR:$rs2)>;

// === ENCRYPTED OR ===
def OR_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000000; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b110; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1011011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "or_enc\t$rd, $rs1, $rs2";
}

def : Pat<(int_riscv_or_enc GPR:$rs1, GPR:$rs2), (OR_ENC GPR:$rs1, GPR:$rs2)>;

// === ENCRYPTED AND ===
def AND_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs2;
    bits<5> rs1;
    bits<5> rd;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 0;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-25} = 0b0000000; /*funct7*/  
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b111; /*funct3*/
    let Inst{11-7} = rd;
    let Inst{6-0} = 0b1011011; /*opcode*/
    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = "and_enc\t$rd, $rs1, $rs2";
}

def : Pat<(int_riscv_and_enc GPR:$rs1, GPR:$rs2), (AND_ENC GPR:$rs1, GPR:$rs2)>;

