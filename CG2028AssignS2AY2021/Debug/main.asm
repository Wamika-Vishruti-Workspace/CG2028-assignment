   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC1:
  21 0000 61736D3A 		.ascii	"asm: i = %d, y_n = %d, \012\000"
  21      2069203D 
  21      2025642C 
  21      20795F6E 
  21      203D2025 
  22 0019 000000   		.align	2
  23              	.LC2:
  24 001c 4320203A 		.ascii	"C  : i = %d, y_n = %d, \012\000"
  24      2069203D 
  24      2025642C 
  24      20795F6E 
  24      203D2025 
  25 0035 000000   		.align	2
  26              	.LC0:
  27 0038 64000000 		.word	100
  28 003c E6000000 		.word	230
  29 0040 18010000 		.word	280
  30 0044 9A010000 		.word	410
  31 0048 1C020000 		.word	540
  32 004c 58020000 		.word	600
  33 0050 E0010000 		.word	480
  34 0054 86010000 		.word	390
  35 0058 FA000000 		.word	250
  36 005c A0000000 		.word	160
  37 0060 64000000 		.word	100
  38 0064 54010000 		.word	340
  39              		.section	.text.main,"ax",%progbits
  40              		.align	2
  41              		.global	main
  42              		.thumb
  43              		.thumb_func
  45              	main:
  46              	.LFB0:
  47              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** #define N_MAX 10
   3:../src/main.c **** #define X_SIZE 12
   4:../src/main.c **** 
   5:../src/main.c **** 
   6:../src/main.c **** // CG2028 Assignment, Sem 2, AY 2020/21
   7:../src/main.c **** // (c) CG2028 Teaching Team, ECE NUS, 2021
   8:../src/main.c **** 
   9:../src/main.c **** extern int iir(int N, int* b, int* a, int x_n); // asm implementation
  10:../src/main.c **** int iir_c(int N, int* b, int* a, int x_n); // reference C implementation
  11:../src/main.c **** 
  12:../src/main.c **** int main(void)
  13:../src/main.c **** {
  48              		.loc 1 13 0
  49              		.cfi_startproc
  50              		@ args = 0, pretend = 0, frame = 144
  51              		@ frame_needed = 1, uses_anonymous_args = 0
  52 0000 B0B5     		push	{r4, r5, r7, lr}
  53              	.LCFI0:
  54              		.cfi_def_cfa_offset 16
  55              		.cfi_offset 14, -4
  56              		.cfi_offset 7, -8
  57              		.cfi_offset 5, -12
  58              		.cfi_offset 4, -16
  59 0002 A4B0     		sub	sp, sp, #144
  60              	.LCFI1:
  61              		.cfi_def_cfa_offset 160
  62 0004 00AF     		add	r7, sp, #0
  63              	.LCFI2:
  64              		.cfi_def_cfa_register 7
  14:../src/main.c **** 	//variables
  15:../src/main.c **** 	int i;
  16:../src/main.c **** 	int N = 4;
  65              		.loc 1 16 0
  66 0006 4FF00403 		mov	r3, #4
  67 000a C7F88830 		str	r3, [r7, #136]
  17:../src/main.c **** 	// think of the values below as numbers of the form y.yy (floating point with 2 digits precision)
  18:../src/main.c **** 	// which are scaled up to allow them to be used integers
  19:../src/main.c **** 	// within the iir function, we divide y by 100 (decimal) to scale it down
  20:../src/main.c **** 	int b[N_MAX+1] = {100, 250, 360, 450, 580}; //N+1 dimensional feedforward
  68              		.loc 1 20 0
  69 000e 07F15C03 		add	r3, r7, #92
  70 0012 4FF00002 		mov	r2, #0
  71 0016 1A60     		str	r2, [r3, #0]
  72 0018 03F10403 		add	r3, r3, #4
  73 001c 4FF00002 		mov	r2, #0
  74 0020 1A60     		str	r2, [r3, #0]
  75 0022 03F10403 		add	r3, r3, #4
  76 0026 4FF00002 		mov	r2, #0
  77 002a 1A60     		str	r2, [r3, #0]
  78 002c 03F10403 		add	r3, r3, #4
  79 0030 4FF00002 		mov	r2, #0
  80 0034 1A60     		str	r2, [r3, #0]
  81 0036 03F10403 		add	r3, r3, #4
  82 003a 4FF00002 		mov	r2, #0
  83 003e 1A60     		str	r2, [r3, #0]
  84 0040 03F10403 		add	r3, r3, #4
  85 0044 4FF00002 		mov	r2, #0
  86 0048 1A60     		str	r2, [r3, #0]
  87 004a 03F10403 		add	r3, r3, #4
  88 004e 4FF00002 		mov	r2, #0
  89 0052 1A60     		str	r2, [r3, #0]
  90 0054 03F10403 		add	r3, r3, #4
  91 0058 4FF00002 		mov	r2, #0
  92 005c 1A60     		str	r2, [r3, #0]
  93 005e 03F10403 		add	r3, r3, #4
  94 0062 4FF00002 		mov	r2, #0
  95 0066 1A60     		str	r2, [r3, #0]
  96 0068 03F10403 		add	r3, r3, #4
  97 006c 4FF00002 		mov	r2, #0
  98 0070 1A60     		str	r2, [r3, #0]
  99 0072 03F10403 		add	r3, r3, #4
 100 0076 4FF00002 		mov	r2, #0
 101 007a 1A60     		str	r2, [r3, #0]
 102 007c 03F10403 		add	r3, r3, #4
 103 0080 4FF06403 		mov	r3, #100
 104 0084 FB65     		str	r3, [r7, #92]
 105 0086 4FF0FA03 		mov	r3, #250
 106 008a 3B66     		str	r3, [r7, #96]
 107 008c 4FF4B473 		mov	r3, #360
 108 0090 7B66     		str	r3, [r7, #100]
 109 0092 4FF4E173 		mov	r3, #450
 110 0096 BB66     		str	r3, [r7, #104]
 111 0098 4FF41173 		mov	r3, #580
 112 009c FB66     		str	r3, [r7, #108]
  21:../src/main.c **** 	int a[N_MAX+1] = {100, 120, 180, 230, 250}; //N+1 dimensional feedback
 113              		.loc 1 21 0
 114 009e 07F13003 		add	r3, r7, #48
 115 00a2 4FF00002 		mov	r2, #0
 116 00a6 1A60     		str	r2, [r3, #0]
 117 00a8 03F10403 		add	r3, r3, #4
 118 00ac 4FF00002 		mov	r2, #0
 119 00b0 1A60     		str	r2, [r3, #0]
 120 00b2 03F10403 		add	r3, r3, #4
 121 00b6 4FF00002 		mov	r2, #0
 122 00ba 1A60     		str	r2, [r3, #0]
 123 00bc 03F10403 		add	r3, r3, #4
 124 00c0 4FF00002 		mov	r2, #0
 125 00c4 1A60     		str	r2, [r3, #0]
 126 00c6 03F10403 		add	r3, r3, #4
 127 00ca 4FF00002 		mov	r2, #0
 128 00ce 1A60     		str	r2, [r3, #0]
 129 00d0 03F10403 		add	r3, r3, #4
 130 00d4 4FF00002 		mov	r2, #0
 131 00d8 1A60     		str	r2, [r3, #0]
 132 00da 03F10403 		add	r3, r3, #4
 133 00de 4FF00002 		mov	r2, #0
 134 00e2 1A60     		str	r2, [r3, #0]
 135 00e4 03F10403 		add	r3, r3, #4
 136 00e8 4FF00002 		mov	r2, #0
 137 00ec 1A60     		str	r2, [r3, #0]
 138 00ee 03F10403 		add	r3, r3, #4
 139 00f2 4FF00002 		mov	r2, #0
 140 00f6 1A60     		str	r2, [r3, #0]
 141 00f8 03F10403 		add	r3, r3, #4
 142 00fc 4FF00002 		mov	r2, #0
 143 0100 1A60     		str	r2, [r3, #0]
 144 0102 03F10403 		add	r3, r3, #4
 145 0106 4FF00002 		mov	r2, #0
 146 010a 1A60     		str	r2, [r3, #0]
 147 010c 03F10403 		add	r3, r3, #4
 148 0110 4FF06403 		mov	r3, #100
 149 0114 3B63     		str	r3, [r7, #48]
 150 0116 4FF07803 		mov	r3, #120
 151 011a 7B63     		str	r3, [r7, #52]
 152 011c 4FF0B403 		mov	r3, #180
 153 0120 BB63     		str	r3, [r7, #56]
 154 0122 4FF0E603 		mov	r3, #230
 155 0126 FB63     		str	r3, [r7, #60]
 156 0128 4FF0FA03 		mov	r3, #250
 157 012c 3B64     		str	r3, [r7, #64]
  22:../src/main.c **** 	int x[X_SIZE] = {100, 230, 280, 410, 540, 600, 480, 390, 250, 160, 100, 340};
 158              		.loc 1 22 0
 159 012e 40F20003 		movw	r3, #:lower16:.LC0
 160 0132 C0F20003 		movt	r3, #:upper16:.LC0
 161 0136 3C46     		mov	r4, r7
 162 0138 1D46     		mov	r5, r3
 163 013a 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 164 013c 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 165 013e 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
 166 0140 0FC4     		stmia	r4!, {r0, r1, r2, r3}
 167 0142 95E80F00 		ldmia	r5, {r0, r1, r2, r3}
 168 0146 84E80F00 		stmia	r4, {r0, r1, r2, r3}
  23:../src/main.c **** 
  24:../src/main.c **** 	// Call assembly language function iir for each element of x
  25:../src/main.c **** 	for (i=0; i<X_SIZE; i++)
 169              		.loc 1 25 0
 170 014a 4FF00003 		mov	r3, #0
 171 014e C7F88C30 		str	r3, [r7, #140]
 172 0152 3DE0     		b	.L2
 173              	.L3:
  26:../src/main.c **** 	{
  27:../src/main.c **** 		printf( "asm: i = %d, y_n = %d, \n", i, iir(N, b, a, x[i]) ) ;
 174              		.loc 1 27 0 discriminator 2
 175 0154 40F20004 		movw	r4, #:lower16:.LC1
 176 0158 C0F20004 		movt	r4, #:upper16:.LC1
 177 015c D7F88C30 		ldr	r3, [r7, #140]
 178 0160 4FEA8303 		lsl	r3, r3, #2
 179 0164 07F19002 		add	r2, r7, #144
 180 0168 D318     		adds	r3, r2, r3
 181 016a 53F8903C 		ldr	r3, [r3, #-144]
 182 016e 07F15C01 		add	r1, r7, #92
 183 0172 07F13002 		add	r2, r7, #48
 184 0176 D7F88800 		ldr	r0, [r7, #136]
 185 017a FFF7FEFF 		bl	iir
 186 017e 0346     		mov	r3, r0
 187 0180 2046     		mov	r0, r4
 188 0182 D7F88C10 		ldr	r1, [r7, #140]
 189 0186 1A46     		mov	r2, r3
 190 0188 FFF7FEFF 		bl	printf
  28:../src/main.c **** 		printf( "C  : i = %d, y_n = %d, \n", i, iir_c(N, b, a, x[i]) ) ;
 191              		.loc 1 28 0 discriminator 2
 192 018c 40F20004 		movw	r4, #:lower16:.LC2
 193 0190 C0F20004 		movt	r4, #:upper16:.LC2
 194 0194 D7F88C30 		ldr	r3, [r7, #140]
 195 0198 4FEA8303 		lsl	r3, r3, #2
 196 019c 07F19002 		add	r2, r7, #144
 197 01a0 D318     		adds	r3, r2, r3
 198 01a2 53F8903C 		ldr	r3, [r3, #-144]
 199 01a6 07F15C01 		add	r1, r7, #92
 200 01aa 07F13002 		add	r2, r7, #48
 201 01ae D7F88800 		ldr	r0, [r7, #136]
 202 01b2 FFF7FEFF 		bl	iir_c
 203 01b6 0346     		mov	r3, r0
 204 01b8 2046     		mov	r0, r4
 205 01ba D7F88C10 		ldr	r1, [r7, #140]
 206 01be 1A46     		mov	r2, r3
 207 01c0 FFF7FEFF 		bl	printf
  25:../src/main.c **** 	for (i=0; i<X_SIZE; i++)
 208              		.loc 1 25 0 discriminator 2
 209 01c4 D7F88C30 		ldr	r3, [r7, #140]
 210 01c8 03F10103 		add	r3, r3, #1
 211 01cc C7F88C30 		str	r3, [r7, #140]
 212              	.L2:
  25:../src/main.c **** 	for (i=0; i<X_SIZE; i++)
 213              		.loc 1 25 0 is_stmt 0 discriminator 1
 214 01d0 D7F88C30 		ldr	r3, [r7, #140]
 215 01d4 0B2B     		cmp	r3, #11
 216 01d6 BDDD     		ble	.L3
 217              	.L4:
  29:../src/main.c **** 	}
  30:../src/main.c **** 	while (1); //halt
 218              		.loc 1 30 0 is_stmt 1 discriminator 1
 219 01d8 FEE7     		b	.L4
 220              		.cfi_endproc
 221              	.LFE0:
 223 01da 00BF     		.section	.text.iir_c,"ax",%progbits
 224              		.align	2
 225              		.global	iir_c
 226              		.thumb
 227              		.thumb_func
 229              	iir_c:
 230              	.LFB1:
  31:../src/main.c **** }
  32:../src/main.c **** 
  33:../src/main.c **** int iir_c(int N, int* b, int* a, int x_n)
  34:../src/main.c **** { 	// The implementation below is inefficient and meant only for verifying your results.
 231              		.loc 1 34 0
 232              		.cfi_startproc
 233              		@ args = 0, pretend = 0, frame = 24
 234              		@ frame_needed = 1, uses_anonymous_args = 0
 235              		@ link register save eliminated.
 236 0000 80B4     		push	{r7}
 237              	.LCFI3:
 238              		.cfi_def_cfa_offset 4
 239              		.cfi_offset 7, -4
 240 0002 87B0     		sub	sp, sp, #28
 241              	.LCFI4:
 242              		.cfi_def_cfa_offset 32
 243 0004 00AF     		add	r7, sp, #0
 244              	.LCFI5:
 245              		.cfi_def_cfa_register 7
 246 0006 F860     		str	r0, [r7, #12]
 247 0008 B960     		str	r1, [r7, #8]
 248 000a 7A60     		str	r2, [r7, #4]
 249 000c 3B60     		str	r3, [r7, #0]
  35:../src/main.c **** 
  36:../src/main.c **** 	static int x_store[N_MAX] = {0}; // to store the previous N values of x_n.
  37:../src/main.c **** 	static int y_store[N_MAX] = {0}; // to store the previous values of y_n.
  38:../src/main.c **** 	
  39:../src/main.c **** 	int j;
  40:../src/main.c **** 	int y_n;
  41:../src/main.c **** 
  42:../src/main.c **** 	y_n = x_n*b[0]/a[0];
 250              		.loc 1 42 0
 251 000e BB68     		ldr	r3, [r7, #8]
 252 0010 1B68     		ldr	r3, [r3, #0]
 253 0012 3A68     		ldr	r2, [r7, #0]
 254 0014 02FB03F2 		mul	r2, r2, r3
 255 0018 7B68     		ldr	r3, [r7, #4]
 256 001a 1B68     		ldr	r3, [r3, #0]
 257 001c 92FBF3F3 		sdiv	r3, r2, r3
 258 0020 3B61     		str	r3, [r7, #16]
  43:../src/main.c **** 	
  44:../src/main.c **** 	for (j=0; j<=N; j++)
 259              		.loc 1 44 0
 260 0022 4FF00003 		mov	r3, #0
 261 0026 7B61     		str	r3, [r7, #20]
 262 0028 2DE0     		b	.L6
 263              	.L7:
  45:../src/main.c **** 	{
  46:../src/main.c **** 		y_n+=(b[j+1]*x_store[j]-a[j+1]*y_store[j])/a[0];
 264              		.loc 1 46 0 discriminator 2
 265 002a 7B69     		ldr	r3, [r7, #20]
 266 002c 03F10103 		add	r3, r3, #1
 267 0030 4FEA8303 		lsl	r3, r3, #2
 268 0034 BA68     		ldr	r2, [r7, #8]
 269 0036 D318     		adds	r3, r2, r3
 270 0038 1A68     		ldr	r2, [r3, #0]
 271 003a 40F20003 		movw	r3, #:lower16:x_store.3834
 272 003e C0F20003 		movt	r3, #:upper16:x_store.3834
 273 0042 7969     		ldr	r1, [r7, #20]
 274 0044 53F82130 		ldr	r3, [r3, r1, lsl #2]
 275 0048 03FB02F2 		mul	r2, r3, r2
 276 004c 7B69     		ldr	r3, [r7, #20]
 277 004e 03F10103 		add	r3, r3, #1
 278 0052 4FEA8303 		lsl	r3, r3, #2
 279 0056 7968     		ldr	r1, [r7, #4]
 280 0058 CB18     		adds	r3, r1, r3
 281 005a 1968     		ldr	r1, [r3, #0]
 282 005c 40F20003 		movw	r3, #:lower16:y_store.3835
 283 0060 C0F20003 		movt	r3, #:upper16:y_store.3835
 284 0064 7869     		ldr	r0, [r7, #20]
 285 0066 53F82030 		ldr	r3, [r3, r0, lsl #2]
 286 006a 03FB01F3 		mul	r3, r3, r1
 287 006e D21A     		subs	r2, r2, r3
 288 0070 7B68     		ldr	r3, [r7, #4]
 289 0072 1B68     		ldr	r3, [r3, #0]
 290 0074 92FBF3F3 		sdiv	r3, r2, r3
 291 0078 3A69     		ldr	r2, [r7, #16]
 292 007a D318     		adds	r3, r2, r3
 293 007c 3B61     		str	r3, [r7, #16]
  44:../src/main.c **** 	for (j=0; j<=N; j++)
 294              		.loc 1 44 0 discriminator 2
 295 007e 7B69     		ldr	r3, [r7, #20]
 296 0080 03F10103 		add	r3, r3, #1
 297 0084 7B61     		str	r3, [r7, #20]
 298              	.L6:
  44:../src/main.c **** 	for (j=0; j<=N; j++)
 299              		.loc 1 44 0 is_stmt 0 discriminator 1
 300 0086 7A69     		ldr	r2, [r7, #20]
 301 0088 FB68     		ldr	r3, [r7, #12]
 302 008a 9A42     		cmp	r2, r3
 303 008c CDDD     		ble	.L7
  47:../src/main.c **** 	}
  48:../src/main.c **** 	
  49:../src/main.c **** 	for (j=N-1; j>0; j--)
 304              		.loc 1 49 0 is_stmt 1
 305 008e FB68     		ldr	r3, [r7, #12]
 306 0090 03F1FF33 		add	r3, r3, #-1
 307 0094 7B61     		str	r3, [r7, #20]
 308 0096 23E0     		b	.L8
 309              	.L9:
  50:../src/main.c **** 	{
  51:../src/main.c **** 		x_store[j] = x_store[j-1];
 310              		.loc 1 51 0 discriminator 2
 311 0098 7B69     		ldr	r3, [r7, #20]
 312 009a 03F1FF32 		add	r2, r3, #-1
 313 009e 40F20003 		movw	r3, #:lower16:x_store.3834
 314 00a2 C0F20003 		movt	r3, #:upper16:x_store.3834
 315 00a6 53F82210 		ldr	r1, [r3, r2, lsl #2]
 316 00aa 40F20003 		movw	r3, #:lower16:x_store.3834
 317 00ae C0F20003 		movt	r3, #:upper16:x_store.3834
 318 00b2 7A69     		ldr	r2, [r7, #20]
 319 00b4 43F82210 		str	r1, [r3, r2, lsl #2]
  52:../src/main.c **** 		y_store[j] = y_store[j-1];
 320              		.loc 1 52 0 discriminator 2
 321 00b8 7B69     		ldr	r3, [r7, #20]
 322 00ba 03F1FF32 		add	r2, r3, #-1
 323 00be 40F20003 		movw	r3, #:lower16:y_store.3835
 324 00c2 C0F20003 		movt	r3, #:upper16:y_store.3835
 325 00c6 53F82210 		ldr	r1, [r3, r2, lsl #2]
 326 00ca 40F20003 		movw	r3, #:lower16:y_store.3835
 327 00ce C0F20003 		movt	r3, #:upper16:y_store.3835
 328 00d2 7A69     		ldr	r2, [r7, #20]
 329 00d4 43F82210 		str	r1, [r3, r2, lsl #2]
  49:../src/main.c **** 	for (j=N-1; j>0; j--)
 330              		.loc 1 49 0 discriminator 2
 331 00d8 7B69     		ldr	r3, [r7, #20]
 332 00da 03F1FF33 		add	r3, r3, #-1
 333 00de 7B61     		str	r3, [r7, #20]
 334              	.L8:
  49:../src/main.c **** 	for (j=N-1; j>0; j--)
 335              		.loc 1 49 0 is_stmt 0 discriminator 1
 336 00e0 7B69     		ldr	r3, [r7, #20]
 337 00e2 002B     		cmp	r3, #0
 338 00e4 D8DC     		bgt	.L9
  53:../src/main.c **** 	}
  54:../src/main.c **** 	
  55:../src/main.c **** 	x_store[0] = x_n;
 339              		.loc 1 55 0 is_stmt 1
 340 00e6 40F20003 		movw	r3, #:lower16:x_store.3834
 341 00ea C0F20003 		movt	r3, #:upper16:x_store.3834
 342 00ee 3A68     		ldr	r2, [r7, #0]
 343 00f0 1A60     		str	r2, [r3, #0]
  56:../src/main.c **** 	y_store[0] = y_n;
 344              		.loc 1 56 0
 345 00f2 40F20003 		movw	r3, #:lower16:y_store.3835
 346 00f6 C0F20003 		movt	r3, #:upper16:y_store.3835
 347 00fa 3A69     		ldr	r2, [r7, #16]
 348 00fc 1A60     		str	r2, [r3, #0]
  57:../src/main.c **** 	
  58:../src/main.c **** 	y_n /= 100; // scaling down
 349              		.loc 1 58 0
 350 00fe 3A69     		ldr	r2, [r7, #16]
 351 0100 48F21F53 		movw	r3, #34079
 352 0104 C5F2EB13 		movt	r3, 20971
 353 0108 83FB0213 		smull	r1, r3, r3, r2
 354 010c 4FEA6311 		asr	r1, r3, #5
 355 0110 4FEAE273 		asr	r3, r2, #31
 356 0114 CB1A     		subs	r3, r1, r3
 357 0116 3B61     		str	r3, [r7, #16]
  59:../src/main.c **** 	
  60:../src/main.c **** 	return y_n;
 358              		.loc 1 60 0
 359 0118 3B69     		ldr	r3, [r7, #16]
  61:../src/main.c **** }
 360              		.loc 1 61 0
 361 011a 1846     		mov	r0, r3
 362 011c 07F11C07 		add	r7, r7, #28
 363 0120 BD46     		mov	sp, r7
 364 0122 80BC     		pop	{r7}
 365 0124 7047     		bx	lr
 366              		.cfi_endproc
 367              	.LFE1:
 369 0126 00BF     		.bss
 370              		.align	2
 371              	x_store.3834:
 372 0000 00000000 		.space	40
 372      00000000 
 372      00000000 
 372      00000000 
 372      00000000 
 373              		.align	2
 374              	y_store.3835:
 375 0028 00000000 		.space	40
 375      00000000 
 375      00000000 
 375      00000000 
 375      00000000 
 376              		.text
 377              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:19     .rodata:00000000 $d
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:20     .rodata:00000000 .LC1
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:23     .rodata:0000001c .LC2
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:26     .rodata:00000038 .LC0
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:40     .text.main:00000000 $t
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:45     .text.main:00000000 main
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:229    .text.iir_c:00000000 iir_c
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:224    .text.iir_c:00000000 $t
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:371    .bss:00000000 x_store.3834
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:374    .bss:00000028 y_store.3835
C:\Users\wamik\AppData\Local\Temp\ccU5qYXm.s:370    .bss:00000000 $d
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
iir
printf
