; ModuleID = 'main.pp.c'
source_filename = "main.pp.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown-elf"

%struct.int_enc = type { i32 }
%struct.uint_enc = type { i32 }

@globalCount = dso_local global %struct.int_enc zeroinitializer, align 4
@globalMax = dso_local global %struct.uint_enc { i32 100 }, align 4
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
  %__negate_enc_r = alloca i32, align 4
  %ref.tmp = alloca %struct.int_enc, align 4
  %__full_reg_r = alloca i32, align 4
  %ref.tmp1 = alloca %struct.int_enc, align 4
  %__zero_reg_r = alloca i32, align 4
  %.compoundliteral = alloca %struct.int_enc, align 4
  %.compoundliteral3 = alloca %struct.int_enc, align 4
  %.compoundliteral9 = alloca %struct.int_enc, align 4
  %__lnot_enc_r = alloca i32, align 4
  %.compoundliteral12 = alloca %struct.int_enc, align 4
  %__bnot_enc_r = alloca i32, align 4
  %ref.tmp15 = alloca %struct.int_enc, align 4
  %__full_reg_r16 = alloca i32, align 4
  %ref.tmp17 = alloca %struct.int_enc, align 4
  %__zero_reg_r18 = alloca i32, align 4
  %.compoundliteral19 = alloca %struct.int_enc, align 4
  %.compoundliteral21 = alloca %struct.int_enc, align 4
  %.compoundliteral27 = alloca %struct.int_enc, align 4
  %__and_enc_r = alloca i32, align 4
  %.compoundliteral31 = alloca %struct.int_enc, align 4
  %__land_enc_r = alloca i32, align 4
  %.compoundliteral35 = alloca %struct.int_enc, align 4
  %__or_enc_r = alloca i32, align 4
  %.compoundliteral39 = alloca %struct.int_enc, align 4
  %__lor_enc_r = alloca i32, align 4
  %.compoundliteral43 = alloca %struct.int_enc, align 4
  %__xor_enc_r = alloca i32, align 4
  %.compoundliteral47 = alloca %struct.int_enc, align 4
  %__lxor_enc_r = alloca i32, align 4
  %.compoundliteral51 = alloca %struct.int_enc, align 4
  %__sll_enc_r = alloca i32, align 4
  %.compoundliteral55 = alloca %struct.int_enc, align 4
  %__srl_enc_r = alloca i32, align 4
  %.compoundliteral59 = alloca %struct.int_enc, align 4
  %__add_enc_r = alloca i32, align 4
  %.compoundliteral63 = alloca %struct.int_enc, align 4
  %__sub_enc_r = alloca i32, align 4
  %.compoundliteral67 = alloca %struct.int_enc, align 4
  %__set_enc_r = alloca i32, align 4
  %.compoundliteral71 = alloca %struct.int_enc, align 4
  %__slt_enc_r = alloca i32, align 4
  %.compoundliteral75 = alloca %struct.int_enc, align 4
  %__slet_enc_r = alloca i32, align 4
  %.compoundliteral81 = alloca %struct.int_enc, align 4
  %__sgt_enc_r = alloca i32, align 4
  %.compoundliteral85 = alloca %struct.int_enc, align 4
  %__sget_enc_r = alloca i32, align 4
  %.compoundliteral91 = alloca %struct.int_enc, align 4
  %__andi_enc_r = alloca i32, align 4
  %.compoundliteral94 = alloca %struct.int_enc, align 4
  %__landi_enc_r = alloca i32, align 4
  %.compoundliteral97 = alloca %struct.int_enc, align 4
  %__ori_enc_r = alloca i32, align 4
  %.compoundliteral100 = alloca %struct.int_enc, align 4
  %__lori_enc_r = alloca i32, align 4
  %.compoundliteral103 = alloca %struct.int_enc, align 4
  %__xori_enc_r = alloca i32, align 4
  %.compoundliteral106 = alloca %struct.int_enc, align 4
  %__lxori_enc_r = alloca i32, align 4
  %.compoundliteral109 = alloca %struct.int_enc, align 4
  %__slli_enc_r = alloca i32, align 4
  %.compoundliteral112 = alloca %struct.int_enc, align 4
  %__srli_enc_r = alloca i32, align 4
  %.compoundliteral115 = alloca %struct.int_enc, align 4
  %__addi_enc_r = alloca i32, align 4
  %.compoundliteral118 = alloca %struct.int_enc, align 4
  %__subi_enc_r = alloca i32, align 4
  %.compoundliteral121 = alloca %struct.int_enc, align 4
  %__seti_enc_r = alloca i32, align 4
  %.compoundliteral124 = alloca %struct.int_enc, align 4
  %__slti_enc_r = alloca i32, align 4
  %.compoundliteral127 = alloca %struct.int_enc, align 4
  %__sleti_enc_r = alloca i32, align 4
  %.compoundliteral131 = alloca %struct.int_enc, align 4
  %__sgti_enc_r = alloca i32, align 4
  %.compoundliteral135 = alloca %struct.int_enc, align 4
  %__sgeti_enc_r = alloca i32, align 4
  %.compoundliteral138 = alloca %struct.int_enc, align 4
  %__iand_enc_r = alloca i32, align 4
  %.compoundliteral141 = alloca %struct.int_enc, align 4
  %__iland_enc_r = alloca i32, align 4
  %.compoundliteral144 = alloca %struct.int_enc, align 4
  %__ior_enc_r = alloca i32, align 4
  %.compoundliteral147 = alloca %struct.int_enc, align 4
  %__ilor_enc_r = alloca i32, align 4
  %.compoundliteral150 = alloca %struct.int_enc, align 4
  %__ixor_enc_r = alloca i32, align 4
  %.compoundliteral153 = alloca %struct.int_enc, align 4
  %__ilxor_enc_r = alloca i32, align 4
  %.compoundliteral156 = alloca %struct.int_enc, align 4
  %__isll_enc_r = alloca i32, align 4
  %ref.tmp158 = alloca %struct.int_enc, align 4
  %__zero_reg_r159 = alloca i32, align 4
  %.compoundliteral160 = alloca %struct.int_enc, align 4
  %.compoundliteral162 = alloca %struct.int_enc, align 4
  %.compoundliteral167 = alloca %struct.int_enc, align 4
  %__isrl_enc_r = alloca i32, align 4
  %ref.tmp169 = alloca %struct.int_enc, align 4
  %__zero_reg_r170 = alloca i32, align 4
  %.compoundliteral171 = alloca %struct.int_enc, align 4
  %.compoundliteral173 = alloca %struct.int_enc, align 4
  %.compoundliteral178 = alloca %struct.int_enc, align 4
  %__iadd_enc_r = alloca i32, align 4
  %.compoundliteral181 = alloca %struct.int_enc, align 4
  %__isub_enc_r = alloca i32, align 4
  %ref.tmp184 = alloca %struct.int_enc, align 4
  %__full_reg_r185 = alloca i32, align 4
  %ref.tmp186 = alloca %struct.int_enc, align 4
  %__zero_reg_r187 = alloca i32, align 4
  %.compoundliteral188 = alloca %struct.int_enc, align 4
  %.compoundliteral190 = alloca %struct.int_enc, align 4
  %.compoundliteral196 = alloca %struct.int_enc, align 4
  %__iset_enc_r = alloca i32, align 4
  %ref.tmp199 = alloca %struct.int_enc, align 4
  %__full_reg_r200 = alloca i32, align 4
  %ref.tmp201 = alloca %struct.int_enc, align 4
  %__zero_reg_r202 = alloca i32, align 4
  %.compoundliteral203 = alloca %struct.int_enc, align 4
  %.compoundliteral205 = alloca %struct.int_enc, align 4
  %.compoundliteral211 = alloca %struct.int_enc, align 4
  %__islt_enc_r = alloca i32, align 4
  %.compoundliteral214 = alloca %struct.int_enc, align 4
  %__islet_enc_r = alloca i32, align 4
  %.compoundliteral218 = alloca %struct.int_enc, align 4
  %__isgt_enc_r = alloca i32, align 4
  %.compoundliteral221 = alloca %struct.int_enc, align 4
  %__isget_enc_r = alloca i32, align 4
  %.compoundliteral225 = alloca %struct.int_enc, align 4
  %__and_enc_r227 = alloca i32, align 4
  %.compoundliteral230 = alloca %struct.uint_enc, align 4
  %__land_enc_r232 = alloca i32, align 4
  %.compoundliteral235 = alloca %struct.uint_enc, align 4
  %__or_enc_r237 = alloca i32, align 4
  %.compoundliteral240 = alloca %struct.uint_enc, align 4
  %__lor_enc_r242 = alloca i32, align 4
  %.compoundliteral245 = alloca %struct.uint_enc, align 4
  %__xor_enc_r247 = alloca i32, align 4
  %.compoundliteral250 = alloca %struct.uint_enc, align 4
  %__lxor_enc_r252 = alloca i32, align 4
  %.compoundliteral255 = alloca %struct.uint_enc, align 4
  %__sll_enc_r257 = alloca i32, align 4
  %.compoundliteral260 = alloca %struct.uint_enc, align 4
  %__srl_enc_r262 = alloca i32, align 4
  %.compoundliteral265 = alloca %struct.uint_enc, align 4
  %__add_enc_r267 = alloca i32, align 4
  %.compoundliteral270 = alloca %struct.uint_enc, align 4
  %__sub_enc_r272 = alloca i32, align 4
  %.compoundliteral275 = alloca %struct.uint_enc, align 4
  %__set_enc_r277 = alloca i32, align 4
  %.compoundliteral280 = alloca %struct.uint_enc, align 4
  %__sltu_enc_r = alloca i32, align 4
  %.compoundliteral284 = alloca %struct.uint_enc, align 4
  %__sletu_enc_r = alloca i32, align 4
  %.compoundliteral290 = alloca %struct.uint_enc, align 4
  %__sgtu_enc_r = alloca i32, align 4
  %.compoundliteral294 = alloca %struct.uint_enc, align 4
  %__sgetu_enc_r = alloca i32, align 4
  %.compoundliteral298 = alloca %struct.uint_enc, align 4
  %__andi_enc_r300 = alloca i32, align 4
  %.compoundliteral302 = alloca %struct.uint_enc, align 4
  %__landi_enc_r304 = alloca i32, align 4
  %.compoundliteral306 = alloca %struct.uint_enc, align 4
  %__ori_enc_r308 = alloca i32, align 4
  %.compoundliteral310 = alloca %struct.uint_enc, align 4
  %__lori_enc_r312 = alloca i32, align 4
  %.compoundliteral314 = alloca %struct.uint_enc, align 4
  %__xori_enc_r316 = alloca i32, align 4
  %.compoundliteral318 = alloca %struct.uint_enc, align 4
  %__lxori_enc_r320 = alloca i32, align 4
  %.compoundliteral322 = alloca %struct.uint_enc, align 4
  %__slli_enc_r324 = alloca i32, align 4
  %.compoundliteral326 = alloca %struct.uint_enc, align 4
  %__srli_enc_r328 = alloca i32, align 4
  %.compoundliteral330 = alloca %struct.uint_enc, align 4
  %__addi_enc_r332 = alloca i32, align 4
  %.compoundliteral334 = alloca %struct.uint_enc, align 4
  %__subi_enc_r336 = alloca i32, align 4
  %.compoundliteral338 = alloca %struct.uint_enc, align 4
  %__seti_enc_r340 = alloca i32, align 4
  %.compoundliteral342 = alloca %struct.uint_enc, align 4
  %__sltiu_enc_r = alloca i32, align 4
  %.compoundliteral345 = alloca %struct.uint_enc, align 4
  %__sletiu_enc_r = alloca i32, align 4
  %.compoundliteral349 = alloca %struct.uint_enc, align 4
  %__sgtiu_enc_r = alloca i32, align 4
  %.compoundliteral352 = alloca %struct.uint_enc, align 4
  %__sgetiu_enc_r = alloca i32, align 4
  %.compoundliteral355 = alloca %struct.uint_enc, align 4
  %__iand_enc_r357 = alloca i32, align 4
  %.compoundliteral359 = alloca %struct.uint_enc, align 4
  %__iland_enc_r361 = alloca i32, align 4
  %.compoundliteral363 = alloca %struct.uint_enc, align 4
  %__ior_enc_r365 = alloca i32, align 4
  %.compoundliteral367 = alloca %struct.uint_enc, align 4
  %__ilor_enc_r369 = alloca i32, align 4
  %.compoundliteral371 = alloca %struct.uint_enc, align 4
  %__ixor_enc_r373 = alloca i32, align 4
  %.compoundliteral375 = alloca %struct.uint_enc, align 4
  %__ilxor_enc_r377 = alloca i32, align 4
  %.compoundliteral379 = alloca %struct.uint_enc, align 4
  %__isll_enc_r381 = alloca i32, align 4
  %ref.tmp382 = alloca %struct.int_enc, align 4
  %__zero_reg_r383 = alloca i32, align 4
  %.compoundliteral384 = alloca %struct.int_enc, align 4
  %.compoundliteral386 = alloca %struct.int_enc, align 4
  %.compoundliteral391 = alloca %struct.uint_enc, align 4
  %__isrl_enc_r393 = alloca i32, align 4
  %ref.tmp394 = alloca %struct.int_enc, align 4
  %__zero_reg_r395 = alloca i32, align 4
  %.compoundliteral396 = alloca %struct.int_enc, align 4
  %.compoundliteral398 = alloca %struct.int_enc, align 4
  %.compoundliteral403 = alloca %struct.uint_enc, align 4
  %__iadd_enc_r405 = alloca i32, align 4
  %.compoundliteral407 = alloca %struct.uint_enc, align 4
  %__isub_enc_r409 = alloca i32, align 4
  %ref.tmp411 = alloca %struct.int_enc, align 4
  %__full_reg_r412 = alloca i32, align 4
  %ref.tmp413 = alloca %struct.int_enc, align 4
  %__zero_reg_r414 = alloca i32, align 4
  %.compoundliteral415 = alloca %struct.int_enc, align 4
  %.compoundliteral417 = alloca %struct.int_enc, align 4
  %.compoundliteral423 = alloca %struct.uint_enc, align 4
  %__iset_enc_r425 = alloca i32, align 4
  %ref.tmp427 = alloca %struct.int_enc, align 4
  %__full_reg_r428 = alloca i32, align 4
  %ref.tmp429 = alloca %struct.int_enc, align 4
  %__zero_reg_r430 = alloca i32, align 4
  %.compoundliteral431 = alloca %struct.int_enc, align 4
  %.compoundliteral433 = alloca %struct.int_enc, align 4
  %.compoundliteral439 = alloca %struct.uint_enc, align 4
  %__isltu_enc_r = alloca i32, align 4
  %.compoundliteral442 = alloca %struct.uint_enc, align 4
  %__isletu_enc_r = alloca i32, align 4
  %.compoundliteral446 = alloca %struct.uint_enc, align 4
  %__isgtu_enc_r = alloca i32, align 4
  %.compoundliteral449 = alloca %struct.uint_enc, align 4
  %__isgetu_enc_r = alloca i32, align 4
  %.compoundliteral453 = alloca %struct.uint_enc, align 4
  %a = alloca %struct.int_enc, align 4
  %__add_enc_r455 = alloca i32, align 4
  %b = alloca %struct.int_enc, align 4
  %__sub_enc_r459 = alloca i32, align 4
  %__add_enc_r463 = alloca i32, align 4
  %.compoundliteral466 = alloca %struct.int_enc, align 4
  %__sub_enc_r468 = alloca i32, align 4
  %.compoundliteral471 = alloca %struct.int_enc, align 4
  %__addi_enc_r473 = alloca i32, align 4
  %.compoundliteral475 = alloca %struct.int_enc, align 4
  %__subi_enc_r477 = alloca i32, align 4
  %.compoundliteral479 = alloca %struct.int_enc, align 4
  %tmp = alloca %struct.int_enc, align 4
  %agg.tmp = alloca %struct.int_enc, align 4
  %agg.tmp481 = alloca %struct.int_enc, align 4
  %__sub_enc_r482 = alloca i32, align 4
  %agg.tmp489 = alloca %struct.int_enc, align 4
  %agg.tmp490 = alloca %struct.int_enc, align 4
  %__slli_enc_r491 = alloca i32, align 4
  %tmp504 = alloca %struct.int_enc, align 4
  %agg.tmp505 = alloca %struct.int_enc, align 4
  %agg.tmp506 = alloca %struct.int_enc, align 4
  %__land_enc_r507 = alloca i32, align 4
  %ref.tmp508 = alloca %struct.int_enc, align 4
  %__sll_enc_r509 = alloca i32, align 4
  %ref.tmp510 = alloca %struct.int_enc, align 4
  %__add_enc_r511 = alloca i32, align 4
  %ref.tmp519 = alloca %struct.int_enc, align 4
  %__subi_enc_r520 = alloca i32, align 4
  %tmp535 = alloca %struct.uint_enc, align 4
  %agg.tmp536 = alloca %struct.uint_enc, align 4
  %tmp547 = alloca %struct.uint_enc, align 4
  %agg.tmp548 = alloca %struct.uint_enc, align 4
  %agg.tmp554 = alloca %struct.uint_enc, align 4
  %coerce = alloca %struct.int_enc, align 4
  %coerce574 = alloca %struct.int_enc, align 4
  %.compoundliteral576 = alloca %struct.int_enc, align 4
  %seven = alloca i32, align 4
  %i = alloca i32, align 4
  %x579 = alloca %struct.int_enc, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %list, ptr align 4 @__const.main.list, i32 20, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 @__const.main.x, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %y, ptr align 4 @__const.main.y, i32 4, i1 false)
  call void @llvm.memset.p0.i32(ptr align 4 %result, i8 0, i32 4, i1 false)
  call void @llvm.memset.p0.i32(ptr align 4 %uresult, i8 0, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %no_neg, ptr align 4 @__const.main.no_neg, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %test, ptr align 4 @__const.main.test, i32 4, i1 false)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %thirteen, ptr align 4 @__const.main.thirteen, i32 4, i1 false)
  %v = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %0 = load i32, ptr %v, align 4
  %v2 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral, i32 0, i32 0
  store i32 0, ptr %v2, align 4
  %v4 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral3, i32 0, i32 0
  store i32 0, ptr %v4, align 4
  %1 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %1, ptr %__zero_reg_r, align 4
  %2 = load i32, ptr %__zero_reg_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %2) #4, !srcloc !10
  %v5 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp1, i32 0, i32 0
  %3 = load i32, ptr %__zero_reg_r, align 4
  store i32 %3, ptr %v5, align 4
  %v6 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp1, i32 0, i32 0
  %4 = load i32, ptr %v6, align 4
  %5 = call i32 @llvm.riscv.addi.enc(i32 %4, i32 -1)
  store i32 %5, ptr %__full_reg_r, align 4
  %6 = load i32, ptr %__full_reg_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %6) #4, !srcloc !11
  %v7 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp, i32 0, i32 0
  %7 = load i32, ptr %__full_reg_r, align 4
  store i32 %7, ptr %v7, align 4
  %v8 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp, i32 0, i32 0
  %8 = load i32, ptr %v8, align 4
  %9 = call i32 @llvm.riscv.xor.enc(i32 %0, i32 %8)
  %10 = call i32 @llvm.riscv.addi.enc(i32 %9, i32 1)
  store i32 %10, ptr %__negate_enc_r, align 4
  %11 = load i32, ptr %__negate_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %11) #4, !srcloc !12
  %v10 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral9, i32 0, i32 0
  %12 = load i32, ptr %__negate_enc_r, align 4
  store i32 %12, ptr %v10, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral9, i32 4, i1 false)
  %v11 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %13 = load i32, ptr %v11, align 4
  %14 = call i32 @llvm.riscv.sltiu.enc(i32 %13, i32 1)
  store i32 %14, ptr %__lnot_enc_r, align 4
  %15 = load i32, ptr %__lnot_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %15) #4, !srcloc !13
  %v13 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral12, i32 0, i32 0
  %16 = load i32, ptr %__lnot_enc_r, align 4
  store i32 %16, ptr %v13, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral12, i32 4, i1 false)
  %v14 = getelementptr inbounds nuw %struct.int_enc, ptr %result, i32 0, i32 0
  %17 = load i32, ptr %v14, align 4
  %v20 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral19, i32 0, i32 0
  store i32 0, ptr %v20, align 4
  %v22 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral21, i32 0, i32 0
  store i32 0, ptr %v22, align 4
  %18 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %18, ptr %__zero_reg_r18, align 4
  %19 = load i32, ptr %__zero_reg_r18, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %19) #4, !srcloc !14
  %v23 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp17, i32 0, i32 0
  %20 = load i32, ptr %__zero_reg_r18, align 4
  store i32 %20, ptr %v23, align 4
  %v24 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp17, i32 0, i32 0
  %21 = load i32, ptr %v24, align 4
  %22 = call i32 @llvm.riscv.addi.enc(i32 %21, i32 -1)
  store i32 %22, ptr %__full_reg_r16, align 4
  %23 = load i32, ptr %__full_reg_r16, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %23) #4, !srcloc !15
  %v25 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp15, i32 0, i32 0
  %24 = load i32, ptr %__full_reg_r16, align 4
  store i32 %24, ptr %v25, align 4
  %v26 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp15, i32 0, i32 0
  %25 = load i32, ptr %v26, align 4
  %26 = call i32 @llvm.riscv.xor.enc(i32 %17, i32 %25)
  store i32 %26, ptr %__bnot_enc_r, align 4
  %27 = load i32, ptr %__bnot_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %27) #4, !srcloc !16
  %v28 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral27, i32 0, i32 0
  %28 = load i32, ptr %__bnot_enc_r, align 4
  store i32 %28, ptr %v28, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral27, i32 4, i1 false)
  %v29 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %29 = load i32, ptr %v29, align 4
  %v30 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %30 = load i32, ptr %v30, align 4
  %31 = call i32 @llvm.riscv.and.enc(i32 %29, i32 %30)
  store i32 %31, ptr %__and_enc_r, align 4
  %32 = load i32, ptr %__and_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %32) #4, !srcloc !17
  %v32 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral31, i32 0, i32 0
  %33 = load i32, ptr %__and_enc_r, align 4
  store i32 %33, ptr %v32, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral31, i32 4, i1 false)
  %v33 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %34 = load i32, ptr %v33, align 4
  %35 = call i32 @llvm.riscv.sltiu.enc(i32 %34, i32 0)
  %36 = call i32 @llvm.riscv.sltiu.enc(i32 %35, i32 1)
  %v34 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %37 = load i32, ptr %v34, align 4
  %38 = call i32 @llvm.riscv.sltiu.enc(i32 %37, i32 0)
  %39 = call i32 @llvm.riscv.sltiu.enc(i32 %38, i32 1)
  %40 = call i32 @llvm.riscv.and.enc(i32 %36, i32 %39)
  store i32 %40, ptr %__land_enc_r, align 4
  %41 = load i32, ptr %__land_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %41) #4, !srcloc !18
  %v36 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral35, i32 0, i32 0
  %42 = load i32, ptr %__land_enc_r, align 4
  store i32 %42, ptr %v36, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral35, i32 4, i1 false)
  %v37 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %43 = load i32, ptr %v37, align 4
  %v38 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %44 = load i32, ptr %v38, align 4
  %45 = call i32 @llvm.riscv.or.enc(i32 %43, i32 %44)
  store i32 %45, ptr %__or_enc_r, align 4
  %46 = load i32, ptr %__or_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %46) #4, !srcloc !19
  %v40 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral39, i32 0, i32 0
  %47 = load i32, ptr %__or_enc_r, align 4
  store i32 %47, ptr %v40, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral39, i32 4, i1 false)
  %v41 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %48 = load i32, ptr %v41, align 4
  %49 = call i32 @llvm.riscv.sltiu.enc(i32 %48, i32 0)
  %50 = call i32 @llvm.riscv.sltiu.enc(i32 %49, i32 1)
  %v42 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %51 = load i32, ptr %v42, align 4
  %52 = call i32 @llvm.riscv.sltiu.enc(i32 %51, i32 0)
  %53 = call i32 @llvm.riscv.sltiu.enc(i32 %52, i32 1)
  %54 = call i32 @llvm.riscv.or.enc(i32 %50, i32 %53)
  store i32 %54, ptr %__lor_enc_r, align 4
  %55 = load i32, ptr %__lor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %55) #4, !srcloc !20
  %v44 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral43, i32 0, i32 0
  %56 = load i32, ptr %__lor_enc_r, align 4
  store i32 %56, ptr %v44, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral43, i32 4, i1 false)
  %v45 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %57 = load i32, ptr %v45, align 4
  %v46 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %58 = load i32, ptr %v46, align 4
  %59 = call i32 @llvm.riscv.xor.enc(i32 %57, i32 %58)
  store i32 %59, ptr %__xor_enc_r, align 4
  %60 = load i32, ptr %__xor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %60) #4, !srcloc !21
  %v48 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral47, i32 0, i32 0
  %61 = load i32, ptr %__xor_enc_r, align 4
  store i32 %61, ptr %v48, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral47, i32 4, i1 false)
  %v49 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %62 = load i32, ptr %v49, align 4
  %63 = call i32 @llvm.riscv.sltiu.enc(i32 %62, i32 0)
  %64 = call i32 @llvm.riscv.sltiu.enc(i32 %63, i32 1)
  %v50 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %65 = load i32, ptr %v50, align 4
  %66 = call i32 @llvm.riscv.sltiu.enc(i32 %65, i32 0)
  %67 = call i32 @llvm.riscv.sltiu.enc(i32 %66, i32 1)
  %68 = call i32 @llvm.riscv.xor.enc(i32 %64, i32 %67)
  store i32 %68, ptr %__lxor_enc_r, align 4
  %69 = load i32, ptr %__lxor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %69) #4, !srcloc !22
  %v52 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral51, i32 0, i32 0
  %70 = load i32, ptr %__lxor_enc_r, align 4
  store i32 %70, ptr %v52, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral51, i32 4, i1 false)
  %v53 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %71 = load i32, ptr %v53, align 4
  %v54 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %72 = load i32, ptr %v54, align 4
  %73 = call i32 @llvm.riscv.sll.enc(i32 %71, i32 %72)
  store i32 %73, ptr %__sll_enc_r, align 4
  %74 = load i32, ptr %__sll_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %74) #4, !srcloc !23
  %v56 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral55, i32 0, i32 0
  %75 = load i32, ptr %__sll_enc_r, align 4
  store i32 %75, ptr %v56, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral55, i32 4, i1 false)
  %v57 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %76 = load i32, ptr %v57, align 4
  %v58 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %77 = load i32, ptr %v58, align 4
  %78 = call i32 @llvm.riscv.srl.enc(i32 %76, i32 %77)
  store i32 %78, ptr %__srl_enc_r, align 4
  %79 = load i32, ptr %__srl_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %79) #4, !srcloc !24
  %v60 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral59, i32 0, i32 0
  %80 = load i32, ptr %__srl_enc_r, align 4
  store i32 %80, ptr %v60, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral59, i32 4, i1 false)
  %v61 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %81 = load i32, ptr %v61, align 4
  %v62 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %82 = load i32, ptr %v62, align 4
  %83 = call i32 @llvm.riscv.add.enc(i32 %81, i32 %82)
  store i32 %83, ptr %__add_enc_r, align 4
  %84 = load i32, ptr %__add_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %84) #4, !srcloc !25
  %v64 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral63, i32 0, i32 0
  %85 = load i32, ptr %__add_enc_r, align 4
  store i32 %85, ptr %v64, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral63, i32 4, i1 false)
  %v65 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %86 = load i32, ptr %v65, align 4
  %v66 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %87 = load i32, ptr %v66, align 4
  %88 = call i32 @llvm.riscv.sub.enc(i32 %86, i32 %87)
  store i32 %88, ptr %__sub_enc_r, align 4
  %89 = load i32, ptr %__sub_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %89) #4, !srcloc !26
  %v68 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral67, i32 0, i32 0
  %90 = load i32, ptr %__sub_enc_r, align 4
  store i32 %90, ptr %v68, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral67, i32 4, i1 false)
  %v69 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %91 = load i32, ptr %v69, align 4
  %v70 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %92 = load i32, ptr %v70, align 4
  %93 = call i32 @llvm.riscv.sub.enc(i32 %91, i32 %92)
  %94 = call i32 @llvm.riscv.sltiu.enc(i32 %93, i32 1)
  store i32 %94, ptr %__set_enc_r, align 4
  %95 = load i32, ptr %__set_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %95) #4, !srcloc !27
  %v72 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral71, i32 0, i32 0
  %96 = load i32, ptr %__set_enc_r, align 4
  store i32 %96, ptr %v72, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral71, i32 4, i1 false)
  %v73 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %97 = load i32, ptr %v73, align 4
  %v74 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %98 = load i32, ptr %v74, align 4
  %99 = call i32 @llvm.riscv.slt.enc(i32 %97, i32 %98)
  store i32 %99, ptr %__slt_enc_r, align 4
  %100 = load i32, ptr %__slt_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %100) #4, !srcloc !28
  %v76 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral75, i32 0, i32 0
  %101 = load i32, ptr %__slt_enc_r, align 4
  store i32 %101, ptr %v76, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral75, i32 4, i1 false)
  %v77 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %102 = load i32, ptr %v77, align 4
  %v78 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %103 = load i32, ptr %v78, align 4
  %104 = call i32 @llvm.riscv.slt.enc(i32 %102, i32 %103)
  %v79 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %105 = load i32, ptr %v79, align 4
  %v80 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %106 = load i32, ptr %v80, align 4
  %107 = call i32 @llvm.riscv.sub.enc(i32 %105, i32 %106)
  %108 = call i32 @llvm.riscv.sltiu.enc(i32 %107, i32 1)
  %109 = call i32 @llvm.riscv.or.enc(i32 %104, i32 %108)
  store i32 %109, ptr %__slet_enc_r, align 4
  %110 = load i32, ptr %__slet_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %110) #4, !srcloc !29
  %v82 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral81, i32 0, i32 0
  %111 = load i32, ptr %__slet_enc_r, align 4
  store i32 %111, ptr %v82, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral81, i32 4, i1 false)
  %v83 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %112 = load i32, ptr %v83, align 4
  %v84 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %113 = load i32, ptr %v84, align 4
  %114 = call i32 @llvm.riscv.slt.enc(i32 %112, i32 %113)
  store i32 %114, ptr %__sgt_enc_r, align 4
  %115 = load i32, ptr %__sgt_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %115) #4, !srcloc !30
  %v86 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral85, i32 0, i32 0
  %116 = load i32, ptr %__sgt_enc_r, align 4
  store i32 %116, ptr %v86, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral85, i32 4, i1 false)
  %v87 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %117 = load i32, ptr %v87, align 4
  %v88 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %118 = load i32, ptr %v88, align 4
  %119 = call i32 @llvm.riscv.slt.enc(i32 %117, i32 %118)
  %120 = call i32 @llvm.riscv.sltiu.enc(i32 %119, i32 1)
  %v89 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %121 = load i32, ptr %v89, align 4
  %v90 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %122 = load i32, ptr %v90, align 4
  %123 = call i32 @llvm.riscv.sub.enc(i32 %121, i32 %122)
  %124 = call i32 @llvm.riscv.sltiu.enc(i32 %123, i32 1)
  %125 = call i32 @llvm.riscv.or.enc(i32 %120, i32 %124)
  store i32 %125, ptr %__sget_enc_r, align 4
  %126 = load i32, ptr %__sget_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %126) #4, !srcloc !31
  %v92 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral91, i32 0, i32 0
  %127 = load i32, ptr %__sget_enc_r, align 4
  store i32 %127, ptr %v92, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral91, i32 4, i1 false)
  %v93 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %128 = load i32, ptr %v93, align 4
  %129 = call i32 @llvm.riscv.andi.enc(i32 %128, i32 13)
  store i32 %129, ptr %__andi_enc_r, align 4
  %130 = load i32, ptr %__andi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %130) #4, !srcloc !32
  %v95 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral94, i32 0, i32 0
  %131 = load i32, ptr %__andi_enc_r, align 4
  store i32 %131, ptr %v95, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral94, i32 4, i1 false)
  %v96 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %132 = load i32, ptr %v96, align 4
  %133 = call i32 @llvm.riscv.sltiu.enc(i32 %132, i32 0)
  %134 = call i32 @llvm.riscv.sltiu.enc(i32 %133, i32 1)
  %135 = call i32 @llvm.riscv.andi.enc(i32 %134, i32 1)
  store i32 %135, ptr %__landi_enc_r, align 4
  %136 = load i32, ptr %__landi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %136) #4, !srcloc !33
  %v98 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral97, i32 0, i32 0
  %137 = load i32, ptr %__landi_enc_r, align 4
  store i32 %137, ptr %v98, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral97, i32 4, i1 false)
  %v99 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %138 = load i32, ptr %v99, align 4
  %139 = call i32 @llvm.riscv.ori.enc(i32 %138, i32 13)
  store i32 %139, ptr %__ori_enc_r, align 4
  %140 = load i32, ptr %__ori_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %140) #4, !srcloc !34
  %v101 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral100, i32 0, i32 0
  %141 = load i32, ptr %__ori_enc_r, align 4
  store i32 %141, ptr %v101, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral100, i32 4, i1 false)
  %v102 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %142 = load i32, ptr %v102, align 4
  %143 = call i32 @llvm.riscv.sltiu.enc(i32 %142, i32 0)
  %144 = call i32 @llvm.riscv.sltiu.enc(i32 %143, i32 1)
  %145 = call i32 @llvm.riscv.ori.enc(i32 %144, i32 1)
  store i32 %145, ptr %__lori_enc_r, align 4
  %146 = load i32, ptr %__lori_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %146) #4, !srcloc !35
  %v104 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral103, i32 0, i32 0
  %147 = load i32, ptr %__lori_enc_r, align 4
  store i32 %147, ptr %v104, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral103, i32 4, i1 false)
  %v105 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %148 = load i32, ptr %v105, align 4
  %149 = call i32 @llvm.riscv.xori.enc(i32 %148, i32 13)
  store i32 %149, ptr %__xori_enc_r, align 4
  %150 = load i32, ptr %__xori_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %150) #4, !srcloc !36
  %v107 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral106, i32 0, i32 0
  %151 = load i32, ptr %__xori_enc_r, align 4
  store i32 %151, ptr %v107, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral106, i32 4, i1 false)
  %v108 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %152 = load i32, ptr %v108, align 4
  %153 = call i32 @llvm.riscv.sltiu.enc(i32 %152, i32 0)
  %154 = call i32 @llvm.riscv.sltiu.enc(i32 %153, i32 1)
  %155 = call i32 @llvm.riscv.xori.enc(i32 %154, i32 1)
  store i32 %155, ptr %__lxori_enc_r, align 4
  %156 = load i32, ptr %__lxori_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %156) #4, !srcloc !37
  %v110 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral109, i32 0, i32 0
  %157 = load i32, ptr %__lxori_enc_r, align 4
  store i32 %157, ptr %v110, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral109, i32 4, i1 false)
  %v111 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %158 = load i32, ptr %v111, align 4
  %159 = call i32 @llvm.riscv.slli.enc(i32 %158, i32 13)
  store i32 %159, ptr %__slli_enc_r, align 4
  %160 = load i32, ptr %__slli_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %160) #4, !srcloc !38
  %v113 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral112, i32 0, i32 0
  %161 = load i32, ptr %__slli_enc_r, align 4
  store i32 %161, ptr %v113, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral112, i32 4, i1 false)
  %v114 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %162 = load i32, ptr %v114, align 4
  %163 = call i32 @llvm.riscv.srli.enc(i32 %162, i32 13)
  store i32 %163, ptr %__srli_enc_r, align 4
  %164 = load i32, ptr %__srli_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %164) #4, !srcloc !39
  %v116 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral115, i32 0, i32 0
  %165 = load i32, ptr %__srli_enc_r, align 4
  store i32 %165, ptr %v116, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral115, i32 4, i1 false)
  %v117 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %166 = load i32, ptr %v117, align 4
  %167 = call i32 @llvm.riscv.addi.enc(i32 %166, i32 13)
  store i32 %167, ptr %__addi_enc_r, align 4
  %168 = load i32, ptr %__addi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %168) #4, !srcloc !40
  %v119 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral118, i32 0, i32 0
  %169 = load i32, ptr %__addi_enc_r, align 4
  store i32 %169, ptr %v119, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral118, i32 4, i1 false)
  %v120 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %170 = load i32, ptr %v120, align 4
  %171 = call i32 @llvm.riscv.addi.enc(i32 %170, i32 -13)
  store i32 %171, ptr %__subi_enc_r, align 4
  %172 = load i32, ptr %__subi_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %172) #4, !srcloc !41
  %v122 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral121, i32 0, i32 0
  %173 = load i32, ptr %__subi_enc_r, align 4
  store i32 %173, ptr %v122, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral121, i32 4, i1 false)
  %v123 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %174 = load i32, ptr %v123, align 4
  %175 = call i32 @llvm.riscv.addi.enc(i32 %174, i32 -13)
  %176 = call i32 @llvm.riscv.sltiu.enc(i32 %175, i32 1)
  store i32 %176, ptr %__seti_enc_r, align 4
  %177 = load i32, ptr %__seti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %177) #4, !srcloc !42
  %v125 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral124, i32 0, i32 0
  %178 = load i32, ptr %__seti_enc_r, align 4
  store i32 %178, ptr %v125, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral124, i32 4, i1 false)
  %v126 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %179 = load i32, ptr %v126, align 4
  %180 = call i32 @llvm.riscv.slti.enc(i32 %179, i32 13)
  store i32 %180, ptr %__slti_enc_r, align 4
  %181 = load i32, ptr %__slti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %181) #4, !srcloc !43
  %v128 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral127, i32 0, i32 0
  %182 = load i32, ptr %__slti_enc_r, align 4
  store i32 %182, ptr %v128, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral127, i32 4, i1 false)
  %v129 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %183 = load i32, ptr %v129, align 4
  %184 = call i32 @llvm.riscv.slti.enc(i32 %183, i32 13)
  %v130 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %185 = load i32, ptr %v130, align 4
  %186 = call i32 @llvm.riscv.addi.enc(i32 %185, i32 -13)
  %187 = call i32 @llvm.riscv.sltiu.enc(i32 %186, i32 1)
  %188 = call i32 @llvm.riscv.or.enc(i32 %184, i32 %187)
  store i32 %188, ptr %__sleti_enc_r, align 4
  %189 = load i32, ptr %__sleti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %189) #4, !srcloc !44
  %v132 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral131, i32 0, i32 0
  %190 = load i32, ptr %__sleti_enc_r, align 4
  store i32 %190, ptr %v132, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral131, i32 4, i1 false)
  %v133 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %191 = load i32, ptr %v133, align 4
  %192 = call i32 @llvm.riscv.slti.enc(i32 %191, i32 13)
  %v134 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %193 = load i32, ptr %v134, align 4
  %194 = call i32 @llvm.riscv.sub.enc(i32 %193, i32 13)
  %195 = call i32 @llvm.riscv.sltiu.enc(i32 %194, i32 1)
  %196 = call i32 @llvm.riscv.or.enc(i32 %192, i32 %195)
  %197 = call i32 @llvm.riscv.sltiu.enc(i32 %196, i32 1)
  store i32 %197, ptr %__sgti_enc_r, align 4
  %198 = load i32, ptr %__sgti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %198) #4, !srcloc !45
  %v136 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral135, i32 0, i32 0
  %199 = load i32, ptr %__sgti_enc_r, align 4
  store i32 %199, ptr %v136, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral135, i32 4, i1 false)
  %v137 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %200 = load i32, ptr %v137, align 4
  %201 = call i32 @llvm.riscv.slti.enc(i32 %200, i32 13)
  %202 = call i32 @llvm.riscv.sltiu.enc(i32 %201, i32 1)
  store i32 %202, ptr %__sgeti_enc_r, align 4
  %203 = load i32, ptr %__sgeti_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %203) #4, !srcloc !46
  %v139 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral138, i32 0, i32 0
  %204 = load i32, ptr %__sgeti_enc_r, align 4
  store i32 %204, ptr %v139, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral138, i32 4, i1 false)
  %v140 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %205 = load i32, ptr %v140, align 4
  %206 = call i32 @llvm.riscv.andi.enc(i32 %205, i32 13)
  store i32 %206, ptr %__iand_enc_r, align 4
  %207 = load i32, ptr %__iand_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %207) #4, !srcloc !47
  %v142 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral141, i32 0, i32 0
  %208 = load i32, ptr %__iand_enc_r, align 4
  store i32 %208, ptr %v142, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral141, i32 4, i1 false)
  %v143 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %209 = load i32, ptr %v143, align 4
  %210 = call i32 @llvm.riscv.sltiu.enc(i32 %209, i32 0)
  %211 = call i32 @llvm.riscv.sltiu.enc(i32 %210, i32 1)
  %212 = call i32 @llvm.riscv.andi.enc(i32 %211, i32 1)
  store i32 %212, ptr %__iland_enc_r, align 4
  %213 = load i32, ptr %__iland_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %213) #4, !srcloc !48
  %v145 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral144, i32 0, i32 0
  %214 = load i32, ptr %__iland_enc_r, align 4
  store i32 %214, ptr %v145, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral144, i32 4, i1 false)
  %v146 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %215 = load i32, ptr %v146, align 4
  %216 = call i32 @llvm.riscv.ori.enc(i32 %215, i32 13)
  store i32 %216, ptr %__ior_enc_r, align 4
  %217 = load i32, ptr %__ior_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %217) #4, !srcloc !49
  %v148 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral147, i32 0, i32 0
  %218 = load i32, ptr %__ior_enc_r, align 4
  store i32 %218, ptr %v148, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral147, i32 4, i1 false)
  %v149 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %219 = load i32, ptr %v149, align 4
  %220 = call i32 @llvm.riscv.sltiu.enc(i32 %219, i32 0)
  %221 = call i32 @llvm.riscv.sltiu.enc(i32 %220, i32 1)
  %222 = call i32 @llvm.riscv.ori.enc(i32 %221, i32 1)
  store i32 %222, ptr %__ilor_enc_r, align 4
  %223 = load i32, ptr %__ilor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %223) #4, !srcloc !50
  %v151 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral150, i32 0, i32 0
  %224 = load i32, ptr %__ilor_enc_r, align 4
  store i32 %224, ptr %v151, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral150, i32 4, i1 false)
  %v152 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %225 = load i32, ptr %v152, align 4
  %226 = call i32 @llvm.riscv.xori.enc(i32 %225, i32 13)
  store i32 %226, ptr %__ixor_enc_r, align 4
  %227 = load i32, ptr %__ixor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %227) #4, !srcloc !51
  %v154 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral153, i32 0, i32 0
  %228 = load i32, ptr %__ixor_enc_r, align 4
  store i32 %228, ptr %v154, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral153, i32 4, i1 false)
  %v155 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %229 = load i32, ptr %v155, align 4
  %230 = call i32 @llvm.riscv.sltiu.enc(i32 %229, i32 0)
  %231 = call i32 @llvm.riscv.sltiu.enc(i32 %230, i32 1)
  %232 = call i32 @llvm.riscv.xori.enc(i32 %231, i32 1)
  store i32 %232, ptr %__ilxor_enc_r, align 4
  %233 = load i32, ptr %__ilxor_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %233) #4, !srcloc !52
  %v157 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral156, i32 0, i32 0
  %234 = load i32, ptr %__ilxor_enc_r, align 4
  store i32 %234, ptr %v157, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral156, i32 4, i1 false)
  %v161 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral160, i32 0, i32 0
  store i32 0, ptr %v161, align 4
  %v163 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral162, i32 0, i32 0
  store i32 0, ptr %v163, align 4
  %235 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %235, ptr %__zero_reg_r159, align 4
  %236 = load i32, ptr %__zero_reg_r159, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %236) #4, !srcloc !53
  %v164 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp158, i32 0, i32 0
  %237 = load i32, ptr %__zero_reg_r159, align 4
  store i32 %237, ptr %v164, align 4
  %v165 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp158, i32 0, i32 0
  %238 = load i32, ptr %v165, align 4
  %239 = call i32 @llvm.riscv.xori.enc(i32 %238, i32 13)
  %v166 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %240 = load i32, ptr %v166, align 4
  %241 = call i32 @llvm.riscv.sll.enc(i32 %239, i32 %240)
  store i32 %241, ptr %__isll_enc_r, align 4
  %242 = load i32, ptr %__isll_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %242) #4, !srcloc !54
  %v168 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral167, i32 0, i32 0
  %243 = load i32, ptr %__isll_enc_r, align 4
  store i32 %243, ptr %v168, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral167, i32 4, i1 false)
  %v172 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral171, i32 0, i32 0
  store i32 0, ptr %v172, align 4
  %v174 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral173, i32 0, i32 0
  store i32 0, ptr %v174, align 4
  %244 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %244, ptr %__zero_reg_r170, align 4
  %245 = load i32, ptr %__zero_reg_r170, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %245) #4, !srcloc !55
  %v175 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp169, i32 0, i32 0
  %246 = load i32, ptr %__zero_reg_r170, align 4
  store i32 %246, ptr %v175, align 4
  %v176 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp169, i32 0, i32 0
  %247 = load i32, ptr %v176, align 4
  %248 = call i32 @llvm.riscv.xori.enc(i32 %247, i32 13)
  %v177 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %249 = load i32, ptr %v177, align 4
  %250 = call i32 @llvm.riscv.srl.enc(i32 %248, i32 %249)
  store i32 %250, ptr %__isrl_enc_r, align 4
  %251 = load i32, ptr %__isrl_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %251) #4, !srcloc !56
  %v179 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral178, i32 0, i32 0
  %252 = load i32, ptr %__isrl_enc_r, align 4
  store i32 %252, ptr %v179, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral178, i32 4, i1 false)
  %v180 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %253 = load i32, ptr %v180, align 4
  %254 = call i32 @llvm.riscv.addi.enc(i32 %253, i32 13)
  store i32 %254, ptr %__iadd_enc_r, align 4
  %255 = load i32, ptr %__iadd_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %255) #4, !srcloc !57
  %v182 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral181, i32 0, i32 0
  %256 = load i32, ptr %__iadd_enc_r, align 4
  store i32 %256, ptr %v182, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral181, i32 4, i1 false)
  %v183 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %257 = load i32, ptr %v183, align 4
  %v189 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral188, i32 0, i32 0
  store i32 0, ptr %v189, align 4
  %v191 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral190, i32 0, i32 0
  store i32 0, ptr %v191, align 4
  %258 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %258, ptr %__zero_reg_r187, align 4
  %259 = load i32, ptr %__zero_reg_r187, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %259) #4, !srcloc !58
  %v192 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp186, i32 0, i32 0
  %260 = load i32, ptr %__zero_reg_r187, align 4
  store i32 %260, ptr %v192, align 4
  %v193 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp186, i32 0, i32 0
  %261 = load i32, ptr %v193, align 4
  %262 = call i32 @llvm.riscv.addi.enc(i32 %261, i32 -1)
  store i32 %262, ptr %__full_reg_r185, align 4
  %263 = load i32, ptr %__full_reg_r185, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %263) #4, !srcloc !59
  %v194 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp184, i32 0, i32 0
  %264 = load i32, ptr %__full_reg_r185, align 4
  store i32 %264, ptr %v194, align 4
  %v195 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp184, i32 0, i32 0
  %265 = load i32, ptr %v195, align 4
  %266 = call i32 @llvm.riscv.xor.enc(i32 %257, i32 %265)
  %267 = call i32 @llvm.riscv.addi.enc(i32 %266, i32 1)
  %268 = call i32 @llvm.riscv.addi.enc(i32 %267, i32 13)
  store i32 %268, ptr %__isub_enc_r, align 4
  %269 = load i32, ptr %__isub_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %269) #4, !srcloc !60
  %v197 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral196, i32 0, i32 0
  %270 = load i32, ptr %__isub_enc_r, align 4
  store i32 %270, ptr %v197, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral196, i32 4, i1 false)
  %v198 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %271 = load i32, ptr %v198, align 4
  %v204 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral203, i32 0, i32 0
  store i32 0, ptr %v204, align 4
  %v206 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral205, i32 0, i32 0
  store i32 0, ptr %v206, align 4
  %272 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %272, ptr %__zero_reg_r202, align 4
  %273 = load i32, ptr %__zero_reg_r202, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %273) #4, !srcloc !61
  %v207 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp201, i32 0, i32 0
  %274 = load i32, ptr %__zero_reg_r202, align 4
  store i32 %274, ptr %v207, align 4
  %v208 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp201, i32 0, i32 0
  %275 = load i32, ptr %v208, align 4
  %276 = call i32 @llvm.riscv.addi.enc(i32 %275, i32 -1)
  store i32 %276, ptr %__full_reg_r200, align 4
  %277 = load i32, ptr %__full_reg_r200, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %277) #4, !srcloc !62
  %v209 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp199, i32 0, i32 0
  %278 = load i32, ptr %__full_reg_r200, align 4
  store i32 %278, ptr %v209, align 4
  %v210 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp199, i32 0, i32 0
  %279 = load i32, ptr %v210, align 4
  %280 = call i32 @llvm.riscv.xor.enc(i32 %271, i32 %279)
  %281 = call i32 @llvm.riscv.addi.enc(i32 %280, i32 1)
  %282 = call i32 @llvm.riscv.addi.enc(i32 %281, i32 13)
  %283 = call i32 @llvm.riscv.sltiu.enc(i32 %282, i32 1)
  store i32 %283, ptr %__iset_enc_r, align 4
  %284 = load i32, ptr %__iset_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %284) #4, !srcloc !63
  %v212 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral211, i32 0, i32 0
  %285 = load i32, ptr %__iset_enc_r, align 4
  store i32 %285, ptr %v212, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral211, i32 4, i1 false)
  %v213 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %286 = load i32, ptr %v213, align 4
  %287 = call i32 @llvm.riscv.slti.enc(i32 %286, i32 13)
  %288 = call i32 @llvm.riscv.sltiu.enc(i32 %287, i32 1)
  store i32 %288, ptr %__islt_enc_r, align 4
  %289 = load i32, ptr %__islt_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %289) #4, !srcloc !64
  %v215 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral214, i32 0, i32 0
  %290 = load i32, ptr %__islt_enc_r, align 4
  store i32 %290, ptr %v215, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral214, i32 4, i1 false)
  %v216 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %291 = load i32, ptr %v216, align 4
  %292 = call i32 @llvm.riscv.slti.enc(i32 %291, i32 13)
  %293 = call i32 @llvm.riscv.sltiu.enc(i32 %292, i32 1)
  %294 = call i32 @llvm.riscv.sltiu.enc(i32 %293, i32 1)
  %v217 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %295 = load i32, ptr %v217, align 4
  %296 = call i32 @llvm.riscv.sub.enc(i32 %295, i32 13)
  %297 = call i32 @llvm.riscv.sltiu.enc(i32 %296, i32 1)
  %298 = call i32 @llvm.riscv.sltiu.enc(i32 %297, i32 0)
  %299 = call i32 @llvm.riscv.sltiu.enc(i32 %298, i32 1)
  %300 = call i32 @llvm.riscv.or.enc(i32 %294, i32 %299)
  store i32 %300, ptr %__islet_enc_r, align 4
  %301 = load i32, ptr %__islet_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %301) #4, !srcloc !65
  %v219 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral218, i32 0, i32 0
  %302 = load i32, ptr %__islet_enc_r, align 4
  store i32 %302, ptr %v219, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral218, i32 4, i1 false)
  %v220 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %303 = load i32, ptr %v220, align 4
  %304 = call i32 @llvm.riscv.slti.enc(i32 %303, i32 13)
  store i32 %304, ptr %__isgt_enc_r, align 4
  %305 = load i32, ptr %__isgt_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %305) #4, !srcloc !66
  %v222 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral221, i32 0, i32 0
  %306 = load i32, ptr %__isgt_enc_r, align 4
  store i32 %306, ptr %v222, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral221, i32 4, i1 false)
  %v223 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %307 = load i32, ptr %v223, align 4
  %308 = call i32 @llvm.riscv.slti.enc(i32 %307, i32 13)
  %v224 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %309 = load i32, ptr %v224, align 4
  %310 = call i32 @llvm.riscv.addi.enc(i32 %309, i32 -13)
  %311 = call i32 @llvm.riscv.sltiu.enc(i32 %310, i32 1)
  %312 = call i32 @llvm.riscv.or.enc(i32 %308, i32 %311)
  store i32 %312, ptr %__isget_enc_r, align 4
  %313 = load i32, ptr %__isget_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %313) #4, !srcloc !67
  %v226 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral225, i32 0, i32 0
  %314 = load i32, ptr %__isget_enc_r, align 4
  store i32 %314, ptr %v226, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %.compoundliteral225, i32 4, i1 false)
  %v228 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %315 = load i32, ptr %v228, align 4
  %v229 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %316 = load i32, ptr %v229, align 4
  %317 = call i32 @llvm.riscv.and.enc(i32 %315, i32 %316)
  store i32 %317, ptr %__and_enc_r227, align 4
  %318 = load i32, ptr %__and_enc_r227, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %318) #4, !srcloc !68
  %v231 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral230, i32 0, i32 0
  %319 = load i32, ptr %__and_enc_r227, align 4
  store i32 %319, ptr %v231, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral230, i32 4, i1 false)
  %v233 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %320 = load i32, ptr %v233, align 4
  %321 = call i32 @llvm.riscv.sltiu.enc(i32 %320, i32 0)
  %322 = call i32 @llvm.riscv.sltiu.enc(i32 %321, i32 1)
  %v234 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %323 = load i32, ptr %v234, align 4
  %324 = call i32 @llvm.riscv.sltiu.enc(i32 %323, i32 0)
  %325 = call i32 @llvm.riscv.sltiu.enc(i32 %324, i32 1)
  %326 = call i32 @llvm.riscv.and.enc(i32 %322, i32 %325)
  store i32 %326, ptr %__land_enc_r232, align 4
  %327 = load i32, ptr %__land_enc_r232, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %327) #4, !srcloc !69
  %v236 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral235, i32 0, i32 0
  %328 = load i32, ptr %__land_enc_r232, align 4
  store i32 %328, ptr %v236, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral235, i32 4, i1 false)
  %v238 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %329 = load i32, ptr %v238, align 4
  %v239 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %330 = load i32, ptr %v239, align 4
  %331 = call i32 @llvm.riscv.or.enc(i32 %329, i32 %330)
  store i32 %331, ptr %__or_enc_r237, align 4
  %332 = load i32, ptr %__or_enc_r237, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %332) #4, !srcloc !70
  %v241 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral240, i32 0, i32 0
  %333 = load i32, ptr %__or_enc_r237, align 4
  store i32 %333, ptr %v241, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral240, i32 4, i1 false)
  %v243 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %334 = load i32, ptr %v243, align 4
  %335 = call i32 @llvm.riscv.sltiu.enc(i32 %334, i32 0)
  %336 = call i32 @llvm.riscv.sltiu.enc(i32 %335, i32 1)
  %v244 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %337 = load i32, ptr %v244, align 4
  %338 = call i32 @llvm.riscv.sltiu.enc(i32 %337, i32 0)
  %339 = call i32 @llvm.riscv.sltiu.enc(i32 %338, i32 1)
  %340 = call i32 @llvm.riscv.or.enc(i32 %336, i32 %339)
  store i32 %340, ptr %__lor_enc_r242, align 4
  %341 = load i32, ptr %__lor_enc_r242, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %341) #4, !srcloc !71
  %v246 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral245, i32 0, i32 0
  %342 = load i32, ptr %__lor_enc_r242, align 4
  store i32 %342, ptr %v246, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral245, i32 4, i1 false)
  %v248 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %343 = load i32, ptr %v248, align 4
  %v249 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %344 = load i32, ptr %v249, align 4
  %345 = call i32 @llvm.riscv.xor.enc(i32 %343, i32 %344)
  store i32 %345, ptr %__xor_enc_r247, align 4
  %346 = load i32, ptr %__xor_enc_r247, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %346) #4, !srcloc !72
  %v251 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral250, i32 0, i32 0
  %347 = load i32, ptr %__xor_enc_r247, align 4
  store i32 %347, ptr %v251, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral250, i32 4, i1 false)
  %v253 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %348 = load i32, ptr %v253, align 4
  %349 = call i32 @llvm.riscv.sltiu.enc(i32 %348, i32 0)
  %350 = call i32 @llvm.riscv.sltiu.enc(i32 %349, i32 1)
  %v254 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %351 = load i32, ptr %v254, align 4
  %352 = call i32 @llvm.riscv.sltiu.enc(i32 %351, i32 0)
  %353 = call i32 @llvm.riscv.sltiu.enc(i32 %352, i32 1)
  %354 = call i32 @llvm.riscv.xor.enc(i32 %350, i32 %353)
  store i32 %354, ptr %__lxor_enc_r252, align 4
  %355 = load i32, ptr %__lxor_enc_r252, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %355) #4, !srcloc !73
  %v256 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral255, i32 0, i32 0
  %356 = load i32, ptr %__lxor_enc_r252, align 4
  store i32 %356, ptr %v256, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral255, i32 4, i1 false)
  %v258 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %357 = load i32, ptr %v258, align 4
  %v259 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %358 = load i32, ptr %v259, align 4
  %359 = call i32 @llvm.riscv.sll.enc(i32 %357, i32 %358)
  store i32 %359, ptr %__sll_enc_r257, align 4
  %360 = load i32, ptr %__sll_enc_r257, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %360) #4, !srcloc !74
  %v261 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral260, i32 0, i32 0
  %361 = load i32, ptr %__sll_enc_r257, align 4
  store i32 %361, ptr %v261, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral260, i32 4, i1 false)
  %v263 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %362 = load i32, ptr %v263, align 4
  %v264 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %363 = load i32, ptr %v264, align 4
  %364 = call i32 @llvm.riscv.srl.enc(i32 %362, i32 %363)
  store i32 %364, ptr %__srl_enc_r262, align 4
  %365 = load i32, ptr %__srl_enc_r262, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %365) #4, !srcloc !75
  %v266 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral265, i32 0, i32 0
  %366 = load i32, ptr %__srl_enc_r262, align 4
  store i32 %366, ptr %v266, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral265, i32 4, i1 false)
  %v268 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %367 = load i32, ptr %v268, align 4
  %v269 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %368 = load i32, ptr %v269, align 4
  %369 = call i32 @llvm.riscv.add.enc(i32 %367, i32 %368)
  store i32 %369, ptr %__add_enc_r267, align 4
  %370 = load i32, ptr %__add_enc_r267, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %370) #4, !srcloc !76
  %v271 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral270, i32 0, i32 0
  %371 = load i32, ptr %__add_enc_r267, align 4
  store i32 %371, ptr %v271, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral270, i32 4, i1 false)
  %v273 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %372 = load i32, ptr %v273, align 4
  %v274 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %373 = load i32, ptr %v274, align 4
  %374 = call i32 @llvm.riscv.sub.enc(i32 %372, i32 %373)
  store i32 %374, ptr %__sub_enc_r272, align 4
  %375 = load i32, ptr %__sub_enc_r272, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %375) #4, !srcloc !77
  %v276 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral275, i32 0, i32 0
  %376 = load i32, ptr %__sub_enc_r272, align 4
  store i32 %376, ptr %v276, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral275, i32 4, i1 false)
  %v278 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %377 = load i32, ptr %v278, align 4
  %v279 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %378 = load i32, ptr %v279, align 4
  %379 = call i32 @llvm.riscv.sub.enc(i32 %377, i32 %378)
  %380 = call i32 @llvm.riscv.sltiu.enc(i32 %379, i32 1)
  store i32 %380, ptr %__set_enc_r277, align 4
  %381 = load i32, ptr %__set_enc_r277, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %381) #4, !srcloc !78
  %v281 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral280, i32 0, i32 0
  %382 = load i32, ptr %__set_enc_r277, align 4
  store i32 %382, ptr %v281, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral280, i32 4, i1 false)
  %v282 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %383 = load i32, ptr %v282, align 4
  %v283 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %384 = load i32, ptr %v283, align 4
  %385 = call i32 @llvm.riscv.sltu.enc(i32 %383, i32 %384)
  store i32 %385, ptr %__sltu_enc_r, align 4
  %386 = load i32, ptr %__sltu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %386) #4, !srcloc !79
  %v285 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral284, i32 0, i32 0
  %387 = load i32, ptr %__sltu_enc_r, align 4
  store i32 %387, ptr %v285, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral284, i32 4, i1 false)
  %v286 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %388 = load i32, ptr %v286, align 4
  %v287 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %389 = load i32, ptr %v287, align 4
  %390 = call i32 @llvm.riscv.sltu.enc(i32 %388, i32 %389)
  %v288 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %391 = load i32, ptr %v288, align 4
  %v289 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %392 = load i32, ptr %v289, align 4
  %393 = call i32 @llvm.riscv.sub.enc(i32 %391, i32 %392)
  %394 = call i32 @llvm.riscv.sltiu.enc(i32 %393, i32 1)
  %395 = call i32 @llvm.riscv.or.enc(i32 %390, i32 %394)
  store i32 %395, ptr %__sletu_enc_r, align 4
  %396 = load i32, ptr %__sletu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %396) #4, !srcloc !80
  %v291 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral290, i32 0, i32 0
  %397 = load i32, ptr %__sletu_enc_r, align 4
  store i32 %397, ptr %v291, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral290, i32 4, i1 false)
  %v292 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %398 = load i32, ptr %v292, align 4
  %v293 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %399 = load i32, ptr %v293, align 4
  %400 = call i32 @llvm.riscv.sltu.enc(i32 %398, i32 %399)
  store i32 %400, ptr %__sgtu_enc_r, align 4
  %401 = load i32, ptr %__sgtu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %401) #4, !srcloc !81
  %v295 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral294, i32 0, i32 0
  %402 = load i32, ptr %__sgtu_enc_r, align 4
  store i32 %402, ptr %v295, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral294, i32 4, i1 false)
  %v296 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %403 = load i32, ptr %v296, align 4
  %v297 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %404 = load i32, ptr %v297, align 4
  %405 = call i32 @llvm.riscv.slt.enc(i32 %403, i32 %404)
  %406 = call i32 @llvm.riscv.sltiu.enc(i32 %405, i32 1)
  store i32 %406, ptr %__sgetu_enc_r, align 4
  %407 = load i32, ptr %__sgetu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %407) #4, !srcloc !82
  %v299 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral298, i32 0, i32 0
  %408 = load i32, ptr %__sgetu_enc_r, align 4
  store i32 %408, ptr %v299, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral298, i32 4, i1 false)
  %v301 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %409 = load i32, ptr %v301, align 4
  %410 = call i32 @llvm.riscv.andi.enc(i32 %409, i32 3)
  store i32 %410, ptr %__andi_enc_r300, align 4
  %411 = load i32, ptr %__andi_enc_r300, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %411) #4, !srcloc !83
  %v303 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral302, i32 0, i32 0
  %412 = load i32, ptr %__andi_enc_r300, align 4
  store i32 %412, ptr %v303, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral302, i32 4, i1 false)
  %v305 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %413 = load i32, ptr %v305, align 4
  %414 = call i32 @llvm.riscv.sltiu.enc(i32 %413, i32 0)
  %415 = call i32 @llvm.riscv.sltiu.enc(i32 %414, i32 1)
  %416 = call i32 @llvm.riscv.andi.enc(i32 %415, i32 1)
  store i32 %416, ptr %__landi_enc_r304, align 4
  %417 = load i32, ptr %__landi_enc_r304, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %417) #4, !srcloc !84
  %v307 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral306, i32 0, i32 0
  %418 = load i32, ptr %__landi_enc_r304, align 4
  store i32 %418, ptr %v307, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral306, i32 4, i1 false)
  %v309 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %419 = load i32, ptr %v309, align 4
  %420 = call i32 @llvm.riscv.ori.enc(i32 %419, i32 3)
  store i32 %420, ptr %__ori_enc_r308, align 4
  %421 = load i32, ptr %__ori_enc_r308, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %421) #4, !srcloc !85
  %v311 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral310, i32 0, i32 0
  %422 = load i32, ptr %__ori_enc_r308, align 4
  store i32 %422, ptr %v311, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral310, i32 4, i1 false)
  %v313 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %423 = load i32, ptr %v313, align 4
  %424 = call i32 @llvm.riscv.sltiu.enc(i32 %423, i32 0)
  %425 = call i32 @llvm.riscv.sltiu.enc(i32 %424, i32 1)
  %426 = call i32 @llvm.riscv.ori.enc(i32 %425, i32 1)
  store i32 %426, ptr %__lori_enc_r312, align 4
  %427 = load i32, ptr %__lori_enc_r312, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %427) #4, !srcloc !86
  %v315 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral314, i32 0, i32 0
  %428 = load i32, ptr %__lori_enc_r312, align 4
  store i32 %428, ptr %v315, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral314, i32 4, i1 false)
  %v317 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %429 = load i32, ptr %v317, align 4
  %430 = call i32 @llvm.riscv.xori.enc(i32 %429, i32 3)
  store i32 %430, ptr %__xori_enc_r316, align 4
  %431 = load i32, ptr %__xori_enc_r316, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %431) #4, !srcloc !87
  %v319 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral318, i32 0, i32 0
  %432 = load i32, ptr %__xori_enc_r316, align 4
  store i32 %432, ptr %v319, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral318, i32 4, i1 false)
  %v321 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %433 = load i32, ptr %v321, align 4
  %434 = call i32 @llvm.riscv.sltiu.enc(i32 %433, i32 0)
  %435 = call i32 @llvm.riscv.sltiu.enc(i32 %434, i32 1)
  %436 = call i32 @llvm.riscv.xori.enc(i32 %435, i32 1)
  store i32 %436, ptr %__lxori_enc_r320, align 4
  %437 = load i32, ptr %__lxori_enc_r320, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %437) #4, !srcloc !88
  %v323 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral322, i32 0, i32 0
  %438 = load i32, ptr %__lxori_enc_r320, align 4
  store i32 %438, ptr %v323, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral322, i32 4, i1 false)
  %v325 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %439 = load i32, ptr %v325, align 4
  %440 = call i32 @llvm.riscv.slli.enc(i32 %439, i32 3)
  store i32 %440, ptr %__slli_enc_r324, align 4
  %441 = load i32, ptr %__slli_enc_r324, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %441) #4, !srcloc !89
  %v327 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral326, i32 0, i32 0
  %442 = load i32, ptr %__slli_enc_r324, align 4
  store i32 %442, ptr %v327, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral326, i32 4, i1 false)
  %v329 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %443 = load i32, ptr %v329, align 4
  %444 = call i32 @llvm.riscv.srli.enc(i32 %443, i32 3)
  store i32 %444, ptr %__srli_enc_r328, align 4
  %445 = load i32, ptr %__srli_enc_r328, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %445) #4, !srcloc !90
  %v331 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral330, i32 0, i32 0
  %446 = load i32, ptr %__srli_enc_r328, align 4
  store i32 %446, ptr %v331, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral330, i32 4, i1 false)
  %v333 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %447 = load i32, ptr %v333, align 4
  %448 = call i32 @llvm.riscv.addi.enc(i32 %447, i32 3)
  store i32 %448, ptr %__addi_enc_r332, align 4
  %449 = load i32, ptr %__addi_enc_r332, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %449) #4, !srcloc !91
  %v335 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral334, i32 0, i32 0
  %450 = load i32, ptr %__addi_enc_r332, align 4
  store i32 %450, ptr %v335, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral334, i32 4, i1 false)
  %v337 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %451 = load i32, ptr %v337, align 4
  %452 = call i32 @llvm.riscv.addi.enc(i32 %451, i32 -3)
  store i32 %452, ptr %__subi_enc_r336, align 4
  %453 = load i32, ptr %__subi_enc_r336, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %453) #4, !srcloc !92
  %v339 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral338, i32 0, i32 0
  %454 = load i32, ptr %__subi_enc_r336, align 4
  store i32 %454, ptr %v339, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral338, i32 4, i1 false)
  %v341 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %455 = load i32, ptr %v341, align 4
  %456 = call i32 @llvm.riscv.addi.enc(i32 %455, i32 -3)
  %457 = call i32 @llvm.riscv.sltiu.enc(i32 %456, i32 1)
  store i32 %457, ptr %__seti_enc_r340, align 4
  %458 = load i32, ptr %__seti_enc_r340, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %458) #4, !srcloc !93
  %v343 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral342, i32 0, i32 0
  %459 = load i32, ptr %__seti_enc_r340, align 4
  store i32 %459, ptr %v343, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral342, i32 4, i1 false)
  %v344 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %460 = load i32, ptr %v344, align 4
  %461 = call i32 @llvm.riscv.sltiu.enc(i32 %460, i32 3)
  store i32 %461, ptr %__sltiu_enc_r, align 4
  %462 = load i32, ptr %__sltiu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %462) #4, !srcloc !94
  %v346 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral345, i32 0, i32 0
  %463 = load i32, ptr %__sltiu_enc_r, align 4
  store i32 %463, ptr %v346, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral345, i32 4, i1 false)
  %v347 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %464 = load i32, ptr %v347, align 4
  %465 = call i32 @llvm.riscv.sltiu.enc(i32 %464, i32 3)
  %v348 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %466 = load i32, ptr %v348, align 4
  %467 = call i32 @llvm.riscv.addi.enc(i32 %466, i32 -3)
  %468 = call i32 @llvm.riscv.sltiu.enc(i32 %467, i32 1)
  %469 = call i32 @llvm.riscv.or.enc(i32 %465, i32 %468)
  store i32 %469, ptr %__sletiu_enc_r, align 4
  %470 = load i32, ptr %__sletiu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %470) #4, !srcloc !95
  %v350 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral349, i32 0, i32 0
  %471 = load i32, ptr %__sletiu_enc_r, align 4
  store i32 %471, ptr %v350, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral349, i32 4, i1 false)
  %v351 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %472 = load i32, ptr %v351, align 4
  %473 = call i32 @llvm.riscv.sltiu.enc(i32 %472, i32 3)
  %474 = call i32 @llvm.riscv.sltiu.enc(i32 %473, i32 1)
  store i32 %474, ptr %__sgtiu_enc_r, align 4
  %475 = load i32, ptr %__sgtiu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %475) #4, !srcloc !96
  %v353 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral352, i32 0, i32 0
  %476 = load i32, ptr %__sgtiu_enc_r, align 4
  store i32 %476, ptr %v353, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral352, i32 4, i1 false)
  %v354 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %477 = load i32, ptr %v354, align 4
  %478 = call i32 @llvm.riscv.sltiu.enc(i32 %477, i32 3)
  %479 = call i32 @llvm.riscv.sltiu.enc(i32 %478, i32 1)
  store i32 %479, ptr %__sgetiu_enc_r, align 4
  %480 = load i32, ptr %__sgetiu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %480) #4, !srcloc !97
  %v356 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral355, i32 0, i32 0
  %481 = load i32, ptr %__sgetiu_enc_r, align 4
  store i32 %481, ptr %v356, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral355, i32 4, i1 false)
  %v358 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %482 = load i32, ptr %v358, align 4
  %483 = call i32 @llvm.riscv.andi.enc(i32 %482, i32 3)
  store i32 %483, ptr %__iand_enc_r357, align 4
  %484 = load i32, ptr %__iand_enc_r357, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %484) #4, !srcloc !98
  %v360 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral359, i32 0, i32 0
  %485 = load i32, ptr %__iand_enc_r357, align 4
  store i32 %485, ptr %v360, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral359, i32 4, i1 false)
  %v362 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %486 = load i32, ptr %v362, align 4
  %487 = call i32 @llvm.riscv.sltiu.enc(i32 %486, i32 0)
  %488 = call i32 @llvm.riscv.sltiu.enc(i32 %487, i32 1)
  %489 = call i32 @llvm.riscv.andi.enc(i32 %488, i32 1)
  store i32 %489, ptr %__iland_enc_r361, align 4
  %490 = load i32, ptr %__iland_enc_r361, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %490) #4, !srcloc !99
  %v364 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral363, i32 0, i32 0
  %491 = load i32, ptr %__iland_enc_r361, align 4
  store i32 %491, ptr %v364, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral363, i32 4, i1 false)
  %v366 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %492 = load i32, ptr %v366, align 4
  %493 = call i32 @llvm.riscv.ori.enc(i32 %492, i32 3)
  store i32 %493, ptr %__ior_enc_r365, align 4
  %494 = load i32, ptr %__ior_enc_r365, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %494) #4, !srcloc !100
  %v368 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral367, i32 0, i32 0
  %495 = load i32, ptr %__ior_enc_r365, align 4
  store i32 %495, ptr %v368, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral367, i32 4, i1 false)
  %v370 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %496 = load i32, ptr %v370, align 4
  %497 = call i32 @llvm.riscv.sltiu.enc(i32 %496, i32 0)
  %498 = call i32 @llvm.riscv.sltiu.enc(i32 %497, i32 1)
  %499 = call i32 @llvm.riscv.ori.enc(i32 %498, i32 1)
  store i32 %499, ptr %__ilor_enc_r369, align 4
  %500 = load i32, ptr %__ilor_enc_r369, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %500) #4, !srcloc !101
  %v372 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral371, i32 0, i32 0
  %501 = load i32, ptr %__ilor_enc_r369, align 4
  store i32 %501, ptr %v372, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral371, i32 4, i1 false)
  %v374 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %502 = load i32, ptr %v374, align 4
  %503 = call i32 @llvm.riscv.xori.enc(i32 %502, i32 3)
  store i32 %503, ptr %__ixor_enc_r373, align 4
  %504 = load i32, ptr %__ixor_enc_r373, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %504) #4, !srcloc !102
  %v376 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral375, i32 0, i32 0
  %505 = load i32, ptr %__ixor_enc_r373, align 4
  store i32 %505, ptr %v376, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral375, i32 4, i1 false)
  %v378 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %506 = load i32, ptr %v378, align 4
  %507 = call i32 @llvm.riscv.sltiu.enc(i32 %506, i32 0)
  %508 = call i32 @llvm.riscv.sltiu.enc(i32 %507, i32 1)
  %509 = call i32 @llvm.riscv.xori.enc(i32 %508, i32 1)
  store i32 %509, ptr %__ilxor_enc_r377, align 4
  %510 = load i32, ptr %__ilxor_enc_r377, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %510) #4, !srcloc !103
  %v380 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral379, i32 0, i32 0
  %511 = load i32, ptr %__ilxor_enc_r377, align 4
  store i32 %511, ptr %v380, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral379, i32 4, i1 false)
  %v385 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral384, i32 0, i32 0
  store i32 0, ptr %v385, align 4
  %v387 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral386, i32 0, i32 0
  store i32 0, ptr %v387, align 4
  %512 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %512, ptr %__zero_reg_r383, align 4
  %513 = load i32, ptr %__zero_reg_r383, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %513) #4, !srcloc !104
  %v388 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp382, i32 0, i32 0
  %514 = load i32, ptr %__zero_reg_r383, align 4
  store i32 %514, ptr %v388, align 4
  %v389 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp382, i32 0, i32 0
  %515 = load i32, ptr %v389, align 4
  %516 = call i32 @llvm.riscv.xori.enc(i32 %515, i32 3)
  %v390 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %517 = load i32, ptr %v390, align 4
  %518 = call i32 @llvm.riscv.sll.enc(i32 %516, i32 %517)
  store i32 %518, ptr %__isll_enc_r381, align 4
  %519 = load i32, ptr %__isll_enc_r381, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %519) #4, !srcloc !105
  %v392 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral391, i32 0, i32 0
  %520 = load i32, ptr %__isll_enc_r381, align 4
  store i32 %520, ptr %v392, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral391, i32 4, i1 false)
  %v397 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral396, i32 0, i32 0
  store i32 0, ptr %v397, align 4
  %v399 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral398, i32 0, i32 0
  store i32 0, ptr %v399, align 4
  %521 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %521, ptr %__zero_reg_r395, align 4
  %522 = load i32, ptr %__zero_reg_r395, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %522) #4, !srcloc !106
  %v400 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp394, i32 0, i32 0
  %523 = load i32, ptr %__zero_reg_r395, align 4
  store i32 %523, ptr %v400, align 4
  %v401 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp394, i32 0, i32 0
  %524 = load i32, ptr %v401, align 4
  %525 = call i32 @llvm.riscv.xori.enc(i32 %524, i32 3)
  %v402 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %526 = load i32, ptr %v402, align 4
  %527 = call i32 @llvm.riscv.srl.enc(i32 %525, i32 %526)
  store i32 %527, ptr %__isrl_enc_r393, align 4
  %528 = load i32, ptr %__isrl_enc_r393, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %528) #4, !srcloc !107
  %v404 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral403, i32 0, i32 0
  %529 = load i32, ptr %__isrl_enc_r393, align 4
  store i32 %529, ptr %v404, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral403, i32 4, i1 false)
  %v406 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %530 = load i32, ptr %v406, align 4
  %531 = call i32 @llvm.riscv.addi.enc(i32 %530, i32 3)
  store i32 %531, ptr %__iadd_enc_r405, align 4
  %532 = load i32, ptr %__iadd_enc_r405, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %532) #4, !srcloc !108
  %v408 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral407, i32 0, i32 0
  %533 = load i32, ptr %__iadd_enc_r405, align 4
  store i32 %533, ptr %v408, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral407, i32 4, i1 false)
  %v410 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %534 = load i32, ptr %v410, align 4
  %v416 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral415, i32 0, i32 0
  store i32 0, ptr %v416, align 4
  %v418 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral417, i32 0, i32 0
  store i32 0, ptr %v418, align 4
  %535 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %535, ptr %__zero_reg_r414, align 4
  %536 = load i32, ptr %__zero_reg_r414, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %536) #4, !srcloc !109
  %v419 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp413, i32 0, i32 0
  %537 = load i32, ptr %__zero_reg_r414, align 4
  store i32 %537, ptr %v419, align 4
  %v420 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp413, i32 0, i32 0
  %538 = load i32, ptr %v420, align 4
  %539 = call i32 @llvm.riscv.addi.enc(i32 %538, i32 -1)
  store i32 %539, ptr %__full_reg_r412, align 4
  %540 = load i32, ptr %__full_reg_r412, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %540) #4, !srcloc !110
  %v421 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp411, i32 0, i32 0
  %541 = load i32, ptr %__full_reg_r412, align 4
  store i32 %541, ptr %v421, align 4
  %v422 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp411, i32 0, i32 0
  %542 = load i32, ptr %v422, align 4
  %543 = call i32 @llvm.riscv.xor.enc(i32 %534, i32 %542)
  %544 = call i32 @llvm.riscv.addi.enc(i32 %543, i32 1)
  %545 = call i32 @llvm.riscv.addi.enc(i32 %544, i32 3)
  store i32 %545, ptr %__isub_enc_r409, align 4
  %546 = load i32, ptr %__isub_enc_r409, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %546) #4, !srcloc !111
  %v424 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral423, i32 0, i32 0
  %547 = load i32, ptr %__isub_enc_r409, align 4
  store i32 %547, ptr %v424, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral423, i32 4, i1 false)
  %v426 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %548 = load i32, ptr %v426, align 4
  %v432 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral431, i32 0, i32 0
  store i32 0, ptr %v432, align 4
  %v434 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral433, i32 0, i32 0
  store i32 0, ptr %v434, align 4
  %549 = call i32 @llvm.riscv.xor.enc(i32 0, i32 0)
  store i32 %549, ptr %__zero_reg_r430, align 4
  %550 = load i32, ptr %__zero_reg_r430, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %550) #4, !srcloc !112
  %v435 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp429, i32 0, i32 0
  %551 = load i32, ptr %__zero_reg_r430, align 4
  store i32 %551, ptr %v435, align 4
  %v436 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp429, i32 0, i32 0
  %552 = load i32, ptr %v436, align 4
  %553 = call i32 @llvm.riscv.addi.enc(i32 %552, i32 -1)
  store i32 %553, ptr %__full_reg_r428, align 4
  %554 = load i32, ptr %__full_reg_r428, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %554) #4, !srcloc !113
  %v437 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp427, i32 0, i32 0
  %555 = load i32, ptr %__full_reg_r428, align 4
  store i32 %555, ptr %v437, align 4
  %v438 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp427, i32 0, i32 0
  %556 = load i32, ptr %v438, align 4
  %557 = call i32 @llvm.riscv.xor.enc(i32 %548, i32 %556)
  %558 = call i32 @llvm.riscv.addi.enc(i32 %557, i32 1)
  %559 = call i32 @llvm.riscv.addi.enc(i32 %558, i32 3)
  %560 = call i32 @llvm.riscv.sltiu.enc(i32 %559, i32 1)
  store i32 %560, ptr %__iset_enc_r425, align 4
  %561 = load i32, ptr %__iset_enc_r425, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %561) #4, !srcloc !114
  %v440 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral439, i32 0, i32 0
  %562 = load i32, ptr %__iset_enc_r425, align 4
  store i32 %562, ptr %v440, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral439, i32 4, i1 false)
  %v441 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %563 = load i32, ptr %v441, align 4
  %564 = call i32 @llvm.riscv.sltiu.enc(i32 %563, i32 3)
  %565 = call i32 @llvm.riscv.sltiu.enc(i32 %564, i32 1)
  store i32 %565, ptr %__isltu_enc_r, align 4
  %566 = load i32, ptr %__isltu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %566) #4, !srcloc !115
  %v443 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral442, i32 0, i32 0
  %567 = load i32, ptr %__isltu_enc_r, align 4
  store i32 %567, ptr %v443, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral442, i32 4, i1 false)
  %v444 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %568 = load i32, ptr %v444, align 4
  %569 = call i32 @llvm.riscv.sltiu.enc(i32 %568, i32 3)
  %570 = call i32 @llvm.riscv.sltiu.enc(i32 %569, i32 1)
  %571 = call i32 @llvm.riscv.sltiu.enc(i32 %570, i32 1)
  %v445 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %572 = load i32, ptr %v445, align 4
  %573 = call i32 @llvm.riscv.sub.enc(i32 %572, i32 3)
  %574 = call i32 @llvm.riscv.sltiu.enc(i32 %573, i32 1)
  %575 = call i32 @llvm.riscv.sltiu.enc(i32 %574, i32 0)
  %576 = call i32 @llvm.riscv.sltiu.enc(i32 %575, i32 1)
  %577 = call i32 @llvm.riscv.or.enc(i32 %571, i32 %576)
  store i32 %577, ptr %__isletu_enc_r, align 4
  %578 = load i32, ptr %__isletu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %578) #4, !srcloc !116
  %v447 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral446, i32 0, i32 0
  %579 = load i32, ptr %__isletu_enc_r, align 4
  store i32 %579, ptr %v447, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral446, i32 4, i1 false)
  %v448 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %580 = load i32, ptr %v448, align 4
  %581 = call i32 @llvm.riscv.sltiu.enc(i32 %580, i32 3)
  store i32 %581, ptr %__isgtu_enc_r, align 4
  %582 = load i32, ptr %__isgtu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %582) #4, !srcloc !117
  %v450 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral449, i32 0, i32 0
  %583 = load i32, ptr %__isgtu_enc_r, align 4
  store i32 %583, ptr %v450, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral449, i32 4, i1 false)
  %v451 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %584 = load i32, ptr %v451, align 4
  %585 = call i32 @llvm.riscv.sltiu.enc(i32 %584, i32 3)
  %586 = call i32 @llvm.riscv.sltiu.enc(i32 %585, i32 1)
  %v452 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %587 = load i32, ptr %v452, align 4
  %588 = call i32 @llvm.riscv.sub.enc(i32 %587, i32 3)
  %589 = call i32 @llvm.riscv.sltiu.enc(i32 %588, i32 1)
  %590 = call i32 @llvm.riscv.sltiu.enc(i32 %589, i32 1)
  %591 = call i32 @llvm.riscv.or.enc(i32 %586, i32 %590)
  store i32 %591, ptr %__isgetu_enc_r, align 4
  %592 = load i32, ptr %__isgetu_enc_r, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %592) #4, !srcloc !118
  %v454 = getelementptr inbounds nuw %struct.uint_enc, ptr %.compoundliteral453, i32 0, i32 0
  %593 = load i32, ptr %__isgetu_enc_r, align 4
  store i32 %593, ptr %v454, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %.compoundliteral453, i32 4, i1 false)
  %v456 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %594 = load i32, ptr %v456, align 4
  %v457 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %595 = load i32, ptr %v457, align 4
  %596 = call i32 @llvm.riscv.add.enc(i32 %594, i32 %595)
  store i32 %596, ptr %__add_enc_r455, align 4
  %597 = load i32, ptr %__add_enc_r455, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %597) #4, !srcloc !119
  %v458 = getelementptr inbounds nuw %struct.int_enc, ptr %a, i32 0, i32 0
  %598 = load i32, ptr %__add_enc_r455, align 4
  store i32 %598, ptr %v458, align 4
  %v460 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %599 = load i32, ptr %v460, align 4
  %v461 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %600 = load i32, ptr %v461, align 4
  %601 = call i32 @llvm.riscv.sub.enc(i32 %599, i32 %600)
  store i32 %601, ptr %__sub_enc_r459, align 4
  %602 = load i32, ptr %__sub_enc_r459, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %602) #4, !srcloc !120
  %v462 = getelementptr inbounds nuw %struct.int_enc, ptr %b, i32 0, i32 0
  %603 = load i32, ptr %__sub_enc_r459, align 4
  store i32 %603, ptr %v462, align 4
  %v464 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %604 = load i32, ptr %v464, align 4
  %v465 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %605 = load i32, ptr %v465, align 4
  %606 = call i32 @llvm.riscv.add.enc(i32 %604, i32 %605)
  store i32 %606, ptr %__add_enc_r463, align 4
  %607 = load i32, ptr %__add_enc_r463, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %607) #4, !srcloc !121
  %v467 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral466, i32 0, i32 0
  %608 = load i32, ptr %__add_enc_r463, align 4
  store i32 %608, ptr %v467, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral466, i32 4, i1 false)
  %v469 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %609 = load i32, ptr %v469, align 4
  %v470 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %610 = load i32, ptr %v470, align 4
  %611 = call i32 @llvm.riscv.sub.enc(i32 %609, i32 %610)
  store i32 %611, ptr %__sub_enc_r468, align 4
  %612 = load i32, ptr %__sub_enc_r468, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %612) #4, !srcloc !122
  %v472 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral471, i32 0, i32 0
  %613 = load i32, ptr %__sub_enc_r468, align 4
  store i32 %613, ptr %v472, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral471, i32 4, i1 false)
  %v474 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %614 = load i32, ptr %v474, align 4
  %615 = call i32 @llvm.riscv.addi.enc(i32 %614, i32 1)
  store i32 %615, ptr %__addi_enc_r473, align 4
  %616 = load i32, ptr %__addi_enc_r473, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %616) #4, !srcloc !123
  %v476 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral475, i32 0, i32 0
  %617 = load i32, ptr %__addi_enc_r473, align 4
  store i32 %617, ptr %v476, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral475, i32 4, i1 false)
  %v478 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %618 = load i32, ptr %v478, align 4
  %619 = call i32 @llvm.riscv.addi.enc(i32 %618, i32 -1)
  store i32 %619, ptr %__subi_enc_r477, align 4
  %620 = load i32, ptr %__subi_enc_r477, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %620) #4, !srcloc !124
  %v480 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral479, i32 0, i32 0
  %621 = load i32, ptr %__subi_enc_r477, align 4
  store i32 %621, ptr %v480, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x, ptr align 4 %.compoundliteral479, i32 4, i1 false)
  %v483 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %622 = load i32, ptr %v483, align 4
  %v484 = getelementptr inbounds nuw %struct.int_enc, ptr %thirteen, i32 0, i32 0
  %623 = load i32, ptr %v484, align 4
  %624 = call i32 @llvm.riscv.sub.enc(i32 %622, i32 %623)
  store i32 %624, ptr %__sub_enc_r482, align 4
  %625 = load i32, ptr %__sub_enc_r482, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %625) #4, !srcloc !125
  %v485 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp481, i32 0, i32 0
  %626 = load i32, ptr %__sub_enc_r482, align 4
  store i32 %626, ptr %v485, align 4
  %coerce.dive = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp481, i32 0, i32 0
  %627 = load i32, ptr %coerce.dive, align 4
  %coerce.dive486 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %628 = load i32, ptr %coerce.dive486, align 4
  %coerce.dive487 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %629 = load i32, ptr %coerce.dive487, align 4
  %call = call i32 @addDouble(i32 %627, i32 %628, i32 %629)
  %coerce.dive488 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp, i32 0, i32 0
  store i32 %call, ptr %coerce.dive488, align 4
  %v492 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %630 = load i32, ptr %v492, align 4
  %631 = call i32 @llvm.riscv.slli.enc(i32 %630, i32 2)
  store i32 %631, ptr %__slli_enc_r491, align 4
  %632 = load i32, ptr %__slli_enc_r491, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %632) #4, !srcloc !126
  %v493 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp490, i32 0, i32 0
  %633 = load i32, ptr %__slli_enc_r491, align 4
  store i32 %633, ptr %v493, align 4
  %coerce.dive494 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %634 = load i32, ptr %coerce.dive494, align 4
  %coerce.dive495 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp490, i32 0, i32 0
  %635 = load i32, ptr %coerce.dive495, align 4
  %coerce.dive496 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %636 = load i32, ptr %coerce.dive496, align 4
  %call497 = call i32 @addDouble(i32 %634, i32 %635, i32 %636)
  %coerce.dive498 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp489, i32 0, i32 0
  store i32 %call497, ptr %coerce.dive498, align 4
  %coerce.dive499 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp, i32 0, i32 0
  %637 = load i32, ptr %coerce.dive499, align 4
  %coerce.dive500 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp489, i32 0, i32 0
  %638 = load i32, ptr %coerce.dive500, align 4
  %coerce.dive501 = getelementptr inbounds nuw %struct.int_enc, ptr %thirteen, i32 0, i32 0
  %639 = load i32, ptr %coerce.dive501, align 4
  %call502 = call i32 @addDouble(i32 %637, i32 %638, i32 %639)
  %coerce.dive503 = getelementptr inbounds nuw %struct.int_enc, ptr %tmp, i32 0, i32 0
  store i32 %call502, ptr %coerce.dive503, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %tmp, i32 4, i1 false)
  %v512 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %640 = load i32, ptr %v512, align 4
  %v513 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %641 = load i32, ptr %v513, align 4
  %642 = call i32 @llvm.riscv.add.enc(i32 %640, i32 %641)
  store i32 %642, ptr %__add_enc_r511, align 4
  %643 = load i32, ptr %__add_enc_r511, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %643) #4, !srcloc !127
  %v514 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp510, i32 0, i32 0
  %644 = load i32, ptr %__add_enc_r511, align 4
  store i32 %644, ptr %v514, align 4
  %v515 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp510, i32 0, i32 0
  %645 = load i32, ptr %v515, align 4
  %v516 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %646 = load i32, ptr %v516, align 4
  %647 = call i32 @llvm.riscv.sll.enc(i32 %645, i32 %646)
  store i32 %647, ptr %__sll_enc_r509, align 4
  %648 = load i32, ptr %__sll_enc_r509, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %648) #4, !srcloc !128
  %v517 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp508, i32 0, i32 0
  %649 = load i32, ptr %__sll_enc_r509, align 4
  store i32 %649, ptr %v517, align 4
  %v518 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp508, i32 0, i32 0
  %650 = load i32, ptr %v518, align 4
  %651 = call i32 @llvm.riscv.sltiu.enc(i32 %650, i32 0)
  %652 = call i32 @llvm.riscv.sltiu.enc(i32 %651, i32 1)
  %v521 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %653 = load i32, ptr %v521, align 4
  %654 = call i32 @llvm.riscv.addi.enc(i32 %653, i32 -1)
  store i32 %654, ptr %__subi_enc_r520, align 4
  %655 = load i32, ptr %__subi_enc_r520, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %655) #4, !srcloc !129
  %v522 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp519, i32 0, i32 0
  %656 = load i32, ptr %__subi_enc_r520, align 4
  store i32 %656, ptr %v522, align 4
  %v523 = getelementptr inbounds nuw %struct.int_enc, ptr %ref.tmp519, i32 0, i32 0
  %657 = load i32, ptr %v523, align 4
  %658 = call i32 @llvm.riscv.sltiu.enc(i32 %657, i32 0)
  %659 = call i32 @llvm.riscv.sltiu.enc(i32 %658, i32 1)
  %660 = call i32 @llvm.riscv.and.enc(i32 %652, i32 %659)
  store i32 %660, ptr %__land_enc_r507, align 4
  %661 = load i32, ptr %__land_enc_r507, align 4
  call void asm sideeffect "", "r,~{memory}"(i32 %661) #4, !srcloc !130
  %v524 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp506, i32 0, i32 0
  %662 = load i32, ptr %__land_enc_r507, align 4
  store i32 %662, ptr %v524, align 4
  %coerce.dive525 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp506, i32 0, i32 0
  %663 = load i32, ptr %coerce.dive525, align 4
  %coerce.dive526 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %664 = load i32, ptr %coerce.dive526, align 4
  %coerce.dive527 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %665 = load i32, ptr %coerce.dive527, align 4
  %call528 = call i32 @addDouble(i32 %663, i32 %664, i32 %665)
  %coerce.dive529 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp505, i32 0, i32 0
  store i32 %call528, ptr %coerce.dive529, align 4
  %coerce.dive530 = getelementptr inbounds nuw %struct.int_enc, ptr %agg.tmp505, i32 0, i32 0
  %666 = load i32, ptr %coerce.dive530, align 4
  %coerce.dive531 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %667 = load i32, ptr %coerce.dive531, align 4
  %coerce.dive532 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %668 = load i32, ptr %coerce.dive532, align 4
  %call533 = call i32 @addDouble(i32 %666, i32 %667, i32 %668)
  %coerce.dive534 = getelementptr inbounds nuw %struct.int_enc, ptr %tmp504, i32 0, i32 0
  store i32 %call533, ptr %coerce.dive534, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %result, ptr align 4 %tmp504, i32 4, i1 false)
  %coerce.dive537 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %669 = load i32, ptr %coerce.dive537, align 4
  %coerce.dive538 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %670 = load i32, ptr %coerce.dive538, align 4
  %coerce.dive539 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %671 = load i32, ptr %coerce.dive539, align 4
  %call540 = call i32 @uaddDouble(i32 %669, i32 %670, i32 %671)
  %coerce.dive541 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp536, i32 0, i32 0
  store i32 %call540, ptr %coerce.dive541, align 4
  %coerce.dive542 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp536, i32 0, i32 0
  %672 = load i32, ptr %coerce.dive542, align 4
  %coerce.dive543 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %673 = load i32, ptr %coerce.dive543, align 4
  %coerce.dive544 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %674 = load i32, ptr %coerce.dive544, align 4
  %call545 = call i32 @uaddDouble(i32 %672, i32 %673, i32 %674)
  %coerce.dive546 = getelementptr inbounds nuw %struct.uint_enc, ptr %tmp535, i32 0, i32 0
  store i32 %call545, ptr %coerce.dive546, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %tmp535, i32 4, i1 false)
  %coerce.dive549 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %675 = load i32, ptr %coerce.dive549, align 4
  %coerce.dive550 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %676 = load i32, ptr %coerce.dive550, align 4
  %coerce.dive551 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %677 = load i32, ptr %coerce.dive551, align 4
  %call552 = call i32 @uaddDouble(i32 %675, i32 %676, i32 %677)
  %coerce.dive553 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp548, i32 0, i32 0
  store i32 %call552, ptr %coerce.dive553, align 4
  %coerce.dive555 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %678 = load i32, ptr %coerce.dive555, align 4
  %coerce.dive556 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %679 = load i32, ptr %coerce.dive556, align 4
  %coerce.dive557 = getelementptr inbounds nuw %struct.uint_enc, ptr %test, i32 0, i32 0
  %680 = load i32, ptr %coerce.dive557, align 4
  %call558 = call i32 @uaddDouble(i32 %678, i32 %679, i32 %680)
  %coerce.dive559 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp554, i32 0, i32 0
  store i32 %call558, ptr %coerce.dive559, align 4
  %coerce.dive560 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp548, i32 0, i32 0
  %681 = load i32, ptr %coerce.dive560, align 4
  %coerce.dive561 = getelementptr inbounds nuw %struct.uint_enc, ptr %agg.tmp554, i32 0, i32 0
  %682 = load i32, ptr %coerce.dive561, align 4
  %coerce.dive562 = getelementptr inbounds nuw %struct.uint_enc, ptr %no_neg, i32 0, i32 0
  %683 = load i32, ptr %coerce.dive562, align 4
  %call563 = call i32 @uaddDouble(i32 %681, i32 %682, i32 %683)
  %coerce.dive564 = getelementptr inbounds nuw %struct.uint_enc, ptr %tmp547, i32 0, i32 0
  store i32 %call563, ptr %coerce.dive564, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %uresult, ptr align 4 %tmp547, i32 4, i1 false)
  %coerce.dive565 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %684 = load i32, ptr %coerce.dive565, align 4
  %coerce.dive566 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %685 = load i32, ptr %coerce.dive566, align 4
  %coerce.dive567 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %686 = load i32, ptr %coerce.dive567, align 4
  %call568 = call i32 @addDouble(i32 %684, i32 %685, i32 %686)
  %coerce.dive569 = getelementptr inbounds nuw %struct.int_enc, ptr %coerce, i32 0, i32 0
  store i32 %call568, ptr %coerce.dive569, align 4
  %coerce.dive570 = getelementptr inbounds nuw %struct.int_enc, ptr %x, i32 0, i32 0
  %687 = load i32, ptr %coerce.dive570, align 4
  %coerce.dive571 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %688 = load i32, ptr %coerce.dive571, align 4
  %coerce.dive572 = getelementptr inbounds nuw %struct.int_enc, ptr %y, i32 0, i32 0
  %689 = load i32, ptr %coerce.dive572, align 4
  %call573 = call i32 @addDouble(i32 %687, i32 %688, i32 %689)
  %coerce.dive575 = getelementptr inbounds nuw %struct.int_enc, ptr %coerce574, i32 0, i32 0
  store i32 %call573, ptr %coerce.dive575, align 4
  %v577 = getelementptr inbounds nuw %struct.int_enc, ptr %.compoundliteral576, i32 0, i32 0
  store i32 0, ptr %v577, align 4
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %z, ptr align 4 %.compoundliteral576, i32 4, i1 false)
  %call578 = call i32 @getSeven()
  store i32 %call578, ptr %seven, align 4
  store i32 0, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %690 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %690, 10
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %x579, ptr align 4 @__const.main.x.1, i32 4, i1 false)
  %691 = load i32, ptr %i, align 4
  %inc = add nsw i32 %691, 1
  store i32 %inc, ptr %i, align 4
  br label %while.cond, !llvm.loop !131

while.end:                                        ; preds = %while.cond
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #3

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.xor.enc(i32, i32) #1

; Function Attrs: nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.addi.enc(i32, i32 immarg) #1

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
!6 = !{i64 2147549921}
!7 = !{i64 2147550645}
!8 = !{i64 2147551369}
!9 = !{i64 2147552093}
!10 = !{i64 2147552890}
!11 = !{i64 2147552946}
!12 = !{i64 2147553002}
!13 = !{i64 2147553550}
!14 = !{i64 2147554406}
!15 = !{i64 2147554462}
!16 = !{i64 2147554518}
!17 = !{i64 2147555243}
!18 = !{i64 2147556121}
!19 = !{i64 2147556839}
!20 = !{i64 2147557709}
!21 = !{i64 2147558433}
!22 = !{i64 2147559311}
!23 = !{i64 2147560036}
!24 = !{i64 2147560760}
!25 = !{i64 2147561484}
!26 = !{i64 2147562208}
!27 = !{i64 2147562962}
!28 = !{i64 2147563468}
!29 = !{i64 2147564108}
!30 = !{i64 2147564615}
!31 = !{i64 2147565285}
!32 = !{i64 2147566077}
!33 = !{i64 2147566798}
!34 = !{i64 2147567586}
!35 = !{i64 2147568300}
!36 = !{i64 2147569092}
!37 = !{i64 2147569813}
!38 = !{i64 2147570588}
!39 = !{i64 2147571362}
!40 = !{i64 2147572154}
!41 = !{i64 2147572949}
!42 = !{i64 2147573634}
!43 = !{i64 2147574271}
!44 = !{i64 2147575043}
!45 = !{i64 2147575860}
!46 = !{i64 2147576530}
!47 = !{i64 2147577323}
!48 = !{i64 2147578066}
!49 = !{i64 2147578854}
!50 = !{i64 2147579590}
!51 = !{i64 2147580382}
!52 = !{i64 2147581125}
!53 = !{i64 2147582065}
!54 = !{i64 2147582121}
!55 = !{i64 2147583060}
!56 = !{i64 2147583116}
!57 = !{i64 2147583908}
!58 = !{i64 2147585153}
!59 = !{i64 2147585209}
!60 = !{i64 2147585265}
!61 = !{i64 2147586401}
!62 = !{i64 2147586457}
!63 = !{i64 2147586513}
!64 = !{i64 2147587034}
!65 = !{i64 2147587775}
!66 = !{i64 2147588413}
!67 = !{i64 2147589042}
!68 = !{i64 2147589799}
!69 = !{i64 2147590708}
!70 = !{i64 2147591457}
!71 = !{i64 2147592358}
!72 = !{i64 2147593113}
!73 = !{i64 2147594022}
!74 = !{i64 2147594778}
!75 = !{i64 2147595533}
!76 = !{i64 2147596288}
!77 = !{i64 2147597043}
!78 = !{i64 2147597830}
!79 = !{i64 2147598361}
!80 = !{i64 2147599039}
!81 = !{i64 2147599574}
!82 = !{i64 2147600142}
!83 = !{i64 2147600951}
!84 = !{i64 2147601690}
!85 = !{i64 2147602494}
!86 = !{i64 2147603226}
!87 = !{i64 2147604034}
!88 = !{i64 2147604773}
!89 = !{i64 2147605564}
!90 = !{i64 2147606354}
!91 = !{i64 2147607162}
!92 = !{i64 2147607973}
!93 = !{i64 2147608676}
!94 = !{i64 2147609326}
!95 = !{i64 2147610115}
!96 = !{i64 2147610794}
!97 = !{i64 2147611477}
!98 = !{i64 2147612287}
!99 = !{i64 2147613048}
!100 = !{i64 2147613852}
!101 = !{i64 2147614606}
!102 = !{i64 2147615414}
!103 = !{i64 2147616175}
!104 = !{i64 2147617133}
!105 = !{i64 2147617189}
!106 = !{i64 2147618146}
!107 = !{i64 2147618202}
!108 = !{i64 2147619010}
!109 = !{i64 2147620271}
!110 = !{i64 2147620327}
!111 = !{i64 2147620383}
!112 = !{i64 2147621537}
!113 = !{i64 2147621593}
!114 = !{i64 2147621649}
!115 = !{i64 2147622185}
!116 = !{i64 2147622946}
!117 = !{i64 2147623597}
!118 = !{i64 2147624300}
!119 = !{i64 2147625027}
!120 = !{i64 2147625751}
!121 = !{i64 2147626475}
!122 = !{i64 2147627199}
!123 = !{i64 2147627986}
!124 = !{i64 2147628777}
!125 = !{i64 2147629516}
!126 = !{i64 2147630285}
!127 = !{i64 2147652487}
!128 = !{i64 2147652687}
!129 = !{i64 2147654096}
!130 = !{i64 2147658300}
!131 = distinct !{!131, !132}
!132 = !{!"llvm.loop.mustprogress"}
