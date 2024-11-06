; RUN: mlir-translate -import-llvm -split-input-file %s | FileCheck %s

; CHECK-LABEL: @integer_arith
; CHECK-SAME:  %[[ARG1:[a-zA-Z0-9]+]]
; CHECK-SAME:  %[[ARG2:[a-zA-Z0-9]+]]
; CHECK-SAME:  %[[ARG3:[a-zA-Z0-9]+]]
; CHECK-SAME:  %[[ARG4:[a-zA-Z0-9]+]]
define void @integer_arith(i32 %arg1, i32 %arg2, i64 %arg3, i64 %arg4) {
  ; CHECK:  %[[C1:[0-9]+]] = llvm.mlir.constant(-7 : i32) : i32
  ; CHECK:  %[[C2:[0-9]+]] = llvm.mlir.constant(42 : i32) : i32
  ; CHECK:  llvm.add %[[ARG1]], %[[C1]] : i32
  %1 = add i32 %arg1, -7
  ; CHECK:  llvm.add %[[C2]], %[[ARG2]] : i32
  %2 = add i32 42, %arg2
  ; CHECK:  llvm.sub %[[ARG3]], %[[ARG4]] : i64
  %3 = sub i64 %arg3, %arg4
  ; CHECK:  llvm.mul %[[ARG1]], %[[ARG2]] : i32
  %4 = mul i32 %arg1, %arg2
  ; CHECK:  llvm.udiv %[[ARG3]], %[[ARG4]] : i64
  %5 = udiv i64 %arg3, %arg4
  ; CHECK:  llvm.sdiv %[[ARG1]], %[[ARG2]] : i32
  %6 = sdiv i32 %arg1, %arg2
  ; CHECK:  llvm.urem %[[ARG3]], %[[ARG4]] : i64
  %7 = urem i64 %arg3, %arg4
  ; CHECK:  llvm.srem %[[ARG1]], %[[ARG2]] : i32
  %8 = srem i32 %arg1, %arg2
  ; CHECK:  llvm.shl %[[ARG3]], %[[ARG4]] : i64
  %9 = shl i64 %arg3, %arg4
  ; CHECK:  llvm.lshr %[[ARG1]], %[[ARG2]] : i32
  %10 = lshr i32 %arg1, %arg2
  ; CHECK:  llvm.ashr %[[ARG3]], %[[ARG4]] : i64
  %11 = ashr i64 %arg3, %arg4
  ; CHECK:  llvm.and %[[ARG1]], %[[ARG2]] : i32
  %12 = and i32 %arg1, %arg2
  ; CHECK:  llvm.or %[[ARG3]], %[[ARG4]] : i64
  %13 = or i64 %arg3, %arg4
  ; CHECK:  llvm.xor %[[ARG1]], %[[ARG2]] : i32
  %14 = xor i32 %arg1, %arg2
  ret void
}