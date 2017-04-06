echo "########## Installing Rust #############"
curl https://sh.rustup.rs -sSf > out 
expect -c "
        spawn  sh out
        expect "*"
        send \"\n\r\"
        expect eof"
sleep 1 
echo "########## Building Parity #############"         
. $HOME/.cargo/env
sleep 1
cd parity 
cargo build --release
