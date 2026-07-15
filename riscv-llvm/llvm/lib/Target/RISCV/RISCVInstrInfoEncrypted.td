// === ENCRYPTED R-TYPE INSTRUCTIONS ===
class RTuple<string n, bits<3> f3, bits<7> f7> {
  string name = n;
  bits<3> funct3 = f3;
  bits<7> funct7 = f7;
}

foreach op = [
  RTuple<"ADD",  0b000, 0b0000000>,
  RTuple<"SUB",  0b000, 0b0100000>,
  RTuple<"SLL",  0b001, 0b0000000>,
  RTuple<"SLT",  0b010, 0b0000000>,
  RTuple<"SLTU", 0b011, 0b0000000>,
  RTuple<"XOR",  0b100, 0b0000000>,
  RTuple<"SRL",  0b101, 0b0000000>,
  RTuple<"SRA",  0b101, 0b0100000>,
  RTuple<"OR",   0b110, 0b0000000>,
  RTuple<"AND",  0b111, 0b0000000>
] in {
  def op.name # "_ENC" : Instruction {
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

    let Inst{31-25} = op.funct7;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = op.funct3;
    let Inst{11-7}  = rd;
    let Inst{6-0}   = 0b1011011;

    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList  = (ins GPR:$rs1, GPR:$rs2);
    let AsmString = !tolower(op.name) # "_enc\t$rd, $rs1, $rs2";
  }

  def : Pat<(!cast<Intrinsic>("int_riscv_" # !tolower(op.name) # "_enc") GPR:$rs1, GPR:$rs2), 
            (!cast<Instruction>(op.name # "_ENC") GPR:$rs1, GPR:$rs2)>;
}

// === ENCRYPTED I-TYPE INSTRUCTIONS ===
class ITuple<string n, bits<3> f3> {
  string name = n;
  bits<3> funct3 = f3;
}
// Non-shifting
foreach op = [
  ITuple<"ADDI",  0b000>,
  ITuple<"SLTI",  0b010>,
  ITuple<"SLTIU", 0b011>,
  ITuple<"XORI",  0b100>,
  ITuple<"ORI",   0b110>,
  ITuple<"ANDI",  0b111>,
] in {
  def op.name # "_ENC" : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<12> imm; bits<5> rs1; bits<5> rd;
    let Namespace = "RISCV"; let Size = 4;
    let hasSideEffects = 0; let mayLoad = 0; let mayStore = 0;

    let Inst{31-20} = imm;
    let Inst{19-15} = rs1;
    let Inst{14-12} = op.funct3;
    let Inst{11-7}  = rd;
    let Inst{6-0}   = 0b0001011;

    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList  = (ins GPR:$rs1, simm12:$imm);
    let AsmString = !tolower(op.name) # "_enc\t$rd, $rs1, $imm";
  }

  def : Pat<(!cast<Intrinsic>("int_riscv_" # !tolower(op.name) # "_enc") GPR:$rs1, imm:$imm), 
            (!cast<Instruction>(op.name # "_ENC") GPR:$rs1, i32imm:$imm)>;
}

// Shifting
foreach op = [
  RTuple<"SLLI",  0b001, 0b0000000>,
  RTuple<"SRLI",  0b101, 0b0000000>,
  RTuple<"SRAI",  0b101, 0b0100000>,
] in {
  def op.name # "_ENC" : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> shamt; bits<5> rs1; bits<5> rd;
    let Namespace = "RISCV"; let Size = 4;
    let hasSideEffects = 0; let mayLoad = 0; let mayStore = 0;

    let Inst{31-25} = op.funct7;
    let Inst{24-20} = shamt;
    let Inst{19-15} = rs1;
    let Inst{14-12} = op.funct3;
    let Inst{11-7}  = rd;
    let Inst{6-0}   = 0b0001011;

    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList  = (ins GPR:$rs1, uimm5:$shamt);
    let AsmString = !tolower(op.name) # "_enc\t$rd, $rs1, $shamt";
  }

  def : Pat<(!cast<Intrinsic>("int_riscv_" # !tolower(op.name) # "_enc") GPR:$rs1, imm:$shamt), 
            (!cast<Instruction>(op.name # "_ENC") GPR:$rs1, i32imm:$shamt)>;
}

// === ENCRYPTED CMOV ===
def CMOV_ENC : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<5> rs3;
    bits<5> rs2; 
    bits<5> rs1; 
    bits<5> rd;
    let Namespace = "RISCV"; 
    let Size = 4;
    let hasSideEffects = 0; 
    let mayLoad = 0; 
    let mayStore = 0;
    let Inst{31-27} = rs3;
    let Inst{26-25} = 0b11;
    let Inst{24-20} = rs2;
    let Inst{19-15} = rs1;
    let Inst{14-12} = 0b101;
    let Inst{11-7}  = rd;
    let Inst{6-0}   = 0b0101011;

    dag OutOperandList = (outs GPR:$rd);
    dag InOperandList  = (ins GPR:$rs1, GPR:$rs2, GPR:$rs3);
    let AsmString = "cmov_enc\t$rd, $rs3, $rs2, $rs1";
}

def : Pat<(int_riscv_cmov_enc GPR:$rs1, GPR:$rs2, GPR:$rs3), (CMOV_ENC GPR:$rs1, GPR:$rs2, GPR:$rs3)>;