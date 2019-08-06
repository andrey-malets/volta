ECLIPSE_PLUGINS=/Applications/Ac6/SystemWorkbench.app/Contents/Eclipse/plugins

COMPILER_BIN=$(wildcard $(ECLIPSE_PLUGINS)/fr.ac6.mcu.externaltools.arm-*/tools/compiler/bin)

CC="$(COMPILER_BIN)/arm-none-eabi-gcc"
AS="$(COMPILER_BIN)/arm-none-eabi-as"
OBJCOPY="$(COMPILER_BIN)/arm-none-eabi-objcopy"
SIZE="$(COMPILER_BIN)/arm-none-eabi-size"

OPENOCD=./openocd.sh \
	$(wildcard $(ECLIPSE_PLUGINS)/fr.ac6.mcu.externaltools.openocd.*/tools) \
	$(wildcard $(ECLIPSE_PLUGINS)/fr.ac6.mcu.debug_*/resources)

CONFIG=Debug

COMMON_FLAGS=-mcpu=cortex-m3 -mthumb -mfloat-abi=soft

CC_FLAGS=\
	-Og -g3 -Wall -Werror -pedantic \
	-fmessage-length=0 -ffunction-sections -c \
	-fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" \

DEFINES=\
	'-D__weak=__attribute__((weak))' \
	'-D__packed="__attribute__((__packed__))"' \
	-DUSE_HAL_DRIVER \
	-DSTM32F103xB

INCLUDES=\
	-IInc \
	-IDrivers/STM32F1xx_HAL_Driver/Inc \
	-IDrivers/STM32F1xx_HAL_Driver/Inc/Legacy \
	-IMiddlewares/ST/STM32_USB_Device_Library/Core/Inc \
	-IMiddlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc \
	-IDrivers/CMSIS/Device/ST/STM32F1xx/Include \
	-IDrivers/CMSIS/Include

LDFLAGS=\
	-specs=nosys.specs -specs=nano.specs \
	-Wl,-Map=$(CONFIG)/output.map -Wl,--gc-sections \
	-lm

CFLAGS=$(COMMON_FLAGS) $(CC_FLAGS) $(DEFINES) $(INCLUDES)

ASFLAGS=$(COMMON_FLAGS) -g


DRIVERS_SRCS += \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd_ex.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.c \
	Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usb.c

DRIVERS_OBJS += \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd_ex.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.o \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usb.o

DRIVERS_DEPS += \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pcd_ex.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.d \
	$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_usb.d

$(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src/%.o: \
		Drivers/STM32F1xx_HAL_Driver/Src/%.c
	mkdir -p $(CONFIG)/Drivers/STM32F1xx_HAL_Driver/Src
	$(CC) $(CFLAGS) -o $@ $^


MIDDLEWARE_SRCS += \
	Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.c \
	Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.c \
	Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.c \
	Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.c

MIDDLEWARE_OBJS += \
	$(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.o \
	$(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.o \
	$(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.o \
	$(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.o

MIDDLEWARE_DEPS += \
	$(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/usbd_cdc.d \
	$(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_core.d \
	$(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ctlreq.d \
	$(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Core/Src/usbd_ioreq.d

$(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.o: \
		Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src/%.c
	mkdir -p $(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Src
	$(CC) $(CFLAGS) -o $@ $^

$(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.o: \
		Middlewares/ST/STM32_USB_Device_Library/Core/Src/%.c
	mkdir -p $(CONFIG)/Middlewares/ST/STM32_USB_Device_Library/Core/Src
	$(CC) $(CFLAGS) -o $@ $^


MAIN_SRCS += \
	Src/buffer.c \
	Src/main.c \
	Src/stm32f1xx_hal_msp.c \
	Src/stm32f1xx_it.c \
	Src/system_stm32f1xx.c \
	Src/usb_device.c \
	Src/usbd_cdc_if.c \
	Src/usbd_conf.c

MAIN_OBJS += \
	$(CONFIG)/Src/buffer.o \
	$(CONFIG)/Src/main.o \
	$(CONFIG)/Src/stm32f1xx_hal_msp.o \
	$(CONFIG)/Src/stm32f1xx_it.o \
	$(CONFIG)/Src/system_stm32f1xx.o \
	$(CONFIG)/Src/usb_device.o \
	$(CONFIG)/Src/usbd_cdc_if.o \
	$(CONFIG)/Src/usbd_conf.o

MAIN_DEPS += \
	$(CONFIG)/Src/buffer.d \
	$(CONFIG)/Src/main.d \
	$(CONFIG)/Src/stm32f1xx_hal_msp.d \
	$(CONFIG)/Src/stm32f1xx_it.d \
	$(CONFIG)/Src/system_stm32f1xx.d \
	$(CONFIG)/Src/usb_device.d \
	$(CONFIG)/Src/usbd_cdc_if.d \
	$(CONFIG)/Src/usbd_conf.d \
	$(CONFIG)/Src/usbd_desc.d

$(CONFIG)/Src/%.o: Src/%.c
	mkdir -p $(CONFIG)/Src
	$(CC) $(CFLAGS) -o $@ $^


.PHONY: $(CONFIG)/Src/usbd_desc.o

$(CONFIG)/Src/usbd_desc.o: Src/usbd_desc.c
	$(CC) $(CFLAGS) '-DDEVICE_SERIAL="$(DEVICE_SERIAL)"' -o $@ $^


STARTUP_SRCS += \
	startup/startup_stm32f103xb.s

STARTUP_OBJS += \
	$(CONFIG)/startup/startup_stm32f103xb.o

$(CONFIG)/startup/%.o: startup/%.s
	mkdir -p $(CONFIG)/startup
	$(AS) $(ASFLAGS) -o $@ $^


ALL_OBJS += $(DRIVERS_OBJS) $(MIDDLEWARE_OBJS) $(MAIN_OBJS) \
	$(CONFIG)/Src/usbd_desc.o $(STARTUP_OBJS)
ALL_DEPS += $(DRIVERS_DEPS) $(MIDDLEWARE_DEPS) $(MAIN_DEPS) \
	$(CONFIG)/Src/usbd_desc.o $(STARTUP_DEPS)


OUTPUT=$(CONFIG)/analog_test_blue_pill.elf


$(OUTPUT): $(ALL_OBJS) STM32F103C8Tx_FLASH.ld
	$(CC) $(COMMON_FLAGS) $(LDFLAGS) -T"STM32F103C8Tx_FLASH.ld" -o "$@" \
		$(ALL_OBJS)
	$(OBJCOPY) -O ihex "$@" "$(CONFIG)/analog_test_blue_pill.hex"
	$(SIZE) "$@"


.PHONY: all flash clean


all: $(OUTPUT)

flash: all
	$(OPENOCD) -f openocd.cfg -c 'program $(OUTPUT) verify reset exit'

clean:
	rm -f $(ALL_OBJS) $(ALL_DEPS) $(OUTPUT)
