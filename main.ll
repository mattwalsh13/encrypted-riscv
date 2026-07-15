; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

%struct.int_enc = type { i32 }

@__const.main.x = private unnamed_addr constant %struct.int_enc { i32 13 }, align 4
@__const.main.y = private unnamed_addr constant %struct.int_enc { i32 7 }, align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.int_enc, align 4
  %y = alloca %struct.int_enc, align 4
  %result = alloca %struct.int_enc, align 4
  %__add_enc_r = alloca i32, align 4
  %.compoundliteral = alloca %struct.int_enc, align 4
  %__sub_enc_r = alloca i32, align 4
  %.compoundliteral5 = alloca %struct.int_enc, align 4
  %__sll_enc_r = alloca i32, align 4
  %.compoundliteral9 = alloca %struct.int_enc, align 4
  %__slt_enc_r = alloca i32, align 4
  %.compoundliteral13 = alloca %struct.int_enc, align 4
  %__sltu_enc_r = alloca i32, align 4
  %.compoundliteral17 = alloca %struct.int_enc, align 4
  %__xor_enc_r = alloca i32, align 4
  %.compoundliteral21 = alloca %struct.int_enc, align 4
  %__srl_enc_r = alloca i32, align 4
  %.compoundliteral25 = alloca %struct.int_enc, align 4
  %__sra_enc_r = alloca i32, align 4
  %.compoundliteral29 = alloca %struct.int_enc, align 4
  %__or_enc_r = alloca i32, align 4
  %.compoundliteral33 = alloca %struct.int_enc, align 4
  %__and_enc_r = alloca i32, align 4
  %.compoundliteral37 = alloca %struct.int_enc, align 4
  %__addi_enc_r = alloca i32, align 4
  %.compoundliteral40 = alloca %struct.int_enc, align 4
  %__slti_enc_r = alloca i32, align 4
  %.compoundliteral43 = alloca %struct.int_enc, align 4
  %__sltiu_enc_r = alloca i32, align 4
  %.compoundliteral46 = alloca %struct.int_enc, align 4
  %__xori_enc_r = alloca i32, align 4
  %.compoundliteral49 = alloca %struct.int_enc, align 4
  %__andi_enc_r = alloca i32, align 4
  %.compoundliteral52 = alloca %struct.int_enc, align 4
  %__slli_enc_r = alloca i32, align 4
  %.compoundliteral55 = alloca %struct.int_enc, align 4
  %__srli_enc_r = alloca i32, align 4
  %.compoundliteral58 = alloca %struct.int_enc, align 4
  %__srai_enc_r = alloca i32, align 4
  %.compoundliteral61 = alloca %struct.int_enc, align 4
  %__cmov_enc_r = alloca i32, align 4
  %.compoundliteral66 = alloca %struct.int_enc, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 @__const.main.x, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %y, ptr align 4 @__const.main.y, i32 4, i1 false)
  %v = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %0 = load i32, ptr %v, align 4
  %v1 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %1 = load i32, ptr %v1, align 4
  %2 = call i32 @llvm.riscv.add.enc(i32 %0, i32 %1)
  store i32 %2, ptr %__add_enc_r, align 4
  %3 = load i32, ptr %__add_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %3) #3, !srcloc !6
  %v2 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral, i32 0, i32 0
  %4 = load i32, ptr %__add_enc_r, align 4
  store i32 %4, ptr %v2, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral, i32 4, i1 false)
  %v3 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %5 = load i32, ptr %v3, align 4
  %v4 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %6 = load i32, ptr %v4, align 4
  %7 = call i32 @llvm.riscv.sub.enc(i32 %5, i32 %6)
  store i32 %7, ptr %__sub_enc_r, align 4
  %8 = load i32, ptr %__sub_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %8) #3, !srcloc !7
  %v6 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral5, i32 0, i32 0
  %9 = load i32, ptr %__sub_enc_r, align 4
  store i32 %9, ptr %v6, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral5, i32 4, i1 false)
  %v7 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %10 = load i32, ptr %v7, align 4
  %v8 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %11 = load i32, ptr %v8, align 4
  %12 = call i32 @llvm.riscv.sll.enc(i32 %10, i32 %11)
  store i32 %12, ptr %__sll_enc_r, align 4
  %13 = load i32, ptr %__sll_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %13) #3, !srcloc !8
  %v10 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral9, i32 0, i32 0
  %14 = load i32, ptr %__sll_enc_r, align 4
  store i32 %14, ptr %v10, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral9, i32 4, i1 false)
  %v11 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %15 = load i32, ptr %v11, align 4
  %v12 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %16 = load i32, ptr %v12, align 4
  %17 = call i32 @llvm.riscv.slt.enc(i32 %15, i32 %16)
  store i32 %17, ptr %__slt_enc_r, align 4
  %18 = load i32, ptr %__slt_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %18) #3, !srcloc !9
  %v14 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral13, i32 0, i32 0
  %19 = load i32, ptr %__slt_enc_r, align 4
  store i32 %19, ptr %v14, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral13, i32 4, i1 false)
  %v15 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %20 = load i32, ptr %v15, align 4
  %v16 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %21 = load i32, ptr %v16, align 4
  %22 = call i32 @llvm.riscv.sltu.enc(i32 %20, i32 %21)
  store i32 %22, ptr %__sltu_enc_r, align 4
  %23 = load i32, ptr %__sltu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %23) #3, !srcloc !10
  %v18 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral17, i32 0, i32 0
  %24 = load i32, ptr %__sltu_enc_r, align 4
  store i32 %24, ptr %v18, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral17, i32 4, i1 false)
  %v19 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %25 = load i32, ptr %v19, align 4
  %v20 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %26 = load i32, ptr %v20, align 4
  %27 = call i32 @llvm.riscv.xor.enc(i32 %25, i32 %26)
  store i32 %27, ptr %__xor_enc_r, align 4
  %28 = load i32, ptr %__xor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %28) #3, !srcloc !11
  %v22 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral21, i32 0, i32 0
  %29 = load i32, ptr %__xor_enc_r, align 4
  store i32 %29, ptr %v22, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral21, i32 4, i1 false)
  %v23 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %30 = load i32, ptr %v23, align 4
  %v24 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %31 = load i32, ptr %v24, align 4
  %32 = call i32 @llvm.riscv.srl.enc(i32 %30, i32 %31)
  store i32 %32, ptr %__srl_enc_r, align 4
  %33 = load i32, ptr %__srl_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %33) #3, !srcloc !12
  %v26 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral25, i32 0, i32 0
  %34 = load i32, ptr %__srl_enc_r, align 4
  store i32 %34, ptr %v26, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral25, i32 4, i1 false)
  %v27 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %35 = load i32, ptr %v27, align 4
  %v28 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %36 = load i32, ptr %v28, align 4
  %37 = call i32 @llvm.riscv.sra.enc(i32 %35, i32 %36)
  store i32 %37, ptr %__sra_enc_r, align 4
  %38 = load i32, ptr %__sra_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %38) #3, !srcloc !13
  %v30 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral29, i32 0, i32 0
  %39 = load i32, ptr %__sra_enc_r, align 4
  store i32 %39, ptr %v30, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral29, i32 4, i1 false)
  %v31 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %40 = load i32, ptr %v31, align 4
  %v32 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %41 = load i32, ptr %v32, align 4
  %42 = call i32 @llvm.riscv.or.enc(i32 %40, i32 %41)
  store i32 %42, ptr %__or_enc_r, align 4
  %43 = load i32, ptr %__or_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %43) #3, !srcloc !14
  %v34 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral33, i32 0, i32 0
  %44 = load i32, ptr %__or_enc_r, align 4
  store i32 %44, ptr %v34, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral33, i32 4, i1 false)
  %v35 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %45 = load i32, ptr %v35, align 4
  %v36 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %46 = load i32, ptr %v36, align 4
  %47 = call i32 @llvm.riscv.and.enc(i32 %45, i32 %46)
  store i32 %47, ptr %__and_enc_r, align 4
  %48 = load i32, ptr %__and_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %48) #3, !srcloc !15
  %v38 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral37, i32 0, i32 0
  %49 = load i32, ptr %__and_enc_r, align 4
  store i32 %49, ptr %v38, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral37, i32 4, i1 false)
  %v39 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %50 = load i32, ptr %v39, align 4
  %51 = call i32 @llvm.riscv.addi.enc(i32 %50, i32 13)
  store i32 %51, ptr %__addi_enc_r, align 4
  %52 = load i32, ptr %__addi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %52) #3, !srcloc !16
  %v41 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral40, i32 0, i32 0
  %53 = load i32, ptr %__addi_enc_r, align 4
  store i32 %53, ptr %v41, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral40, i32 4, i1 false)
  %v42 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %54 = load i32, ptr %v42, align 4
  %55 = call i32 @llvm.riscv.slti.enc(i32 %54, i32 13)
  store i32 %55, ptr %__slti_enc_r, align 4
  %56 = load i32, ptr %__slti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %56) #3, !srcloc !17
  %v44 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral43, i32 0, i32 0
  %57 = load i32, ptr %__slti_enc_r, align 4
  store i32 %57, ptr %v44, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral43, i32 4, i1 false)
  %v45 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %58 = load i32, ptr %v45, align 4
  %59 = call i32 @llvm.riscv.sltiu.enc(i32 %58, i32 13)
  store i32 %59, ptr %__sltiu_enc_r, align 4
  %60 = load i32, ptr %__sltiu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %60) #3, !srcloc !18
  %v47 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral46, i32 0, i32 0
  %61 = load i32, ptr %__sltiu_enc_r, align 4
  store i32 %61, ptr %v47, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral46, i32 4, i1 false)
  %v48 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %62 = load i32, ptr %v48, align 4
  %63 = call i32 @llvm.riscv.xori.enc(i32 %62, i32 13)
  store i32 %63, ptr %__xori_enc_r, align 4
  %64 = load i32, ptr %__xori_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %64) #3, !srcloc !19
  %v50 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral49, i32 0, i32 0
  %65 = load i32, ptr %__xori_enc_r, align 4
  store i32 %65, ptr %v50, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral49, i32 4, i1 false)
  %v51 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %66 = load i32, ptr %v51, align 4
  %67 = call i32 @llvm.riscv.andi.enc(i32 %66, i32 13)
  store i32 %67, ptr %__andi_enc_r, align 4
  %68 = load i32, ptr %__andi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %68) #3, !srcloc !20
  %v53 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral52, i32 0, i32 0
  %69 = load i32, ptr %__andi_enc_r, align 4
  store i32 %69, ptr %v53, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral52, i32 4, i1 false)
  %v54 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %70 = load i32, ptr %v54, align 4
  %71 = call i32 @llvm.riscv.slli.enc(i32 %70, i32 13)
  store i32 %71, ptr %__slli_enc_r, align 4
  %72 = load i32, ptr %__slli_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %72) #3, !srcloc !21
  %v56 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral55, i32 0, i32 0
  %73 = load i32, ptr %__slli_enc_r, align 4
  store i32 %73, ptr %v56, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral55, i32 4, i1 false)
  %v57 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %74 = load i32, ptr %v57, align 4
  %75 = call i32 @llvm.riscv.srli.enc(i32 %74, i32 13)
  store i32 %75, ptr %__srli_enc_r, align 4
  %76 = load i32, ptr %__srli_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %76) #3, !srcloc !22
  %v59 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral58, i32 0, i32 0
  %77 = load i32, ptr %__srli_enc_r, align 4
  store i32 %77, ptr %v59, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral58, i32 4, i1 false)
  %v60 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %78 = load i32, ptr %v60, align 4
  %79 = call i32 @llvm.riscv.srai.enc(i32 %78, i32 13)
  store i32 %79, ptr %__srai_enc_r, align 4
  %80 = load i32, ptr %__srai_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %80) #3, !srcloc !23
  %v62 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral61, i32 0, i32 0
  %81 = load i32, ptr %__srai_enc_r, align 4
  store i32 %81, ptr %v62, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral61, i32 4, i1 false)
  %v63 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %82 = load i32, ptr %v63, align 4
  %v64 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %83 = load i32, ptr %v64, align 4
  %v65 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %84 = load i32, ptr %v65, align 4
  %85 = call i32 @llvm.riscv.cmov.enc(i32 %82, i32 %83, i32 %84)
  store i32 %85, ptr %__cmov_enc_r, align 4
  %86 = load i32, ptr %__cmov_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %86) #3, !srcloc !24
  %v67 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral66, i32 0, i32 0
  %87 = load i32, ptr %__cmov_enc_r, align 4
  store i32 %87, ptr %v67, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral66, i32 4, i1 false)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.add.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sub.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sll.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.slt.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sltu.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.xor.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.srl.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sra.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.or.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.and.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.addi.enc(i32, i32 immarg) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.slti.enc(i32, i32 immarg) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sltiu.enc(i32, i32 immarg) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.xori.enc(i32, i32 immarg) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.andi.enc(i32, i32 immarg) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.slli.enc(i32, i32 immarg) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.srli.enc(i32, i32 immarg) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.srai.enc(i32, i32 immarg) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.cmov.enc(i32, i32, i32) #2

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xqccmt,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-y,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvabd,-experimental-zvbc32e,-experimental-zvdot4a8i,-experimental-zvfbdota32f,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvfqwbdota8f,-experimental-zvfqwdota8f,-experimental-zvfwbdota16bf,-experimental-zvfwdota16bf,-experimental-zvkgs,-experimental-zvqwbdota16i,-experimental-zvqwbdota8i,-experimental-zvqwdota16i,-experimental-zvqwdota8i,-experimental-zvvfmm,-experimental-zvvmm,-experimental-zvvmtls,-experimental-zvvmttls,-experimental-zvzip,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svrsw60t59b,-svvptc,-v,-xaifet,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcheriot,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xsmtvdotii,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccid,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"target-abi", !"ilp32"}
!1 = !{i32 6, !"riscv-isa", !2}
!2 = !{!"rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0"}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{i32 8, !"SmallDataLimit", i32 0}
!5 = !{!"clang version 23.0.0git (https://github.com/mattwalsh13/encrypted-riscv.git f76699ba303d347bc32d95d9fa55bdedc4c52bed)"}
!6 = !{i64 2147513328}
!7 = !{i64 2147513834}
!8 = !{i64 2147514340}
!9 = !{i64 2147514846}
!10 = !{i64 2147515358}
!11 = !{i64 2147515865}
!12 = !{i64 2147516371}
!13 = !{i64 2147516877}
!14 = !{i64 2147517377}
!15 = !{i64 2147517882}
!16 = !{i64 2147518518}
!17 = !{i64 2147519155}
!18 = !{i64 2147519796}
!19 = !{i64 2147520434}
!20 = !{i64 2147521071}
!21 = !{i64 2147521690}
!22 = !{i64 2147522309}
!23 = !{i64 2147522928}
!24 = !{i64 2147523610}
