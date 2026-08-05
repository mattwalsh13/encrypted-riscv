; ModuleID = 'main.pp.c'
source_filename = "main.pp.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

%struct.int_enc = type { i32 }
%struct.uint_enc = type { i32 }

@globalCount = dso_local global %struct.int_enc zeroinitializer, align 4
@globalMax = dso_local constant %struct.uint_enc { i32 100 }, align 4
@__const.main.list = private unnamed_addr constant [5 x %struct.int_enc] [%struct.int_enc { i32 1 }, %struct.int_enc { i32 2 }, %struct.int_enc { i32 3 }, %struct.int_enc { i32 4 }, %struct.int_enc { i32 5 }], align 4
@__const.main.x = private unnamed_addr constant %struct.int_enc { i32 13 }, align 4
@__const.main.y = private unnamed_addr constant %struct.int_enc { i32 7 }, align 4
@__const.main.no_neg = private unnamed_addr constant %struct.uint_enc { i32 3 }, align 4
@__const.main.test = private unnamed_addr constant %struct.uint_enc { i32 2 }, align 4
@__const.main.thirteen = private unnamed_addr constant %struct.int_enc { i32 13 }, align 4
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
  call void asm sideeffect "", "r,~{memory}"(i32 %3) #4, !srcloc !6
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
  call void asm sideeffect "", "r,~{memory}"(i32 %8) #4, !srcloc !7
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
define dso_local i32 @uaddDouble(i32 %a.coerce, i32 %b.coerce, i32 %useless.coerce) #0 {
entry:
  %retval = alloca %struct.uint_enc, align 4
  %a = alloca %struct.uint_enc, align 4
  %b = alloca %struct.uint_enc, align 4
  %useless = alloca %struct.uint_enc, align 4
  %c = alloca %struct.uint_enc, align 4
  %__add_enc_r = alloca i32, align 4
  %__add_enc_r5 = alloca i32, align 4
  %coerce.dive = getelementptr inbounds nuw %struct.uint_enc, ptr %a, i32 0, i32 0
  store i32 %a.coerce, ptr %coerce.dive, align 4
  %coerce.dive1 = getelementptr inbounds nuw %struct.uint_enc, ptr %b, i32 0, i32 0
  store i32 %b.coerce, ptr %coerce.dive1, align 4
  %coerce.dive2 = getelementptr inbounds nuw %struct.uint_enc, ptr %useless, i32 0, i32 0
  store i32 %useless.coerce, ptr %coerce.dive2, align 4
  %v = getelementptr inbounds nuw %struct.uint_enc, ptr %a, i32 0, i32 0
  %0 = load i32, ptr %v, align 4
  %v3 = getelementptr inbounds nuw %struct.uint_enc, ptr %b, i32 0, i32 0
  %1 = load i32, ptr %v3, align 4
  %2 = call i32 @llvm.riscv.add.enc(i32 %0, i32 %1)
  store i32 %2, ptr %__add_enc_r, align 4
  %3 = load i32, ptr %__add_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %3) #4, !srcloc !8
  %v4 = getelementptr inbounds nuw %struct.uint_enc, ptr %c, i32 0, i32 0
  %4 = load i32, ptr %__add_enc_r, align 4
  store i32 %4, ptr %v4, align 4
  %v6 = getelementptr inbounds nuw %struct.uint_enc, ptr %c, i32 0, i32 0
  %5 = load i32, ptr %v6, align 4
  %v7 = getelementptr inbounds nuw %struct.uint_enc, ptr %b, i32 0, i32 0
  %6 = load i32, ptr %v7, align 4
  %7 = call i32 @llvm.riscv.add.enc(i32 %5, i32 %6)
  store i32 %7, ptr %__add_enc_r5, align 4
  %8 = load i32, ptr %__add_enc_r5, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %8) #4, !srcloc !9
  %v8 = getelementptr inbounds nuw %struct.uint_enc, ptr %retval, i32 0, i32 0
  %9 = load i32, ptr %__add_enc_r5, align 4
  store i32 %9, ptr %v8, align 4
  %coerce.dive9 = getelementptr inbounds nuw %struct.uint_enc, ptr %retval, i32 0, i32 0
  %10 = load i32, ptr %coerce.dive9, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @getSeven() #0 {
entry:
  %seven = alloca i32, align 4
  store i32 7, ptr %seven, align 4
  %0 = load i32, ptr %seven, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %list = alloca [5 x %struct.int_enc], align 4
  %x = alloca %struct.int_enc, align 4
  %y = alloca %struct.int_enc, align 4
  %result = alloca %struct.int_enc, align 4
  %uresult = alloca %struct.uint_enc, align 4
  %z = alloca %struct.int_enc, align 4
  %w = alloca %struct.int_enc, align 4
  %no_neg = alloca %struct.uint_enc, align 4
  %test = alloca %struct.uint_enc, align 4
  %thirteen = alloca %struct.int_enc, align 4
  %p = alloca ptr, align 4
  %__addi_enc_r = alloca i32, align 4
  %.compoundliteral = alloca %struct.int_enc, align 4
  %__negate_enc_r = alloca i32, align 4
  %ref.tmp = alloca %struct.int_enc, align 4
  %__full_reg_r = alloca i32, align 4
  %ref.tmp3 = alloca %struct.int_enc, align 4
  %__zero_reg_r = alloca i32, align 4
  %.compoundliteral4 = alloca %struct.int_enc, align 4
  %.compoundliteral6 = alloca %struct.int_enc, align 4
  %.compoundliteral12 = alloca %struct.int_enc, align 4
  %__lnot_enc_r = alloca i32, align 4
  %.compoundliteral15 = alloca %struct.int_enc, align 4
  %__bnot_enc_r = alloca i32, align 4
  %ref.tmp18 = alloca %struct.int_enc, align 4
  %__full_reg_r19 = alloca i32, align 4
  %ref.tmp20 = alloca %struct.int_enc, align 4
  %__zero_reg_r21 = alloca i32, align 4
  %.compoundliteral22 = alloca %struct.int_enc, align 4
  %.compoundliteral24 = alloca %struct.int_enc, align 4
  %.compoundliteral30 = alloca %struct.int_enc, align 4
  %__and_enc_r = alloca i32, align 4
  %.compoundliteral34 = alloca %struct.int_enc, align 4
  %__land_enc_r = alloca i32, align 4
  %.compoundliteral38 = alloca %struct.int_enc, align 4
  %__or_enc_r = alloca i32, align 4
  %.compoundliteral42 = alloca %struct.int_enc, align 4
  %__lor_enc_r = alloca i32, align 4
  %.compoundliteral46 = alloca %struct.int_enc, align 4
  %__xor_enc_r = alloca i32, align 4
  %.compoundliteral50 = alloca %struct.int_enc, align 4
  %__lxor_enc_r = alloca i32, align 4
  %.compoundliteral54 = alloca %struct.int_enc, align 4
  %__sll_enc_r = alloca i32, align 4
  %.compoundliteral58 = alloca %struct.int_enc, align 4
  %__srl_enc_r = alloca i32, align 4
  %.compoundliteral62 = alloca %struct.int_enc, align 4
  %__add_enc_r = alloca i32, align 4
  %.compoundliteral66 = alloca %struct.int_enc, align 4
  %__sub_enc_r = alloca i32, align 4
  %.compoundliteral70 = alloca %struct.int_enc, align 4
  %__set_enc_r = alloca i32, align 4
  %.compoundliteral74 = alloca %struct.int_enc, align 4
  %__slt_enc_r = alloca i32, align 4
  %.compoundliteral78 = alloca %struct.int_enc, align 4
  %__slet_enc_r = alloca i32, align 4
  %.compoundliteral84 = alloca %struct.int_enc, align 4
  %__sgt_enc_r = alloca i32, align 4
  %.compoundliteral88 = alloca %struct.int_enc, align 4
  %__sget_enc_r = alloca i32, align 4
  %.compoundliteral92 = alloca %struct.int_enc, align 4
  %__andi_enc_r = alloca i32, align 4
  %.compoundliteral95 = alloca %struct.int_enc, align 4
  %__landi_enc_r = alloca i32, align 4
  %.compoundliteral98 = alloca %struct.int_enc, align 4
  %__ori_enc_r = alloca i32, align 4
  %.compoundliteral101 = alloca %struct.int_enc, align 4
  %__lori_enc_r = alloca i32, align 4
  %.compoundliteral104 = alloca %struct.int_enc, align 4
  %__xori_enc_r = alloca i32, align 4
  %.compoundliteral107 = alloca %struct.int_enc, align 4
  %__lxori_enc_r = alloca i32, align 4
  %.compoundliteral110 = alloca %struct.int_enc, align 4
  %__slli_enc_r = alloca i32, align 4
  %.compoundliteral113 = alloca %struct.int_enc, align 4
  %__srli_enc_r = alloca i32, align 4
  %.compoundliteral116 = alloca %struct.int_enc, align 4
  %__addi_enc_r118 = alloca i32, align 4
  %.compoundliteral120 = alloca %struct.int_enc, align 4
  %__subi_enc_r = alloca i32, align 4
  %.compoundliteral123 = alloca %struct.int_enc, align 4
  %__seti_enc_r = alloca i32, align 4
  %.compoundliteral126 = alloca %struct.int_enc, align 4
  %__slti_enc_r = alloca i32, align 4
  %.compoundliteral129 = alloca %struct.int_enc, align 4
  %__sleti_enc_r = alloca i32, align 4
  %.compoundliteral133 = alloca %struct.int_enc, align 4
  %__sgti_enc_r = alloca i32, align 4
  %.compoundliteral137 = alloca %struct.int_enc, align 4
  %__sgeti_enc_r = alloca i32, align 4
  %.compoundliteral140 = alloca %struct.int_enc, align 4
  %__iand_enc_r = alloca i32, align 4
  %.compoundliteral143 = alloca %struct.int_enc, align 4
  %__iland_enc_r = alloca i32, align 4
  %.compoundliteral146 = alloca %struct.int_enc, align 4
  %__ior_enc_r = alloca i32, align 4
  %.compoundliteral149 = alloca %struct.int_enc, align 4
  %__ilor_enc_r = alloca i32, align 4
  %.compoundliteral152 = alloca %struct.int_enc, align 4
  %__ixor_enc_r = alloca i32, align 4
  %.compoundliteral155 = alloca %struct.int_enc, align 4
  %__ilxor_enc_r = alloca i32, align 4
  %.compoundliteral158 = alloca %struct.int_enc, align 4
  %__isll_enc_r = alloca i32, align 4
  %ref.tmp160 = alloca %struct.int_enc, align 4
  %__zero_reg_r161 = alloca i32, align 4
  %.compoundliteral162 = alloca %struct.int_enc, align 4
  %.compoundliteral164 = alloca %struct.int_enc, align 4
  %.compoundliteral169 = alloca %struct.int_enc, align 4
  %__isrl_enc_r = alloca i32, align 4
  %ref.tmp171 = alloca %struct.int_enc, align 4
  %__zero_reg_r172 = alloca i32, align 4
  %.compoundliteral173 = alloca %struct.int_enc, align 4
  %.compoundliteral175 = alloca %struct.int_enc, align 4
  %.compoundliteral180 = alloca %struct.int_enc, align 4
  %__iadd_enc_r = alloca i32, align 4
  %.compoundliteral183 = alloca %struct.int_enc, align 4
  %__isub_enc_r = alloca i32, align 4
  %ref.tmp186 = alloca %struct.int_enc, align 4
  %__full_reg_r187 = alloca i32, align 4
  %ref.tmp188 = alloca %struct.int_enc, align 4
  %__zero_reg_r189 = alloca i32, align 4
  %.compoundliteral190 = alloca %struct.int_enc, align 4
  %.compoundliteral192 = alloca %struct.int_enc, align 4
  %.compoundliteral198 = alloca %struct.int_enc, align 4
  %__iset_enc_r = alloca i32, align 4
  %ref.tmp201 = alloca %struct.int_enc, align 4
  %__full_reg_r202 = alloca i32, align 4
  %ref.tmp203 = alloca %struct.int_enc, align 4
  %__zero_reg_r204 = alloca i32, align 4
  %.compoundliteral205 = alloca %struct.int_enc, align 4
  %.compoundliteral207 = alloca %struct.int_enc, align 4
  %.compoundliteral213 = alloca %struct.int_enc, align 4
  %__islt_enc_r = alloca i32, align 4
  %.compoundliteral217 = alloca %struct.int_enc, align 4
  %__islet_enc_r = alloca i32, align 4
  %.compoundliteral220 = alloca %struct.int_enc, align 4
  %__isgt_enc_r = alloca i32, align 4
  %.compoundliteral223 = alloca %struct.int_enc, align 4
  %__isget_enc_r = alloca i32, align 4
  %.compoundliteral227 = alloca %struct.int_enc, align 4
  %__and_enc_r229 = alloca i32, align 4
  %.compoundliteral232 = alloca %struct.uint_enc, align 4
  %__land_enc_r234 = alloca i32, align 4
  %.compoundliteral237 = alloca %struct.uint_enc, align 4
  %__or_enc_r239 = alloca i32, align 4
  %.compoundliteral242 = alloca %struct.uint_enc, align 4
  %__lor_enc_r244 = alloca i32, align 4
  %.compoundliteral247 = alloca %struct.uint_enc, align 4
  %__xor_enc_r249 = alloca i32, align 4
  %.compoundliteral252 = alloca %struct.uint_enc, align 4
  %__lxor_enc_r254 = alloca i32, align 4
  %.compoundliteral257 = alloca %struct.uint_enc, align 4
  %__sll_enc_r259 = alloca i32, align 4
  %.compoundliteral262 = alloca %struct.uint_enc, align 4
  %__srl_enc_r264 = alloca i32, align 4
  %.compoundliteral267 = alloca %struct.uint_enc, align 4
  %__add_enc_r269 = alloca i32, align 4
  %.compoundliteral272 = alloca %struct.uint_enc, align 4
  %__sub_enc_r274 = alloca i32, align 4
  %.compoundliteral277 = alloca %struct.uint_enc, align 4
  %__set_enc_r279 = alloca i32, align 4
  %.compoundliteral282 = alloca %struct.uint_enc, align 4
  %__sltu_enc_r = alloca i32, align 4
  %.compoundliteral286 = alloca %struct.uint_enc, align 4
  %__sletu_enc_r = alloca i32, align 4
  %.compoundliteral292 = alloca %struct.uint_enc, align 4
  %__sgtu_enc_r = alloca i32, align 4
  %.compoundliteral296 = alloca %struct.uint_enc, align 4
  %__sgetu_enc_r = alloca i32, align 4
  %.compoundliteral300 = alloca %struct.uint_enc, align 4
  %__andi_enc_r302 = alloca i32, align 4
  %.compoundliteral304 = alloca %struct.uint_enc, align 4
  %__landi_enc_r306 = alloca i32, align 4
  %.compoundliteral308 = alloca %struct.uint_enc, align 4
  %__ori_enc_r310 = alloca i32, align 4
  %.compoundliteral312 = alloca %struct.uint_enc, align 4
  %__lori_enc_r314 = alloca i32, align 4
  %.compoundliteral316 = alloca %struct.uint_enc, align 4
  %__xori_enc_r318 = alloca i32, align 4
  %.compoundliteral320 = alloca %struct.uint_enc, align 4
  %__lxori_enc_r322 = alloca i32, align 4
  %.compoundliteral324 = alloca %struct.uint_enc, align 4
  %__slli_enc_r326 = alloca i32, align 4
  %.compoundliteral328 = alloca %struct.uint_enc, align 4
  %__srli_enc_r330 = alloca i32, align 4
  %.compoundliteral332 = alloca %struct.uint_enc, align 4
  %__addi_enc_r334 = alloca i32, align 4
  %.compoundliteral336 = alloca %struct.uint_enc, align 4
  %__subi_enc_r338 = alloca i32, align 4
  %.compoundliteral340 = alloca %struct.uint_enc, align 4
  %__seti_enc_r342 = alloca i32, align 4
  %.compoundliteral344 = alloca %struct.uint_enc, align 4
  %__sltiu_enc_r = alloca i32, align 4
  %.compoundliteral347 = alloca %struct.uint_enc, align 4
  %__sletiu_enc_r = alloca i32, align 4
  %.compoundliteral351 = alloca %struct.uint_enc, align 4
  %__sgtiu_enc_r = alloca i32, align 4
  %.compoundliteral354 = alloca %struct.uint_enc, align 4
  %__sgetiu_enc_r = alloca i32, align 4
  %.compoundliteral357 = alloca %struct.uint_enc, align 4
  %__iand_enc_r359 = alloca i32, align 4
  %.compoundliteral361 = alloca %struct.uint_enc, align 4
  %__iland_enc_r363 = alloca i32, align 4
  %.compoundliteral365 = alloca %struct.uint_enc, align 4
  %__ior_enc_r367 = alloca i32, align 4
  %.compoundliteral369 = alloca %struct.uint_enc, align 4
  %__ilor_enc_r371 = alloca i32, align 4
  %.compoundliteral373 = alloca %struct.uint_enc, align 4
  %__ixor_enc_r375 = alloca i32, align 4
  %.compoundliteral377 = alloca %struct.uint_enc, align 4
  %__ilxor_enc_r379 = alloca i32, align 4
  %.compoundliteral381 = alloca %struct.uint_enc, align 4
  %__isll_enc_r383 = alloca i32, align 4
  %ref.tmp384 = alloca %struct.int_enc, align 4
  %__zero_reg_r385 = alloca i32, align 4
  %.compoundliteral386 = alloca %struct.int_enc, align 4
  %.compoundliteral388 = alloca %struct.int_enc, align 4
  %.compoundliteral393 = alloca %struct.uint_enc, align 4
  %__isrl_enc_r395 = alloca i32, align 4
  %ref.tmp396 = alloca %struct.int_enc, align 4
  %__zero_reg_r397 = alloca i32, align 4
  %.compoundliteral398 = alloca %struct.int_enc, align 4
  %.compoundliteral400 = alloca %struct.int_enc, align 4
  %.compoundliteral405 = alloca %struct.uint_enc, align 4
  %__iadd_enc_r407 = alloca i32, align 4
  %.compoundliteral409 = alloca %struct.uint_enc, align 4
  %__isub_enc_r411 = alloca i32, align 4
  %ref.tmp413 = alloca %struct.int_enc, align 4
  %__full_reg_r414 = alloca i32, align 4
  %ref.tmp415 = alloca %struct.int_enc, align 4
  %__zero_reg_r416 = alloca i32, align 4
  %.compoundliteral417 = alloca %struct.int_enc, align 4
  %.compoundliteral419 = alloca %struct.int_enc, align 4
  %.compoundliteral425 = alloca %struct.uint_enc, align 4
  %__iset_enc_r427 = alloca i32, align 4
  %ref.tmp429 = alloca %struct.int_enc, align 4
  %__full_reg_r430 = alloca i32, align 4
  %ref.tmp431 = alloca %struct.int_enc, align 4
  %__zero_reg_r432 = alloca i32, align 4
  %.compoundliteral433 = alloca %struct.int_enc, align 4
  %.compoundliteral435 = alloca %struct.int_enc, align 4
  %.compoundliteral441 = alloca %struct.uint_enc, align 4
  %__isltu_enc_r = alloca i32, align 4
  %.compoundliteral445 = alloca %struct.uint_enc, align 4
  %__isletu_enc_r = alloca i32, align 4
  %.compoundliteral448 = alloca %struct.uint_enc, align 4
  %__isgtu_enc_r = alloca i32, align 4
  %.compoundliteral451 = alloca %struct.uint_enc, align 4
  %__isgetu_enc_r = alloca i32, align 4
  %.compoundliteral455 = alloca %struct.uint_enc, align 4
  %a = alloca %struct.int_enc, align 4
  %__add_enc_r457 = alloca i32, align 4
  %b = alloca %struct.int_enc, align 4
  %__sub_enc_r461 = alloca i32, align 4
  %__add_enc_r465 = alloca i32, align 4
  %.compoundliteral468 = alloca %struct.int_enc, align 4
  %__sub_enc_r470 = alloca i32, align 4
  %.compoundliteral473 = alloca %struct.int_enc, align 4
  %__addi_enc_r475 = alloca i32, align 4
  %.compoundliteral477 = alloca %struct.int_enc, align 4
  %__subi_enc_r479 = alloca i32, align 4
  %.compoundliteral481 = alloca %struct.int_enc, align 4
  %__cmov_enc_r = alloca i32, align 4
  %.compoundliteral486 = alloca %struct.int_enc, align 4
  %tmp = alloca %struct.int_enc, align 4
  %agg.tmp = alloca %struct.int_enc, align 4
  %agg.tmp488 = alloca %struct.int_enc, align 4
  %__sub_enc_r489 = alloca i32, align 4
  %agg.tmp495 = alloca %struct.int_enc, align 4
  %agg.tmp496 = alloca %struct.int_enc, align 4
  %__slli_enc_r497 = alloca i32, align 4
  %tmp510 = alloca %struct.int_enc, align 4
  %agg.tmp511 = alloca %struct.int_enc, align 4
  %agg.tmp512 = alloca %struct.int_enc, align 4
  %__land_enc_r513 = alloca i32, align 4
  %ref.tmp514 = alloca %struct.int_enc, align 4
  %__sll_enc_r515 = alloca i32, align 4
  %ref.tmp516 = alloca %struct.int_enc, align 4
  %__add_enc_r517 = alloca i32, align 4
  %ref.tmp525 = alloca %struct.int_enc, align 4
  %__subi_enc_r526 = alloca i32, align 4
  %tmp541 = alloca %struct.uint_enc, align 4
  %agg.tmp542 = alloca %struct.uint_enc, align 4
  %tmp553 = alloca %struct.uint_enc, align 4
  %agg.tmp554 = alloca %struct.uint_enc, align 4
  %agg.tmp560 = alloca %struct.uint_enc, align 4
  %coerce = alloca %struct.int_enc, align 4
  %coerce580 = alloca %struct.int_enc, align 4
  %.compoundliteral582 = alloca %struct.int_enc, align 4
  %seven = alloca i32, align 4
  %i = alloca i32, align 4
  %x585 = alloca %struct.int_enc, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %list, ptr align 4 @__const.main.list, i32 20, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 @__const.main.x, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %y, ptr align 4 @__const.main.y, i32 4, i1 false)
  call void @llvm.memset.p0.i32(ptr align 4 %result, i8 0, i32 4, i1 false)
  call void @llvm.memset.p0.i32(ptr align 4 %uresult, i8 0, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %no_neg, ptr align 4 @__const.main.no_neg, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %test, ptr align 4 @__const.main.test, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %thirteen, ptr align 4 @__const.main.thirteen, i32 4, i1 false)
  store ptr %x, ptr %p, align 4
  %0 = load ptr, ptr %p, align 4
  %v = getelementptr inbounds nuw %struct.int_enc, ptr %0, i32 0, i32 0
  %1 = load i32, ptr %v, align 4
  %2 = call i32 @llvm.riscv.addi.enc(i32 %1, i32 1)
  store i32 %2, ptr %__addi_enc_r, align 4
  %3 = load i32, ptr %__addi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %3) #4, !srcloc !10
  %v1 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral, i32 0, i32 0
  %4 = load i32, ptr %__addi_enc_r, align 4
  store i32 %4, ptr %v1, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral, i32 4, i1 false)
  %5 = load ptr, ptr %p, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %5, ptr align 4 %result, i32 4, i1 false)
  %v2 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %6 = load i32, ptr %v2, align 4
  %v5 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral4, i32 0, i32 0
  store i32 0, ptr %v5, align 4
  %v7 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral6, i32 0, i32 0
  store i32 0, ptr %v7, align 4
  %7 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %7, ptr %__zero_reg_r, align 4
  %8 = load i32, ptr %__zero_reg_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %8) #4, !srcloc !11
  %v8 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp3, i32 0, i32 0
  %9 = load i32, ptr %__zero_reg_r, align 4
  store i32 %9, ptr %v8, align 4
  %v9 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp3, i32 0, i32 0
  %10 = load i32, ptr %v9, align 4
  %11 = call i32 @llvm.riscv.addi.enc(i32 %10, i32 -1)
  store i32 %11, ptr %__full_reg_r, align 4
  %12 = load i32, ptr %__full_reg_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %12) #4, !srcloc !12
  %v10 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp, i32 0, i32 0
  %13 = load i32, ptr %__full_reg_r, align 4
  store i32 %13, ptr %v10, align 4
  %v11 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp, i32 0, i32 0
  %14 = load i32, ptr %v11, align 4
  %15 = call i32 @llvm.riscv.xor.enc(i32 %6, i32 %14)
  %16 = call i32 @llvm.riscv.addi.enc(i32 %15, i32 1)
  store i32 %16, ptr %__negate_enc_r, align 4
  %17 = load i32, ptr %__negate_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %17) #4, !srcloc !13
  %v13 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral12, i32 0, i32 0
  %18 = load i32, ptr %__negate_enc_r, align 4
  store i32 %18, ptr %v13, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral12, i32 4, i1 false)
  %v14 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %19 = load i32, ptr %v14, align 4
  %20 = call i32 @llvm.riscv.sltiu.enc(i32 %19, i32 1)
  store i32 %20, ptr %__lnot_enc_r, align 4
  %21 = load i32, ptr %__lnot_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %21) #4, !srcloc !14
  %v16 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral15, i32 0, i32 0
  %22 = load i32, ptr %__lnot_enc_r, align 4
  store i32 %22, ptr %v16, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral15, i32 4, i1 false)
  %v17 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %23 = load i32, ptr %v17, align 4
  %v23 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral22, i32 0, i32 0
  store i32 0, ptr %v23, align 4
  %v25 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral24, i32 0, i32 0
  store i32 0, ptr %v25, align 4
  %24 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %24, ptr %__zero_reg_r21, align 4
  %25 = load i32, ptr %__zero_reg_r21, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %25) #4, !srcloc !15
  %v26 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp20, i32 0, i32 0
  %26 = load i32, ptr %__zero_reg_r21, align 4
  store i32 %26, ptr %v26, align 4
  %v27 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp20, i32 0, i32 0
  %27 = load i32, ptr %v27, align 4
  %28 = call i32 @llvm.riscv.addi.enc(i32 %27, i32 -1)
  store i32 %28, ptr %__full_reg_r19, align 4
  %29 = load i32, ptr %__full_reg_r19, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %29) #4, !srcloc !16
  %v28 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp18, i32 0, i32 0
  %30 = load i32, ptr %__full_reg_r19, align 4
  store i32 %30, ptr %v28, align 4
  %v29 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp18, i32 0, i32 0
  %31 = load i32, ptr %v29, align 4
  %32 = call i32 @llvm.riscv.xor.enc(i32 %23, i32 %31)
  store i32 %32, ptr %__bnot_enc_r, align 4
  %33 = load i32, ptr %__bnot_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %33) #4, !srcloc !17
  %v31 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral30, i32 0, i32 0
  %34 = load i32, ptr %__bnot_enc_r, align 4
  store i32 %34, ptr %v31, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral30, i32 4, i1 false)
  %v32 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %35 = load i32, ptr %v32, align 4
  %v33 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %36 = load i32, ptr %v33, align 4
  %37 = call i32 @llvm.riscv.and.enc(i32 %35, i32 %36)
  store i32 %37, ptr %__and_enc_r, align 4
  %38 = load i32, ptr %__and_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %38) #4, !srcloc !18
  %v35 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral34, i32 0, i32 0
  %39 = load i32, ptr %__and_enc_r, align 4
  store i32 %39, ptr %v35, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral34, i32 4, i1 false)
  %v36 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %40 = load i32, ptr %v36, align 4
  %41 = call i32 @llvm.riscv.sltiu.enc(i32 %40, i32 1)
  %42 = call i32 @llvm.riscv.sltiu.enc(i32 %41, i32 1)
  %v37 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %43 = load i32, ptr %v37, align 4
  %44 = call i32 @llvm.riscv.sltiu.enc(i32 %43, i32 1)
  %45 = call i32 @llvm.riscv.sltiu.enc(i32 %44, i32 1)
  %46 = call i32 @llvm.riscv.and.enc(i32 %42, i32 %45)
  store i32 %46, ptr %__land_enc_r, align 4
  %47 = load i32, ptr %__land_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %47) #4, !srcloc !19
  %v39 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral38, i32 0, i32 0
  %48 = load i32, ptr %__land_enc_r, align 4
  store i32 %48, ptr %v39, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral38, i32 4, i1 false)
  %v40 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %49 = load i32, ptr %v40, align 4
  %v41 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %50 = load i32, ptr %v41, align 4
  %51 = call i32 @llvm.riscv.or.enc(i32 %49, i32 %50)
  store i32 %51, ptr %__or_enc_r, align 4
  %52 = load i32, ptr %__or_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %52) #4, !srcloc !20
  %v43 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral42, i32 0, i32 0
  %53 = load i32, ptr %__or_enc_r, align 4
  store i32 %53, ptr %v43, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral42, i32 4, i1 false)
  %v44 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %54 = load i32, ptr %v44, align 4
  %55 = call i32 @llvm.riscv.sltiu.enc(i32 %54, i32 1)
  %56 = call i32 @llvm.riscv.sltiu.enc(i32 %55, i32 1)
  %v45 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %57 = load i32, ptr %v45, align 4
  %58 = call i32 @llvm.riscv.sltiu.enc(i32 %57, i32 1)
  %59 = call i32 @llvm.riscv.sltiu.enc(i32 %58, i32 1)
  %60 = call i32 @llvm.riscv.or.enc(i32 %56, i32 %59)
  store i32 %60, ptr %__lor_enc_r, align 4
  %61 = load i32, ptr %__lor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %61) #4, !srcloc !21
  %v47 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral46, i32 0, i32 0
  %62 = load i32, ptr %__lor_enc_r, align 4
  store i32 %62, ptr %v47, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral46, i32 4, i1 false)
  %v48 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %63 = load i32, ptr %v48, align 4
  %v49 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %64 = load i32, ptr %v49, align 4
  %65 = call i32 @llvm.riscv.xor.enc(i32 %63, i32 %64)
  store i32 %65, ptr %__xor_enc_r, align 4
  %66 = load i32, ptr %__xor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %66) #4, !srcloc !22
  %v51 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral50, i32 0, i32 0
  %67 = load i32, ptr %__xor_enc_r, align 4
  store i32 %67, ptr %v51, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral50, i32 4, i1 false)
  %v52 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %68 = load i32, ptr %v52, align 4
  %69 = call i32 @llvm.riscv.sltiu.enc(i32 %68, i32 1)
  %70 = call i32 @llvm.riscv.sltiu.enc(i32 %69, i32 1)
  %v53 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %71 = load i32, ptr %v53, align 4
  %72 = call i32 @llvm.riscv.sltiu.enc(i32 %71, i32 1)
  %73 = call i32 @llvm.riscv.sltiu.enc(i32 %72, i32 1)
  %74 = call i32 @llvm.riscv.xor.enc(i32 %70, i32 %73)
  store i32 %74, ptr %__lxor_enc_r, align 4
  %75 = load i32, ptr %__lxor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %75) #4, !srcloc !23
  %v55 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral54, i32 0, i32 0
  %76 = load i32, ptr %__lxor_enc_r, align 4
  store i32 %76, ptr %v55, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral54, i32 4, i1 false)
  %v56 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %77 = load i32, ptr %v56, align 4
  %v57 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %78 = load i32, ptr %v57, align 4
  %79 = call i32 @llvm.riscv.sll.enc(i32 %77, i32 %78)
  store i32 %79, ptr %__sll_enc_r, align 4
  %80 = load i32, ptr %__sll_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %80) #4, !srcloc !24
  %v59 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral58, i32 0, i32 0
  %81 = load i32, ptr %__sll_enc_r, align 4
  store i32 %81, ptr %v59, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral58, i32 4, i1 false)
  %v60 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %82 = load i32, ptr %v60, align 4
  %v61 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %83 = load i32, ptr %v61, align 4
  %84 = call i32 @llvm.riscv.srl.enc(i32 %82, i32 %83)
  store i32 %84, ptr %__srl_enc_r, align 4
  %85 = load i32, ptr %__srl_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %85) #4, !srcloc !25
  %v63 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral62, i32 0, i32 0
  %86 = load i32, ptr %__srl_enc_r, align 4
  store i32 %86, ptr %v63, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral62, i32 4, i1 false)
  %v64 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %87 = load i32, ptr %v64, align 4
  %v65 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %88 = load i32, ptr %v65, align 4
  %89 = call i32 @llvm.riscv.add.enc(i32 %87, i32 %88)
  store i32 %89, ptr %__add_enc_r, align 4
  %90 = load i32, ptr %__add_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %90) #4, !srcloc !26
  %v67 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral66, i32 0, i32 0
  %91 = load i32, ptr %__add_enc_r, align 4
  store i32 %91, ptr %v67, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral66, i32 4, i1 false)
  %v68 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %92 = load i32, ptr %v68, align 4
  %v69 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %93 = load i32, ptr %v69, align 4
  %94 = call i32 @llvm.riscv.sub.enc(i32 %92, i32 %93)
  store i32 %94, ptr %__sub_enc_r, align 4
  %95 = load i32, ptr %__sub_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %95) #4, !srcloc !27
  %v71 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral70, i32 0, i32 0
  %96 = load i32, ptr %__sub_enc_r, align 4
  store i32 %96, ptr %v71, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral70, i32 4, i1 false)
  %v72 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %97 = load i32, ptr %v72, align 4
  %v73 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %98 = load i32, ptr %v73, align 4
  %99 = call i32 @llvm.riscv.sub.enc(i32 %97, i32 %98)
  %100 = call i32 @llvm.riscv.sltiu.enc(i32 %99, i32 1)
  store i32 %100, ptr %__set_enc_r, align 4
  %101 = load i32, ptr %__set_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %101) #4, !srcloc !28
  %v75 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral74, i32 0, i32 0
  %102 = load i32, ptr %__set_enc_r, align 4
  store i32 %102, ptr %v75, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral74, i32 4, i1 false)
  %v76 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %103 = load i32, ptr %v76, align 4
  %v77 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %104 = load i32, ptr %v77, align 4
  %105 = call i32 @llvm.riscv.slt.enc(i32 %103, i32 %104)
  store i32 %105, ptr %__slt_enc_r, align 4
  %106 = load i32, ptr %__slt_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %106) #4, !srcloc !29
  %v79 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral78, i32 0, i32 0
  %107 = load i32, ptr %__slt_enc_r, align 4
  store i32 %107, ptr %v79, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral78, i32 4, i1 false)
  %v80 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %108 = load i32, ptr %v80, align 4
  %v81 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %109 = load i32, ptr %v81, align 4
  %110 = call i32 @llvm.riscv.slt.enc(i32 %108, i32 %109)
  %v82 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %111 = load i32, ptr %v82, align 4
  %v83 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %112 = load i32, ptr %v83, align 4
  %113 = call i32 @llvm.riscv.sub.enc(i32 %111, i32 %112)
  %114 = call i32 @llvm.riscv.sltiu.enc(i32 %113, i32 1)
  %115 = call i32 @llvm.riscv.or.enc(i32 %110, i32 %114)
  store i32 %115, ptr %__slet_enc_r, align 4
  %116 = load i32, ptr %__slet_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %116) #4, !srcloc !30
  %v85 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral84, i32 0, i32 0
  %117 = load i32, ptr %__slet_enc_r, align 4
  store i32 %117, ptr %v85, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral84, i32 4, i1 false)
  %v86 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %118 = load i32, ptr %v86, align 4
  %v87 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %119 = load i32, ptr %v87, align 4
  %120 = call i32 @llvm.riscv.slt.enc(i32 %118, i32 %119)
  store i32 %120, ptr %__sgt_enc_r, align 4
  %121 = load i32, ptr %__sgt_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %121) #4, !srcloc !31
  %v89 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral88, i32 0, i32 0
  %122 = load i32, ptr %__sgt_enc_r, align 4
  store i32 %122, ptr %v89, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral88, i32 4, i1 false)
  %v90 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %123 = load i32, ptr %v90, align 4
  %v91 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %124 = load i32, ptr %v91, align 4
  %125 = call i32 @llvm.riscv.slt.enc(i32 %123, i32 %124)
  %126 = call i32 @llvm.riscv.sltiu.enc(i32 %125, i32 1)
  store i32 %126, ptr %__sget_enc_r, align 4
  %127 = load i32, ptr %__sget_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %127) #4, !srcloc !32
  %v93 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral92, i32 0, i32 0
  %128 = load i32, ptr %__sget_enc_r, align 4
  store i32 %128, ptr %v93, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral92, i32 4, i1 false)
  %v94 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %129 = load i32, ptr %v94, align 4
  %130 = call i32 @llvm.riscv.andi.enc(i32 %129, i32 13)
  store i32 %130, ptr %__andi_enc_r, align 4
  %131 = load i32, ptr %__andi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %131) #4, !srcloc !33
  %v96 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral95, i32 0, i32 0
  %132 = load i32, ptr %__andi_enc_r, align 4
  store i32 %132, ptr %v96, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral95, i32 4, i1 false)
  %v97 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %133 = load i32, ptr %v97, align 4
  %134 = call i32 @llvm.riscv.sltiu.enc(i32 %133, i32 1)
  %135 = call i32 @llvm.riscv.sltiu.enc(i32 %134, i32 1)
  %136 = call i32 @llvm.riscv.andi.enc(i32 %135, i32 1)
  store i32 %136, ptr %__landi_enc_r, align 4
  %137 = load i32, ptr %__landi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %137) #4, !srcloc !34
  %v99 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral98, i32 0, i32 0
  %138 = load i32, ptr %__landi_enc_r, align 4
  store i32 %138, ptr %v99, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral98, i32 4, i1 false)
  %v100 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %139 = load i32, ptr %v100, align 4
  %140 = call i32 @llvm.riscv.ori.enc(i32 %139, i32 13)
  store i32 %140, ptr %__ori_enc_r, align 4
  %141 = load i32, ptr %__ori_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %141) #4, !srcloc !35
  %v102 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral101, i32 0, i32 0
  %142 = load i32, ptr %__ori_enc_r, align 4
  store i32 %142, ptr %v102, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral101, i32 4, i1 false)
  %v103 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %143 = load i32, ptr %v103, align 4
  %144 = call i32 @llvm.riscv.sltiu.enc(i32 %143, i32 1)
  %145 = call i32 @llvm.riscv.sltiu.enc(i32 %144, i32 1)
  %146 = call i32 @llvm.riscv.ori.enc(i32 %145, i32 1)
  store i32 %146, ptr %__lori_enc_r, align 4
  %147 = load i32, ptr %__lori_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %147) #4, !srcloc !36
  %v105 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral104, i32 0, i32 0
  %148 = load i32, ptr %__lori_enc_r, align 4
  store i32 %148, ptr %v105, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral104, i32 4, i1 false)
  %v106 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %149 = load i32, ptr %v106, align 4
  %150 = call i32 @llvm.riscv.xori.enc(i32 %149, i32 13)
  store i32 %150, ptr %__xori_enc_r, align 4
  %151 = load i32, ptr %__xori_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %151) #4, !srcloc !37
  %v108 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral107, i32 0, i32 0
  %152 = load i32, ptr %__xori_enc_r, align 4
  store i32 %152, ptr %v108, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral107, i32 4, i1 false)
  %v109 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %153 = load i32, ptr %v109, align 4
  %154 = call i32 @llvm.riscv.sltiu.enc(i32 %153, i32 1)
  %155 = call i32 @llvm.riscv.sltiu.enc(i32 %154, i32 1)
  %156 = call i32 @llvm.riscv.xori.enc(i32 %155, i32 1)
  store i32 %156, ptr %__lxori_enc_r, align 4
  %157 = load i32, ptr %__lxori_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %157) #4, !srcloc !38
  %v111 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral110, i32 0, i32 0
  %158 = load i32, ptr %__lxori_enc_r, align 4
  store i32 %158, ptr %v111, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral110, i32 4, i1 false)
  %v112 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %159 = load i32, ptr %v112, align 4
  %160 = call i32 @llvm.riscv.slli.enc(i32 %159, i32 13)
  store i32 %160, ptr %__slli_enc_r, align 4
  %161 = load i32, ptr %__slli_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %161) #4, !srcloc !39
  %v114 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral113, i32 0, i32 0
  %162 = load i32, ptr %__slli_enc_r, align 4
  store i32 %162, ptr %v114, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral113, i32 4, i1 false)
  %v115 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %163 = load i32, ptr %v115, align 4
  %164 = call i32 @llvm.riscv.srli.enc(i32 %163, i32 13)
  store i32 %164, ptr %__srli_enc_r, align 4
  %165 = load i32, ptr %__srli_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %165) #4, !srcloc !40
  %v117 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral116, i32 0, i32 0
  %166 = load i32, ptr %__srli_enc_r, align 4
  store i32 %166, ptr %v117, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral116, i32 4, i1 false)
  %v119 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %167 = load i32, ptr %v119, align 4
  %168 = call i32 @llvm.riscv.addi.enc(i32 %167, i32 13)
  store i32 %168, ptr %__addi_enc_r118, align 4
  %169 = load i32, ptr %__addi_enc_r118, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %169) #4, !srcloc !41
  %v121 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral120, i32 0, i32 0
  %170 = load i32, ptr %__addi_enc_r118, align 4
  store i32 %170, ptr %v121, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral120, i32 4, i1 false)
  %v122 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %171 = load i32, ptr %v122, align 4
  %172 = call i32 @llvm.riscv.addi.enc(i32 %171, i32 -13)
  store i32 %172, ptr %__subi_enc_r, align 4
  %173 = load i32, ptr %__subi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %173) #4, !srcloc !42
  %v124 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral123, i32 0, i32 0
  %174 = load i32, ptr %__subi_enc_r, align 4
  store i32 %174, ptr %v124, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral123, i32 4, i1 false)
  %v125 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %175 = load i32, ptr %v125, align 4
  %176 = call i32 @llvm.riscv.addi.enc(i32 %175, i32 -13)
  %177 = call i32 @llvm.riscv.sltiu.enc(i32 %176, i32 1)
  store i32 %177, ptr %__seti_enc_r, align 4
  %178 = load i32, ptr %__seti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %178) #4, !srcloc !43
  %v127 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral126, i32 0, i32 0
  %179 = load i32, ptr %__seti_enc_r, align 4
  store i32 %179, ptr %v127, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral126, i32 4, i1 false)
  %v128 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %180 = load i32, ptr %v128, align 4
  %181 = call i32 @llvm.riscv.slti.enc(i32 %180, i32 13)
  store i32 %181, ptr %__slti_enc_r, align 4
  %182 = load i32, ptr %__slti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %182) #4, !srcloc !44
  %v130 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral129, i32 0, i32 0
  %183 = load i32, ptr %__slti_enc_r, align 4
  store i32 %183, ptr %v130, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral129, i32 4, i1 false)
  %v131 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %184 = load i32, ptr %v131, align 4
  %185 = call i32 @llvm.riscv.slti.enc(i32 %184, i32 13)
  %v132 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %186 = load i32, ptr %v132, align 4
  %187 = call i32 @llvm.riscv.addi.enc(i32 %186, i32 -13)
  %188 = call i32 @llvm.riscv.sltiu.enc(i32 %187, i32 1)
  %189 = call i32 @llvm.riscv.or.enc(i32 %185, i32 %188)
  store i32 %189, ptr %__sleti_enc_r, align 4
  %190 = load i32, ptr %__sleti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %190) #4, !srcloc !45
  %v134 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral133, i32 0, i32 0
  %191 = load i32, ptr %__sleti_enc_r, align 4
  store i32 %191, ptr %v134, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral133, i32 4, i1 false)
  %v135 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %192 = load i32, ptr %v135, align 4
  %193 = call i32 @llvm.riscv.slti.enc(i32 %192, i32 13)
  %v136 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %194 = load i32, ptr %v136, align 4
  %195 = call i32 @llvm.riscv.addi.enc(i32 %194, i32 -13)
  %196 = call i32 @llvm.riscv.sltiu.enc(i32 %195, i32 1)
  %197 = call i32 @llvm.riscv.or.enc(i32 %193, i32 %196)
  %198 = call i32 @llvm.riscv.sltiu.enc(i32 %197, i32 1)
  store i32 %198, ptr %__sgti_enc_r, align 4
  %199 = load i32, ptr %__sgti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %199) #4, !srcloc !46
  %v138 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral137, i32 0, i32 0
  %200 = load i32, ptr %__sgti_enc_r, align 4
  store i32 %200, ptr %v138, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral137, i32 4, i1 false)
  %v139 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %201 = load i32, ptr %v139, align 4
  %202 = call i32 @llvm.riscv.slti.enc(i32 %201, i32 13)
  %203 = call i32 @llvm.riscv.sltiu.enc(i32 %202, i32 1)
  store i32 %203, ptr %__sgeti_enc_r, align 4
  %204 = load i32, ptr %__sgeti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %204) #4, !srcloc !47
  %v141 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral140, i32 0, i32 0
  %205 = load i32, ptr %__sgeti_enc_r, align 4
  store i32 %205, ptr %v141, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral140, i32 4, i1 false)
  %v142 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %206 = load i32, ptr %v142, align 4
  %207 = call i32 @llvm.riscv.andi.enc(i32 %206, i32 13)
  store i32 %207, ptr %__iand_enc_r, align 4
  %208 = load i32, ptr %__iand_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %208) #4, !srcloc !48
  %v144 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral143, i32 0, i32 0
  %209 = load i32, ptr %__iand_enc_r, align 4
  store i32 %209, ptr %v144, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral143, i32 4, i1 false)
  %v145 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %210 = load i32, ptr %v145, align 4
  %211 = call i32 @llvm.riscv.sltiu.enc(i32 %210, i32 1)
  %212 = call i32 @llvm.riscv.sltiu.enc(i32 %211, i32 1)
  %213 = call i32 @llvm.riscv.andi.enc(i32 %212, i32 1)
  store i32 %213, ptr %__iland_enc_r, align 4
  %214 = load i32, ptr %__iland_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %214) #4, !srcloc !49
  %v147 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral146, i32 0, i32 0
  %215 = load i32, ptr %__iland_enc_r, align 4
  store i32 %215, ptr %v147, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral146, i32 4, i1 false)
  %v148 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %216 = load i32, ptr %v148, align 4
  %217 = call i32 @llvm.riscv.ori.enc(i32 %216, i32 13)
  store i32 %217, ptr %__ior_enc_r, align 4
  %218 = load i32, ptr %__ior_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %218) #4, !srcloc !50
  %v150 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral149, i32 0, i32 0
  %219 = load i32, ptr %__ior_enc_r, align 4
  store i32 %219, ptr %v150, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral149, i32 4, i1 false)
  %v151 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %220 = load i32, ptr %v151, align 4
  %221 = call i32 @llvm.riscv.sltiu.enc(i32 %220, i32 1)
  %222 = call i32 @llvm.riscv.sltiu.enc(i32 %221, i32 1)
  %223 = call i32 @llvm.riscv.ori.enc(i32 %222, i32 1)
  store i32 %223, ptr %__ilor_enc_r, align 4
  %224 = load i32, ptr %__ilor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %224) #4, !srcloc !51
  %v153 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral152, i32 0, i32 0
  %225 = load i32, ptr %__ilor_enc_r, align 4
  store i32 %225, ptr %v153, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral152, i32 4, i1 false)
  %v154 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %226 = load i32, ptr %v154, align 4
  %227 = call i32 @llvm.riscv.xori.enc(i32 %226, i32 13)
  store i32 %227, ptr %__ixor_enc_r, align 4
  %228 = load i32, ptr %__ixor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %228) #4, !srcloc !52
  %v156 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral155, i32 0, i32 0
  %229 = load i32, ptr %__ixor_enc_r, align 4
  store i32 %229, ptr %v156, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral155, i32 4, i1 false)
  %v157 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %230 = load i32, ptr %v157, align 4
  %231 = call i32 @llvm.riscv.sltiu.enc(i32 %230, i32 1)
  %232 = call i32 @llvm.riscv.sltiu.enc(i32 %231, i32 1)
  %233 = call i32 @llvm.riscv.xori.enc(i32 %232, i32 1)
  store i32 %233, ptr %__ilxor_enc_r, align 4
  %234 = load i32, ptr %__ilxor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %234) #4, !srcloc !53
  %v159 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral158, i32 0, i32 0
  %235 = load i32, ptr %__ilxor_enc_r, align 4
  store i32 %235, ptr %v159, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral158, i32 4, i1 false)
  %v163 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral162, i32 0, i32 0
  store i32 0, ptr %v163, align 4
  %v165 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral164, i32 0, i32 0
  store i32 0, ptr %v165, align 4
  %236 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %236, ptr %__zero_reg_r161, align 4
  %237 = load i32, ptr %__zero_reg_r161, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %237) #4, !srcloc !54
  %v166 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp160, i32 0, i32 0
  %238 = load i32, ptr %__zero_reg_r161, align 4
  store i32 %238, ptr %v166, align 4
  %v167 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp160, i32 0, i32 0
  %239 = load i32, ptr %v167, align 4
  %240 = call i32 @llvm.riscv.xori.enc(i32 %239, i32 13)
  %v168 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %241 = load i32, ptr %v168, align 4
  %242 = call i32 @llvm.riscv.sll.enc(i32 %240, i32 %241)
  store i32 %242, ptr %__isll_enc_r, align 4
  %243 = load i32, ptr %__isll_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %243) #4, !srcloc !55
  %v170 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral169, i32 0, i32 0
  %244 = load i32, ptr %__isll_enc_r, align 4
  store i32 %244, ptr %v170, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral169, i32 4, i1 false)
  %v174 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral173, i32 0, i32 0
  store i32 0, ptr %v174, align 4
  %v176 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral175, i32 0, i32 0
  store i32 0, ptr %v176, align 4
  %245 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %245, ptr %__zero_reg_r172, align 4
  %246 = load i32, ptr %__zero_reg_r172, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %246) #4, !srcloc !56
  %v177 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp171, i32 0, i32 0
  %247 = load i32, ptr %__zero_reg_r172, align 4
  store i32 %247, ptr %v177, align 4
  %v178 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp171, i32 0, i32 0
  %248 = load i32, ptr %v178, align 4
  %249 = call i32 @llvm.riscv.xori.enc(i32 %248, i32 13)
  %v179 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %250 = load i32, ptr %v179, align 4
  %251 = call i32 @llvm.riscv.srl.enc(i32 %249, i32 %250)
  store i32 %251, ptr %__isrl_enc_r, align 4
  %252 = load i32, ptr %__isrl_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %252) #4, !srcloc !57
  %v181 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral180, i32 0, i32 0
  %253 = load i32, ptr %__isrl_enc_r, align 4
  store i32 %253, ptr %v181, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral180, i32 4, i1 false)
  %v182 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %254 = load i32, ptr %v182, align 4
  %255 = call i32 @llvm.riscv.addi.enc(i32 %254, i32 13)
  store i32 %255, ptr %__iadd_enc_r, align 4
  %256 = load i32, ptr %__iadd_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %256) #4, !srcloc !58
  %v184 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral183, i32 0, i32 0
  %257 = load i32, ptr %__iadd_enc_r, align 4
  store i32 %257, ptr %v184, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral183, i32 4, i1 false)
  %v185 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %258 = load i32, ptr %v185, align 4
  %v191 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral190, i32 0, i32 0
  store i32 0, ptr %v191, align 4
  %v193 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral192, i32 0, i32 0
  store i32 0, ptr %v193, align 4
  %259 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %259, ptr %__zero_reg_r189, align 4
  %260 = load i32, ptr %__zero_reg_r189, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %260) #4, !srcloc !59
  %v194 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp188, i32 0, i32 0
  %261 = load i32, ptr %__zero_reg_r189, align 4
  store i32 %261, ptr %v194, align 4
  %v195 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp188, i32 0, i32 0
  %262 = load i32, ptr %v195, align 4
  %263 = call i32 @llvm.riscv.addi.enc(i32 %262, i32 -1)
  store i32 %263, ptr %__full_reg_r187, align 4
  %264 = load i32, ptr %__full_reg_r187, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %264) #4, !srcloc !60
  %v196 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp186, i32 0, i32 0
  %265 = load i32, ptr %__full_reg_r187, align 4
  store i32 %265, ptr %v196, align 4
  %v197 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp186, i32 0, i32 0
  %266 = load i32, ptr %v197, align 4
  %267 = call i32 @llvm.riscv.xor.enc(i32 %258, i32 %266)
  %268 = call i32 @llvm.riscv.addi.enc(i32 %267, i32 1)
  %269 = call i32 @llvm.riscv.addi.enc(i32 %268, i32 13)
  store i32 %269, ptr %__isub_enc_r, align 4
  %270 = load i32, ptr %__isub_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %270) #4, !srcloc !61
  %v199 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral198, i32 0, i32 0
  %271 = load i32, ptr %__isub_enc_r, align 4
  store i32 %271, ptr %v199, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral198, i32 4, i1 false)
  %v200 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %272 = load i32, ptr %v200, align 4
  %v206 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral205, i32 0, i32 0
  store i32 0, ptr %v206, align 4
  %v208 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral207, i32 0, i32 0
  store i32 0, ptr %v208, align 4
  %273 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %273, ptr %__zero_reg_r204, align 4
  %274 = load i32, ptr %__zero_reg_r204, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %274) #4, !srcloc !62
  %v209 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp203, i32 0, i32 0
  %275 = load i32, ptr %__zero_reg_r204, align 4
  store i32 %275, ptr %v209, align 4
  %v210 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp203, i32 0, i32 0
  %276 = load i32, ptr %v210, align 4
  %277 = call i32 @llvm.riscv.addi.enc(i32 %276, i32 -1)
  store i32 %277, ptr %__full_reg_r202, align 4
  %278 = load i32, ptr %__full_reg_r202, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %278) #4, !srcloc !63
  %v211 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp201, i32 0, i32 0
  %279 = load i32, ptr %__full_reg_r202, align 4
  store i32 %279, ptr %v211, align 4
  %v212 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp201, i32 0, i32 0
  %280 = load i32, ptr %v212, align 4
  %281 = call i32 @llvm.riscv.xor.enc(i32 %272, i32 %280)
  %282 = call i32 @llvm.riscv.addi.enc(i32 %281, i32 1)
  %283 = call i32 @llvm.riscv.addi.enc(i32 %282, i32 13)
  %284 = call i32 @llvm.riscv.sltiu.enc(i32 %283, i32 1)
  store i32 %284, ptr %__iset_enc_r, align 4
  %285 = load i32, ptr %__iset_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %285) #4, !srcloc !64
  %v214 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral213, i32 0, i32 0
  %286 = load i32, ptr %__iset_enc_r, align 4
  store i32 %286, ptr %v214, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral213, i32 4, i1 false)
  %v215 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %287 = load i32, ptr %v215, align 4
  %288 = call i32 @llvm.riscv.slti.enc(i32 %287, i32 13)
  %v216 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %289 = load i32, ptr %v216, align 4
  %290 = call i32 @llvm.riscv.addi.enc(i32 %289, i32 -13)
  %291 = call i32 @llvm.riscv.sltiu.enc(i32 %290, i32 1)
  %292 = call i32 @llvm.riscv.or.enc(i32 %288, i32 %291)
  %293 = call i32 @llvm.riscv.sltiu.enc(i32 %292, i32 1)
  store i32 %293, ptr %__islt_enc_r, align 4
  %294 = load i32, ptr %__islt_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %294) #4, !srcloc !65
  %v218 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral217, i32 0, i32 0
  %295 = load i32, ptr %__islt_enc_r, align 4
  store i32 %295, ptr %v218, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral217, i32 4, i1 false)
  %v219 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %296 = load i32, ptr %v219, align 4
  %297 = call i32 @llvm.riscv.slti.enc(i32 %296, i32 13)
  %298 = call i32 @llvm.riscv.sltiu.enc(i32 %297, i32 1)
  store i32 %298, ptr %__islet_enc_r, align 4
  %299 = load i32, ptr %__islet_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %299) #4, !srcloc !66
  %v221 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral220, i32 0, i32 0
  %300 = load i32, ptr %__islet_enc_r, align 4
  store i32 %300, ptr %v221, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral220, i32 4, i1 false)
  %v222 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %301 = load i32, ptr %v222, align 4
  %302 = call i32 @llvm.riscv.slti.enc(i32 %301, i32 13)
  store i32 %302, ptr %__isgt_enc_r, align 4
  %303 = load i32, ptr %__isgt_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %303) #4, !srcloc !67
  %v224 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral223, i32 0, i32 0
  %304 = load i32, ptr %__isgt_enc_r, align 4
  store i32 %304, ptr %v224, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral223, i32 4, i1 false)
  %v225 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %305 = load i32, ptr %v225, align 4
  %306 = call i32 @llvm.riscv.slti.enc(i32 %305, i32 13)
  %v226 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %307 = load i32, ptr %v226, align 4
  %308 = call i32 @llvm.riscv.addi.enc(i32 %307, i32 -13)
  %309 = call i32 @llvm.riscv.sltiu.enc(i32 %308, i32 1)
  %310 = call i32 @llvm.riscv.or.enc(i32 %306, i32 %309)
  store i32 %310, ptr %__isget_enc_r, align 4
  %311 = load i32, ptr %__isget_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %311) #4, !srcloc !68
  %v228 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral227, i32 0, i32 0
  %312 = load i32, ptr %__isget_enc_r, align 4
  store i32 %312, ptr %v228, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral227, i32 4, i1 false)
  %v230 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %313 = load i32, ptr %v230, align 4
  %v231 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %314 = load i32, ptr %v231, align 4
  %315 = call i32 @llvm.riscv.and.enc(i32 %313, i32 %314)
  store i32 %315, ptr %__and_enc_r229, align 4
  %316 = load i32, ptr %__and_enc_r229, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %316) #4, !srcloc !69
  %v233 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral232, i32 0, i32 0
  %317 = load i32, ptr %__and_enc_r229, align 4
  store i32 %317, ptr %v233, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral232, i32 4, i1 false)
  %v235 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %318 = load i32, ptr %v235, align 4
  %319 = call i32 @llvm.riscv.sltiu.enc(i32 %318, i32 1)
  %320 = call i32 @llvm.riscv.sltiu.enc(i32 %319, i32 1)
  %v236 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %321 = load i32, ptr %v236, align 4
  %322 = call i32 @llvm.riscv.sltiu.enc(i32 %321, i32 1)
  %323 = call i32 @llvm.riscv.sltiu.enc(i32 %322, i32 1)
  %324 = call i32 @llvm.riscv.and.enc(i32 %320, i32 %323)
  store i32 %324, ptr %__land_enc_r234, align 4
  %325 = load i32, ptr %__land_enc_r234, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %325) #4, !srcloc !70
  %v238 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral237, i32 0, i32 0
  %326 = load i32, ptr %__land_enc_r234, align 4
  store i32 %326, ptr %v238, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral237, i32 4, i1 false)
  %v240 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %327 = load i32, ptr %v240, align 4
  %v241 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %328 = load i32, ptr %v241, align 4
  %329 = call i32 @llvm.riscv.or.enc(i32 %327, i32 %328)
  store i32 %329, ptr %__or_enc_r239, align 4
  %330 = load i32, ptr %__or_enc_r239, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %330) #4, !srcloc !71
  %v243 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral242, i32 0, i32 0
  %331 = load i32, ptr %__or_enc_r239, align 4
  store i32 %331, ptr %v243, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral242, i32 4, i1 false)
  %v245 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %332 = load i32, ptr %v245, align 4
  %333 = call i32 @llvm.riscv.sltiu.enc(i32 %332, i32 1)
  %334 = call i32 @llvm.riscv.sltiu.enc(i32 %333, i32 1)
  %v246 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %335 = load i32, ptr %v246, align 4
  %336 = call i32 @llvm.riscv.sltiu.enc(i32 %335, i32 1)
  %337 = call i32 @llvm.riscv.sltiu.enc(i32 %336, i32 1)
  %338 = call i32 @llvm.riscv.or.enc(i32 %334, i32 %337)
  store i32 %338, ptr %__lor_enc_r244, align 4
  %339 = load i32, ptr %__lor_enc_r244, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %339) #4, !srcloc !72
  %v248 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral247, i32 0, i32 0
  %340 = load i32, ptr %__lor_enc_r244, align 4
  store i32 %340, ptr %v248, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral247, i32 4, i1 false)
  %v250 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %341 = load i32, ptr %v250, align 4
  %v251 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %342 = load i32, ptr %v251, align 4
  %343 = call i32 @llvm.riscv.xor.enc(i32 %341, i32 %342)
  store i32 %343, ptr %__xor_enc_r249, align 4
  %344 = load i32, ptr %__xor_enc_r249, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %344) #4, !srcloc !73
  %v253 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral252, i32 0, i32 0
  %345 = load i32, ptr %__xor_enc_r249, align 4
  store i32 %345, ptr %v253, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral252, i32 4, i1 false)
  %v255 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %346 = load i32, ptr %v255, align 4
  %347 = call i32 @llvm.riscv.sltiu.enc(i32 %346, i32 1)
  %348 = call i32 @llvm.riscv.sltiu.enc(i32 %347, i32 1)
  %v256 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %349 = load i32, ptr %v256, align 4
  %350 = call i32 @llvm.riscv.sltiu.enc(i32 %349, i32 1)
  %351 = call i32 @llvm.riscv.sltiu.enc(i32 %350, i32 1)
  %352 = call i32 @llvm.riscv.xor.enc(i32 %348, i32 %351)
  store i32 %352, ptr %__lxor_enc_r254, align 4
  %353 = load i32, ptr %__lxor_enc_r254, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %353) #4, !srcloc !74
  %v258 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral257, i32 0, i32 0
  %354 = load i32, ptr %__lxor_enc_r254, align 4
  store i32 %354, ptr %v258, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral257, i32 4, i1 false)
  %v260 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %355 = load i32, ptr %v260, align 4
  %v261 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %356 = load i32, ptr %v261, align 4
  %357 = call i32 @llvm.riscv.sll.enc(i32 %355, i32 %356)
  store i32 %357, ptr %__sll_enc_r259, align 4
  %358 = load i32, ptr %__sll_enc_r259, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %358) #4, !srcloc !75
  %v263 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral262, i32 0, i32 0
  %359 = load i32, ptr %__sll_enc_r259, align 4
  store i32 %359, ptr %v263, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral262, i32 4, i1 false)
  %v265 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %360 = load i32, ptr %v265, align 4
  %v266 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %361 = load i32, ptr %v266, align 4
  %362 = call i32 @llvm.riscv.srl.enc(i32 %360, i32 %361)
  store i32 %362, ptr %__srl_enc_r264, align 4
  %363 = load i32, ptr %__srl_enc_r264, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %363) #4, !srcloc !76
  %v268 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral267, i32 0, i32 0
  %364 = load i32, ptr %__srl_enc_r264, align 4
  store i32 %364, ptr %v268, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral267, i32 4, i1 false)
  %v270 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %365 = load i32, ptr %v270, align 4
  %v271 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %366 = load i32, ptr %v271, align 4
  %367 = call i32 @llvm.riscv.add.enc(i32 %365, i32 %366)
  store i32 %367, ptr %__add_enc_r269, align 4
  %368 = load i32, ptr %__add_enc_r269, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %368) #4, !srcloc !77
  %v273 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral272, i32 0, i32 0
  %369 = load i32, ptr %__add_enc_r269, align 4
  store i32 %369, ptr %v273, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral272, i32 4, i1 false)
  %v275 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %370 = load i32, ptr %v275, align 4
  %v276 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %371 = load i32, ptr %v276, align 4
  %372 = call i32 @llvm.riscv.sub.enc(i32 %370, i32 %371)
  store i32 %372, ptr %__sub_enc_r274, align 4
  %373 = load i32, ptr %__sub_enc_r274, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %373) #4, !srcloc !78
  %v278 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral277, i32 0, i32 0
  %374 = load i32, ptr %__sub_enc_r274, align 4
  store i32 %374, ptr %v278, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral277, i32 4, i1 false)
  %v280 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %375 = load i32, ptr %v280, align 4
  %v281 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %376 = load i32, ptr %v281, align 4
  %377 = call i32 @llvm.riscv.sub.enc(i32 %375, i32 %376)
  %378 = call i32 @llvm.riscv.sltiu.enc(i32 %377, i32 1)
  store i32 %378, ptr %__set_enc_r279, align 4
  %379 = load i32, ptr %__set_enc_r279, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %379) #4, !srcloc !79
  %v283 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral282, i32 0, i32 0
  %380 = load i32, ptr %__set_enc_r279, align 4
  store i32 %380, ptr %v283, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral282, i32 4, i1 false)
  %v284 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %381 = load i32, ptr %v284, align 4
  %v285 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %382 = load i32, ptr %v285, align 4
  %383 = call i32 @llvm.riscv.sltu.enc(i32 %381, i32 %382)
  store i32 %383, ptr %__sltu_enc_r, align 4
  %384 = load i32, ptr %__sltu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %384) #4, !srcloc !80
  %v287 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral286, i32 0, i32 0
  %385 = load i32, ptr %__sltu_enc_r, align 4
  store i32 %385, ptr %v287, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral286, i32 4, i1 false)
  %v288 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %386 = load i32, ptr %v288, align 4
  %v289 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %387 = load i32, ptr %v289, align 4
  %388 = call i32 @llvm.riscv.sltu.enc(i32 %386, i32 %387)
  %v290 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %389 = load i32, ptr %v290, align 4
  %v291 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %390 = load i32, ptr %v291, align 4
  %391 = call i32 @llvm.riscv.sub.enc(i32 %389, i32 %390)
  %392 = call i32 @llvm.riscv.sltiu.enc(i32 %391, i32 1)
  %393 = call i32 @llvm.riscv.or.enc(i32 %388, i32 %392)
  store i32 %393, ptr %__sletu_enc_r, align 4
  %394 = load i32, ptr %__sletu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %394) #4, !srcloc !81
  %v293 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral292, i32 0, i32 0
  %395 = load i32, ptr %__sletu_enc_r, align 4
  store i32 %395, ptr %v293, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral292, i32 4, i1 false)
  %v294 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %396 = load i32, ptr %v294, align 4
  %v295 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %397 = load i32, ptr %v295, align 4
  %398 = call i32 @llvm.riscv.sltu.enc(i32 %396, i32 %397)
  store i32 %398, ptr %__sgtu_enc_r, align 4
  %399 = load i32, ptr %__sgtu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %399) #4, !srcloc !82
  %v297 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral296, i32 0, i32 0
  %400 = load i32, ptr %__sgtu_enc_r, align 4
  store i32 %400, ptr %v297, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral296, i32 4, i1 false)
  %v298 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %401 = load i32, ptr %v298, align 4
  %v299 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %402 = load i32, ptr %v299, align 4
  %403 = call i32 @llvm.riscv.sltu.enc(i32 %401, i32 %402)
  %404 = call i32 @llvm.riscv.sltiu.enc(i32 %403, i32 1)
  store i32 %404, ptr %__sgetu_enc_r, align 4
  %405 = load i32, ptr %__sgetu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %405) #4, !srcloc !83
  %v301 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral300, i32 0, i32 0
  %406 = load i32, ptr %__sgetu_enc_r, align 4
  store i32 %406, ptr %v301, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral300, i32 4, i1 false)
  %v303 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %407 = load i32, ptr %v303, align 4
  %408 = call i32 @llvm.riscv.andi.enc(i32 %407, i32 3)
  store i32 %408, ptr %__andi_enc_r302, align 4
  %409 = load i32, ptr %__andi_enc_r302, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %409) #4, !srcloc !84
  %v305 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral304, i32 0, i32 0
  %410 = load i32, ptr %__andi_enc_r302, align 4
  store i32 %410, ptr %v305, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral304, i32 4, i1 false)
  %v307 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %411 = load i32, ptr %v307, align 4
  %412 = call i32 @llvm.riscv.sltiu.enc(i32 %411, i32 1)
  %413 = call i32 @llvm.riscv.sltiu.enc(i32 %412, i32 1)
  %414 = call i32 @llvm.riscv.andi.enc(i32 %413, i32 1)
  store i32 %414, ptr %__landi_enc_r306, align 4
  %415 = load i32, ptr %__landi_enc_r306, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %415) #4, !srcloc !85
  %v309 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral308, i32 0, i32 0
  %416 = load i32, ptr %__landi_enc_r306, align 4
  store i32 %416, ptr %v309, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral308, i32 4, i1 false)
  %v311 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %417 = load i32, ptr %v311, align 4
  %418 = call i32 @llvm.riscv.ori.enc(i32 %417, i32 3)
  store i32 %418, ptr %__ori_enc_r310, align 4
  %419 = load i32, ptr %__ori_enc_r310, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %419) #4, !srcloc !86
  %v313 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral312, i32 0, i32 0
  %420 = load i32, ptr %__ori_enc_r310, align 4
  store i32 %420, ptr %v313, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral312, i32 4, i1 false)
  %v315 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %421 = load i32, ptr %v315, align 4
  %422 = call i32 @llvm.riscv.sltiu.enc(i32 %421, i32 1)
  %423 = call i32 @llvm.riscv.sltiu.enc(i32 %422, i32 1)
  %424 = call i32 @llvm.riscv.ori.enc(i32 %423, i32 1)
  store i32 %424, ptr %__lori_enc_r314, align 4
  %425 = load i32, ptr %__lori_enc_r314, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %425) #4, !srcloc !87
  %v317 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral316, i32 0, i32 0
  %426 = load i32, ptr %__lori_enc_r314, align 4
  store i32 %426, ptr %v317, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral316, i32 4, i1 false)
  %v319 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %427 = load i32, ptr %v319, align 4
  %428 = call i32 @llvm.riscv.xori.enc(i32 %427, i32 3)
  store i32 %428, ptr %__xori_enc_r318, align 4
  %429 = load i32, ptr %__xori_enc_r318, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %429) #4, !srcloc !88
  %v321 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral320, i32 0, i32 0
  %430 = load i32, ptr %__xori_enc_r318, align 4
  store i32 %430, ptr %v321, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral320, i32 4, i1 false)
  %v323 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %431 = load i32, ptr %v323, align 4
  %432 = call i32 @llvm.riscv.sltiu.enc(i32 %431, i32 1)
  %433 = call i32 @llvm.riscv.sltiu.enc(i32 %432, i32 1)
  %434 = call i32 @llvm.riscv.xori.enc(i32 %433, i32 1)
  store i32 %434, ptr %__lxori_enc_r322, align 4
  %435 = load i32, ptr %__lxori_enc_r322, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %435) #4, !srcloc !89
  %v325 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral324, i32 0, i32 0
  %436 = load i32, ptr %__lxori_enc_r322, align 4
  store i32 %436, ptr %v325, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral324, i32 4, i1 false)
  %v327 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %437 = load i32, ptr %v327, align 4
  %438 = call i32 @llvm.riscv.slli.enc(i32 %437, i32 3)
  store i32 %438, ptr %__slli_enc_r326, align 4
  %439 = load i32, ptr %__slli_enc_r326, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %439) #4, !srcloc !90
  %v329 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral328, i32 0, i32 0
  %440 = load i32, ptr %__slli_enc_r326, align 4
  store i32 %440, ptr %v329, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral328, i32 4, i1 false)
  %v331 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %441 = load i32, ptr %v331, align 4
  %442 = call i32 @llvm.riscv.srli.enc(i32 %441, i32 3)
  store i32 %442, ptr %__srli_enc_r330, align 4
  %443 = load i32, ptr %__srli_enc_r330, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %443) #4, !srcloc !91
  %v333 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral332, i32 0, i32 0
  %444 = load i32, ptr %__srli_enc_r330, align 4
  store i32 %444, ptr %v333, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral332, i32 4, i1 false)
  %v335 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %445 = load i32, ptr %v335, align 4
  %446 = call i32 @llvm.riscv.addi.enc(i32 %445, i32 3)
  store i32 %446, ptr %__addi_enc_r334, align 4
  %447 = load i32, ptr %__addi_enc_r334, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %447) #4, !srcloc !92
  %v337 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral336, i32 0, i32 0
  %448 = load i32, ptr %__addi_enc_r334, align 4
  store i32 %448, ptr %v337, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral336, i32 4, i1 false)
  %v339 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %449 = load i32, ptr %v339, align 4
  %450 = call i32 @llvm.riscv.addi.enc(i32 %449, i32 -3)
  store i32 %450, ptr %__subi_enc_r338, align 4
  %451 = load i32, ptr %__subi_enc_r338, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %451) #4, !srcloc !93
  %v341 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral340, i32 0, i32 0
  %452 = load i32, ptr %__subi_enc_r338, align 4
  store i32 %452, ptr %v341, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral340, i32 4, i1 false)
  %v343 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %453 = load i32, ptr %v343, align 4
  %454 = call i32 @llvm.riscv.addi.enc(i32 %453, i32 -3)
  %455 = call i32 @llvm.riscv.sltiu.enc(i32 %454, i32 1)
  store i32 %455, ptr %__seti_enc_r342, align 4
  %456 = load i32, ptr %__seti_enc_r342, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %456) #4, !srcloc !94
  %v345 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral344, i32 0, i32 0
  %457 = load i32, ptr %__seti_enc_r342, align 4
  store i32 %457, ptr %v345, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral344, i32 4, i1 false)
  %v346 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %458 = load i32, ptr %v346, align 4
  %459 = call i32 @llvm.riscv.sltiu.enc(i32 %458, i32 3)
  store i32 %459, ptr %__sltiu_enc_r, align 4
  %460 = load i32, ptr %__sltiu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %460) #4, !srcloc !95
  %v348 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral347, i32 0, i32 0
  %461 = load i32, ptr %__sltiu_enc_r, align 4
  store i32 %461, ptr %v348, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral347, i32 4, i1 false)
  %v349 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %462 = load i32, ptr %v349, align 4
  %463 = call i32 @llvm.riscv.sltiu.enc(i32 %462, i32 3)
  %v350 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %464 = load i32, ptr %v350, align 4
  %465 = call i32 @llvm.riscv.addi.enc(i32 %464, i32 -3)
  %466 = call i32 @llvm.riscv.sltiu.enc(i32 %465, i32 1)
  %467 = call i32 @llvm.riscv.or.enc(i32 %463, i32 %466)
  store i32 %467, ptr %__sletiu_enc_r, align 4
  %468 = load i32, ptr %__sletiu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %468) #4, !srcloc !96
  %v352 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral351, i32 0, i32 0
  %469 = load i32, ptr %__sletiu_enc_r, align 4
  store i32 %469, ptr %v352, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral351, i32 4, i1 false)
  %v353 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %470 = load i32, ptr %v353, align 4
  %471 = call i32 @llvm.riscv.sltiu.enc(i32 %470, i32 3)
  %472 = call i32 @llvm.riscv.sltiu.enc(i32 %471, i32 1)
  store i32 %472, ptr %__sgtiu_enc_r, align 4
  %473 = load i32, ptr %__sgtiu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %473) #4, !srcloc !97
  %v355 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral354, i32 0, i32 0
  %474 = load i32, ptr %__sgtiu_enc_r, align 4
  store i32 %474, ptr %v355, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral354, i32 4, i1 false)
  %v356 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %475 = load i32, ptr %v356, align 4
  %476 = call i32 @llvm.riscv.sltiu.enc(i32 %475, i32 3)
  %477 = call i32 @llvm.riscv.sltiu.enc(i32 %476, i32 1)
  store i32 %477, ptr %__sgetiu_enc_r, align 4
  %478 = load i32, ptr %__sgetiu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %478) #4, !srcloc !98
  %v358 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral357, i32 0, i32 0
  %479 = load i32, ptr %__sgetiu_enc_r, align 4
  store i32 %479, ptr %v358, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral357, i32 4, i1 false)
  %v360 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %480 = load i32, ptr %v360, align 4
  %481 = call i32 @llvm.riscv.andi.enc(i32 %480, i32 3)
  store i32 %481, ptr %__iand_enc_r359, align 4
  %482 = load i32, ptr %__iand_enc_r359, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %482) #4, !srcloc !99
  %v362 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral361, i32 0, i32 0
  %483 = load i32, ptr %__iand_enc_r359, align 4
  store i32 %483, ptr %v362, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral361, i32 4, i1 false)
  %v364 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %484 = load i32, ptr %v364, align 4
  %485 = call i32 @llvm.riscv.sltiu.enc(i32 %484, i32 1)
  %486 = call i32 @llvm.riscv.sltiu.enc(i32 %485, i32 1)
  %487 = call i32 @llvm.riscv.andi.enc(i32 %486, i32 1)
  store i32 %487, ptr %__iland_enc_r363, align 4
  %488 = load i32, ptr %__iland_enc_r363, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %488) #4, !srcloc !100
  %v366 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral365, i32 0, i32 0
  %489 = load i32, ptr %__iland_enc_r363, align 4
  store i32 %489, ptr %v366, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral365, i32 4, i1 false)
  %v368 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %490 = load i32, ptr %v368, align 4
  %491 = call i32 @llvm.riscv.ori.enc(i32 %490, i32 3)
  store i32 %491, ptr %__ior_enc_r367, align 4
  %492 = load i32, ptr %__ior_enc_r367, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %492) #4, !srcloc !101
  %v370 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral369, i32 0, i32 0
  %493 = load i32, ptr %__ior_enc_r367, align 4
  store i32 %493, ptr %v370, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral369, i32 4, i1 false)
  %v372 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %494 = load i32, ptr %v372, align 4
  %495 = call i32 @llvm.riscv.sltiu.enc(i32 %494, i32 1)
  %496 = call i32 @llvm.riscv.sltiu.enc(i32 %495, i32 1)
  %497 = call i32 @llvm.riscv.ori.enc(i32 %496, i32 1)
  store i32 %497, ptr %__ilor_enc_r371, align 4
  %498 = load i32, ptr %__ilor_enc_r371, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %498) #4, !srcloc !102
  %v374 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral373, i32 0, i32 0
  %499 = load i32, ptr %__ilor_enc_r371, align 4
  store i32 %499, ptr %v374, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral373, i32 4, i1 false)
  %v376 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %500 = load i32, ptr %v376, align 4
  %501 = call i32 @llvm.riscv.xori.enc(i32 %500, i32 3)
  store i32 %501, ptr %__ixor_enc_r375, align 4
  %502 = load i32, ptr %__ixor_enc_r375, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %502) #4, !srcloc !103
  %v378 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral377, i32 0, i32 0
  %503 = load i32, ptr %__ixor_enc_r375, align 4
  store i32 %503, ptr %v378, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral377, i32 4, i1 false)
  %v380 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %504 = load i32, ptr %v380, align 4
  %505 = call i32 @llvm.riscv.sltiu.enc(i32 %504, i32 1)
  %506 = call i32 @llvm.riscv.sltiu.enc(i32 %505, i32 1)
  %507 = call i32 @llvm.riscv.xori.enc(i32 %506, i32 1)
  store i32 %507, ptr %__ilxor_enc_r379, align 4
  %508 = load i32, ptr %__ilxor_enc_r379, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %508) #4, !srcloc !104
  %v382 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral381, i32 0, i32 0
  %509 = load i32, ptr %__ilxor_enc_r379, align 4
  store i32 %509, ptr %v382, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral381, i32 4, i1 false)
  %v387 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral386, i32 0, i32 0
  store i32 0, ptr %v387, align 4
  %v389 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral388, i32 0, i32 0
  store i32 0, ptr %v389, align 4
  %510 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %510, ptr %__zero_reg_r385, align 4
  %511 = load i32, ptr %__zero_reg_r385, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %511) #4, !srcloc !105
  %v390 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp384, i32 0, i32 0
  %512 = load i32, ptr %__zero_reg_r385, align 4
  store i32 %512, ptr %v390, align 4
  %v391 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp384, i32 0, i32 0
  %513 = load i32, ptr %v391, align 4
  %514 = call i32 @llvm.riscv.xori.enc(i32 %513, i32 3)
  %v392 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %515 = load i32, ptr %v392, align 4
  %516 = call i32 @llvm.riscv.sll.enc(i32 %514, i32 %515)
  store i32 %516, ptr %__isll_enc_r383, align 4
  %517 = load i32, ptr %__isll_enc_r383, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %517) #4, !srcloc !106
  %v394 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral393, i32 0, i32 0
  %518 = load i32, ptr %__isll_enc_r383, align 4
  store i32 %518, ptr %v394, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral393, i32 4, i1 false)
  %v399 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral398, i32 0, i32 0
  store i32 0, ptr %v399, align 4
  %v401 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral400, i32 0, i32 0
  store i32 0, ptr %v401, align 4
  %519 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %519, ptr %__zero_reg_r397, align 4
  %520 = load i32, ptr %__zero_reg_r397, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %520) #4, !srcloc !107
  %v402 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp396, i32 0, i32 0
  %521 = load i32, ptr %__zero_reg_r397, align 4
  store i32 %521, ptr %v402, align 4
  %v403 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp396, i32 0, i32 0
  %522 = load i32, ptr %v403, align 4
  %523 = call i32 @llvm.riscv.xori.enc(i32 %522, i32 3)
  %v404 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %524 = load i32, ptr %v404, align 4
  %525 = call i32 @llvm.riscv.srl.enc(i32 %523, i32 %524)
  store i32 %525, ptr %__isrl_enc_r395, align 4
  %526 = load i32, ptr %__isrl_enc_r395, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %526) #4, !srcloc !108
  %v406 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral405, i32 0, i32 0
  %527 = load i32, ptr %__isrl_enc_r395, align 4
  store i32 %527, ptr %v406, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral405, i32 4, i1 false)
  %v408 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %528 = load i32, ptr %v408, align 4
  %529 = call i32 @llvm.riscv.addi.enc(i32 %528, i32 3)
  store i32 %529, ptr %__iadd_enc_r407, align 4
  %530 = load i32, ptr %__iadd_enc_r407, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %530) #4, !srcloc !109
  %v410 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral409, i32 0, i32 0
  %531 = load i32, ptr %__iadd_enc_r407, align 4
  store i32 %531, ptr %v410, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral409, i32 4, i1 false)
  %v412 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %532 = load i32, ptr %v412, align 4
  %v418 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral417, i32 0, i32 0
  store i32 0, ptr %v418, align 4
  %v420 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral419, i32 0, i32 0
  store i32 0, ptr %v420, align 4
  %533 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %533, ptr %__zero_reg_r416, align 4
  %534 = load i32, ptr %__zero_reg_r416, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %534) #4, !srcloc !110
  %v421 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp415, i32 0, i32 0
  %535 = load i32, ptr %__zero_reg_r416, align 4
  store i32 %535, ptr %v421, align 4
  %v422 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp415, i32 0, i32 0
  %536 = load i32, ptr %v422, align 4
  %537 = call i32 @llvm.riscv.addi.enc(i32 %536, i32 -1)
  store i32 %537, ptr %__full_reg_r414, align 4
  %538 = load i32, ptr %__full_reg_r414, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %538) #4, !srcloc !111
  %v423 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp413, i32 0, i32 0
  %539 = load i32, ptr %__full_reg_r414, align 4
  store i32 %539, ptr %v423, align 4
  %v424 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp413, i32 0, i32 0
  %540 = load i32, ptr %v424, align 4
  %541 = call i32 @llvm.riscv.xor.enc(i32 %532, i32 %540)
  %542 = call i32 @llvm.riscv.addi.enc(i32 %541, i32 1)
  %543 = call i32 @llvm.riscv.addi.enc(i32 %542, i32 3)
  store i32 %543, ptr %__isub_enc_r411, align 4
  %544 = load i32, ptr %__isub_enc_r411, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %544) #4, !srcloc !112
  %v426 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral425, i32 0, i32 0
  %545 = load i32, ptr %__isub_enc_r411, align 4
  store i32 %545, ptr %v426, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral425, i32 4, i1 false)
  %v428 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %546 = load i32, ptr %v428, align 4
  %v434 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral433, i32 0, i32 0
  store i32 0, ptr %v434, align 4
  %v436 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral435, i32 0, i32 0
  store i32 0, ptr %v436, align 4
  %547 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %547, ptr %__zero_reg_r432, align 4
  %548 = load i32, ptr %__zero_reg_r432, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %548) #4, !srcloc !113
  %v437 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp431, i32 0, i32 0
  %549 = load i32, ptr %__zero_reg_r432, align 4
  store i32 %549, ptr %v437, align 4
  %v438 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp431, i32 0, i32 0
  %550 = load i32, ptr %v438, align 4
  %551 = call i32 @llvm.riscv.addi.enc(i32 %550, i32 -1)
  store i32 %551, ptr %__full_reg_r430, align 4
  %552 = load i32, ptr %__full_reg_r430, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %552) #4, !srcloc !114
  %v439 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp429, i32 0, i32 0
  %553 = load i32, ptr %__full_reg_r430, align 4
  store i32 %553, ptr %v439, align 4
  %v440 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp429, i32 0, i32 0
  %554 = load i32, ptr %v440, align 4
  %555 = call i32 @llvm.riscv.xor.enc(i32 %546, i32 %554)
  %556 = call i32 @llvm.riscv.addi.enc(i32 %555, i32 1)
  %557 = call i32 @llvm.riscv.addi.enc(i32 %556, i32 3)
  %558 = call i32 @llvm.riscv.sltiu.enc(i32 %557, i32 1)
  store i32 %558, ptr %__iset_enc_r427, align 4
  %559 = load i32, ptr %__iset_enc_r427, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %559) #4, !srcloc !115
  %v442 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral441, i32 0, i32 0
  %560 = load i32, ptr %__iset_enc_r427, align 4
  store i32 %560, ptr %v442, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral441, i32 4, i1 false)
  %v443 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %561 = load i32, ptr %v443, align 4
  %562 = call i32 @llvm.riscv.sltiu.enc(i32 %561, i32 3)
  %v444 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %563 = load i32, ptr %v444, align 4
  %564 = call i32 @llvm.riscv.addi.enc(i32 %563, i32 -3)
  %565 = call i32 @llvm.riscv.sltiu.enc(i32 %564, i32 1)
  %566 = call i32 @llvm.riscv.or.enc(i32 %562, i32 %565)
  %567 = call i32 @llvm.riscv.sltiu.enc(i32 %566, i32 1)
  store i32 %567, ptr %__isltu_enc_r, align 4
  %568 = load i32, ptr %__isltu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %568) #4, !srcloc !116
  %v446 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral445, i32 0, i32 0
  %569 = load i32, ptr %__isltu_enc_r, align 4
  store i32 %569, ptr %v446, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral445, i32 4, i1 false)
  %v447 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %570 = load i32, ptr %v447, align 4
  %571 = call i32 @llvm.riscv.sltiu.enc(i32 %570, i32 3)
  %572 = call i32 @llvm.riscv.sltiu.enc(i32 %571, i32 1)
  store i32 %572, ptr %__isletu_enc_r, align 4
  %573 = load i32, ptr %__isletu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %573) #4, !srcloc !117
  %v449 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral448, i32 0, i32 0
  %574 = load i32, ptr %__isletu_enc_r, align 4
  store i32 %574, ptr %v449, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral448, i32 4, i1 false)
  %v450 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %575 = load i32, ptr %v450, align 4
  %576 = call i32 @llvm.riscv.sltiu.enc(i32 %575, i32 3)
  store i32 %576, ptr %__isgtu_enc_r, align 4
  %577 = load i32, ptr %__isgtu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %577) #4, !srcloc !118
  %v452 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral451, i32 0, i32 0
  %578 = load i32, ptr %__isgtu_enc_r, align 4
  store i32 %578, ptr %v452, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral451, i32 4, i1 false)
  %v453 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %579 = load i32, ptr %v453, align 4
  %580 = call i32 @llvm.riscv.sltiu.enc(i32 %579, i32 3)
  %v454 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %581 = load i32, ptr %v454, align 4
  %582 = call i32 @llvm.riscv.addi.enc(i32 %581, i32 -3)
  %583 = call i32 @llvm.riscv.sltiu.enc(i32 %582, i32 1)
  %584 = call i32 @llvm.riscv.or.enc(i32 %580, i32 %583)
  store i32 %584, ptr %__isgetu_enc_r, align 4
  %585 = load i32, ptr %__isgetu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %585) #4, !srcloc !119
  %v456 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral455, i32 0, i32 0
  %586 = load i32, ptr %__isgetu_enc_r, align 4
  store i32 %586, ptr %v456, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral455, i32 4, i1 false)
  %v458 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %587 = load i32, ptr %v458, align 4
  %v459 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %588 = load i32, ptr %v459, align 4
  %589 = call i32 @llvm.riscv.add.enc(i32 %587, i32 %588)
  store i32 %589, ptr %__add_enc_r457, align 4
  %590 = load i32, ptr %__add_enc_r457, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %590) #4, !srcloc !120
  %v460 = getelementptr inbounds nuw %struct.int_enc, ptr %a, i32 0, i32 0
  %591 = load i32, ptr %__add_enc_r457, align 4
  store i32 %591, ptr %v460, align 4
  %v462 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %592 = load i32, ptr %v462, align 4
  %v463 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %593 = load i32, ptr %v463, align 4
  %594 = call i32 @llvm.riscv.sub.enc(i32 %592, i32 %593)
  store i32 %594, ptr %__sub_enc_r461, align 4
  %595 = load i32, ptr %__sub_enc_r461, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %595) #4, !srcloc !121
  %v464 = getelementptr inbounds nuw %struct.int_enc, ptr %b, i32 0, i32 0
  %596 = load i32, ptr %__sub_enc_r461, align 4
  store i32 %596, ptr %v464, align 4
  %v466 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %597 = load i32, ptr %v466, align 4
  %v467 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %598 = load i32, ptr %v467, align 4
  %599 = call i32 @llvm.riscv.add.enc(i32 %597, i32 %598)
  store i32 %599, ptr %__add_enc_r465, align 4
  %600 = load i32, ptr %__add_enc_r465, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %600) #4, !srcloc !122
  %v469 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral468, i32 0, i32 0
  %601 = load i32, ptr %__add_enc_r465, align 4
  store i32 %601, ptr %v469, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral468, i32 4, i1 false)
  %v471 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %602 = load i32, ptr %v471, align 4
  %v472 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %603 = load i32, ptr %v472, align 4
  %604 = call i32 @llvm.riscv.sub.enc(i32 %602, i32 %603)
  store i32 %604, ptr %__sub_enc_r470, align 4
  %605 = load i32, ptr %__sub_enc_r470, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %605) #4, !srcloc !123
  %v474 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral473, i32 0, i32 0
  %606 = load i32, ptr %__sub_enc_r470, align 4
  store i32 %606, ptr %v474, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral473, i32 4, i1 false)
  %v476 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %607 = load i32, ptr %v476, align 4
  %608 = call i32 @llvm.riscv.addi.enc(i32 %607, i32 1)
  store i32 %608, ptr %__addi_enc_r475, align 4
  %609 = load i32, ptr %__addi_enc_r475, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %609) #4, !srcloc !124
  %v478 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral477, i32 0, i32 0
  %610 = load i32, ptr %__addi_enc_r475, align 4
  store i32 %610, ptr %v478, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral477, i32 4, i1 false)
  %v480 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %611 = load i32, ptr %v480, align 4
  %612 = call i32 @llvm.riscv.addi.enc(i32 %611, i32 -1)
  store i32 %612, ptr %__subi_enc_r479, align 4
  %613 = load i32, ptr %__subi_enc_r479, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %613) #4, !srcloc !125
  %v482 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral481, i32 0, i32 0
  %614 = load i32, ptr %__subi_enc_r479, align 4
  store i32 %614, ptr %v482, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral481, i32 4, i1 false)
  %v483 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %615 = load i32, ptr %v483, align 4
  %v484 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %616 = load i32, ptr %v484, align 4
  %v485 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %617 = load i32, ptr %v485, align 4
  %618 = call i32 @llvm.riscv.cmov.enc(i32 %615, i32 %616, i32 %617)
  store i32 %618, ptr %__cmov_enc_r, align 4
  %619 = load i32, ptr %__cmov_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %619) #4, !srcloc !126
  %v487 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral486, i32 0, i32 0
  %620 = load i32, ptr %__cmov_enc_r, align 4
  store i32 %620, ptr %v487, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral486, i32 4, i1 false)
  %v490 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %621 = load i32, ptr %v490, align 4
  %622 = call i32 @llvm.riscv.sub.enc(i32 %621, i32 13)
  store i32 %622, ptr %__sub_enc_r489, align 4
  %623 = load i32, ptr %__sub_enc_r489, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %623) #4, !srcloc !127
  %v491 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp488, i32 0, i32 0
  %624 = load i32, ptr %__sub_enc_r489, align 4
  store i32 %624, ptr %v491, align 4
  %coerce.dive = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp488, i32 0, i32 0
  %625 = load i32, ptr %coerce.dive, align 4
  %coerce.dive492 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %626 = load i32, ptr %coerce.dive492, align 4
  %coerce.dive493 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %627 = load i32, ptr %coerce.dive493, align 4
  %call = call i32 @addDouble(i32 %625, i32 %626, i32 %627)
  %coerce.dive494 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp, i32 0, i32 0
  store i32 %call, ptr %coerce.dive494, align 4
  %v498 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %628 = load i32, ptr %v498, align 4
  %629 = call i32 @llvm.riscv.slli.enc(i32 %628, i32 2)
  store i32 %629, ptr %__slli_enc_r497, align 4
  %630 = load i32, ptr %__slli_enc_r497, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %630) #4, !srcloc !128
  %v499 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp496, i32 0, i32 0
  %631 = load i32, ptr %__slli_enc_r497, align 4
  store i32 %631, ptr %v499, align 4
  %coerce.dive500 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %632 = load i32, ptr %coerce.dive500, align 4
  %coerce.dive501 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp496, i32 0, i32 0
  %633 = load i32, ptr %coerce.dive501, align 4
  %coerce.dive502 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %634 = load i32, ptr %coerce.dive502, align 4
  %call503 = call i32 @addDouble(i32 %632, i32 %633, i32 %634)
  %coerce.dive504 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp495, i32 0, i32 0
  store i32 %call503, ptr %coerce.dive504, align 4
  %coerce.dive505 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp, i32 0, i32 0
  %635 = load i32, ptr %coerce.dive505, align 4
  %coerce.dive506 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp495, i32 0, i32 0
  %636 = load i32, ptr %coerce.dive506, align 4
  %coerce.dive507 = getelementptr inbounds nuw %struct.int_enc, ptr %thirteen, i32 0, i32 0
  %637 = load i32, ptr %coerce.dive507, align 4
  %call508 = call i32 @addDouble(i32 %635, i32 %636, i32 %637)
  %coerce.dive509 = getelementptr inbounds nuw %struct.int_enc, ptr %tmp, i32 0, i32 0
  store i32 %call508, ptr %coerce.dive509, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %tmp, i32 4, i1 false)
  %v518 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %638 = load i32, ptr %v518, align 4
  %v519 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %639 = load i32, ptr %v519, align 4
  %640 = call i32 @llvm.riscv.add.enc(i32 %638, i32 %639)
  store i32 %640, ptr %__add_enc_r517, align 4
  %641 = load i32, ptr %__add_enc_r517, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %641) #4, !srcloc !129
  %v520 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp516, i32 0, i32 0
  %642 = load i32, ptr %__add_enc_r517, align 4
  store i32 %642, ptr %v520, align 4
  %v521 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp516, i32 0, i32 0
  %643 = load i32, ptr %v521, align 4
  %v522 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %644 = load i32, ptr %v522, align 4
  %645 = call i32 @llvm.riscv.sll.enc(i32 %643, i32 %644)
  store i32 %645, ptr %__sll_enc_r515, align 4
  %646 = load i32, ptr %__sll_enc_r515, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %646) #4, !srcloc !130
  %v523 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp514, i32 0, i32 0
  %647 = load i32, ptr %__sll_enc_r515, align 4
  store i32 %647, ptr %v523, align 4
  %v524 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp514, i32 0, i32 0
  %648 = load i32, ptr %v524, align 4
  %649 = call i32 @llvm.riscv.sltiu.enc(i32 %648, i32 1)
  %650 = call i32 @llvm.riscv.sltiu.enc(i32 %649, i32 1)
  %v527 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %651 = load i32, ptr %v527, align 4
  %652 = call i32 @llvm.riscv.addi.enc(i32 %651, i32 -1)
  store i32 %652, ptr %__subi_enc_r526, align 4
  %653 = load i32, ptr %__subi_enc_r526, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %653) #4, !srcloc !131
  %v528 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp525, i32 0, i32 0
  %654 = load i32, ptr %__subi_enc_r526, align 4
  store i32 %654, ptr %v528, align 4
  %v529 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp525, i32 0, i32 0
  %655 = load i32, ptr %v529, align 4
  %656 = call i32 @llvm.riscv.sltiu.enc(i32 %655, i32 1)
  %657 = call i32 @llvm.riscv.sltiu.enc(i32 %656, i32 1)
  %658 = call i32 @llvm.riscv.and.enc(i32 %650, i32 %657)
  store i32 %658, ptr %__land_enc_r513, align 4
  %659 = load i32, ptr %__land_enc_r513, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %659) #4, !srcloc !132
  %v530 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp512, i32 0, i32 0
  %660 = load i32, ptr %__land_enc_r513, align 4
  store i32 %660, ptr %v530, align 4
  %coerce.dive531 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp512, i32 0, i32 0
  %661 = load i32, ptr %coerce.dive531, align 4
  %coerce.dive532 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %662 = load i32, ptr %coerce.dive532, align 4
  %coerce.dive533 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %663 = load i32, ptr %coerce.dive533, align 4
  %call534 = call i32 @addDouble(i32 %661, i32 %662, i32 %663)
  %coerce.dive535 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp511, i32 0, i32 0
  store i32 %call534, ptr %coerce.dive535, align 4
  %coerce.dive536 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp511, i32 0, i32 0
  %664 = load i32, ptr %coerce.dive536, align 4
  %coerce.dive537 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %665 = load i32, ptr %coerce.dive537, align 4
  %coerce.dive538 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %666 = load i32, ptr %coerce.dive538, align 4
  %call539 = call i32 @addDouble(i32 %664, i32 %665, i32 %666)
  %coerce.dive540 = getelementptr inbounds nuw %struct.int_enc, ptr %tmp510, i32 0, i32 0
  store i32 %call539, ptr %coerce.dive540, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %tmp510, i32 4, i1 false)
  %coerce.dive543 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %667 = load i32, ptr %coerce.dive543, align 4
  %coerce.dive544 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %668 = load i32, ptr %coerce.dive544, align 4
  %coerce.dive545 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %669 = load i32, ptr %coerce.dive545, align 4
  %call546 = call i32 @uaddDouble(i32 %667, i32 %668, i32 %669)
  %coerce.dive547 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp542, i32 0, i32 0
  store i32 %call546, ptr %coerce.dive547, align 4
  %coerce.dive548 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp542, i32 0, i32 0
  %670 = load i32, ptr %coerce.dive548, align 4
  %coerce.dive549 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %671 = load i32, ptr %coerce.dive549, align 4
  %coerce.dive550 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %672 = load i32, ptr %coerce.dive550, align 4
  %call551 = call i32 @uaddDouble(i32 %670, i32 %671, i32 %672)
  %coerce.dive552 = getelementptr inbounds nuw %struct.uint_enc, ptr %tmp541, i32 0, i32 0
  store i32 %call551, ptr %coerce.dive552, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %tmp541, i32 4, i1 false)
  %coerce.dive555 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %673 = load i32, ptr %coerce.dive555, align 4
  %coerce.dive556 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %674 = load i32, ptr %coerce.dive556, align 4
  %coerce.dive557 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %675 = load i32, ptr %coerce.dive557, align 4
  %call558 = call i32 @uaddDouble(i32 %673, i32 %674, i32 %675)
  %coerce.dive559 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp554, i32 0, i32 0
  store i32 %call558, ptr %coerce.dive559, align 4
  %coerce.dive561 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %676 = load i32, ptr %coerce.dive561, align 4
  %coerce.dive562 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %677 = load i32, ptr %coerce.dive562, align 4
  %coerce.dive563 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %678 = load i32, ptr %coerce.dive563, align 4
  %call564 = call i32 @uaddDouble(i32 %676, i32 %677, i32 %678)
  %coerce.dive565 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp560, i32 0, i32 0
  store i32 %call564, ptr %coerce.dive565, align 4
  %coerce.dive566 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp554, i32 0, i32 0
  %679 = load i32, ptr %coerce.dive566, align 4
  %coerce.dive567 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp560, i32 0, i32 0
  %680 = load i32, ptr %coerce.dive567, align 4
  %coerce.dive568 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %681 = load i32, ptr %coerce.dive568, align 4
  %call569 = call i32 @uaddDouble(i32 %679, i32 %680, i32 %681)
  %coerce.dive570 = getelementptr inbounds nuw %struct.uint_enc, ptr %tmp553, i32 0, i32 0
  store i32 %call569, ptr %coerce.dive570, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %tmp553, i32 4, i1 false)
  %coerce.dive571 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %682 = load i32, ptr %coerce.dive571, align 4
  %coerce.dive572 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %683 = load i32, ptr %coerce.dive572, align 4
  %coerce.dive573 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %684 = load i32, ptr %coerce.dive573, align 4
  %call574 = call i32 @addDouble(i32 %682, i32 %683, i32 %684)
  %coerce.dive575 = getelementptr inbounds nuw %struct.int_enc, ptr %coerce, i32 0, i32 0
  store i32 %call574, ptr %coerce.dive575, align 4
  %coerce.dive576 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %685 = load i32, ptr %coerce.dive576, align 4
  %coerce.dive577 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %686 = load i32, ptr %coerce.dive577, align 4
  %coerce.dive578 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %687 = load i32, ptr %coerce.dive578, align 4
  %call579 = call i32 @addDouble(i32 %685, i32 %686, i32 %687)
  %coerce.dive581 = getelementptr inbounds nuw %struct.int_enc, ptr %coerce580, i32 0, i32 0
  store i32 %call579, ptr %coerce.dive581, align 4
  %v583 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral582, i32 0, i32 0
  store i32 0, ptr %v583, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %z, ptr align 4 %.compoundliteral582, i32 4, i1 false)
  %call584 = call i32 @getSeven()
  store i32 %call584, ptr %seven, align 4
  store i32 0, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %688 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %688, 10
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x585, ptr align 4 @__const.main.x.1, i32 4, i1 false)
  %689 = load i32, ptr %i, align 4
  %inc = add nsw i32 %689, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !133

while.end:                                        ; preds = %while.cond
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #3

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.addi.enc(i32, i32 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.xor.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sltiu.enc(i32, i32 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.and.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.or.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sll.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.srl.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sub.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.slt.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.andi.enc(i32, i32 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.ori.enc(i32, i32 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.xori.enc(i32, i32 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.slli.enc(i32, i32 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.srli.enc(i32, i32 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.slti.enc(i32, i32 immarg) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.sltu.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.cmov.enc(i32, i32, i32) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+i,+m,+relax,+zaamo,+zalrsc,+zca,+zmmul,-b,-d,-e,-experimental-p,-experimental-smpmpmt,-experimental-svukte,-experimental-xqccmt,-experimental-xsfmclic,-experimental-xsfsclic,-experimental-y,-experimental-zibi,-experimental-zicfilp,-experimental-zicfiss,-experimental-zvabd,-experimental-zvbc32e,-experimental-zvdot4a8i,-experimental-zvfbdota32f,-experimental-zvfbfa,-experimental-zvfofp8min,-experimental-zvfqwbdota8f,-experimental-zvfqwdota8f,-experimental-zvfwbdota16bf,-experimental-zvfwdota16bf,-experimental-zvkgs,-experimental-zvqwbdota16i,-experimental-zvqwbdota8i,-experimental-zvqwdota16i,-experimental-zvqwdota8i,-experimental-zvvfmm,-experimental-zvvmm,-experimental-zvvmtls,-experimental-zvvmttls,-experimental-zvzip,-f,-h,-q,-sdext,-sdtrig,-sha,-shcounterenw,-shgatpa,-shlcofideleg,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcntrpmf,-smcsrind,-smctr,-smdbltrp,-smepmp,-smmpm,-smnpm,-smrnmi,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssctr,-ssdbltrp,-ssnpm,-sspm,-ssqosid,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-supm,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-svrsw60t59b,-svvptc,-v,-xaifet,-xandesbfhcvt,-xandesperf,-xandesvbfhcvt,-xandesvdot,-xandesvpackfph,-xandesvsinth,-xandesvsintload,-xcheriot,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xmipscbop,-xmipscmov,-xmipsexectl,-xmipslsp,-xqccmp,-xqci,-xqcia,-xqciac,-xqcibi,-xqcibm,-xqcicli,-xqcicm,-xqcics,-xqcicsr,-xqciint,-xqciio,-xqcilb,-xqcili,-xqcilia,-xqcilo,-xqcilsm,-xqcisim,-xqcisls,-xqcisync,-xsfcease,-xsfmm128t,-xsfmm16t,-xsfmm32a,-xsfmm32a16f,-xsfmm32a32f,-xsfmm32a8f,-xsfmm32a8i,-xsfmm32t,-xsfmm64a64f,-xsfmm64t,-xsfmmbase,-xsfvcp,-xsfvfbfexp16e,-xsfvfexp16e,-xsfvfexp32e,-xsfvfexpa,-xsfvfexpa64e,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xsmtvdot,-xsmtvdotii,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zabha,-zacas,-zalasr,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zcb,-zcd,-zce,-zcf,-zclsd,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccamoc,-ziccid,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zicsr,-zifencei,-zihintntl,-zihintpause,-zihpm,-zilsd,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"target-abi", !"ilp32"}
!1 = !{i32 6, !"riscv-isa", !2}
!2 = !{!"rv32i2p1_m2p0_a2p1_c2p0_zmmul1p0_zaamo1p0_zalrsc1p0_zca1p0"}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{i32 8, !"SmallDataLimit", i32 0}
!5 = !{!"clang version 23.0.0git (https://github.com/mattwalsh13/encrypted-riscv.git f76699ba303d347bc32d95d9fa55bdedc4c52bed)"}
!6 = !{i64 2147550010}
!7 = !{i64 2147550734}
!8 = !{i64 2147551458}
!9 = !{i64 2147552182}
!10 = !{i64 2147552981}
!11 = !{i64 2147553779}
!12 = !{i64 2147553835}
!13 = !{i64 2147553891}
!14 = !{i64 2147554439}
!15 = !{i64 2147555295}
!16 = !{i64 2147555351}
!17 = !{i64 2147555407}
!18 = !{i64 2147556132}
!19 = !{i64 2147557010}
!20 = !{i64 2147557728}
!21 = !{i64 2147558598}
!22 = !{i64 2147559322}
!23 = !{i64 2147560200}
!24 = !{i64 2147560925}
!25 = !{i64 2147561649}
!26 = !{i64 2147562373}
!27 = !{i64 2147563097}
!28 = !{i64 2147563851}
!29 = !{i64 2147564357}
!30 = !{i64 2147564997}
!31 = !{i64 2147565504}
!32 = !{i64 2147566043}
!33 = !{i64 2147566835}
!34 = !{i64 2147567556}
!35 = !{i64 2147568344}
!36 = !{i64 2147569058}
!37 = !{i64 2147569850}
!38 = !{i64 2147570571}
!39 = !{i64 2147571346}
!40 = !{i64 2147572120}
!41 = !{i64 2147572912}
!42 = !{i64 2147573707}
!43 = !{i64 2147574537}
!44 = !{i64 2147575174}
!45 = !{i64 2147575946}
!46 = !{i64 2147576767}
!47 = !{i64 2147577437}
!48 = !{i64 2147578230}
!49 = !{i64 2147578973}
!50 = !{i64 2147579761}
!51 = !{i64 2147580497}
!52 = !{i64 2147581289}
!53 = !{i64 2147582032}
!54 = !{i64 2147582972}
!55 = !{i64 2147583028}
!56 = !{i64 2147583967}
!57 = !{i64 2147584023}
!58 = !{i64 2147584815}
!59 = !{i64 2147586060}
!60 = !{i64 2147586116}
!61 = !{i64 2147586172}
!62 = !{i64 2147587453}
!63 = !{i64 2147587509}
!64 = !{i64 2147587565}
!65 = !{i64 2147588243}
!66 = !{i64 2147588770}
!67 = !{i64 2147589408}
!68 = !{i64 2147590037}
!69 = !{i64 2147590794}
!70 = !{i64 2147591703}
!71 = !{i64 2147592452}
!72 = !{i64 2147593353}
!73 = !{i64 2147594108}
!74 = !{i64 2147595017}
!75 = !{i64 2147595773}
!76 = !{i64 2147596528}
!77 = !{i64 2147597283}
!78 = !{i64 2147598038}
!79 = !{i64 2147598825}
!80 = !{i64 2147599356}
!81 = !{i64 2147600034}
!82 = !{i64 2147600569}
!83 = !{i64 2147601138}
!84 = !{i64 2147601947}
!85 = !{i64 2147602686}
!86 = !{i64 2147603490}
!87 = !{i64 2147604222}
!88 = !{i64 2147605030}
!89 = !{i64 2147605769}
!90 = !{i64 2147606560}
!91 = !{i64 2147607350}
!92 = !{i64 2147608158}
!93 = !{i64 2147608969}
!94 = !{i64 2147609815}
!95 = !{i64 2147610465}
!96 = !{i64 2147611254}
!97 = !{i64 2147611933}
!98 = !{i64 2147612616}
!99 = !{i64 2147613426}
!100 = !{i64 2147614187}
!101 = !{i64 2147614991}
!102 = !{i64 2147615745}
!103 = !{i64 2147616553}
!104 = !{i64 2147617314}
!105 = !{i64 2147618272}
!106 = !{i64 2147618328}
!107 = !{i64 2147619285}
!108 = !{i64 2147619341}
!109 = !{i64 2147620149}
!110 = !{i64 2147621410}
!111 = !{i64 2147621466}
!112 = !{i64 2147621522}
!113 = !{i64 2147622819}
!114 = !{i64 2147622875}
!115 = !{i64 2147622931}
!116 = !{i64 2147623628}
!117 = !{i64 2147624171}
!118 = !{i64 2147624822}
!119 = !{i64 2147625471}
!120 = !{i64 2147626198}
!121 = !{i64 2147626922}
!122 = !{i64 2147627646}
!123 = !{i64 2147628370}
!124 = !{i64 2147629157}
!125 = !{i64 2147629948}
!126 = !{i64 2147630620}
!127 = !{i64 2147631359}
!128 = !{i64 2147632128}
!129 = !{i64 2147654330}
!130 = !{i64 2147654530}
!131 = !{i64 2147655939}
!132 = !{i64 2147660143}
!133 = distinct !{!133, !134}
!134 = !{!"llvm.loop.mustprogress"}
