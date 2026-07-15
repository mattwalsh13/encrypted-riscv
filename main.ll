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
  %.compoundliteral = alloca %struct.int_enc, align 4
  %.compoundliteral4 = alloca %struct.int_enc, align 4
  %.compoundliteral9 = alloca %struct.int_enc, align 4
  %.compoundliteral14 = alloca %struct.int_enc, align 4
  %.compoundliteral19 = alloca %struct.int_enc, align 4
  %.compoundliteral24 = alloca %struct.int_enc, align 4
  %.compoundliteral29 = alloca %struct.int_enc, align 4
  %.compoundliteral34 = alloca %struct.int_enc, align 4
  %.compoundliteral39 = alloca %struct.int_enc, align 4
  %.compoundliteral44 = alloca %struct.int_enc, align 4
  %.compoundliteral49 = alloca %struct.int_enc, align 4
  %.compoundliteral53 = alloca %struct.int_enc, align 4
  %.compoundliteral57 = alloca %struct.int_enc, align 4
  %.compoundliteral61 = alloca %struct.int_enc, align 4
  %.compoundliteral65 = alloca %struct.int_enc, align 4
  %.compoundliteral69 = alloca %struct.int_enc, align 4
  %.compoundliteral73 = alloca %struct.int_enc, align 4
  %.compoundliteral77 = alloca %struct.int_enc, align 4
  %.compoundliteral81 = alloca %struct.int_enc, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 @__const.main.x, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %y, ptr align 4 @__const.main.y, i32 4, i1 false)
  %v = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral, i32 0, i32 0
  %v1 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %0 = load i32, ptr %v1, align 4
  %v2 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %1 = load i32, ptr %v2, align 4
  %2 = call i32 @llvm.riscv.add.enc(i32 %0, i32 %1)
  store i32 %2, ptr %v, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral, i32 4, i1 false)
  %v3 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %3 = load i32, ptr %v3, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %3) #3, !srcloc !6
  %v5 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral4, i32 0, i32 0
  %v6 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %4 = load i32, ptr %v6, align 4
  %v7 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %5 = load i32, ptr %v7, align 4
  %6 = call i32 @llvm.riscv.sub.enc(i32 %4, i32 %5)
  store i32 %6, ptr %v5, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral4, i32 4, i1 false)
  %v8 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %7 = load i32, ptr %v8, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %7) #3, !srcloc !7
  %v10 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral9, i32 0, i32 0
  %v11 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %8 = load i32, ptr %v11, align 4
  %v12 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %9 = load i32, ptr %v12, align 4
  %10 = call i32 @llvm.riscv.sll.enc(i32 %8, i32 %9)
  store i32 %10, ptr %v10, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral9, i32 4, i1 false)
  %v13 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %11 = load i32, ptr %v13, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %11) #3, !srcloc !8
  %v15 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral14, i32 0, i32 0
  %v16 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %12 = load i32, ptr %v16, align 4
  %v17 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %13 = load i32, ptr %v17, align 4
  %14 = call i32 @llvm.riscv.slt.enc(i32 %12, i32 %13)
  store i32 %14, ptr %v15, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral14, i32 4, i1 false)
  %v18 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %15 = load i32, ptr %v18, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %15) #3, !srcloc !9
  %v20 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral19, i32 0, i32 0
  %v21 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %16 = load i32, ptr %v21, align 4
  %v22 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %17 = load i32, ptr %v22, align 4
  %18 = call i32 @llvm.riscv.sltu.enc(i32 %16, i32 %17)
  store i32 %18, ptr %v20, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral19, i32 4, i1 false)
  %v23 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %19 = load i32, ptr %v23, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %19) #3, !srcloc !10
  %v25 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral24, i32 0, i32 0
  %v26 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %20 = load i32, ptr %v26, align 4
  %v27 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %21 = load i32, ptr %v27, align 4
  %22 = call i32 @llvm.riscv.xor.enc(i32 %20, i32 %21)
  store i32 %22, ptr %v25, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral24, i32 4, i1 false)
  %v28 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %23 = load i32, ptr %v28, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %23) #3, !srcloc !11
  %v30 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral29, i32 0, i32 0
  %v31 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %24 = load i32, ptr %v31, align 4
  %v32 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %25 = load i32, ptr %v32, align 4
  %26 = call i32 @llvm.riscv.srl.enc(i32 %24, i32 %25)
  store i32 %26, ptr %v30, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral29, i32 4, i1 false)
  %v33 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %27 = load i32, ptr %v33, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %27) #3, !srcloc !12
  %v35 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral34, i32 0, i32 0
  %v36 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %28 = load i32, ptr %v36, align 4
  %v37 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %29 = load i32, ptr %v37, align 4
  %30 = call i32 @llvm.riscv.sra.enc(i32 %28, i32 %29)
  store i32 %30, ptr %v35, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral34, i32 4, i1 false)
  %v38 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %31 = load i32, ptr %v38, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %31) #3, !srcloc !13
  %v40 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral39, i32 0, i32 0
  %v41 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %32 = load i32, ptr %v41, align 4
  %v42 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %33 = load i32, ptr %v42, align 4
  %34 = call i32 @llvm.riscv.or.enc(i32 %32, i32 %33)
  store i32 %34, ptr %v40, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral39, i32 4, i1 false)
  %v43 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %35 = load i32, ptr %v43, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %35) #3, !srcloc !14
  %v45 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral44, i32 0, i32 0
  %v46 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %36 = load i32, ptr %v46, align 4
  %v47 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %37 = load i32, ptr %v47, align 4
  %38 = call i32 @llvm.riscv.and.enc(i32 %36, i32 %37)
  store i32 %38, ptr %v45, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral44, i32 4, i1 false)
  %v48 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %39 = load i32, ptr %v48, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %39) #3, !srcloc !15
  %v50 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral49, i32 0, i32 0
  %v51 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %40 = load i32, ptr %v51, align 4
  %41 = call i32 @llvm.riscv.addi.enc(i32 %40, i32 13)
  store i32 %41, ptr %v50, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral49, i32 4, i1 false)
  %v52 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %42 = load i32, ptr %v52, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %42) #3, !srcloc !16
  %v54 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral53, i32 0, i32 0
  %v55 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %43 = load i32, ptr %v55, align 4
  %44 = call i32 @llvm.riscv.slti.enc(i32 %43, i32 13)
  store i32 %44, ptr %v54, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral53, i32 4, i1 false)
  %v56 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %45 = load i32, ptr %v56, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %45) #3, !srcloc !17
  %v58 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral57, i32 0, i32 0
  %v59 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %46 = load i32, ptr %v59, align 4
  %47 = call i32 @llvm.riscv.sltiu.enc(i32 %46, i32 13)
  store i32 %47, ptr %v58, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral57, i32 4, i1 false)
  %v60 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %48 = load i32, ptr %v60, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %48) #3, !srcloc !18
  %v62 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral61, i32 0, i32 0
  %v63 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %49 = load i32, ptr %v63, align 4
  %50 = call i32 @llvm.riscv.xori.enc(i32 %49, i32 13)
  store i32 %50, ptr %v62, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral61, i32 4, i1 false)
  %v64 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %51 = load i32, ptr %v64, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %51) #3, !srcloc !19
  %v66 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral65, i32 0, i32 0
  %v67 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %52 = load i32, ptr %v67, align 4
  %53 = call i32 @llvm.riscv.andi.enc(i32 %52, i32 13)
  store i32 %53, ptr %v66, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral65, i32 4, i1 false)
  %v68 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %54 = load i32, ptr %v68, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %54) #3, !srcloc !20
  %v70 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral69, i32 0, i32 0
  %v71 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %55 = load i32, ptr %v71, align 4
  %56 = call i32 @llvm.riscv.slli.enc(i32 %55, i32 13)
  store i32 %56, ptr %v70, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral69, i32 4, i1 false)
  %v72 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %57 = load i32, ptr %v72, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %57) #3, !srcloc !21
  %v74 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral73, i32 0, i32 0
  %v75 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %58 = load i32, ptr %v75, align 4
  %59 = call i32 @llvm.riscv.srli.enc(i32 %58, i32 13)
  store i32 %59, ptr %v74, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral73, i32 4, i1 false)
  %v76 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %60 = load i32, ptr %v76, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %60) #3, !srcloc !22
  %v78 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral77, i32 0, i32 0
  %v79 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %61 = load i32, ptr %v79, align 4
  %62 = call i32 @llvm.riscv.srai.enc(i32 %61, i32 13)
  store i32 %62, ptr %v78, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral77, i32 4, i1 false)
  %v80 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %63 = load i32, ptr %v80, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %63) #3, !srcloc !23
  %v82 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral81, i32 0, i32 0
  %v83 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %64 = load i32, ptr %v83, align 4
  %v84 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %65 = load i32, ptr %v84, align 4
  %v85 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %66 = load i32, ptr %v85, align 4
  %67 = call i32 @llvm.riscv.cmov.enc(i32 %64, i32 %65, i32 %66)
  store i32 %67, ptr %v82, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral81, i32 4, i1 false)
  %v86 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %68 = load i32, ptr %v86, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %68) #3, !srcloc !24
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
!6 = !{i64 2147512113}
!7 = !{i64 2147512534}
!8 = !{i64 2147512955}
!9 = !{i64 2147513376}
!10 = !{i64 2147513800}
!11 = !{i64 2147514221}
!12 = !{i64 2147514642}
!13 = !{i64 2147515063}
!14 = !{i64 2147515481}
!15 = !{i64 2147515902}
!16 = !{i64 2147516450}
!17 = !{i64 2147516998}
!18 = !{i64 2147517547}
!19 = !{i64 2147518095}
!20 = !{i64 2147518643}
!21 = !{i64 2147519173}
!22 = !{i64 2147519703}
!23 = !{i64 2147520233}
!24 = !{i64 2147520826}
