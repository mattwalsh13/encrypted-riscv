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
  %ref.tmp = alloca %struct.int_enc, align 4
  %__add_enc_r1 = alloca i32, align 4
  %.compoundliteral = alloca %struct.int_enc, align 4
  %__sub_enc_r = alloca i32, align 4
  %.compoundliteral9 = alloca %struct.int_enc, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 @__const.main.x, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %y, ptr align 4 @__const.main.y, i32 4, i1 false)
  %v = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %0 = load i32, ptr %v, align 4
  %v2 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %1 = load i32, ptr %v2, align 4
  %2 = call i32 @llvm.riscv.add.enc(i32 %0, i32 %1)
  store i32 %2, ptr %__add_enc_r1, align 4
  %3 = load i32, ptr %__add_enc_r1, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %3) #3, !srcloc !6
  %v3 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp, i32 0, i32 0
  %4 = load i32, ptr %__add_enc_r1, align 4
  store i32 %4, ptr %v3, align 4
  %v4 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp, i32 0, i32 0
  %5 = load i32, ptr %v4, align 4
  %v5 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %6 = load i32, ptr %v5, align 4
  %7 = call i32 @llvm.riscv.add.enc(i32 %5, i32 %6)
  store i32 %7, ptr %__add_enc_r, align 4
  %8 = load i32, ptr %__add_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %8) #3, !srcloc !7
  %v6 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral, i32 0, i32 0
  %9 = load i32, ptr %__add_enc_r, align 4
  store i32 %9, ptr %v6, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral, i32 4, i1 false)
  %v7 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %10 = load i32, ptr %v7, align 4
  %v8 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %11 = load i32, ptr %v8, align 4
  %12 = call i32 @llvm.riscv.sub.enc(i32 %10, i32 %11)
  store i32 %12, ptr %__sub_enc_r, align 4
  %13 = load i32, ptr %__sub_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %13) #3, !srcloc !8
  %v10 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral9, i32 0, i32 0
  %14 = load i32, ptr %__sub_enc_r, align 4
  store i32 %14, ptr %v10, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral9, i32 4, i1 false)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.add.enc(i32, i32) #2

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sub.enc(i32, i32) #2

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
!6 = !{i64 2147514197}
!7 = !{i64 2147514293}
!8 = !{i64 2147514799}
