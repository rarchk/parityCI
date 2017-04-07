echo "########## Installing Rust #############"
. ./config.sh 
apt-get install file sudo curl -y
curl -s https://static.rust-lang.org/rustup.sh | sh -s -- --channel=$RUST_VERSION
sleep 1 
echo
echo "########## Building Parity #############"         
cd parity
git checkout $PARITY_VERSION 
cargo build --release $PARITY_BUILD_FLAGS
echo "OK!"

sleep 1 
echo
echo "########## Testing Parity #############" 
# enter unit tests and system tests here         

echo "########## Uploading to S3 #############"
sh ../aws_upload.sh target/release/parity 
echo "OK!" 