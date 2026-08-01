; ModuleID = 'main.pp.c'
source_filename = "main.pp.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

%struct.int_enc = type { i32 }

@globalCount = dso_local global %struct.int_enc zeroinitializer, align 4
@__const.main.list = private unnamed_addr constant [5 x %struct.int_enc] [%struct.int_enc { i32 1 }, %struct.int_enc { i32 2 }, %struct.int_enc { i32 3 }, %struct.int_enc { i32 4 }, %struct.int_enc { i32 5 }], align 4
@__const.main.x = private unnamed_addr constant %struct.int_enc { i32 13 }, align 4
@__const.main.y = private unnamed_addr constant %struct.int_enc { i32 7 }, align 4
@__const.main.x.1 = private unnamed_addr constant %struct.int_enc { i32 13 }, align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @addDouble(i32 %a.coerce, i32 %b.coerce, i32 %useless.coerce) #0 {
entry:
  %retval = alloca %struct.int_enc, align 4
  %a = alloca %struct.int_enc, align 4
  %b = alloca %struct.int_enc, align 4
  %useless = alloca %struct.int_enc, align 4
  %c = alloca %struct.int_enc, align 4
  %__add_enc_r = alloca i32, align 4
  %__add_enc_r5 = alloca i32, align 4
  %coerce.dive = getelementptr inbounds nuw %struct.int_enc, ptr %a, i32 0, i32 0
  store i32 %a.coerce, ptr %coerce.dive, align 4
  %coerce.dive1 = getelementptr inbounds nuw %struct.int_enc, ptr %b, i32 0, i32 0
  store i32 %b.coerce, ptr %coerce.dive1, align 4
  %coerce.dive2 = getelementptr inbounds nuw %struct.int_enc, ptr %useless, i32 0, i32 0
  store i32 %useless.coerce, ptr %coerce.dive2, align 4
  %v = getelementptr inbounds nuw %struct.int_enc, ptr %a, i32 0, i32 0
  %0 = load i32, ptr %v, align 4
  %v3 = getelementptr inbounds nuw %struct.int_enc, ptr %b, i32 0, i32 0
  %1 = load i32, ptr %v3, align 4
  %2 = call i32 @llvm.riscv.add.enc(i32 %0, i32 %1)
  store i32 %2, ptr %__add_enc_r, align 4
  %3 = load i32, ptr %__add_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %3) #3, !srcloc !6
  %v4 = getelementptr inbounds nuw %struct.int_enc, ptr %c, i32 0, i32 0
  %4 = load i32, ptr %__add_enc_r, align 4
  store i32 %4, ptr %v4, align 4
  %v6 = getelementptr inbounds nuw %struct.int_enc, ptr %c, i32 0, i32 0
  %5 = load i32, ptr %v6, align 4
  %v7 = getelementptr inbounds nuw %struct.int_enc, ptr %b, i32 0, i32 0
  %6 = load i32, ptr %v7, align 4
  %7 = call i32 @llvm.riscv.add.enc(i32 %5, i32 %6)
  store i32 %7, ptr %__add_enc_r5, align 4
  %8 = load i32, ptr %__add_enc_r5, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %8) #3, !srcloc !7
  %v8 = getelementptr inbounds nuw %struct.int_enc, ptr %retval, i32 0, i32 0
  %9 = load i32, ptr %__add_enc_r5, align 4
  store i32 %9, ptr %v8, align 4
  %coerce.dive9 = getelementptr inbounds nuw %struct.int_enc, ptr %retval, i32 0, i32 0
  %10 = load i32, ptr %coerce.dive9, align 4
  ret i32 %10
}

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.add.enc(i32, i32) #1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %list = alloca [5 x %struct.int_enc], align 4
  %x = alloca %struct.int_enc, align 4
  %y = alloca %struct.int_enc, align 4
  %result = alloca %struct.int_enc, align 4
  %__and_enc_r = alloca i32, align 4
  %.compoundliteral = alloca %struct.int_enc, align 4
  %__add_enc_r = alloca i32, align 4
  %.compoundliteral5 = alloca %struct.int_enc, align 4
  %__addi_enc_r = alloca i32, align 4
  %.compoundliteral8 = alloca %struct.int_enc, align 4
  %__iadd_enc_r = alloca i32, align 4
  %.compoundliteral11 = alloca %struct.int_enc, align 4
  %a = alloca %struct.int_enc, align 4
  %__add_enc_r13 = alloca i32, align 4
  %b = alloca %struct.int_enc, align 4
  %__sub_enc_r = alloca i32, align 4
  %__add_enc_r20 = alloca i32, align 4
  %.compoundliteral23 = alloca %struct.int_enc, align 4
  %__sub_enc_r25 = alloca i32, align 4
  %.compoundliteral28 = alloca %struct.int_enc, align 4
  %__addi_enc_r30 = alloca i32, align 4
  %.compoundliteral32 = alloca %struct.int_enc, align 4
  %i = alloca i32, align 4
  %x34 = alloca %struct.int_enc, align 4
  %coerce = alloca %struct.int_enc, align 4
  %tmp = alloca %struct.int_enc, align 4
  %coerce47 = alloca %struct.int_enc, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %list, ptr align 4 @__const.main.list, i32 20, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 @__const.main.x, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %y, ptr align 4 @__const.main.y, i32 4, i1 false)
  %v = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %0 = load i32, ptr %v, align 4
  %v1 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %1 = load i32, ptr %v1, align 4
  %2 = call i32 @llvm.riscv.and.enc(i32 %0, i32 %1)
  store i32 %2, ptr %__and_enc_r, align 4
  %3 = load i32, ptr %__and_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %3) #3, !srcloc !8
  %v2 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral, i32 0, i32 0
  %4 = load i32, ptr %__and_enc_r, align 4
  store i32 %4, ptr %v2, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral, i32 4, i1 false)
  %v3 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %5 = load i32, ptr %v3, align 4
  %v4 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %6 = load i32, ptr %v4, align 4
  %7 = call i32 @llvm.riscv.add.enc(i32 %5, i32 %6)
  store i32 %7, ptr %__add_enc_r, align 4
  %8 = load i32, ptr %__add_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %8) #3, !srcloc !9
  %v6 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral5, i32 0, i32 0
  %9 = load i32, ptr %__add_enc_r, align 4
  store i32 %9, ptr %v6, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral5, i32 4, i1 false)
  %v7 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %10 = load i32, ptr %v7, align 4
  %11 = call i32 @llvm.riscv.addi.enc(i32 %10, i32 13)
  store i32 %11, ptr %__addi_enc_r, align 4
  %12 = load i32, ptr %__addi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %12) #3, !srcloc !10
  %v9 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral8, i32 0, i32 0
  %13 = load i32, ptr %__addi_enc_r, align 4
  store i32 %13, ptr %v9, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral8, i32 4, i1 false)
  %v10 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %14 = load i32, ptr %v10, align 4
  %15 = call i32 @llvm.riscv.addi.enc(i32 %14, i32 13)
  store i32 %15, ptr %__iadd_enc_r, align 4
  %16 = load i32, ptr %__iadd_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %16) #3, !srcloc !11
  %v12 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral11, i32 0, i32 0
  %17 = load i32, ptr %__iadd_enc_r, align 4
  store i32 %17, ptr %v12, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral11, i32 4, i1 false)
  %v14 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %18 = load i32, ptr %v14, align 4
  %v15 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %19 = load i32, ptr %v15, align 4
  %20 = call i32 @llvm.riscv.add.enc(i32 %18, i32 %19)
  store i32 %20, ptr %__add_enc_r13, align 4
  %21 = load i32, ptr %__add_enc_r13, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %21) #3, !srcloc !12
  %v16 = getelementptr inbounds nuw %struct.int_enc, ptr %a, i32 0, i32 0
  %22 = load i32, ptr %__add_enc_r13, align 4
  store i32 %22, ptr %v16, align 4
  %v17 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %23 = load i32, ptr %v17, align 4
  %v18 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %24 = load i32, ptr %v18, align 4
  %25 = call i32 @llvm.riscv.sub.enc(i32 %23, i32 %24)
  store i32 %25, ptr %__sub_enc_r, align 4
  %26 = load i32, ptr %__sub_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %26) #3, !srcloc !13
  %v19 = getelementptr inbounds nuw %struct.int_enc, ptr %b, i32 0, i32 0
  %27 = load i32, ptr %__sub_enc_r, align 4
  store i32 %27, ptr %v19, align 4
  %v21 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %28 = load i32, ptr %v21, align 4
  %v22 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %29 = load i32, ptr %v22, align 4
  %30 = call i32 @llvm.riscv.add.enc(i32 %28, i32 %29)
  store i32 %30, ptr %__add_enc_r20, align 4
  %31 = load i32, ptr %__add_enc_r20, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %31) #3, !srcloc !14
  %v24 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral23, i32 0, i32 0
  %32 = load i32, ptr %__add_enc_r20, align 4
  store i32 %32, ptr %v24, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral23, i32 4, i1 false)
  %v26 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %33 = load i32, ptr %v26, align 4
  %v27 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %34 = load i32, ptr %v27, align 4
  %35 = call i32 @llvm.riscv.sub.enc(i32 %33, i32 %34)
  store i32 %35, ptr %__sub_enc_r25, align 4
  %36 = load i32, ptr %__sub_enc_r25, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %36) #3, !srcloc !15
  %v29 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral28, i32 0, i32 0
  %37 = load i32, ptr %__sub_enc_r25, align 4
  store i32 %37, ptr %v29, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral28, i32 4, i1 false)
  %v31 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %38 = load i32, ptr %v31, align 4
  %39 = call i32 @llvm.riscv.addi.enc(i32 %38, i32 1)
  store i32 %39, ptr %__addi_enc_r30, align 4
  %40 = load i32, ptr %__addi_enc_r30, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %40) #3, !srcloc !16
  %v33 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral32, i32 0, i32 0
  %41 = load i32, ptr %__addi_enc_r30, align 4
  store i32 %41, ptr %v33, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral32, i32 4, i1 false)
  store i32 0, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %42 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %42, 10
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x34, ptr align 4 @__const.main.x.1, i32 4, i1 false)
  %43 = load i32, ptr %i, align 4
  %inc = add nsw i32 %43, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !17

while.end:                                        ; preds = %while.cond
  %coerce.dive = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %44 = load i32, ptr %coerce.dive, align 4
  %coerce.dive35 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %45 = load i32, ptr %coerce.dive35, align 4
  %coerce.dive36 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %46 = load i32, ptr %coerce.dive36, align 4
  %call = call i32 @addDouble(i32 %44, i32 %45, i32 %46)
  %coerce.dive37 = getelementptr inbounds nuw %struct.int_enc, ptr %coerce, i32 0, i32 0
  store i32 %call, ptr %coerce.dive37, align 4
  %coerce.dive38 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %47 = load i32, ptr %coerce.dive38, align 4
  %coerce.dive39 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %48 = load i32, ptr %coerce.dive39, align 4
  %coerce.dive40 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %49 = load i32, ptr %coerce.dive40, align 4
  %call41 = call i32 @addDouble(i32 %47, i32 %48, i32 %49)
  %coerce.dive42 = getelementptr inbounds nuw %struct.int_enc, ptr %tmp, i32 0, i32 0
  store i32 %call41, ptr %coerce.dive42, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %tmp, i32 4, i1 false)
  %coerce.dive43 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %50 = load i32, ptr %coerce.dive43, align 4
  %coerce.dive44 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %51 = load i32, ptr %coerce.dive44, align 4
  %coerce.dive45 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %52 = load i32, ptr %coerce.dive45, align 4
  %call46 = call i32 @addDouble(i32 %50, i32 %51, i32 %52)
  %coerce.dive48 = getelementptr inbounds nuw %struct.int_enc, ptr %coerce47, i32 0, i32 0
  store i32 %call46, ptr %coerce.dive48, align 4
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.and.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.addi.enc(i32, i32 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sub.enc(i32, i32) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xqccmt,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-y,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvabd,-experimental-zvbc32e,-experimental-zvdot4a8i,-experimental-zvfbdota32f,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvfqwbdota8f,-experimental-zvfqwdota8f,-experimental-zvfwbdota16bf,-experimental-zvfwdota16bf,-experimental-zvkgs,-experimental-zvqwbdota16i,-experimental-zvqwbdota8i,-experimental-zvqwdota16i,-experimental-zvqwdota8i,-experimental-zvvfmm,-experimental-zvvmm,-experimental-zvvmtls,-experimental-zvvmttls,-experimental-zvzip,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svrsw60t59b,-svvptc,-v,-xaifet,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcheriot,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xsmtvdotii,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccid,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"target-abi", !"ilp32"}
!1 = !{i32 6, !"riscv-isa", !2}
!2 = !{!"rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0"}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{i32 8, !"SmallDataLimit", i32 0}
!5 = !{!"clang version 23.0.0git (https://github.com/mattwalsh13/encrypted-riscv.git f76699ba303d347bc32d95d9fa55bdedc4c52bed)"}
!6 = !{i64 2147515960}
!7 = !{i64 2147516466}
!8 = !{i64 2147516972}
!9 = !{i64 2147517478}
!10 = !{i64 2147518114}
!11 = !{i64 2147518751}
!12 = !{i64 2147519258}
!13 = !{i64 2147519764}
!14 = !{i64 2147520270}
!15 = !{i64 2147520776}
!16 = !{i64 2147521408}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
