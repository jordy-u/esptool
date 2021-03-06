#!/bin/sh

set -e

# Setup shell script to download & configure ESP8266 & ESP32 toolchains and SDKs
# for building the flasher stub program

mkdir -p ${TOOLCHAIN_DIR}
cd ${TOOLCHAIN_DIR}

if ! [ -d ${ESP8266_BINDIR} ]; then
    wget -O xtensa-lx106-elf.tar.gz "${ESP8266_TOOLCHAIN_URL}"
	tar zxvf xtensa-lx106-elf.tar.gz
	rm xtensa-lx106-elf.tar.gz
fi

if ! [ -d ${ESP32_BINDIR} ]; then
	wget -O xtensa-esp32-elf.tar.gz "${ESP32_TOOLCHAIN_URL}"
	tar zxvf xtensa-esp32-elf.tar.gz
	rm xtensa-esp32-elf.tar.gz
fi

mkdir -p ${SDKS_DIR}
cd ${SDKS_DIR}

if ! [ -d ${SDK_PATH} ]; then
	wget -O esp8266_sdk.zip "${ESP8266_SDK_URL}"
	unzip esp8266_sdk.zip
	rm esp8266_sdk.zip
fi

if ! [ -d ${IDF_PATH} ]; then
	wget -O esp32_idf.zip "${ESP32_IDF_URL}"
	unzip esp32_idf.zip
	mv esp-idf-* "esp-idf"
	rm esp32_idf.zip
fi
