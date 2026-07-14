; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca <1 x i32>, align 4
  %y = alloca <1 x i32>, align 4
  %result = alloca <1 x i32>, align 4
  %tmp = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp7 = alloca i32, align 4
  %tmp12 = alloca i32, align 4
  %tmp17 = alloca i32, align 4
  %tmp22 = alloca i32, align 4
  %tmp27 = alloca i32, align 4
  %tmp32 = alloca i32, align 4
  %tmp37 = alloca i32, align 4
  %tmp42 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store <1 x i32> splat (i32 13), ptr %x, align 4
  store <1 x i32> splat (i32 7), ptr %y, align 4
  %0 = load <1 x i32>, ptr %x, align 4
  %vecext = extractelement <1 x i32> %0, i32 0
  %1 = load <1 x i32>, ptr %y, align 4
  %vecext1 = extractelement <1 x i32> %1, i32 0
  %2 = call i32 @llvm.riscv.add.enc(i32 %vecext, i32 %vecext1)
  store i32 %2, ptr %tmp, align 4
  %3 = load i32, ptr %tmp, align 4
  %splat.splatinsert = insertelement <1 x i32> poison, i32 %3, i64 0
  %splat.splat = shufflevector <1 x i32> %splat.splatinsert, <1 x i32> poison, <1 x i32> zeroinitializer
  store <1 x i32> %splat.splat, ptr %result, align 4
  %4 = load <1 x i32>, ptr %x, align 4
  %vecext3 = extractelement <1 x i32> %4, i32 0
  %5 = load <1 x i32>, ptr %y, align 4
  %vecext4 = extractelement <1 x i32> %5, i32 0
  %6 = call i32 @llvm.riscv.sub.enc(i32 %vecext3, i32 %vecext4)
  store i32 %6, ptr %tmp2, align 4
  %7 = load i32, ptr %tmp2, align 4
  %splat.splatinsert5 = insertelement <1 x i32> poison, i32 %7, i64 0
  %splat.splat6 = shufflevector <1 x i32> %splat.splatinsert5, <1 x i32> poison, <1 x i32> zeroinitializer
  store <1 x i32> %splat.splat6, ptr %result, align 4
  %8 = load <1 x i32>, ptr %x, align 4
  %vecext8 = extractelement <1 x i32> %8, i32 0
  %9 = load <1 x i32>, ptr %y, align 4
  %vecext9 = extractelement <1 x i32> %9, i32 0
  %10 = call i32 @llvm.riscv.sll.enc(i32 %vecext8, i32 %vecext9)
  store i32 %10, ptr %tmp7, align 4
  %11 = load i32, ptr %tmp7, align 4
  %splat.splatinsert10 = insertelement <1 x i32> poison, i32 %11, i64 0
  %splat.splat11 = shufflevector <1 x i32> %splat.splatinsert10, <1 x i32> poison, <1 x i32> zeroinitializer
  store <1 x i32> %splat.splat11, ptr %result, align 4
  %12 = load <1 x i32>, ptr %x, align 4
  %vecext13 = extractelement <1 x i32> %12, i32 0
  %13 = load <1 x i32>, ptr %y, align 4
  %vecext14 = extractelement <1 x i32> %13, i32 0
  %14 = call i32 @llvm.riscv.slt.enc(i32 %vecext13, i32 %vecext14)
  store i32 %14, ptr %tmp12, align 4
  %15 = load i32, ptr %tmp12, align 4
  %splat.splatinsert15 = insertelement <1 x i32> poison, i32 %15, i64 0
  %splat.splat16 = shufflevector <1 x i32> %splat.splatinsert15, <1 x i32> poison, <1 x i32> zeroinitializer
  store <1 x i32> %splat.splat16, ptr %result, align 4
  %16 = load <1 x i32>, ptr %x, align 4
  %vecext18 = extractelement <1 x i32> %16, i32 0
  %17 = load <1 x i32>, ptr %y, align 4
  %vecext19 = extractelement <1 x i32> %17, i32 0
  %18 = call i32 @llvm.riscv.sltu.enc(i32 %vecext18, i32 %vecext19)
  store i32 %18, ptr %tmp17, align 4
  %19 = load i32, ptr %tmp17, align 4
  %splat.splatinsert20 = insertelement <1 x i32> poison, i32 %19, i64 0
  %splat.splat21 = shufflevector <1 x i32> %splat.splatinsert20, <1 x i32> poison, <1 x i32> zeroinitializer
  store <1 x i32> %splat.splat21, ptr %result, align 4
  %20 = load <1 x i32>, ptr %x, align 4
  %vecext23 = extractelement <1 x i32> %20, i32 0
  %21 = load <1 x i32>, ptr %y, align 4
  %vecext24 = extractelement <1 x i32> %21, i32 0
  %22 = call i32 @llvm.riscv.xor.enc(i32 %vecext23, i32 %vecext24)
  store i32 %22, ptr %tmp22, align 4
  %23 = load i32, ptr %tmp22, align 4
  %splat.splatinsert25 = insertelement <1 x i32> poison, i32 %23, i64 0
  %splat.splat26 = shufflevector <1 x i32> %splat.splatinsert25, <1 x i32> poison, <1 x i32> zeroinitializer
  store <1 x i32> %splat.splat26, ptr %result, align 4
  %24 = load <1 x i32>, ptr %x, align 4
  %vecext28 = extractelement <1 x i32> %24, i32 0
  %25 = load <1 x i32>, ptr %y, align 4
  %vecext29 = extractelement <1 x i32> %25, i32 0
  %26 = call i32 @llvm.riscv.srl.enc(i32 %vecext28, i32 %vecext29)
  store i32 %26, ptr %tmp27, align 4
  %27 = load i32, ptr %tmp27, align 4
  %splat.splatinsert30 = insertelement <1 x i32> poison, i32 %27, i64 0
  %splat.splat31 = shufflevector <1 x i32> %splat.splatinsert30, <1 x i32> poison, <1 x i32> zeroinitializer
  store <1 x i32> %splat.splat31, ptr %result, align 4
  %28 = load <1 x i32>, ptr %x, align 4
  %vecext33 = extractelement <1 x i32> %28, i32 0
  %29 = load <1 x i32>, ptr %y, align 4
  %vecext34 = extractelement <1 x i32> %29, i32 0
  %30 = call i32 @llvm.riscv.sra.enc(i32 %vecext33, i32 %vecext34)
  store i32 %30, ptr %tmp32, align 4
  %31 = load i32, ptr %tmp32, align 4
  %splat.splatinsert35 = insertelement <1 x i32> poison, i32 %31, i64 0
  %splat.splat36 = shufflevector <1 x i32> %splat.splatinsert35, <1 x i32> poison, <1 x i32> zeroinitializer
  store <1 x i32> %splat.splat36, ptr %result, align 4
  %32 = load <1 x i32>, ptr %x, align 4
  %vecext38 = extractelement <1 x i32> %32, i32 0
  %33 = load <1 x i32>, ptr %y, align 4
  %vecext39 = extractelement <1 x i32> %33, i32 0
  %34 = call i32 @llvm.riscv.or.enc(i32 %vecext38, i32 %vecext39)
  store i32 %34, ptr %tmp37, align 4
  %35 = load i32, ptr %tmp37, align 4
  %splat.splatinsert40 = insertelement <1 x i32> poison, i32 %35, i64 0
  %splat.splat41 = shufflevector <1 x i32> %splat.splatinsert40, <1 x i32> poison, <1 x i32> zeroinitializer
  store <1 x i32> %splat.splat41, ptr %result, align 4
  %36 = load <1 x i32>, ptr %x, align 4
  %vecext43 = extractelement <1 x i32> %36, i32 0
  %37 = load <1 x i32>, ptr %y, align 4
  %vecext44 = extractelement <1 x i32> %37, i32 0
  %38 = call i32 @llvm.riscv.and.enc(i32 %vecext43, i32 %vecext44)
  store i32 %38, ptr %tmp42, align 4
  %39 = load i32, ptr %tmp42, align 4
  %splat.splatinsert45 = insertelement <1 x i32> poison, i32 %39, i64 0
  %splat.splat46 = shufflevector <1 x i32> %splat.splatinsert45, <1 x i32> poison, <1 x i32> zeroinitializer
  store <1 x i32> %splat.splat46, ptr %result, align 4
  ret i32 0
}

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.add.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sub.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sll.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.slt.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sltu.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.xor.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.srl.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sra.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.or.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.and.enc(i32, i32) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xqccmt,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-y,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvabd,-experimental-zvbc32e,-experimental-zvdot4a8i,-experimental-zvfbdota32f,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvfqwbdota8f,-experimental-zvfqwdota8f,-experimental-zvfwbdota16bf,-experimental-zvfwdota16bf,-experimental-zvkgs,-experimental-zvqwbdota16i,-experimental-zvqwbdota8i,-experimental-zvqwdota16i,-experimental-zvqwdota8i,-experimental-zvvfmm,-experimental-zvvmm,-experimental-zvvmtls,-experimental-zvvmttls,-experimental-zvzip,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svrsw60t59b,-svvptc,-v,-xaifet,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcheriot,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xsmtvdotii,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccid,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"target-abi", !"ilp32"}
!1 = !{i32 6, !"riscv-isa", !2}
!2 = !{!"rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0"}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{i32 8, !"SmallDataLimit", i32 0}
!5 = !{!"clang version 23.0.0git (https://github.com/mattwalsh13/encrypted-riscv.git b84dd28981e9d71da790eeb2d5a502eb0bcd6892)"}
