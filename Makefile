# TODO: Fix wasi-sdk path
WASI_SDK  ?= .tools/wasi-sdk-12.0
CC         = $(WASI_SDK)/bin/clang
DEBUG_OPT  = -glldb
SYSROOT    = $(WASI_SDK)/share/wasi-sysroot/

TARGET  ?= fileserver.wasm
SRC_DIR ?= ./src

BINDLE_URL ?= http://localhost:8080/v1

.PHONY: build
build: $(WASI_SDK)
	$(CC) $(SRC_DIR)/main.c -o $(TARGET) $(DEBUG_OPT) --sysroot $(SYSROOT)

.PHONY: bindle-push
bindle-push:
	hippofactory HIPPOFACTS -v production --action bindle --server ${BINDLE_URL}

$(WASI_SDK):
	wget https://github.com/WebAssembly/wasi-sdk/releases/download/wasi-sdk-12/wasi-sdk-12.0-macos.tar.gz -O wasi-sdk.tar.gz
	mkdir -p $(WASI_SDK)
	tar xvf wasi-sdk.tar.gz -C $(WASI_SDK) --strip-components 1
	rm -rf wasi-sdk.tar.gz
