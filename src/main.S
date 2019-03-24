@ Author: Danny Feng (Yanming Feng) uid: u6611178 @ANU
.syntax unified
.global main

.type main, %function
main:
  bl init @ setup headphone jack
  mov r7 , 33421 @ r7 is the value for r0
  @ 240 Hz Triangle Wave
  mov r6, 480 @ sawtooth wave counter
  mov r8, 100 @ triangle_up counter
  mov r9, 100 @ triangle_down counter
  b sawtooth_reset

triangle_up:
  mov r9, 100 @ Reset down counter
  add r7, 655
  mov r0, r7
  bl BSP_AUDIO_OUT_Play_Sample
  subs r8, 1
  beq triangle_down
  b triangle_up

triangle_down:
  mov r6, 480
  mov r8, 100 @ Reset up counter
  sub r7, 655
  mov r0, r7
  bl BSP_AUDIO_OUT_Play_Sample
  subs r9, 1
  beq triangle_up
  b triangle_down

@ 100Hz
sawtooth:
  add r7, 136
  mov r0, r7
  bl BSP_AUDIO_OUT_Play_Sample
  subs r6, 1
  beq sawtooth_reset
  b sawtooth

sawtooth_reset:
  mov r7, 0x8000
  mov r6, 136
  b sawtooth
.size main, .-main