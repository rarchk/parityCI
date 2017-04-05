# Install Rust
curl https://sh.rustup.rs -sSf > out 
expect -c "
        spawn  sh out
        expect "*"
        send \"\n\r\"
        expect eof"
. $HOME/.cargo/env
cd parity 
cargo build --$PARITY_VERSION
