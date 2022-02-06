# Under the influence of
# https://gist.github.com/jlgerber/0f280236c2ee1b741dfe41a38d39a467
prog :=xnixperms

debug ?=

$(info debug is $(debug))

ifdef debug
  release :=
  target :=debug
else
  release :=--release
  target :=release
endif

lambda-arm:
	cargo build $(release) --target aarch64-unknown-linux-musl

zip-lambda-arm: lambda-arm
	mkdir -p zip
	zip -j zip/lambda-arm.zip target/aarch64-unknown-linux-musl/$(target)/bootstrap

lambda-x86:
	cargo build $(release) --target x86_64-unknown-linux-musl

zip-lambda-x86: lambda-arm
	mkdir -p zip
	zip -j zip/lambda-x86.zip target/x86_64-unknown-linux-musl/$(target)/bootstrap

build:
	cargo build $(release)

all: build zip-lambda-arm zip-lambda-x86

clean:
	cargo clean
	rm -rf zip

help:
	@echo "usage: make $(prog) [debug=1]"
