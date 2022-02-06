# What

A simple AWS Lambda function written in Rust.

# Building on Mac

Lambda runs Linux, so if you're on a Mac you'll have to cross compile. Here's how I did that using [Homebrew](https://brew.sh).

``` sh
brew tap messense/macos-cross-toolchains
brew install x86_64-unknown-linux-musl
brew install aarch64-unknown-linux-musl
```

Then in my `~/.cargo/config` file:

```
[target.x86_64-unknown-linux-musl]
linker = "x86_64-unknown-linux-musl-gcc"

[target.aarch64-unknown-linux-musl]
linker = "aarch64-unknown-linux-musl-gcc"
```

The `Makefile` in this package has some targets:
1. `lambda-arm` - builds the Lambda function for Arm (aarch64) architecture.
2. `zip-lambda-arm` - creates the .zip file you need for use in Lambda. Creates `zip/lambda-arm.zip`. 
3. `lambda-x86` - builds the Lambda function for Intel (x86_64) architecture.
4. `zip-lambda-x86` - creates the .zip file you need for use in Lambda. Creates `zip/lambda-x86.zip`.
