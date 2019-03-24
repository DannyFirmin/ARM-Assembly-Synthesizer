@ Author: Danny Feng (Yanming Feng) uid: u6611178 @ANU
.syntax unified
.global main

.type main, %function
main:
  bl init @ setup headphone jack
  mov r7 , 33421 @ r7 is the value for r0
  @ 240 Hz Triangle Wave
  mov r8, 100 @ triangle_up counter
  mov r9, 100 @ triangle_down counter
  b triangle_up

triangle_up:
  mov r9, 100 @ Reset down counter
  add r7, 655
  mov r0, r7
  bl BSP_AUDIO_OUT_Play_Sample
  subs r8, 1
  beq triangle_down
  b triangle_up

triangle_down:
  mov r8, 100 @ Reset up counter
  sub r7, 655
  mov r0, r7
  bl BSP_AUDIO_OUT_Play_Sample
  subs r9, 1
  beq triangle_up
  b triangle_down

.size main, .-main