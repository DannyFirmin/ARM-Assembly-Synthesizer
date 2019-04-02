@ Author: Danny Feng (Yanming Feng) uid: u6611178 @ANU
.syntax unified
.global main

.type main, %function
main:
  bl init
  mov r4, #0 @counter
  mov r5, #0 @counter
  mov r7, #32767
  b up
up:
  mov r5, #0
  add r7, #395
  mov r0, r7
  bl BSP_AUDIO_OUT_Play_Sample
  add r4, #1
  cmp r4, #100
  bhi down
  b up

down:
  mov r4, #0
  sub r7, #259
  mov r0, r7
  bl BSP_AUDIO_OUT_Play_Sample
  add r5, #1
  cmp r5, #100
  bhi up
  b down

.size main, .-main