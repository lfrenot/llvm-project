; RUN: mlir-translate -import-llvm -split-input-file %s | FileCheck %s

; CHECK-LABEL: @integer_arith
; CHECK-SAME:  %[[ARG1:[a-zA-Z0-9]+]]
; CHECK-SAME:  %[[ARG2:[a-zA-Z0-9]+]]
; CHECK-SAME:  %[[ARG3:[a-zA-Z0-9]+]]
; CHECK-SAME:  %[[ARG4:[a-zA-Z0-9]+]]
define void @integer_arith(i32 %arg1, i32 %arg2, i64 %arg3, i64 %arg4) {
  ; CHECK:  llvm.udiv %[[ARG3]], %[[ARG4]] : i64
  %5 = udiv i64 %arg3, %arg4
  ret void
}