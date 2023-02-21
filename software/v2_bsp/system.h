/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu_v1' in SOPC Builder design 't_vga_v1'
 * SOPC Builder design path: D:/2.SET/1.Doc/Nam4/Sem1/ThietKeTongHopICSo/1.Project/ICSo/Tuyen/tuyen_vga_v1/t_vga_v1.sopcinfo
 *
 * Generated: Fri May 06 18:25:45 ICT 2016
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_qsys"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x8820
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x19
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x20
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x19
#define ALT_CPU_NAME "cpu_v1"
#define ALT_CPU_RESET_ADDR 0x0


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x8820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x19
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x20
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x19
#define NIOS2_RESET_ADDR 0x0


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID_QSYS
#define __ALTERA_NIOS2_QSYS
#define __ALTERA_UP_AVALON_SRAM
#define __ALTERA_UP_AVALON_VIDEO_PIXEL_BUFFER_DMA
#define __ALTERA_UP_FLASH_MEMORY_IP_CORE_AVALON_INTERFACE


/*
 * Flash_Memory_flash_data configuration
 *
 */

#define ALT_MODULE_CLASS_Flash_Memory_flash_data Altera_UP_Flash_Memory_IP_Core_Avalon_Interface
#define FLASH_MEMORY_FLASH_DATA_BASE 0x1800000
#define FLASH_MEMORY_FLASH_DATA_IRQ -1
#define FLASH_MEMORY_FLASH_DATA_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLASH_MEMORY_FLASH_DATA_NAME "/dev/Flash_Memory_flash_data"
#define FLASH_MEMORY_FLASH_DATA_SPAN 4194304
#define FLASH_MEMORY_FLASH_DATA_TYPE "Altera_UP_Flash_Memory_IP_Core_Avalon_Interface"


/*
 * Flash_Memory_flash_erase_control configuration
 *
 */

#define ALT_MODULE_CLASS_Flash_Memory_flash_erase_control Altera_UP_Flash_Memory_IP_Core_Avalon_Interface
#define FLASH_MEMORY_FLASH_ERASE_CONTROL_BASE 0x9144
#define FLASH_MEMORY_FLASH_ERASE_CONTROL_IRQ -1
#define FLASH_MEMORY_FLASH_ERASE_CONTROL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define FLASH_MEMORY_FLASH_ERASE_CONTROL_NAME "/dev/Flash_Memory_flash_erase_control"
#define FLASH_MEMORY_FLASH_ERASE_CONTROL_SPAN 4
#define FLASH_MEMORY_FLASH_ERASE_CONTROL_TYPE "Altera_UP_Flash_Memory_IP_Core_Avalon_Interface"


/*
 * LEDS configuration
 *
 */

#define ALT_MODULE_CLASS_LEDS altera_avalon_pio
#define LEDS_BASE 0x90f0
#define LEDS_BIT_CLEARING_EDGE_REGISTER 0
#define LEDS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LEDS_CAPTURE 0
#define LEDS_DATA_WIDTH 4
#define LEDS_DO_TEST_BENCH_WIRING 0
#define LEDS_DRIVEN_SIM_VALUE 0
#define LEDS_EDGE_TYPE "NONE"
#define LEDS_FREQ 50000000
#define LEDS_HAS_IN 0
#define LEDS_HAS_OUT 1
#define LEDS_HAS_TRI 0
#define LEDS_IRQ -1
#define LEDS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDS_IRQ_TYPE "NONE"
#define LEDS_NAME "/dev/LEDS"
#define LEDS_RESET_VALUE 0
#define LEDS_SPAN 16
#define LEDS_TYPE "altera_avalon_pio"


/*
 * SW configuration
 *
 */

#define ALT_MODULE_CLASS_SW altera_avalon_pio
#define SW_BASE 0x9100
#define SW_BIT_CLEARING_EDGE_REGISTER 0
#define SW_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SW_CAPTURE 0
#define SW_DATA_WIDTH 3
#define SW_DO_TEST_BENCH_WIRING 0
#define SW_DRIVEN_SIM_VALUE 0
#define SW_EDGE_TYPE "NONE"
#define SW_FREQ 50000000
#define SW_HAS_IN 1
#define SW_HAS_OUT 0
#define SW_HAS_TRI 0
#define SW_IRQ -1
#define SW_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SW_IRQ_TYPE "NONE"
#define SW_NAME "/dev/SW"
#define SW_RESET_VALUE 0
#define SW_SPAN 16
#define SW_TYPE "altera_avalon_pio"


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone II"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x9138
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x9138
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x9138
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "t_vga_v1"


/*
 * clk2nios configuration
 *
 */

#define ALT_MODULE_CLASS_clk2nios altera_avalon_pio
#define CLK2NIOS_BASE 0x90a0
#define CLK2NIOS_BIT_CLEARING_EDGE_REGISTER 0
#define CLK2NIOS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CLK2NIOS_CAPTURE 0
#define CLK2NIOS_DATA_WIDTH 1
#define CLK2NIOS_DO_TEST_BENCH_WIRING 0
#define CLK2NIOS_DRIVEN_SIM_VALUE 0
#define CLK2NIOS_EDGE_TYPE "NONE"
#define CLK2NIOS_FREQ 50000000
#define CLK2NIOS_HAS_IN 1
#define CLK2NIOS_HAS_OUT 0
#define CLK2NIOS_HAS_TRI 0
#define CLK2NIOS_IRQ -1
#define CLK2NIOS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CLK2NIOS_IRQ_TYPE "NONE"
#define CLK2NIOS_NAME "/dev/clk2nios"
#define CLK2NIOS_RESET_VALUE 0
#define CLK2NIOS_SPAN 16
#define CLK2NIOS_TYPE "altera_avalon_pio"


/*
 * clock_f_nios configuration
 *
 */

#define ALT_MODULE_CLASS_clock_f_nios altera_avalon_pio
#define CLOCK_F_NIOS_BASE 0x90b0
#define CLOCK_F_NIOS_BIT_CLEARING_EDGE_REGISTER 0
#define CLOCK_F_NIOS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define CLOCK_F_NIOS_CAPTURE 0
#define CLOCK_F_NIOS_DATA_WIDTH 1
#define CLOCK_F_NIOS_DO_TEST_BENCH_WIRING 0
#define CLOCK_F_NIOS_DRIVEN_SIM_VALUE 0
#define CLOCK_F_NIOS_EDGE_TYPE "NONE"
#define CLOCK_F_NIOS_FREQ 50000000
#define CLOCK_F_NIOS_HAS_IN 0
#define CLOCK_F_NIOS_HAS_OUT 1
#define CLOCK_F_NIOS_HAS_TRI 0
#define CLOCK_F_NIOS_IRQ -1
#define CLOCK_F_NIOS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CLOCK_F_NIOS_IRQ_TYPE "NONE"
#define CLOCK_F_NIOS_NAME "/dev/clock_f_nios"
#define CLOCK_F_NIOS_RESET_VALUE 0
#define CLOCK_F_NIOS_SPAN 16
#define CLOCK_F_NIOS_TYPE "altera_avalon_pio"


/*
 * data2nios configuration
 *
 */

#define ALT_MODULE_CLASS_data2nios altera_avalon_pio
#define DATA2NIOS_BASE 0x9090
#define DATA2NIOS_BIT_CLEARING_EDGE_REGISTER 0
#define DATA2NIOS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define DATA2NIOS_CAPTURE 0
#define DATA2NIOS_DATA_WIDTH 16
#define DATA2NIOS_DO_TEST_BENCH_WIRING 0
#define DATA2NIOS_DRIVEN_SIM_VALUE 0
#define DATA2NIOS_EDGE_TYPE "NONE"
#define DATA2NIOS_FREQ 50000000
#define DATA2NIOS_HAS_IN 1
#define DATA2NIOS_HAS_OUT 0
#define DATA2NIOS_HAS_TRI 0
#define DATA2NIOS_IRQ -1
#define DATA2NIOS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DATA2NIOS_IRQ_TYPE "NONE"
#define DATA2NIOS_NAME "/dev/data2nios"
#define DATA2NIOS_RESET_VALUE 0
#define DATA2NIOS_SPAN 16
#define DATA2NIOS_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 4
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * image1 configuration
 *
 */

#define ALT_MODULE_CLASS_image1 altera_avalon_pio
#define IMAGE1_BASE 0x90e0
#define IMAGE1_BIT_CLEARING_EDGE_REGISTER 0
#define IMAGE1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define IMAGE1_CAPTURE 0
#define IMAGE1_DATA_WIDTH 8
#define IMAGE1_DO_TEST_BENCH_WIRING 0
#define IMAGE1_DRIVEN_SIM_VALUE 0
#define IMAGE1_EDGE_TYPE "NONE"
#define IMAGE1_FREQ 50000000
#define IMAGE1_HAS_IN 0
#define IMAGE1_HAS_OUT 1
#define IMAGE1_HAS_TRI 0
#define IMAGE1_IRQ -1
#define IMAGE1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define IMAGE1_IRQ_TYPE "NONE"
#define IMAGE1_NAME "/dev/image1"
#define IMAGE1_RESET_VALUE 0
#define IMAGE1_SPAN 16
#define IMAGE1_TYPE "altera_avalon_pio"


/*
 * image2 configuration
 *
 */

#define ALT_MODULE_CLASS_image2 altera_avalon_pio
#define IMAGE2_BASE 0x90d0
#define IMAGE2_BIT_CLEARING_EDGE_REGISTER 0
#define IMAGE2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define IMAGE2_CAPTURE 0
#define IMAGE2_DATA_WIDTH 8
#define IMAGE2_DO_TEST_BENCH_WIRING 0
#define IMAGE2_DRIVEN_SIM_VALUE 0
#define IMAGE2_EDGE_TYPE "NONE"
#define IMAGE2_FREQ 50000000
#define IMAGE2_HAS_IN 0
#define IMAGE2_HAS_OUT 1
#define IMAGE2_HAS_TRI 0
#define IMAGE2_IRQ -1
#define IMAGE2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define IMAGE2_IRQ_TYPE "NONE"
#define IMAGE2_NAME "/dev/image2"
#define IMAGE2_RESET_VALUE 0
#define IMAGE2_SPAN 16
#define IMAGE2_TYPE "altera_avalon_pio"


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x9138
#define JTAG_UART_0_IRQ 5
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * pixel_buffer configuration
 *
 */

#define ALT_MODULE_CLASS_pixel_buffer altera_up_avalon_video_pixel_buffer_dma
#define PIXEL_BUFFER_BASE 0x9110
#define PIXEL_BUFFER_IRQ -1
#define PIXEL_BUFFER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIXEL_BUFFER_NAME "/dev/pixel_buffer"
#define PIXEL_BUFFER_SPAN 16
#define PIXEL_BUFFER_TYPE "altera_up_avalon_video_pixel_buffer_dma"


/*
 * ram_onchip_memory configuration
 *
 */

#define ALT_MODULE_CLASS_ram_onchip_memory altera_avalon_onchip_memory2
#define RAM_ONCHIP_MEMORY_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define RAM_ONCHIP_MEMORY_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define RAM_ONCHIP_MEMORY_BASE 0x0
#define RAM_ONCHIP_MEMORY_CONTENTS_INFO ""
#define RAM_ONCHIP_MEMORY_DUAL_PORT 0
#define RAM_ONCHIP_MEMORY_GUI_RAM_BLOCK_TYPE "AUTO"
#define RAM_ONCHIP_MEMORY_INIT_CONTENTS_FILE "t_vga_v1_ram_onchip_memory"
#define RAM_ONCHIP_MEMORY_INIT_MEM_CONTENT 1
#define RAM_ONCHIP_MEMORY_INSTANCE_ID "NONE"
#define RAM_ONCHIP_MEMORY_IRQ -1
#define RAM_ONCHIP_MEMORY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RAM_ONCHIP_MEMORY_NAME "/dev/ram_onchip_memory"
#define RAM_ONCHIP_MEMORY_NON_DEFAULT_INIT_FILE_ENABLED 0
#define RAM_ONCHIP_MEMORY_RAM_BLOCK_TYPE "AUTO"
#define RAM_ONCHIP_MEMORY_READ_DURING_WRITE_MODE "DONT_CARE"
#define RAM_ONCHIP_MEMORY_SINGLE_CLOCK_OP 0
#define RAM_ONCHIP_MEMORY_SIZE_MULTIPLE 1
#define RAM_ONCHIP_MEMORY_SIZE_VALUE 20480
#define RAM_ONCHIP_MEMORY_SPAN 20480
#define RAM_ONCHIP_MEMORY_TYPE "altera_avalon_onchip_memory2"
#define RAM_ONCHIP_MEMORY_WRITABLE 1


/*
 * reset configuration
 *
 */

#define ALT_MODULE_CLASS_reset altera_avalon_pio
#define RESET_BASE 0x90c0
#define RESET_BIT_CLEARING_EDGE_REGISTER 0
#define RESET_BIT_MODIFYING_OUTPUT_REGISTER 0
#define RESET_CAPTURE 0
#define RESET_DATA_WIDTH 1
#define RESET_DO_TEST_BENCH_WIRING 0
#define RESET_DRIVEN_SIM_VALUE 0
#define RESET_EDGE_TYPE "NONE"
#define RESET_FREQ 50000000
#define RESET_HAS_IN 0
#define RESET_HAS_OUT 1
#define RESET_HAS_TRI 0
#define RESET_IRQ -1
#define RESET_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RESET_IRQ_TYPE "NONE"
#define RESET_NAME "/dev/reset"
#define RESET_RESET_VALUE 0
#define RESET_SPAN 16
#define RESET_TYPE "altera_avalon_pio"


/*
 * sdram_controller configuration
 *
 */

#define ALT_MODULE_CLASS_sdram_controller altera_avalon_new_sdram_controller
#define SDRAM_CONTROLLER_BASE 0x1000000
#define SDRAM_CONTROLLER_CAS_LATENCY 3
#define SDRAM_CONTROLLER_CONTENTS_INFO
#define SDRAM_CONTROLLER_INIT_NOP_DELAY 0.0
#define SDRAM_CONTROLLER_INIT_REFRESH_COMMANDS 8
#define SDRAM_CONTROLLER_IRQ -1
#define SDRAM_CONTROLLER_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_CONTROLLER_IS_INITIALIZED 1
#define SDRAM_CONTROLLER_NAME "/dev/sdram_controller"
#define SDRAM_CONTROLLER_POWERUP_DELAY 200.0
#define SDRAM_CONTROLLER_REFRESH_PERIOD 15.625
#define SDRAM_CONTROLLER_REGISTER_DATA_IN 1
#define SDRAM_CONTROLLER_SDRAM_ADDR_WIDTH 0x16
#define SDRAM_CONTROLLER_SDRAM_BANK_WIDTH 2
#define SDRAM_CONTROLLER_SDRAM_COL_WIDTH 8
#define SDRAM_CONTROLLER_SDRAM_DATA_WIDTH 16
#define SDRAM_CONTROLLER_SDRAM_NUM_BANKS 4
#define SDRAM_CONTROLLER_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_CONTROLLER_SDRAM_ROW_WIDTH 12
#define SDRAM_CONTROLLER_SHARED_DATA 0
#define SDRAM_CONTROLLER_SIM_MODEL_BASE 0
#define SDRAM_CONTROLLER_SPAN 8388608
#define SDRAM_CONTROLLER_STARVATION_INDICATOR 0
#define SDRAM_CONTROLLER_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_CONTROLLER_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_CONTROLLER_T_AC 6.0
#define SDRAM_CONTROLLER_T_MRD 3
#define SDRAM_CONTROLLER_T_RCD 20.0
#define SDRAM_CONTROLLER_T_RFC 70.0
#define SDRAM_CONTROLLER_T_RP 20.0
#define SDRAM_CONTROLLER_T_WR 14.0


/*
 * sram_512 configuration
 *
 */

#define ALT_MODULE_CLASS_sram_512 altera_up_avalon_sram
#define SRAM_512_BASE 0x100000
#define SRAM_512_IRQ -1
#define SRAM_512_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SRAM_512_NAME "/dev/sram_512"
#define SRAM_512_SPAN 524288
#define SRAM_512_TYPE "altera_up_avalon_sram"


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid_qsys
#define SYSID_BASE 0x9130
#define SYSID_ID 0
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1448245385
#define SYSID_TYPE "altera_avalon_sysid_qsys"

#endif /* __SYSTEM_H_ */
